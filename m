From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXinerama to 1.1
Message-ID: <20100308133655.2D243776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bd9d856e60499a2d1fdc91d1c9dd05f8a7c2201d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXinerama/Config.in           |    2 +-
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXinerama/Config.in b/package/x11r7/xlib_libXinerama/Config.in
index 7557fce..0620a5e 100644
--- a/package/x11r7/xlib_libXinerama/Config.in
+++ b/package/x11r7/xlib_libXinerama/Config.in
@@ -4,5 +4,5 @@ config BR2_PACKAGE_XLIB_LIBXINERAMA
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
 	help
-	  libXinerama 1.0.1
+	  libXinerama 1.1
 	  X.Org Xinerama library
diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index f13ace4..37553a7 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XLIB_LIBXINERAMA_VERSION = 1.0.3
+XLIB_LIBXINERAMA_VERSION = 1.1
 XLIB_LIBXINERAMA_SOURCE = libXinerama-$(XLIB_LIBXINERAMA_VERSION).tar.bz2
 XLIB_LIBXINERAMA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXINERAMA_AUTORECONF = NO
+XLIB_LIBXINERAMA_LIBTOOL_PATCH = NO
 XLIB_LIBXINERAMA_INSTALL_STAGING = YES
 XLIB_LIBXINERAMA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xineramaproto
 XLIB_LIBXINERAMA_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
-- 
1.6.3.3
