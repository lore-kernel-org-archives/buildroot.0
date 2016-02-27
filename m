From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2016 23:50:51 +0100
Subject: [Buildroot] [git commit] Update for 2016.02-rc3
Message-ID: <20160227225311.C14CB80819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=100ba0f6d6b8020dd4d3ea8ffbfc7f1f3219a650
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 30 ++++++++++++++++++++++++++++++
 Makefile                   |  2 +-
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 62 insertions(+), 10 deletions(-)

diff --git a/CHANGES b/CHANGES
index 347fa75..d54feb2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,33 @@
+2016.02-rc3, Released February 27th, 2016
+
+	Fixes all over the tree.
+
+	Defconfigs: Ensure EABIhf is correctly enabled for ARM cores
+	where VFP is optional (but present on the specific hw). Fix
+	ARM variant selection for freescale_imx31_3stack_defconfig.
+
+	Ensure tarballs of downloaded git trees do not contain a
+	timestamp.
+
+	Clarify license of patches in COPYING.
+
+	Updated/fixed package: avahi, binutils, cairo, can-festival,
+	chrony, cifs-utils, dnsmasq, dvdauthor, e2fsprogs, efl,
+	erlang-rebar, eudev, fbterm, gawk, gnupg2, gnuradio, gpm,
+	gst1-plugins-good, hostapd, imagemagick, iproute2, iputils,
+	jack2, kexec, kismet, lftp, libarchive, libeXosip2, libfm,
+	libglib2, libsoil, libssh, libssh2, libuci, links, lshw, lxc,
+	mediastreamer, mono, mraa, mutt, nfs-utils, numactl, ofono,
+	omniorb, openipmi, openobex, patch, pax-utils, perf,
+	pulseaudio, pure-ftp, qhull, qt, quagga, quota, sdl_sound,
+	shairport-sync, spice, sysklogd, syslog-ng, trace-cmd,
+	trousers, tvheadend, util-linux, vim, webkitgtk24, wireshark,
+	wpa_supplicant, xerces, zsh
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#8651: libMonoPosixHelper.so wrong link reference in buildroot..
+
 2016.02-rc2, Released February 18th, 2016
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index c43c599..568f5c2 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2016.02-rc2
+export BR2_VERSION := 2016.02-rc3
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index ce51540..dae9b5b 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,37 +42,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2016.02-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2016.02-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.02-rc2.tar.gz">buildroot-2016.02-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2016.02-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.02-rc3.tar.gz">buildroot-2016.02-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2016.02-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.02-rc2.tar.bz2">buildroot-2016.02-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2016.02-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.02-rc3.tar.bz2">buildroot-2016.02-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2016.02-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index e7252df..f36c259 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2016.02-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 February 2016</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>Release candidate 3 is out with more cleanups and security
+	  / build fixes. See
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.02-rc3">CHANGES</a>
+	  file for details.</p>
+	<p>Head to the <a href="/downloads/">downloads page</a> to
+	  pick up
+	  the <a href="/downloads/buildroot-2016.02-rc3.tar.bz2">2016.02-rc3
+	    release candidate</a>, and report any problems found to
+	  the <a href="support.html">mailing list</a>
+	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
