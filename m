From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXau to 1.0.5
Message-ID: <20100308133652.984CF776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e505ffa4182ed1b0c69fbc5c08cdb3055f01bba1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXau/Config.in      |    2 +-
 package/x11r7/xlib_libXau/xlib_libXau.mk |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXau/Config.in b/package/x11r7/xlib_libXau/Config.in
index 34cbd09..1b7adbc 100644
--- a/package/x11r7/xlib_libXau/Config.in
+++ b/package/x11r7/xlib_libXau/Config.in
@@ -4,5 +4,5 @@ config BR2_PACKAGE_XLIB_LIBXAU
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	help
-	  libXau 1.0.3
+	  libXau 1.0.5
 	  X.Org Xau library
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index 907f86b..71bca6c 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XLIB_LIBXAU_VERSION = 1.0.4
+XLIB_LIBXAU_VERSION = 1.0.5
 XLIB_LIBXAU_SOURCE = libXau-$(XLIB_LIBXAU_VERSION).tar.bz2
 XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAU_AUTORECONF = NO
+XLIB_LIBXAU_LIBTOOL_PATCH = NO
 XLIB_LIBXAU_INSTALL_STAGING = YES
 XLIB_LIBXAU_DEPENDENCIES = xproto_xproto xproto_xproto xutil_util-macros
 XLIB_LIBXAU_CONF_OPT = --enable-shared --disable-static
-- 
1.6.3.3
