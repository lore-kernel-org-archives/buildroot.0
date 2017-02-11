From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 15:47:27 +0100
Subject: [Buildroot] [git commit] Prepare for 2017.02-rc1
Message-ID: <20170211150419.E162A820EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7320758cad162cfe153cbe1ac00ef3e0e2c70dbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 24 ++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index df3b64e..dcda8fe 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.02-git
+export BR2_VERSION := 2017.02-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1478206447
+BR2_VERSION_EPOCH = 1486825200
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 37adfad..8d8aae3 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -41,41 +41,41 @@
 	  <p><a href="/downloads/buildroot-2016.11.2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest release candidate: <b>2016.11-rc3</b></h3>
+
+      <h3 style="text-align: center;">Latest release candidate: <b>2017.02-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.11-rc3.tar.gz">buildroot-2016.11-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2016.11-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.02-rc1.tar.gz">buildroot-2017.02-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2017.02-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.11-rc3.tar.bz2">buildroot-2016.11-rc3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2016.11-rc3.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.02-rc1.tar.bz2">buildroot-2017.02-rc1.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2017.02-rc1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 7139144..7be1ddf 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,30 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2017.02-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 February 2017</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of
+	  changes all over the tree, see
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.02-rc1">CHANGES</a>
+	  file for details.
+	</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2016.11-rc1.tar.bz2">2017.12-rc1
+	    release candidate</a>, and report any
+	  problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
