From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri,  4 Dec 2015 08:21:11 +0100
Subject: [Buildroot] [PATCH 1/4] docs/website: fixing html tidy errors and
	warnings
In-Reply-To: <1449213674-11333-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1449213674-11333-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1449213674-11333-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch makes tidy html checker happy.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/docs.html     | 20 ++++++++---------
 docs/website/download.html | 39 ++++++++++++++++----------------
 docs/website/header.html   | 16 +++++++-------
 docs/website/index.html    | 24 ++++++++++----------
 docs/website/news.html     | 55 +++++++++++++++++++++++-----------------------
 docs/website/sponsors.html | 26 ++++++++++++----------
 docs/website/support.html  | 10 ++++-----
 7 files changed, 96 insertions(+), 94 deletions(-)

diff --git a/docs/website/docs.html b/docs/website/docs.html
index 9cee36d..4335796 100644
--- a/docs/website/docs.html
+++ b/docs/website/docs.html
@@ -16,15 +16,15 @@
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/manual.html"><img src="images/browser.png" width="180" alt=""></a>
+		<a href="/manual.html"><img src="images/browser.png" width="180" alt="" /></a>
 	      </div>
 	      <div class="back">
-		<a href="/manual.html"><img src="images/browser.png" width="180" alt=""></a>
+		<a href="/manual.html"><img src="images/browser.png" width="180" alt="" /></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3>HTML <br>
+	  <h3>HTML <br/>
 	    <a href="/manual.html">Stable</a> |
 	    <a href="http://nightly.buildroot.org/manual.html">Nightly</a>
 	  </h3>
@@ -35,15 +35,15 @@
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<img src="images/pdf-icon.png" width="180" alt="">
+		<img src="images/pdf-icon.png" width="180" alt="" />
 	      </div>
 	      <div class="back">
-		<img src="images/pdf-icon.png" width="180" alt="">
+		<img src="images/pdf-icon.png" width="180" alt="" />
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3>PDF <br>
+	  <h3>PDF <br/>
 	    <a href="/downloads/manual/manual.pdf">Stable</a> |
 	    <a href="http://nightly.buildroot.org/manual.pdf">Nightly</a>
 	  </h3>
@@ -54,15 +54,15 @@
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<img src="images/text.png" width="180" alt="">
+		<img src="images/text.png" width="180" alt="" />
 	      </div>
 	      <div class="back">
-		<img src="images/text.png" width="180" alt="">
+		<img src="images/text.png" width="180" alt="" />
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3>ASCII <br>
+	  <h3>ASCII <br/>
 	    <a href="/downloads/manual/manual.text">Stable</a> |
 	    <a href="http://nightly.buildroot.org/manual.text">Nightly</a>
 	  </h3>
@@ -89,7 +89,7 @@
 	    <div class="panel-heading">Slides preview</div>
 	    <div class="panel-body">
 	      <div id="slides" style="width: 100%; padding-bottom: 75%; position: relative">
-		<a href="http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf"><img src="images/buildroot-slides.png" alt="buildroot slides" style="position:absolute; width:100%; height:100%; top:0; left:0;"></a>
+		<a href="http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf"><img src="images/buildroot-slides.png" alt="buildroot slides" style="position:absolute; width:100%; height:100%; top:0; left:0;" /></a>
 	      </div>
 	    </div>
 	  </div>
diff --git a/docs/website/download.html b/docs/website/download.html
index 4f8d67a..19b5362 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -15,10 +15,10 @@
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2015.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11.tar.gz"><img src="images/zip.png" width="180" alt="" /></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2015.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11.tar.gz"><img src="images/zip.png" width="180" alt="" /></a>
 	      </div>
 	    </div>
 	  </div>
@@ -29,10 +29,10 @@
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2015.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11.tar.bz2"><img src="images/package.png" width="180" alt="" /></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2015.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11.tar.bz2"><img src="images/package.png" width="180" alt="" /></a>
 	      </div>
 	    </div>
 	  </div>
