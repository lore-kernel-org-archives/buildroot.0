From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 May 2019 22:35:04 +0200
Subject: [Buildroot] [git commit] Update for 2019.05-rc2
Message-ID: <20190515203017.AA2318B51E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2adc578dfdde35d5869a1ecabf403ea5dc4bbdbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 13 +++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6fb63479ee..5d1d858bd3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,16 @@
+2019.05-rc2, released May 15th, 2019
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: bind, bullet, ca-certificates,
+	collectd, cracklib, dhcp, gdb, libinput, libtorrent-rasterbar,
+	linknx, lynx, mono, netsurf, optee-os, postgresql, qt5enginio,
+	qt5multimedia, rpm, samba4, sqlite, strace, uclibc, woff2
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11841: grub-efi.cfg not used when building EFI disk image
+
 2019.05-rc1, Released May 8th, 2019
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 6dcd3d23e3..7246376cf9 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.05-rc1
+export BR2_VERSION := 2019.05-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1557349000
+BR2_VERSION_EPOCH = 1557953000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index a23013dd4c..9203c60195 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 -->
-      <h3 style="text-align: center;">Latest release candidate: <b>2019.05-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2019.05-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.05-rc1.tar.gz">buildroot-2019.05-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2019.05-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.05-rc2.tar.gz">buildroot-2019.05-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2019.05-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.05-rc1.tar.bz2">buildroot-2019.05-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2019.05-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.05-rc2.tar.bz2">buildroot-2019.05-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2019.05-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 5994282a7a..9913893875 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2019.05-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 May 2019</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.05-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2019.05-rc2.tar.bz2">2019.05-rc2
+	  release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
