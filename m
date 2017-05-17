From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 10:27:16 +0200
Subject: [Buildroot] [git commit] Update for 2017.05-rc2
Message-ID: <20170517082838.43FFF820E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ab8f10afaa7579c04d6705eb30c325409e599f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 19 +++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 52 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8496b29..8448145 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,22 @@
+2017.05-rc2, Released May 17th, 2017
+
+	Fixes all over the tree.
+
+	ARC toolchain bumped to 2017.03-rc2
+
+	Updated/fixed packages: bluez_utils, boost, clamav, daemon,
+	efibootmgr, efl, espeak, expedite, faketime, ffmpeg, fxload,
+	git, gpsd, kvm-unit-tests, libcdio, libv4l, lua, mke2img,
+	mpir, mpv, odroid-scripts, openblas, opencv3, openvpn, php,
+	postgresql, protobuf, qt5declarative, qwt, radvd, rpcbind,
+	rtmpdump, strongswan, sudo, ltp-testsuite, uclibc-ng-test,
+	vlc, x11vnc, xfsprogs
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9796: source-check broken for Git downloads
+	#9866: BASE_DIR usage
+
 2017.05-rc1, Released May 8th, 2017
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 95ecf3c..a3ad402 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.05-rc1
+export BR2_VERSION := 2017.05-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1494230000
+BR2_VERSION_EPOCH = 1495000000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 51859f0..b5a9c39 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,37 +42,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2017.05-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2017.05-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.05-rc1.tar.gz">buildroot-2017.05-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2017.05-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.05-rc2.tar.gz">buildroot-2017.05-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2017.05-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.05-rc1.tar.bz2">buildroot-2017.05-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2017.05-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.05-rc2.tar.bz2">buildroot-2017.05-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2017.05-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 04ca641..b9489e7 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2017.05-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 May 2017</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups
+          and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.05-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2017.05-rc2.tar.bz2">2017.05-rc2
+	  release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