@@ -48,10 +48,10 @@
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2015.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt="" /></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2015.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt="" /></a>
 	      </div>
 	    </div>
 	  </div>
@@ -63,10 +63,10 @@
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2015.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt="" /></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2015.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt="" /></a>
 	      </div>
 	    </div>
 	  </div>
@@ -90,21 +90,21 @@
 	  <div class="panel panel-success">
 	    <div class="panel-heading">Repository</div>
 	    <div class="panel-body">
-	      <P>The buildroot repository can be browsed online through cgit at
+	      <p>The buildroot repository can be browsed online through cgit at
 		<a href="http://git.buildroot.net/buildroot/">http://git.buildroot.net/buildroot</a>.
 		To grab a copy of the repository use</p>
 
 
 	      <div class="input-group" style="width: 100%;">
 		<input class="form-control" style="width: 85%;" id="giturl"
-		       value="git clone git://git.buildroot.net/buildroot" type="text" readonly></input>
+		       value="git clone git://git.buildroot.net/buildroot" type="text" readonly 	/>
 		<span class="input-group-button">
 		  <button class="btn pull-right" type="button" data-clipboard-target="#giturl"
 			  data-toggle="tooltip" data-placement="bottom" data-trigger="manual" title="Copied!">
-		    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
+		    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13" />
 		  </button>
 		</span>
-	      </div><br>
+	      </div><br/>
 
 	      <p>
 		Or if you're behind a firewall blocking git:
@@ -116,34 +116,35 @@
 		<span class="input-group-button">
 		  <button class="btn pull-right" type="button" data-clipboard-target="#giturlhttps"
 			  data-toggle="tooltip" data-placement="bottom" data-trigger="click" title="Copied!">
-		    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
+		    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13" />
 		  </button>
 		</span>
-	      </div><br>
+	      </div><br/>
 
 	      <p>
 
 		Please use the native git protocol if at all possible, as it's a lot
-		more efficient than HTTP.
+		more efficient than HTTP.</p>
 
 	      <p>
 
 		If you are not already familiar with using Git, we recommend you visit <a
-											  href="http://git-scm.org">the Git website</a>.
+											  href="http://git-scm.org">the Git website</a>.</p>
 
 	      <p>
 
 		Once you've checked out a copy of the source tree, you can update your source
 		tree at any time so it is in sync with the latest and greatest by entering your
-		buildroot directory and running the command:
+		buildroot directory and running the command: </p>
 
 		<pre>
 		  git pull
 		</pre>
 
-		Because you've only been granted anonymous access to the tree, you won't be
+		<p>
+			Because you've only been granted anonymous access to the tree, you won't be
 		able to push your changes to the repo. Changes can instead be submitted for
-		inclusion by posting them to the buildroot mailing list.
+		inclusion by posting them to the buildroot mailing list.</p>
 	    </div>
 	  </div>
 	</div>
diff --git a/docs/website/header.html b/docs/website/header.html
index 3842f32..6385111 100644
--- a/docs/website/header.html
+++ b/docs/website/header.html
@@ -1,17 +1,17 @@
 <!DOCTYPE html>
 <html lang="en">
 <head>
-	<meta charset="utf-8">
-	<meta http-equiv="X-UA-Compatible" content="IE=edge">
-	<meta name="viewport" content="width=device-width, initial-scale=1.0">
-	<meta name="Buildroot" content="">
-	<meta name="angelo.compagnucci@gmail.com" content="">
-	<link rel="shortcut icon" href="images/favicon.png">
+	<meta charset="utf-8" />
+	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
+	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
+	<meta name="Buildroot" content="" />
+	<meta name="angelo.compagnucci@gmail.com" content="" />
+	<link rel="shortcut icon" href="images/favicon.png" />
 
 	<title>Buildroot - Making Embedded Linux Easy</title>
 
