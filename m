From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:23:38 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXrender: security
	bump to 0.9.10
Message-ID: <20161007132630.F0FCF822F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1c50412877fbda76f3629a6fc10d3084fb15d34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Please see the security advisory for details:
https://lists.x.org/archives/xorg-announce/2016-October/002720.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
