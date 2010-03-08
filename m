From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXxf86dga to 1.1.1
Message-ID: <20100308133657.519A6776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8946a4e78a8f70ca41f2284d87fb0f888b30cc3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXxf86dga/Config.in           |    2 +-
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXxf86dga/Config.in b/package/x11r7/xlib_libXxf86dga/Config.in
index 2568db5..f601f75 100644
--- a/package/x11r7/xlib_libXxf86dga/Config.in
+++ b/package/x11r7/xlib_libXxf86dga/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_XLIB_LIBXXF86DGA
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXxf86dga 1.0.1
+	  libXxf86dga 1.1.1
 	  X.Org Xxf86dga library
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
index 3f91cc6..72fb034 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XLIB_LIBXXF86DGA_VERSION = 1.0.2
+XLIB_LIBXXF86DGA_VERSION = 1.1.1
 XLIB_LIBXXF86DGA_SOURCE = libXxf86dga-$(XLIB_LIBXXF86DGA_VERSION).tar.bz2
 XLIB_LIBXXF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXXF86DGA_AUTORECONF = NO
+XLIB_LIBXXF86DGA_LIBTOOL_PATCH = NO
 XLIB_LIBXXF86DGA_INSTALL_STAGING = YES
 XLIB_LIBXXF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86dgaproto xproto_xproto
 XLIB_LIBXXF86DGA_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
-- 
1.6.3.3
