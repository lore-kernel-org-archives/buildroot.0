From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Nov 2013 23:49:47 +0100
Subject: [Buildroot] [git commit] Update for 2013.11-rc1
Message-ID: <20131112231429.89E849BBB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=abce7ca6f2672ed5988596310e1165f04d2e5ad6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES            |   16 ++++++++--------
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   13 +++++++++++++
 4 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index 12c6b2b..b1edb5c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2013.11, Not yet released:
+2013.11-rc1, Released November 12th, 2013
 
 	Architectures: Nios-II support, MIPS arch handling fixes
 
@@ -60,13 +60,13 @@
 	smartmontools, socat, socketcand, sqlcipher, sqlite, squid,
 	stress, strongswan, stunnel, sudo, syslinux, systemd,
 	sysvinit, tcl, ti-gfx, time, transmission, tremor, tslib,
-	tvheadend, tzdata, uboot-tools, uclibc, udpcast, uemacs,
-	ulogd, usb_modeswitch{,_data}, util-linux, vala, valgrind,
-	vde2, vorbus-tools, vpnc, vsftpd, vtun, wayland, webkit, webp,
-	webrtc-audio-processing, weston, wget, wireshark, wsapi,
-	xavante, xdriver_xf86-video-geode, xenomai, xinetd,
-	xlib_libpthread-stubs, xl2tp, xmlstarlet, xserver_xorg-server,
-	xz, zeromq, zic, zmqpp
+	tstools, tvheadend, tzdata, uboot-tools, uclibc, udpcast,
+	uemacs, ulogd, usb_modeswitch{,_data}, util-linux, vala,
+	valgrind, vde2, vorbus-tools, vpnc, vsftpd, vtun, wayland,
+	webkit, webp, webrtc-audio-processing, weston, wget,
+	wireshark, wsapi, xavante, xdriver_xf86-video-geode, xenomai,
+	xinetd, xlib_libpthread-stubs, xl2tp, xmlstarlet,
+	xserver_xorg-server, xz, zeromq, zic, zmqpp
 
 	New packages: aiccu, autossh, bc, civetweb, cppdb, cryptsetup,
 	duma, eigen, harfbuzz, igmpproxy, iputils, jq, knock, kobs-ng,
diff --git a/Makefile b/Makefile
index 2f7db59..c7a0a6d 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2013.11-git
+export BR2_VERSION:=2013.11-rc1
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 49c768d..dfba889 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,15 +14,15 @@ or
 <a href="/downloads/buildroot-2013.08.1.tar.bz2">buildroot-2013.08.1.tar.bz2</a>.
 
 <p>
-<!--
-The latest release candidate is <b>2013.08-rc3</b>, which can be
+
+The latest release candidate is <b>2013.11-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2013.08-rc3.tar.gz">buildroot-2013.08-rc3.tar.gz</a>
+<a href="/downloads/buildroot-2013.11-rc1tar.gz">buildroot-2013.11-rc1.tar.gz</a>
 or
-<a href="/downloads/buildroot-2013.08-rc3.tar.bz2">buildroot-2013.08-rc3.tar.bz2</a>.
+<a href="/downloads/buildroot-2013.11-rc3.tar.bz2">buildroot-2013.11-rc1.tar.bz2</a>.
 <p>
--->
+
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 2560227..91ed85d 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>12 November 2013 -- 2013.11-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.11_rc1">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2013.11-rc1.tar.bz2">2013.11-rc1
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>11 November 2013 -- Report from Buildroot Developers Meeting</b>
 
     <p>A report from the recent
