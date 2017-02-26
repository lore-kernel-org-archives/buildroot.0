From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Feb 2017 23:17:04 +0100
Subject: [Buildroot] [git commit] Update for 2017.02-rc3
Message-ID: <20170226221749.6372E81D5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87a23e538a05c043635ed6dac155c3e6f109b3d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 26 ++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 59 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index f241f36..7c9add7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,29 @@
+2017.02-rc3, Released February 26th, 2017
+
+	Fixes all over the tree.
+
+	Cmake reverted to version 3.6.3 to workaround regressions
+	related to RPATH handling.
+
+	Updated/fixed packages: bctoolbox, berkeleydb, binutils,
+	btrfs-progs, classpath, directfb, glibc, gstreamer1,
+	gst1-plugins-{base,good,bad,ugly}, gst1-libav,
+	gst1-rtsp-server, gst1-validate, gst-omx, htop, libcurl,
+	libepoxy, libimxvpuapi, libpcap, libuv, ncurses, openssh,
+	oracle-mysql, poco, python, qt5base, qt5webkit, sslh, synergy,
+	trousers, uclibc-ng-test, util-linux, vlc, xfsprogs
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9251: Shared C++ libraries for Microblaze results in Segmentation...
+	#9456: mkusers script bash errors
+	#9506: Collectd 5.7.0 fails to build with libcrypt
+	#9581: VagrantFile provisioning step fails due to issue with grub-pc
+	#9586: usbmount: usbmount slows down the system... to a state of...
+	#9616: CMake host packages cannot provide CONF_ENV
+	#9641: Need raptor package installed in staging
+	#9671: stunnel build error
+
 2017.02-rc2, Released February 20th, 2017
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index b5b431a..68b2d47 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.02-rc2
+export BR2_VERSION := 2017.02-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1487631000
+BR2_VERSION_EPOCH = 1488147000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 85eb5f0..83d618c 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,37 +42,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2017.02-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2017.02-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.02-rc2.tar.gz">buildroot-2017.02-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2017.02-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.02-rc3.tar.gz">buildroot-2017.02-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2017.02-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.02-rc2.tar.bz2">buildroot-2017.02-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2017.02-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.02-rc3.tar.bz2">buildroot-2017.02-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2017.02-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 38ed846..25d6bce 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2017.02-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 February 2017</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>Release candidate 3 is out with more cleanups and security
+	  / build fixes. See
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.02-rc3">CHANGES</a>
+	  file for details.</p>
+	<p>Head to the <a href="/downloads/">downloads page</a> to
+	  pick up
+	  the <a href="/downloads/buildroot-2017.02-rc3.tar.bz2">2017.02-rc3
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
