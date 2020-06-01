From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Jun 2020 23:11:33 +0200
Subject: [Buildroot] [git commit] Update for 2020.05
Message-ID: <20200601211529.AEFE381EC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6306cf35c5936184c09fa1f5678c3381e330fe2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |  8 ++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 26 +++++++++++++-------------
 docs/website/news.html     | 18 ++++++++++++++++++
 4 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/CHANGES b/CHANGES
index 85e9828cbf..3cda0af8df 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,11 @@
+2020.05, released June 1st, 2020
+
+	Various fixes.
+
+	Updated/fixed packages: arm-trusted-firmware, gcc, mp4v2, fmc,
+	fmlib, glib-networking, libusb-compat, linux, qt5webengine,
+	sysrepo, wampcc, xen
+
 2020.05-rc3, released May 29th, 2020
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 374ddb068f..b2afe5bcfb 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.05-rc3
+export BR2_VERSION := 2020.05
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1590784000
+BR2_VERSION_EPOCH = 1591045000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 60308d9e56..0f8efbd577 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,7 +8,7 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest stable / long term support release: <b>2020.02.2</b></h3>
+      <h3 style="text-align: center;">Latest long term support release: <b>2020.02.2</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -41,41 +41,41 @@
 	  <p><a href="/downloads/buildroot-2020.02.2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest stable release: <b>2019.11.1</b></h3>
+
+      <h3 style="text-align: center;">Latest stable release: <b>2020.05</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.11.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.11.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2019.11.1.tar.gz">buildroot-2019.11.1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2019.11.1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.05.tar.gz">buildroot-2020.05.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2020.05.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.11.1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.05.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.11.1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.05.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.11.1.tar.bz2">buildroot-2019.11.1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2019.11.1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.05.tar.bz2">buildroot-2020.05.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2020.05.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2020.05-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2020.05-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 908a3f4536..f8ccb4eac0 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2020.05 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 June 2020</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2020.05 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.05">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2020.05.tar.bz2">2020.05 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
