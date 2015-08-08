From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:36 -0000
Subject: [Buildroot] [git commit branch/next] package/x11r7/xlib_libXrender:
	bump version to 0.9.9
Message-ID: <20150808105629.B36EA7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=977230e25ee38e76e30ab800933deb7db6b9cdfb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libXrender/xlib_libXrender.hash |    4 ++--
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.hash b/package/x11r7/xlib_libXrender/xlib_libXrender.hash
index c2a623d..2a9912a 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.hash
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2013-June/002249.html
-sha256	1d14b02f0060aec5d90dfdcf16a996f17002e515292906ed26e3dcbba0f4fc62	libXrender-0.9.8.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-April/002593.html
+sha256	fc2fe57980a14092426dffcd1f2d9de0987b9d40adea663bd70d6342c0e9be1a	libXrender-0.9.9.tar.bz2
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index 52ff30e..949dea3 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRENDER_VERSION = 0.9.8
+XLIB_LIBXRENDER_VERSION = 0.9.9
 XLIB_LIBXRENDER_SOURCE = libXrender-$(XLIB_LIBXRENDER_VERSION).tar.bz2
 XLIB_LIBXRENDER_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRENDER_LICENSE = MIT
