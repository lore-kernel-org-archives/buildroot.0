From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 07:16:43 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_setxkbmap: bump version
 to 1.3.2
Message-ID: <20190717051632.938EC8379E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5966187a788aed418b427d91cca079939ba2078b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream, added license hash.
Updated _SITE according to release notes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash | 9 +++++++--
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk   | 4 ++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash
index bdc5f1cc78..4f963593cb 100644
--- a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash
+++ b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002563.html
-sha256	a9ddb3963f263ba13f0ea105d8c45a531832140530217cc559587bb94f02d3e1	setxkbmap-1.3.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-July/003007.html
+md5 93e736c98fb75856ee8227a0c49a128d  setxkbmap-1.3.2.tar.bz2
+sha1 44783734bc58fca93165a20da0bb3eca1ccb9ad9  setxkbmap-1.3.2.tar.bz2
+sha256 8ff27486442725e50b02d7049152f51d125ecad71b7ce503cfa09d5d8ceeb9f5  setxkbmap-1.3.2.tar.bz2
+sha512 bfa8015dee0d8d3fdbbd89afbd71c8606ce168d6edca8521d5ed05a00fecbea39bc4bfcce84b71458bdeb34c60bd80a5df27e0691ccee3966443ecdc937faf38  setxkbmap-1.3.2.tar.bz2
+# Locally computed
+sha256 afb8ce58340b6a6b85b73e256425263ce46f5a427279785e275991cb660cce82  COPYING
diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
index b923d60f53..8b69747593 100644
--- a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
+++ b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_SETXKBMAP_VERSION = 1.3.1
+XAPP_SETXKBMAP_VERSION = 1.3.2
 XAPP_SETXKBMAP_SOURCE = setxkbmap-$(XAPP_SETXKBMAP_VERSION).tar.bz2
-XAPP_SETXKBMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_SETXKBMAP_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SETXKBMAP_LICENSE = MIT
 XAPP_SETXKBMAP_LICENSE_FILES = COPYING
 XAPP_SETXKBMAP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