-	<link href="https://oss.maxcdn.com/bootswatch/3.3.5/paper/bootstrap.min.css" rel="stylesheet">
-	<link href="css/main.css" rel="stylesheet">
+	<link href="https://oss.maxcdn.com/bootswatch/3.3.5/paper/bootstrap.min.css" rel="stylesheet" />
+	<link href="css/main.css" rel="stylesheet" />
 
 	<!--[if lt IE 9]>
 	  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
diff --git a/docs/website/index.html b/docs/website/index.html
index 61c2248..6bc37b9 100644
--- a/docs/website/index.html
+++ b/docs/website/index.html
@@ -4,10 +4,10 @@
   <div class="container">
     <div class="row">
       <div class="col-sm-6">
-	<img class="img-responsive center-block" src="images/logo.png" alt="" style="max-width:300px">
+	<img class="img-responsive center-block" src="images/logo.png" alt="" style="max-width:300px" />
       </div><!-- /col-lg-6 -->
       <div class="col-sm-6">
-	<h1>Buildroot<br>
+	<h1>Buildroot<br/>
 	  <small>Making Embedded Linux Easy</small></h1>
 	<div class="col-sm-6" style="margin-top:1em; padding-left:0px;">
 	  <a class="btn btn-default btn-lg" style="width:100%;" href="#about"><span class="glyphicon glyphicon-info-sign"></span>&nbsp; Learn more</a>
@@ -34,10 +34,10 @@
       <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	<div class="flipper">
 	  <div class="front">
-	    <img src="images/tux-flat.png" width="180" alt="">
+	    <img src="images/tux-flat.png" width="180" alt="" />
 	  </div>
 	  <div class="back">
-	    <img src="images/tux-flat.png" width="180" alt="">
+	    <img src="images/tux-flat.png" width="180" alt="" />
 	  </div>
 	</div>
       </div>
@@ -51,10 +51,10 @@
       <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	<div class="flipper">
 	  <div class="front">
-	    <img src="images/hammer.png" width="180" alt="">
+	    <img src="images/hammer.png" width="180" alt="" />
 	  </div>
 	  <div class="back">
-	    <img src="images/hammer.png" width="180" alt="">
+	    <img src="images/hammer.png" width="180" alt="" />
 	  </div>
 	</div>
       </div>
@@ -70,10 +70,10 @@
       <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	<div class="flipper">
 	  <div class="front">
-	    <img src="images/gift.png" width="180" alt="">
+	    <img src="images/gift.png" width="180" alt="" />
 	  </div>
 	  <div class="back">
-	    <img src="images/gift.png" width="180" alt="">
+	    <img src="images/gift.png" width="180" alt="" />
 	  </div>
 	</div>
       </div>
@@ -83,7 +83,7 @@
 
     </div><!--/col-lg-4 -->
   </div><!-- /row -->
-  <hr>
+  <hr/>
 </div><!-- /container -->
 
 <div class="container">
@@ -100,13 +100,13 @@
 	<!-- Wrapper for slides -->
 	<div class="carousel-inner">
 	  <div class="item active">
-	    <img src="images/nconfig.png" alt="">
+	    <img src="images/nconfig.png" alt="" />
 	  </div>
 	  <div class="item">
-	    <img src="images/menuconfig.png" alt="">
+	    <img src="images/menuconfig.png" alt="" />
 	  </div>
 	  <div class="item">
-	    <img src="images/xconfig.png" alt="">
+	    <img src="images/xconfig.png" alt="" />
 	  </div>
 	</div>
 	<!-- Indicators -->
