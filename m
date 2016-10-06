From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 07:28:37 +0200
Subject: [Buildroot] [PATCH 08/11] package/x11r7/xlib_libXrender: security
	bump to 0.9.10
In-Reply-To: <20161006052840.12339-1-bernd.kuhls@t-online.de>
References: <20161006052840.12339-1-bernd.kuhls@t-online.de>
Message-ID: <20161006052840.12339-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please see the security advisory for details:
https://lists.x.org/archives/xorg-announce/2016-October/002720.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXrender/xlib_libXrender.hash | 4 ++--
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.hash b/package/x11r7/xlib_libXrender/xlib_libXrender.hash
index 2a9912a..bbc5b89 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.hash
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002593.html
-sha256	fc2fe57980a14092426dffcd1f2d9de0987b9d40adea663bd70d6342c0e9be1a	libXrender-0.9.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-October/002725.html
+sha256 c06d5979f86e64cabbde57c223938db0b939dff49fdb5a793a1d3d0396650949  libXrender-0.9.10.tar.bz2
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index 72626cf..6134c45 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRENDER_VERSION = 0.9.9
+XLIB_LIBXRENDER_VERSION = 0.9.10
 XLIB_LIBXRENDER_SOURCE = libXrender-$(XLIB_LIBXRENDER_VERSION).tar.bz2
 XLIB_LIBXRENDER_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRENDER_LICENSE = MIT
-- 
2.9.3
