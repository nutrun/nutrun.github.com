define(`PAGE_TEMPLATE', `<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>$1 - nutrun</title>
<meta name="description" content="George Malamidis&apos;s website"/>
<meta name="keywords" content="George Malamidis, music, programming, distributed systems"/>
<meta name="author" content="George Malamidis"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<style type="text/css">
@media only screen { li { margin: 16px 0; } }
</style>
</head>
<body>
$2
<h2>Contact</h2>
<ul>
<li>email <a href="mailto:thr4sh@gmail.com">thr4sh@gmail.com</a></li>
<li><a href="https://twitter.com/nutrun">@nutrun</a> on twitter</li>
</ul>
<p>
<a href="https://validator.w3.org" id="w3c-validator"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFgAAAAfCAMAAABUFvrSAAABs1BMVEXMzMwAAAD+/v71+Pv09PTu9Pjp8fb/7Mbl7vXs7Ozn5+fd6fLT4+7N3+zG2ujU1NTA1uf+y2W20OP7xWKyzeHywWCryd7CwsLqu12jw9vmuFyfwdritFqbvtjesVi0tLTtqVSWu9barlfVqlW1rZjpoFCsrKyLtNLRp1Pmm03OpFGFsNC7pnKppZ6Crs7jlUp8qszFnU6zn2feikW+mEx0pcmYmJi6lEptoca3kkmjkmvYfj9oncSxjUZkm8PWej2ui0W0gVhalL/QbzejgkFVkb2Dg4OKgWVMi7qaez2hclN7e3uXeDyAeWjIXy+UdjtFhrY+grSOcTiKbjY4frI2fbHBUChra2uDaDS/TCYxea9+ZDFlZWUpday6QiElcqpqXUohb6l0XC63PB4ebahcXFymPipuWCwaa6YVaKRqVCpVVVV1RzmdNicRZaJWUk1kUCgOY6FST0tOTk5eSyUIX59OSz8AWpxTQiFOPh6IIBk7OzucCAQ0MzI9MBg7LxeWBAOZAAA2KxUoKCgwJhMjIyMrIhElHQ4cHBwaFQoUFBQXEgkSDgYLCwsMCQQIBgMBAACpDxArAAAAAnRSTlP/AOW3MEoAAAM1SURBVHja7db5VxJRFAdwuwNmm3jDUSCaSiqRNi2obDGybLXVVs3KsgUqyoyuFlpQaWk190/uvjeM4HZcjvVT33PmDss5nxnu4z6oWPnsWaVSUQELZzUuPruPPPwPLw9uiJqIVtQMRANyjvkbYpJoxB+NmYiBaBQx1rAs+DS/wQgX/J18HbHAoXFWGQsxP0McZsYQF2bBwf4EADT2NSrEm832S/o6ADxnbvtgi6FhHOLkmB1BF26JpzkdbxHYNi0pc8LrKCXiRrqh4Dpy0gzGIPMv34jPgUM/mbtQ4KHOznEOIV6XSwg3+rvz0WRhbhh6aYPUDFVKbaeOqqrNlPLATv5y8ePErzUOjGm2TQXrlODh9NjvO/PBCdortZuCUlO0DowH6uHgR+nCvYvgwBF7ktMK7jL9hXI4wnZgPriGbgJUEklfq6lX2q27MqHeMjxF+KsdGeZDbo/DJRjTPajhsWQy6VdwPu/CMCBd2EQ0ANBMCajMUDWA53v5t+IOd0mbf5ju4iFe4SsOLNGwSkDgD3mRi3AHBeXophrolaON6LBX1q4cDluIGAibpmUKp59YAam6YCiMfktFWvEqr1KEg9RhDDyvo0QVZeQyKaKbBhxc1uQ9zTtxYC9laumYN9u7mdpBUp2hOqhfDny36LqTd0P6UAtXpQZB5Ri1SZ0PNv0Lui68iyhrQCMReUGllh5Mh62Cza2oEx5l+9k02n9/K+rcct0peAPROTWCdM2h6qh/Deh4PBoO9wy58CM+/47j5e7jfG5Hyf2sXBeGftqmR7ARtrXrVlytd+Tb9QqW9Ljw1x8Y454Znz+3b8p9WRoQLVXpEVwPbZTwBjMUNJ6sVa7tc+HiXZo8igH+VHJPaC934K5zvjB926ztVrWmD8CboiypUayYePHkGx+EmXc8OY4WvynvcL6U3MkZ+7GxV5+a5Vh/OJVqU2voezExshOmwV1pxHd2+DwnsSy3Su6OpW70EZZMqtnFuG3zuInluey6TbhU2DzU2toaxxbVZ+v0cdd1c8p1V/zH9KjjrjyMB3Li/g0Ym5r+2f+KLQtm+/7F5+wlFx5cRN7Pl7ezXnn9dkTDfwArH4R/3hq++gAAAABJRU5ErkJggg==" alt="Valid XHTML 1.0 Strict" height="31" width="88" /></a>
</p>
<script type="text/javascript">
var here = encodeURIComponent(window.location.href);
var w3cAnchor = document.getElementById("w3c-validator");
w3cAnchor.setAttribute("href", "https://validator.w3.org/check?uri=" + here);
</script>
</body>
</html>')dnl
define(`CREATE_PAGE', `PAGE_TEMPLATE(`$1', `$2')')dnl
