divert(-1)
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
</body>
</html>')

define(`CREATE_PAGE', `PAGE_TEMPLATE(`$1', `$2')')

divert
