From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 May 2021 10:49:31 +0200
Subject: [Buildroot] [git commit] Update for 2021.05-rc1
Message-ID: <20210512082158.6CA9783D45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afe19e6ced27910ec92087d8376c8340621521fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |  4 ++--
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/CHANGES b/CHANGES
index 52450adeb3..4cb218a56f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2021.05-rc1, not yet released
+2021.05-rc1, released May 12th, 2021
 
 	Fixes all over the tree and new features.
 
@@ -13,7 +13,7 @@
 	scripts, so they can call the Buildroot Makefile in the
 	correct directory for both in-tree / out-of-tree builds.
 
-	CMake infrastructure: Use CMAKE_EXE_LINKERFLAGS rather than
+	CMake infrastructure: Use CMAKE_EXE_LINKER_FLAGS rather than
 	CMAKE_CXX_FLAGS to link with libatomic to fix an compatibility
 	issue with poppler. Bump minimal host cmake version to 3.16
 	(from 3.15) to fix a compatibility issue with domoticz.
diff --git a/Makefile b/Makefile
index ef2b6a34e8..76f14888ea 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.05-git
+export BR2_VERSION := 2021.05-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1615065000
+BR2_VERSION_EPOCH = 1620809000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 384b9e98f1..fde13ce8cc 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,41 @@
 	  <p><a href="/downloads/buildroot-2020.11.3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
-      <h3 style="text-align: center;">Latest release candidate: <b>2021.02-rc3</b></h3>
+-->
+      <h3 style="text-align: center;">Latest release candidate: <b>2021.05-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.02-rc3.tar.gz">buildroot-2021.02-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2021.02-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.05-rc1.tar.gz">buildroot-2021.05-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2021.05-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.02-rc3.tar.bz2">buildroot-2021.02-rc3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2021.02-rc3.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.05-rc1.tar.bz2">buildroot-2021.05-rc1.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2021.05-rc1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index fcc73d775d..9192a117a8 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2021.05-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 May 2021</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the tree, see the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.05-rc1">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2021.05-rc1.tar.bz2">2021.05-rc1
+	  release</a>, and report any problems found to the
+         <a href="support.html">mailing list</a> or
+         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
