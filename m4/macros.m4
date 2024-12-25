define(`PAGE_TEMPLATE', `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="description" content="nutrun.com is George Malamidis&apos;s website.">
<meta name="keywords" content="George Malamidis, music, programming, distributed systems, software engineering">
<meta name="author" content="George Malamidis">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/favicon.ico" sizes="any">
<title>$1 - nutrun</title>
<style>
@media only screen and (max-width: 900px) { li { margin: 16px 0; } }
</style>
</head>
<body>
<header>
<h1>$1 - <a href="/">nutrun</a></h1>
</header>
$2
<footer>
<hr>
<p>
Email: <a href="mailto:thr5sh@gmail.com">thr4sh@gmail.com</a>
</p>
<p>
<a href="https://validator.w3.org" id="w3c-validator">Valid HTML</a>
</p>
</footer>
<script>
var here = encodeURIComponent(window.location.href);
var w3cAnchor = document.getElementById("w3c-validator");
w3cAnchor.setAttribute("href", "https://validator.w3.org/check?uri=" + here);
</script>
</body>
</html>')dnl
define(`CREATE_PAGE', `PAGE_TEMPLATE(`$1', `$2')')dnl