diff --git a/docs/website/news.html b/docs/website/news.html
index 89c5062..f1961bf 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -1319,7 +1319,7 @@
       <div class="timeline-body">
 	<p>RC2 is out with more bugfixes - See
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.11_rc2">CHANGES</a>
-	  file for details.
+	  file for details.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2012.11-rc2.tar.bz2">2012.11-rc2
@@ -1516,7 +1516,7 @@
       <div class="timeline-body">
 	<p>RC3 is out with more bugfixes - See
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.05_rc3">CHANGES</a>
-	  file for details.
+	  file for details.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2012.05-rc3.tar.bz2">2012.05-rc3
@@ -1625,7 +1625,7 @@
       <div class="timeline-body">
 	<p>RC3 is out with more bugfixes - See
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc3">CHANGES</a>
-	  file for details.
+	  file for details.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2012.02-rc3.tar.bz2">2012.02-rc3
@@ -1729,7 +1729,7 @@
       <div class="timeline-body">
 	<p>RC3 is out with more bugfixes - See
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.11_rc3">CHANGES</a>
-	  file for details.
+	  file for details.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2011.11-rc3.tar.bz2">2011.11-rc3
@@ -1774,7 +1774,7 @@
 	  the tree, see
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.11_rc1">CHANGES</a>
 	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2011-November/047395.html">announcement</a>
+	  <a href="http://lists.buildroot.org/pipermail/buildroot/2011-November/047395.html">announcement</a></p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2011.11-rc1.tar.bz2">2011.11-rc1
@@ -1813,7 +1813,7 @@
 	<p>RC2 is out with more bugfixes. See
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.08_rc2">CHANGES</a>
 	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2011-August/045211.html">announcement</a>.
+	  <a href="http://lists.buildroot.org/pipermail/buildroot/2011-August/045211.html">announcement</a>.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2011.08-rc2.tar.bz2">2011.08-rc2
@@ -1836,7 +1836,7 @@
 	  the tree, see
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.08_rc1">CHANGES</a>
 	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2011-August/044855.html">announcement</a>.
+	  <a href="http://lists.buildroot.org/pipermail/buildroot/2011-August/044855.html">announcement</a>.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2011.08-rc1.tar.bz2">2011.08-rc1
@@ -1874,7 +1874,7 @@
       <div class="timeline-body">
 	<p>RC2 is out with more bugfixes. See
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.05_rc2">CHANGES</a>
-	  file for details.
+	  file for details.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2011.05-rc2.tar.bz2">2011.05-rc2
@@ -1897,7 +1897,7 @@
 	  the tree, see
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.05_rc1">CHANGES</a>
 	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2011-May/043317.html">announcement</a>.
+	  <a href="http://lists.buildroot.org/pipermail/buildroot/2011-May/043317.html">announcement</a>.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2011.05-rc1.tar.bz2">2011.05-rc1
@@ -1960,7 +1960,7 @@
 	  the tree, see
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.02_rc1">CHANGES</a>
 	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2011-February/041365.html">announcement</a>.
+	  <a href="http://lists.buildroot.org/pipermail/buildroot/2011-February/041365.html">announcement</a>.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2011.02-rc1.tar.bz2">2011.02-rc1
@@ -2023,7 +2023,7 @@
 	  the tree, see
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.11_rc1">CHANGES</a>
 	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2010-November/038645.html">announcement</a>.
+	  <a href="http://lists.buildroot.org/pipermail/buildroot/2010-November/038645.html">announcement</a>.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2010.11-rc1.tar.bz2">2010.11-rc1
@@ -2086,7 +2086,7 @@
       <div class="timeline-body">
 	<p>RC2 is out with more cleanups and bugfixes, see
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.08_rc2">CHANGES</a>
-	  file for details.
+	  file for details.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2010.08-rc2.tar.bz2">2010.08-rc2
@@ -2094,7 +2094,7 @@
 	  the <a href="support.html">mailing list</a>
 	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
-	This is very much expected to be the final release candidate,
+	<p>This is very much expected to be the final release candidate,
 	so give it a good test and expect a final 2010.08 release
 	before September unless critical issues are found.</p>
       </div>
