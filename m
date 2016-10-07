From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:23:34 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXfixes: security
	bump to 5.0.3
Message-ID: <20161007132630.CB2C881810@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=255ed433fa0bc315ab2d67cda2634bb7b5780df1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Please see the security advisory for details:
https://lists.x.org/archives/xorg-announce/2016-October/002720.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libXfixes/xlib_libXfixes.hash | 4 ++--
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
index 00164cd..d96e5c6 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2013-May/002227.html
-sha256	9bd20edfec084a1bed481d48dd4815dee88139fffad091418cdda081129a9aea	libXfixes-5.0.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-October/002722.html
+sha256 de1cd33aff226e08cefd0e6759341c2c8e8c9faf8ce9ac6ec38d43e287b22ad6  libXfixes-5.0.3.tar.bz2
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index 82799a3..b7d835b 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFIXES_VERSION = 5.0.2
+XLIB_LIBXFIXES_VERSION = 5.0.3
 XLIB_LIBXFIXES_SOURCE = libXfixes-$(XLIB_LIBXFIXES_VERSION).tar.bz2
 XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFIXES_LICENSE = MIT
