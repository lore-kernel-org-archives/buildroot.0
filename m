From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXScrnSaver to 1.2.0
Message-ID: <20100308133652.60EB6776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d0f22f65ce9d7abffa63ffb68d5c4ff66c0a88be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXScrnSaver/Config.in         |    2 +-
 .../x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXScrnSaver/Config.in b/package/x11r7/xlib_libXScrnSaver/Config.in
index 6f86d4d..2a2a116 100644
--- a/package/x11r7/xlib_libXScrnSaver/Config.in
+++ b/package/x11r7/xlib_libXScrnSaver/Config.in
@@ -4,5 +4,5 @@ config BR2_PACKAGE_XLIB_LIBXSCRNSAVER
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_SCRNSAVERPROTO
 	help
-	  libXScrnSaver 1.1.2
+	  libXScrnSaver 1.2.0
 	  X.Org XScrnSaver library
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index d2323fa..9a88b03 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XLIB_LIBXSCRNSAVER_VERSION = 1.1.3
+XLIB_LIBXSCRNSAVER_VERSION = 1.2.0
 XLIB_LIBXSCRNSAVER_SOURCE = libXScrnSaver-$(XLIB_LIBXSCRNSAVER_VERSION).tar.bz2
 XLIB_LIBXSCRNSAVER_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXSCRNSAVER_AUTORECONF = NO
+XLIB_LIBXSCRNSAVER_LIBTOOL_PATCH = NO
 XLIB_LIBXSCRNSAVER_INSTALL_STAGING = YES
 XLIB_LIBXSCRNSAVER_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_scrnsaverproto
 XLIB_LIBXSCRNSAVER_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
-- 
1.6.3.3
