From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Aug 2016 08:49:38 +0200
Subject: [Buildroot] [git commit] Update for 2016.08-rc2
Message-ID: <20160817065002.381A57FAE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b3fa45a5275f49412d916640dc1aa173f5e7504
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 29 +++++++++++++++++++++++++++++
 Makefile                   |  2 +-
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 61 insertions(+), 10 deletions(-)

diff --git a/CHANGES b/CHANGES
index 544d6ad..2ecee85 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,32 @@
+2016.08-rc2, Released August 17th, 2016
+
+	Fixes all over the tree.
+
+	Toolchain: disable broken C++ support for internal blackfin
+	toolchains, ARC toolchain bumped to arc-2016.09-eng008 (GCC 6)
+	to fix various issues.
+
+	System: Zoneinfo is available for the musl C library as well.
+
+	Updated/fixed packages: am33x-cm3, axel, barebox, bdwgc,
+	blktrace, cairo, dante, enlightenment, fbterm, ffmpeg, flex,
+	fontconfig, gcc, gmp, gnuplot, gnuradio, gst1-imx, hidapi,
+	inotify_tools, iproute2, kmsxx, lftp, libaio, libcofi,
+	libical, libpjsip, libsidplay2, libunwindow, libxml2,
+	linux-zigbee, lttng-libust, mpv, mtd, ncdu, netplug, ntp,
+	openblas, openipmi, owfs, php, poco, procps, qt, quota,
+	sg3_utils, spidev_test, systemd-bootchart, thrift,
+	uboot-tools, uclibc, webrtc-audio-processing, wayland, weston,
+	xdriver_xf86-video-savage, xserver_xorg-server, xen
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9136: make graph-size fails with "ValueError: too many values to..
+	#9151: qt: fix build with ALSA >= 1.1.x
+	#9156: qt: Fix missing runtime Qt3Support dependency
+	#9161: modsetting patch not applied to xserver 1.18.4
+	#9166: Missing overlays directory in VFAT image for raspberry pi 3
+
 2016.08-rc1, Released August 6th, 2016
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 6a1c9e1..8def78a 100644
--- a/Makefile
+++ b/Makefile
@@ -46,7 +46,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2016.08-rc1
+export BR2_VERSION := 2016.08-rc2
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 647e8ef..907503b 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,37 +42,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2016.08-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2016.08-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.08-rc1.tar.gz">buildroot-2016.08-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2016.08-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.08-rc2.tar.gz">buildroot-2016.08-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2016.08-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.08-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.08-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.08-rc1.tar.bz2">buildroot-2016.08-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2016.08-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.08-rc2.tar.bz2">buildroot-2016.08-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2016.08-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 8c9dbc7..c6dbc4c 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2016.08-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 August 2016</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>Another week, another release candidate with more cleanups
+	  and build fixes. See
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.08-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2016.08-rc2.tar.bz2">2016.08-rc2
+	    release candidate</a>, and report any problems found to
+	  the <a href="support.html">mailing list</a>
+	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
