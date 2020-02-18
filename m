From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Feb 2020 23:31:02 +0100
Subject: [Buildroot] [git commit] Update for 2020.02-rc1
Message-ID: <20200218224319.42F918E491@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22f07ab2b546f6dfdfc11a37e577b3f63e829c3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |  2 +-
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 23 +++++++++++++++++++++++
 4 files changed, 37 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index 06c9201960..d883bb393e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2020.02-rc1, not yet released
+2020.02-rc1, released February 18th, 2020
 
 	Fixes all over the tree and new features.
 
diff --git a/Makefile b/Makefile
index af24630d2f..671e12a9d4 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.02-git
+export BR2_VERSION := 2020.02-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1575236000
+BR2_VERSION_EPOCH = 1582065000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 5e1303b58f..2e003da71c 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,41 @@
 	  <p><a href="/downloads/buildroot-2019.11.1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest release candidate: <b>2019.11-rc3</b></h3>
+
+      <h3 style="text-align: center;">Latest release candidate: <b>2020.02-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.11-rc3.tar.gz">buildroot-2019.11-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2019.11-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.02-rc1.tar.gz">buildroot-2020.02-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2020.02-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.11-rc3.tar.bz2">buildroot-2019.11-rc3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2019.11-rc3.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.02-rc1.tar.bz2">buildroot-2020.02-rc1.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2020.02-rc1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index d1fa009fd5..b6584b572a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,29 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2020.02-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 February 2020</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the
+	  tree, see the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.02-rc1">CHANGES</a>
+	  file for details.
+	</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2020.02-rc1.tar.bz2">2020.02-rc1
+	    release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
