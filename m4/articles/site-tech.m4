include(macros.m4)dnl
CREATE_PAGE(`The tech behind my website', `<p>
The current version of <a href="/">nutrun.com</a> is broadly static HTML, which I edit in <a href="https://www.vim.org">Vim</a>. You might think that there is no CSS, but there is <a href="https://github.com/nutrun/nutrun.github.com/blob/29ec3cf60d9e207e3aa5d1f3bb1f3c550851e1c0/index.html#L12">enough CSS</a> to make the pages accessible.
</p>
<p>
I template the markup in <a href="https://www.gnu.org/software/m4/">M4</a> and generate it with <a href="https://www.gnu.org/software/make/">Make</a>. <a href="https://github.com/nutrun/nutrun.github.com/tree/8f403e45a92c1e18a8b0151be5f0e6efaf90704a/m4">This is how</a>. I run <code>python -m http.server</code> to check the generated content locally.
</p>
<p>
The site is hosted on <a href="https://pages.github.com">GitHb Pages</a>, which are stable, developer friendly and free.
</p>
<p>
I check that every page is valid HTML by using the <a href="https://validator.w3.org">W3C Markup Validation Service</a>. There&apos;s a link in the footer for quick access. Generating that link is the only JavaScript currently on the site and, hence, its only dynamic aspect.
</p>
<p>
I target <a href="https://pagespeed.web.dev">PageSpeed Insights</a> 100/100 scores for performance, accessibility, best practices and SEO, on mobile and desktop.
</p>
<p>
<a href="/">nutrun.com</a> looks great in <a href="https://lynx.invisible-island.net">lynx</a>.
</p>
<p>
<i>George Malamidis, 2024-12-24</i>
</p>')
