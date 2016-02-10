From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2016 08:12:57 +0100
Subject: [Buildroot] [git commit] Update for 2016.02-rc1
Message-ID: <20160210072226.E80AF81851@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ecf55c3f0276d2afb1a5f62e2e183bda730b8bac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |  2 +-
 Makefile                   |  2 +-
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 23 +++++++++++++++++++++++
 4 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5a63add..6892121 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2016.02, Not yet released
+2016.02-rc1, Released February 10th, 2016
 
 	Fixes all over the tree and new features.
 
diff --git a/Makefile b/Makefile
index 9daf011..71735b5 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2016.02-git
+export BR2_VERSION := 2016.02-rc1
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 34b06bf..c1f89ff 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -41,41 +41,41 @@
 	  <p><a href="/downloads/buildroot-2015.11.1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest release candidate: <b>2015.11-rc3</b></h3>
+
+      <h3 style="text-align: center;">Latest release candidate: <b>2016.02-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2015.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2015.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2015.11-rc3.tar.gz">buildroot-2015.11-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2015.11-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.02-rc1.tar.gz">buildroot-2016.02-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2016.02-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2015.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2015.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2015.11-rc3.tar.bz2">buildroot-2015.11-rc3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2015.11-rc3.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.02-rc1.tar.bz2">buildroot-2016.02-rc1.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2016.02-rc1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 5d4c264..c72b818 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,29 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2016.02-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 February 2016</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of
+	  changes all over the tree, see
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.02-rc1">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2016.02-rc1.tar.bz2">2016.02-rc1
+	    release candidate</a>, and report any
+	  problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