@@ -2112,7 +2112,7 @@
 	<p>We have a new release candidate! Lots of changes all over
 	  the tree, see
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.08_rc1">CHANGES</a>
-	  file for details.
+	  file for details.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2010.08-rc1.tar.bz2">2010.08-rc1
@@ -2152,7 +2152,7 @@
       <div class="timeline-body">
 	<p>RC3 is out with more cleanups and bugfixes, see
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.05_rc3">CHANGES</a>
-	  file for details.
+	  file for details.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2010.05-rc3.tar.bz2">2010.05-rc3
@@ -2194,7 +2194,7 @@
 	<p>We have a new release candidate! Lots of changes all over
 	  the tree, see
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.05_rc1">CHANGES</a>
-	  file for details.
+	  file for details.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2010.05-rc1.tar.bz2">2010.05-rc1
@@ -2215,9 +2215,9 @@
       <div class="timeline-body">
 	<p>The slides from
 	  the <a href="http://fosdem.org/2010/schedule/events/emb_cross_build">Cross
-	    Build Systems: Present & Future</a> session
+	    Build Systems: Present &amp; Future</a> session
 	  at <a href="http://fosdem.org/2010">FOSDEM</a> are
-	  now <a href="http://send-patches.org/news/20100211-1-FOSDEM-Crossdev-Workshop.pdf">online</a>.
+	  now <a href="http://send-patches.org/news/20100211-1-FOSDEM-Crossdev-Workshop.pdf">online</a>.</p>
       </div>
     </div>
   </li>
@@ -2251,7 +2251,7 @@
       <div class="timeline-body">
 	<p>RC2 is out with more cleanups and bugfixes, see
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.02_rc2">CHANGES</a>
-	  file for details.
+	  file for details.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2010.02-rc2.tar.bz2">2010.02-rc2
@@ -2273,7 +2273,7 @@
 	<p>We have a new release candidate! Lots of changes all over
 	  the tree, see
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.02_rc1">CHANGES</a>
-	  file for details.
+	  file for details.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2010.02-rc1.tar.bz2">2010.02-rc1
@@ -2313,7 +2313,7 @@
       <div class="timeline-body">
 	<p>RC2 is out with more cleanups and bugfixes, see
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.11_rc2">CHANGES</a>
-	  file for details.
+	  file for details.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2009.11-rc2.tar.bz2">2009.11-rc2
@@ -2335,7 +2335,7 @@
 	<p>We have a new release candidate! Lots of changes all over
 	  the tree, see
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.11_rc1">CHANGES</a>
-	  file for details.
+	  file for details.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2009.11-rc1.tar.bz2">2009.11-rc1
@@ -2428,7 +2428,7 @@
       <div class="timeline-body">
 	<p>RC2 is out with more cleanups and bugfixes, see
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.08_rc2">CHANGES</a>
-	  file for details.
+	  file for details.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2009.08-rc2.tar.bz2">2009.08-rc2
@@ -2450,7 +2450,7 @@
 	<p>We have a new release candidate! Lots of changes all over
 	  the tree, see
 	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.08_rc1">CHANGES</a>
-	  file for details.
+	  file for details.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2009.08-rc1.tar.bz2">2009.08-rc1
@@ -2557,7 +2557,7 @@
 	<p>We have a new release candidate! Lots of changes all over the
 	  tree, see the <a
 			   href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.05_rc1">CHANGES</a>
-	  file for details.
+	  file for details.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2009.05-rc1.tar.bz2">2009.05-rc1
@@ -2583,8 +2583,7 @@
 	  <a href="http://git.buildroot.net/buildroot">here</a>, and clone
 	  the repo using:
 	  <pre>git clone git://git.buildroot.net/buildroot</pre>
-	  See the <a href="/git.html">Git Access</a> page for more details.
-	</p>
+	  See the <a href="/git.html">Git Access</a> page for more details.</p>
       </div>
     </div>
   </li>
@@ -2593,7 +2592,7 @@
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
       <div class="timeline-heading">
