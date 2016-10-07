From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:23:39 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXtst: security bump
	to 1.2.3
Message-ID: <20161007132631.07358822F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46b271ae39b208b89d5803715f35659b5742de9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Please see the security advisory for details:
https://lists.x.org/archives/xorg-announce/2016-October/002720.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libXtst/xlib_libXtst.hash | 4 ++--
 package/x11r7/xlib_libXtst/xlib_libXtst.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.hash b/package/x11r7/xlib_libXtst/xlib_libXtst.hash
index 4224121..7e55a75 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.hash
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2013-May/002237.html
-sha256	ef0a7ffd577e5f1a25b1663b375679529663a1880151beaa73e9186c8309f6d9	libXtst-1.2.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-October/002726.html
+sha256 4655498a1b8e844e3d6f21f3b2c4e2b571effb5fd83199d428a6ba7ea4bf5204  libXtst-1.2.3.tar.bz2
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index ad3caea..d71290a 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXTST_VERSION = 1.2.2
+XLIB_LIBXTST_VERSION = 1.2.3
 XLIB_LIBXTST_SOURCE = libXtst-$(XLIB_LIBXTST_VERSION).tar.bz2
 XLIB_LIBXTST_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXTST_LICENSE = MIT
