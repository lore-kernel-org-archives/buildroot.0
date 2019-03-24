From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 23:07:51 +0100
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXrandr: bump version
 to 1.5.2
Message-ID: <20190324220643.C0BC3802F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb7282f08e2b968ebb49403a04f73bd5878b781e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXrandr/xlib_libXrandr.hash | 9 +++++++--
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash b/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
index 84a50cb5de..ed53669537 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
@@ -1,2 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2016-October/002724.html
-sha256 1ff9e7fa0e4adea912b16a5f0cfa7c1d35b0dcda0e216831f7715c8a3abcf51a  libXrandr-1.5.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002979.html
+md5 18f3b20d522f45e4dadd34afb5bea048  libXrandr-1.5.2.tar.bz2
+sha1 7a1f6df239341b76fd59ebbe101d6f180adb43bb  libXrandr-1.5.2.tar.bz2
+sha256 8aea0ebe403d62330bb741ed595b53741acf45033d3bda1792f1d4cc3daee023  libXrandr-1.5.2.tar.bz2
+sha512 fcd005f9839e7ef980607128a5d76d7b671cc2f5755949e03c569c500d7e987cb3f6932750ab8bf6e2c1086ec69dde09d5831f0c2098b9f9ad46be4f56db0d87  libXrandr-1.5.2.tar.bz2
+# Locally computed
+sha256 73777e5be1cef2827d843e4b186803f050c66db472cf8076d88e2b5f71696e67  COPYING
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 1bfd78f73d..23a0d974d0 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRANDR_VERSION = 1.5.1
+XLIB_LIBXRANDR_VERSION = 1.5.2
 XLIB_LIBXRANDR_SOURCE = libXrandr-$(XLIB_LIBXRANDR_VERSION).tar.bz2
 XLIB_LIBXRANDR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRANDR_LICENSE = MIT