-	<h4 class="timeline-title"><new Logo/h4>
+	<h4 class="timeline-title">new Logo</h4>
 	    <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 March 2009</small></p>
       </div>
       <div class="timeline-body">
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index db50e37..801bca9 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -14,7 +14,7 @@
 	    <div class="panel-body">
 	      <div class="col-sm-4">
 		<a href="http://google.com">
-		  <img class="img-responsive center-block" src="images/google-logo.png"/>
+		  <img class="img-responsive center-block" src="images/google-logo.png" alt="google logo"/>
 		</a>
 	      </div>
 	      <div class="col-sm-8">
@@ -33,8 +33,8 @@
 	  <div class="panel panel-default">
 	    <div class="panel-body">
 	      <div class="col-sm-4">
-		<a href="http://mind.be">
-		  <img class="img-responsive center-block" src="images/mind-logo.png"/>
+		<a href="http://www.mind.be">
+		  <img class="img-responsive center-block" src="images/mind-logo.png" alt="mind logo"/>
 		</a>
 	      </div>
 	      <div class="col-sm-8">
@@ -68,7 +68,7 @@
 	    <div class="panel-body">
 	      <div class="col-sm-12">
 		<a href="http://www.mind.be">
-		  <img class="img-responsive center-block" src="images/mind-logo.png"/>
+		  <img class="img-responsive center-block" src="images/mind-logo.png" alt="minid logo"/>
 		</a>
 	      </div>
 	      <div class="col-sm-12" style="font-size: 12px;">
@@ -87,7 +87,7 @@
 	    <div class="panel-body">
 	      <div class="col-sm-12">
 		<p><a href="http://www.google.com">
-		    <img class="img-responsive center-block" src="images/google-logo.png"/></a></p>
+		    <img class="img-responsive center-block" src="images/google-logo.png" alt="google logo"/></a></p>
 	      </div>
 	      <div class="col-sm-12">
 		<p><a href="http://www.google.com">Google</a> provided the
@@ -103,7 +103,7 @@
 	    <div class="panel-body">
 	      <div class="col-sm-12">
 		<p><a href="http://www.imgtec.com/">
-		    <img class="img-responsive center-block" src="images/imgtec-logo.png"/></a></p>
+		    <img class="img-responsive center-block" src="images/imgtec-logo.png" alt="imgtec logo"/></a></p>
 	      </div>
 	      <div class="col-sm-12">
 		<a href="http://www.imgtec.com/">Imagination Technologies</a>
@@ -121,7 +121,7 @@
 	    <div class="panel-body">
 	      <div class="col-sm-12">
 		<p><a href="http://circuitco.com/">
-		    <img class="img-responsive center-block" src="images/circuitco-logo.png"/></a></p>
+		    <img class="img-responsive center-block" src="images/circuitco-logo.png" alt="circuitco logo"/></a></p>
 	      </div>
 	      <div class="col-sm-12">
 		<p><a href="http://circuitco.com/">CircuitCo</a> sponsored
@@ -137,7 +137,7 @@
 	    <div class="panel-body">
 	      <div class="col-sm-12">
 		<p><a href="http://boundarydevices.com/">
-		    <img class="img-responsive center-block" src="images/boundary-devices-logo.png"/></a></p>
+		    <img class="img-responsive center-block" src="images/boundary-devices-logo.png" alt="boundarydevices logo"/></a></p>
 	      </div>
 	      <div class="col-sm-12">
 		<p><a href="http://boundarydevices.com/">BoundaryDevices</a>
@@ -153,7 +153,7 @@
 	    <div class="panel-body">
 	      <div class="col-sm-12">
 		<p><a href="http://www.fluendo.com/">
-		    <img class="img-responsive center-block" src="images/fluendo-logo.png"/></a></p>
+		    <img class="img-responsive center-block" src="images/fluendo-logo.png" alt="fluendo logo"/></a></p>
 	      </div>
 	      <div class="col-sm-12">
 		<p><a href="http://www.fluendo.com/">Fluendo</a> sponsored the
