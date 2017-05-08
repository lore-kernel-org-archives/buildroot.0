From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 May 2017 12:21:32 +0200
Subject: [Buildroot] [git commit] Update for 2017.05-rc1
Message-ID: <20170508102142.D60967FF72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aee0ef54881151368d600500a663f21e160dd816
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 24 ++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index 919d589..95ecf3c 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.05-git
+export BR2_VERSION := 2017.05-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1488315000
+BR2_VERSION_EPOCH = 1494230000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index ed44bdf..51859f0 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -41,41 +41,41 @@
 	  <p><a href="/downloads/buildroot-2017.02.2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest release candidate: <b>2017.02-rc3</b></h3>
+
+      <h3 style="text-align: center;">Latest release candidate: <b>2017.05-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.02-rc3.tar.gz">buildroot-2017.02-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2017.02-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.05-rc1.tar.gz">buildroot-2017.05-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2017.05-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.02-rc3.tar.bz2">buildroot-2017.02-rc3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2017.02-rc3.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.05-rc1.tar.bz2">buildroot-2017.05-rc1.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2017.05-rc1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 044ba37..04ca641 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,30 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2017.05-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 May 2017</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over
+	  the tree, see
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.05-rc1">CHANGES</a>
+	  file for details.
+	</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2017.05-rc1.tar.bz2">2017.05-rc1
+	    release candidate</a>, and report any
+	  problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
