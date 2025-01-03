include(macros.m4)dnl
CREATE_PAGE(`Redis Cluster multi-key command optimisation with hash tags', `<p>
<a href="https://redis.io/topics/cluster-spec">Redis Cluster</a> allows a <a href="https://redis.io/">Redis</a> installation to automatically partition its dataset across multiple nodes. Keys are partitioned using the concept of <b>hash slots</b>, of which there are 16384 in total, distributed across the cluster&apos;s nodes. For example, if the cluster consists of three nodes, the first node contains hash slots 0 to 5500, the second contains hash slots 5501 to 11000 and the third node contains hash slots 11001 to 16383. To determine a key&apos;s hash slot, we take the <a href="https://en.wikipedia.org/wiki/Cyclic_redundancy_check">CRC16</a> of the key&apos;s modulo 16384.
</p>
<p>
One implication of the way keys are distributed across nodes is that operations that target multiple keys, such as <code>MSET</code> or <code>MGET</code>, issue more Redis commands than they would on a single Redis node setup.
</p>
<p>
To demonstrate, we will store the world&apos;s cities&apos; populations on a Redis cluster. We will then retrieve the populations of all cities in Germany and sum them up to calculate the country&apos;s population. The supporting Python code is <a href="https://github.com/nutrun/redis-cluster-hash-tag">available on github</a> and depends on the <a href="https://redis-py-cluster.readthedocs.io/en/master/">redis-py-cluster</a> library.
</p>
<p>
First, let&apos;s setup a Redis cluster. There are several ways to run a Redis cluster, for example with <a href="https://hub.docker.com/_/redis/">Docker</a>. Here, we download and build Redis from source, assuming a *nix system with <code>make</code>. After building Redis, we set up the <a href="https://github.com/redis/redis/tree/b9d7d55b2c1a17fd596d77081b8a553defb4a590/utils/create-cluster">create-cluster</a> utility for a cluster consisting of six master and six slave Redis nodes.
</p>
<pre>
$ ./<a href="https://github.com/nutrun/redis-cluster-hash-tag/blob/main/setup-redis-cluster.sh">setup-redis-cluster.sh</a>
<i>[...]</i>
<span style="color:green;">[OK] All 16384 slots covered.</span>
</pre>
<p>
We can now import city population data into the running cluster. One way to achieve this is by issuing one <code>SET</code> command per key. The keys&apos; format is <code>&lt;country&gt;_&lt;city&gt;</code>, for example <code>France_Paris</code>.
</p>
<pre>
$ ./<a href="https://github.com/nutrun/redis-cluster-hash-tag/blob/main/measure.sh">measure.sh</a> <a href="https://github.com/nutrun/redis-cluster-hash-tag/blob/main/set.py">set.py</a>
OK
OK
OK
OK
OK
OK

real 0m6.439s
user 0m2.978s
sys0m0.863s
4460
4465
4439
4508
4314
4436
</pre>
<p>
The <code>time</code> command is used as a crude measure of the execution time of the Python scripts that issue the Redis commands. The last six lines of the <code>measure.sh</code> script&apos;s output are <code>total_commands_processed</code>, as reported by each of the cluster&apos;s six master nodes. In this first attempt, we can see that key distribution is even across the cluster&apos;s nodes and that we&apos;ve issued more than 4000 <code>SET</code> commands per node. This is consistent with our expectations of Redis Cluster&apos;s key hashing algorithm.
</p>
<p>
Insertion can be optimised by reducing the number of issued commands with the use of <code>MSET</code>. Calling the <a href="https://redis-py-cluster.readthedocs.io/en/master/">redis-py-cluster</a> library&apos;s <code><a href="https://github.com/Grokzen/redis-py-cluster/blob/master/rediscluster/client.py#L1011-L1029">mset</a></code> function with multiple keys doesn&apos;t have the desired effect. Its implementation <a href="https://github.com/Grokzen/redis-py-cluster/blob/master/rediscluster/client.py#L1011-L1029">iterates over the keys provided to it and issues a <code>SET</code> command for each</a>. That&apos;s because a Redis Cluster node will only accept multi-key commands where all the keys hash to the same slot. To address this, Redis Cluster provides the concept of <i>hash tags</i>, according to which, <q cite="https://redis.io/topics/cluster-tutorial">if there is a substring between {} brackets in a key, only what is inside the string is hashed</q>. An example of this in our demo application would be <code>{France}_Paris</code>. By surrounding the country section of each key in curly braces, we are effectively storing them in the same slot, which means that we can store an entire group by calling <code>MSET</code> once. That is what the <code><a href="https://github.com/nutrun/redis-cluster-hash-tag/blob/main/mset.py">mset.py</a></code> script does.
</p>
<pre>
$ <a href="https://github.com/nutrun/redis-cluster-hash-tag/blob/main/measure.sh">./measure.sh</a> <a href="https://github.com/nutrun/redis-cluster-hash-tag/blob/main/mset.py">mset.py</a>
OK
OK
OK
OK
OK
OK

real 0m0.844s
user 0m0.563s
sys0m0.097s
31
32
37
27
26
29
</pre>
<p>
The demo application&apos;s <code><a href="https://github.com/nutrun/redis-cluster-hash-tag/blob/main/mset.py">mset.py</a></code> script issues less Redis commands and executes faster than <code><a href="https://github.com/nutrun/redis-cluster-hash-tag/blob/main/set.py">set.py</a></code>.
</p>
<p>
Now suppose we want to determine Germany&apos;s population by fetching all of its cities&apos; populations and summing them up. The demo application provides two scripts for doing this: <code><a href="https://github.com/nutrun/redis-cluster-hash-tag/blob/main/get.py">get.py</a></code> which issues one <code>GET</code> command per city and <code><a href="https://github.com/nutrun/redis-cluster-hash-tag/blob/main/mget.py">mget.py</a></code> which uses one <code>MGET</code> command to fetch all of the cities&apos; populations.
</p>
<pre>
$ <a href="https://github.com/nutrun/redis-cluster-hash-tag/blob/main/measure.sh">./measure.sh</a> <a href="https://github.com/nutrun/redis-cluster-hash-tag/blob/main/get.py">get.py</a>
OK
OK
OK
OK
OK
OK
Population: 57857061

real 0m0.729s
user 0m0.483s
sys0m0.096s
295
257
262
262
278
272
</pre>
<pre>
$ <a href="https://github.com/nutrun/redis-cluster-hash-tag/blob/main/measure.sh">./measure.sh</a> <a href="https://github.com/nutrun/redis-cluster-hash-tag/blob/main/mget.py">mget.py</a>
OK
OK
OK
OK
OK
OK
Population: 57857061

real 0m0.285s
user 0m0.242s
sys0m0.030s
5
2
3
3
3
3
</pre>
<p>
Similar to when the cluster was populated, the <code>MGET</code> version is faster and issues less commands than its <code>GET</code> counterpart.
</p>
<p>
This technique can improve the performance of applications where groups of keys are frequently accessed together. However, it is worth noting that by grouping keys using hash tags, we are effectively overriding Redis Cluster&apos;s key hashing algorithm and potentially making keys distributed less evenly across nodes, which can cause certain nodes to use more memory than others.
</p>
<p>
This article was inspired by work we&apos;ve done with my colleagues from the Supply team at <a href="https://www.loveholidays.com/">loveholidays.com</a>.
</p>
<p>
<i>George Malamidis, 2021-04-24</i>
</p>
<h2>References / Links</h2>
<ul>
<li><a href="https://github.com/nutrun/redis-cluster-hash-tag">Suporting code</a></li>
<li><a href="https://redis.io/topics/cluster-spec">Redis Cluster Specification</a></li>
<li><a href="https://redis.io/topics/cluster-tutorial">Redis cluster tutorial</a></li>
<li><a href="https://simplemaps.com/data/world-cities">World Cities Database </a></li>
<li><a href="https://redis-py-cluster.readthedocs.io/en/master/">redis-py-cluster</a></li>
</ul>')