@@ -171,7 +171,7 @@
 	    <div class="panel-body">
 	      <div class="col-sm-12">
 		<p><a href="http://www.synopsys.com">
-		    <img class="img-responsive center-block" src="images/synopsys-logo.png"/></a></p>
+		    <img class="img-responsive center-block" src="images/synopsys-logo.png" alt="synopsys logo"/></a></p>
 	      </div>
 	      <div class="col-sm-12">
 		<p><a href="http://www.synopsys.com">Synopsys</a> sponsored the
@@ -186,7 +186,7 @@
 	    <div class="panel-body">
 	      <div class="col-sm-12">
 		<p><a href="http://www.calao-systems.com/">
-		    <img class="img-responsive center-block" src="images/calao-logo.png"/></a></p>
+		    <img class="img-responsive center-block" src="images/calao-logo.png" alt="calao systems logo"/></a></p>
 	      </div>
 	      <div class="col-sm-12">
 		<p><a href="http://www.calao-systems.com/">Calao Systems</a>
@@ -202,7 +202,7 @@
 	    <div class="panel-body">
 	      <div class="col-sm-12">
 		<p><a href="http://www.free-electrons.com">
-		    <img class="img-responsive center-block" src="images/free-electrons-logo.png"/></a></p>
+		    <img class="img-responsive center-block" src="images/free-electrons-logo.png" alt="free electrons logo"/></a></p>
 	      </div>
 	      <div class="col-sm-12">
 		<p><a href="http://www.free-electrons.com">Free Electrons</a>
@@ -217,5 +217,7 @@
     </div>
   </div>
 </div>
+</div>
+</div>
 
 <!--#include file="footer.html" -->
diff --git a/docs/website/support.html b/docs/website/support.html
index 2f16efe..6f3fb06 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -16,7 +16,7 @@
 	    <div class="panel-body">
 	      <div class="row">
 		<div class="col-sm-1">
-		  <img class="img-responsive" src="images/irc.png" style="max-width:50px; margin-bottom:10px;">
+		  <img class="img-responsive" src="images/irc.png" alt="irc icon" style="max-width:50px; margin-bottom:10px;" />
 		</div>
 		<div class="col-sm-11">
 		  <p>The Buildroot IRC channel is <a href="irc://freenode.net/#buildroot">
@@ -36,7 +36,7 @@
 	    <div class="panel-body">
 	      <div class="row">
 		<div class="col-sm-1">
-		  <img class="img-responsive" src="images/email.png" style="max-width:50px; margin-bottom:10px;">
+		  <img class="img-responsive" src="images/email.png" alt="mailing list icon" style="max-width:50px; margin-bottom:10px;" />
 		</div>
 		<div class="col-sm-11">
 		  <p>The <a href="/lists/buildroot/">mailing list</a> is for discussion and
@@ -56,8 +56,8 @@
 		    before.</p>
 
 		  <form method="get" action="http://search.gmane.org/">
-		    <input type="text" name="query">
-		    <input type="hidden" name="group" value="gmane.comp.lib.uclibc.buildroot">
+		    <input type="text" name="query" />
+		    <input type="hidden" name="group" value="gmane.comp.lib.uclibc.buildroot" />
 		    <button type="submit" class="btn btn-default">Submit</button>
 		  </form>
 		</div>
@@ -72,7 +72,7 @@
 	    <div class="panel-body">
 	      <div class="row">
 		<div class="col-sm-1">
-		  <img class="img-responsive" src="images/bug-buddy.png" style="max-width:50px; margin-bottom:10px;">
+		  <img class="img-responsive" src="images/bug-buddy.png" alt="bug tracker icon" style="max-width:50px; margin-bottom:10px;" />
 		</div>
 		<div class="col-sm-11">
 		  <p>If you encounter any problem while using Buildroot, you can use the
-- 
1.9.1
