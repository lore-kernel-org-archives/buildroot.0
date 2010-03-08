From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXrandr to 1.3.0
Message-ID: <20100308133651.26B27776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6a2b4eba83f2ac3f7ffce7459ed25c27a78bdbb0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXrandr/Config.in         |    2 +-
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXrandr/Config.in b/package/x11r7/xlib_libXrandr/Config.in
index 7c06b56..2edbe9c 100644
--- a/package/x11r7/xlib_libXrandr/Config.in
+++ b/package/x11r7/xlib_libXrandr/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXrandr 1.1.2
+	  libXrandr 1.3.0
 	  X.Org Xrandr library
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 83dc60b..4556c81 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XLIB_LIBXRANDR_VERSION = 1.2.3
+XLIB_LIBXRANDR_VERSION = 1.3.0
 XLIB_LIBXRANDR_SOURCE = libXrandr-$(XLIB_LIBXRANDR_VERSION).tar.bz2
 XLIB_LIBXRANDR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRANDR_AUTORECONF = NO
+XLIB_LIBXRANDR_LIBTOOL_PATCH = NO
 XLIB_LIBXRANDR_INSTALL_STAGING = YES
 XLIB_LIBXRANDR_DEPENDENCIES = xproto_randrproto xlib_libX11 xlib_libXext xlib_libXrender xproto_renderproto xproto_xproto
 XLIB_LIBXRANDR_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
-- 
1.6.3.3
