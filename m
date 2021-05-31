From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 May 2021 23:29:41 +0200
Subject: [Buildroot] [git commit] Update for 2021.05-rc3
Message-ID: <20210531210850.A4E298B306@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4132725bd521308116f069c61d8e2002a2185cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 16 ++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 3 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 53b9020767..95b3a38024 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,19 @@
+2021.05-rc3, released May 31th, 2021
+
+	Fixes all over the tree.
+
+	meson: Explicitly disable PIE support (b_pie) as it is handled
+	by the toolchain wrapper.
+
+	Updated/fixed packages: boost, dhcp, expat, gdb, hwloc, imagemagick,
+	libcurl, libopenh264, llvm, lz4, mpv, nginx, paho-mqtt-c, pifmrds,
+	pipewire, python-bluezero, python-pillow, qemu, strace, uhd, vlc,
+	webkitgtk
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13821: Wrong url for libnfsidmap package
+
 2021.05-rc2, released May 22th, 2021
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 57322fb586..29250a232d 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.05-rc2
+export BR2_VERSION := 2021.05-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1621690900
+BR2_VERSION_EPOCH = 1622496000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 3654285527..ea3af3bfb0 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 -->
-      <h3 style="text-align: center;">Latest release candidate: <b>2021.05-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2021.05-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.05-rc2.tar.gz">buildroot-2021.05-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2021.05-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.05-rc3.tar.gz">buildroot-2021.05-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2021.05-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.05-rc2.tar.bz2">buildroot-2021.05-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2021.05-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.05-rc3.tar.bz2">buildroot-2021.05-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2021.05-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
