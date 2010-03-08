From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXext to 1.1.1
Message-ID: <20100308133616.9ADF8776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dd253742b38387d02f6ed2da2456ad44378c1b6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXext/Config.in       |    2 +-
 package/x11r7/xlib_libXext/xlib_libXext.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXext/Config.in b/package/x11r7/xlib_libXext/Config.in
index 4a4aa9d..445d0a2 100644
--- a/package/x11r7/xlib_libXext/Config.in
+++ b/package/x11r7/xlib_libXext/Config.in
@@ -4,5 +4,5 @@ config BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXext 1.0.2
+	  libXext 1.1.1
 	  X.Org Xext library
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index 1b646ac..0db9626 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXEXT_VERSION = 1.0.4
+XLIB_LIBXEXT_VERSION = 1.1.1
 XLIB_LIBXEXT_SOURCE = libXext-$(XLIB_LIBXEXT_VERSION).tar.bz2
 XLIB_LIBXEXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXEXT_AUTORECONF = NO
-- 
1.6.3.3
