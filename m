From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 23:20:35 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libX11: security bump
 to version 1.6.6
Message-ID: <20180821211334.E056A8E208@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a732f00379c8613a8fbe824fbc965d03ff88ac50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-14599, CVE-2018-14600 & CVE-2018-14598:
https://lists.x.org/archives/xorg-announce/2018-August/002915.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 9 +++++++--
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index b1a87b18e1..4dc934177a 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,2 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2017-February/002777.html
-sha256 4d3890db2ba225ba8c55ca63c6409c1ebb078a2806de59fb16342768ae63435d  libX11-1.6.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-August/002916.html
+md5 6b0f83e851b3b469dd660f3a95ac3e42  libX11-1.6.6.tar.bz2
+sha1 b29cf4362b58188cb27fed2294788004af7428a9  libX11-1.6.6.tar.bz2
+sha256 65fe181d40ec77f45417710c6a67431814ab252d21c2e85c75dd1ed568af414f  libX11-1.6.6.tar.bz2
+sha512 9866dc6b158b15a96efe140b6fa68a775889a37e5565a126216211fee63868e02629a9f9f41816d590ef150560f43b8864010a77a6318c9109e76aec1d21b4d7  libX11-1.6.6.tar.bz2
+# Locally computed
+sha256 2daec087a88e7c9b8082557cdeebad5bbb8155a4137472f0b22e269cd99d0c1e  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index e2266cdfad..9eafd47e7b 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.6.5
+XLIB_LIBX11_VERSION = 1.6.6
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
