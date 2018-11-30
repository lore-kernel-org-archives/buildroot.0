From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Nov 2018 13:27:09 +0100
Subject: [Buildroot] [git commit] Update for 2018.11-rc3
Message-ID: <20181130122425.23B2B8914D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0031f521909a857d9781a3f0585766b49b31b63e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 18 ++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index bfd9ff1524..e88f7258bb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,21 @@
+2018.11-rc3, released November 30th, 2018
+
+	Fixes all over the tree.
+
+	Defconfigs: Fixes for Armadeus APF27, imx6sabre, Olimex A20
+	olinuxino lime legacy, Orangepi zero plus 2, PC, Riotboard.
+
+	graph-depends: Fix for package names starting with a non-alpha
+	character.
+
+	Updated/fixed packages: alsa-utils, botan, dante, domoticz,
+	dtc, freetype, gauche, gcc, gdb, ghostscript, glibc,
+	imx-usb-loader, libbsd, libid3tag, libkrb5, libmicrohttpd,
+	libopenssl, libsoxr, linux, motion, msgpack, mtd,
+	perl-net-ssleay, php, popt, python-numpy, qt5declarative,
+	samba4, shadowsocks-libev, stress-ng, systemd, usb_modeswitch,
+	webkitgtk, valgrind, weston, xfsprogs
+
 2018.11-rc2, released November 21th, 2018
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 69cbd7868d..ea44994c6e 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.11-rc2
+export BR2_VERSION := 2018.11-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1542786000
+BR2_VERSION_EPOCH = 1543580000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 8ee433d80d..0662199e9e 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2018.11-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2018.11-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.11-rc2.tar.gz">buildroot-2018.11-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2018.11-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.11-rc3.tar.gz">buildroot-2018.11-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2018.11-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.11-rc2.tar.bz2">buildroot-2018.11-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2018.11-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.11-rc3.tar.bz2">buildroot-2018.11-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2018.11-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 4aa5b57c02..5322b5723e 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2018.11-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2018</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups
+          and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.11-rc3">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2018.11-rc3.tar.bz2">2018.11-rc3
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
