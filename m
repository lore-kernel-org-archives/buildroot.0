From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump scrnsaverproto to 1.2.0
Message-ID: <20100308133653.1DEC3776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f8a078453d90abd283146c2d51eecccfc78ef038
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libSM/xlib_libSM.mk             |    1 +
 package/x11r7/xproto_scrnsaverproto/Config.in      |    2 +-
 .../xproto_scrnsaverproto/xproto_scrnsaverproto.mk |    2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index 5aeb42d..9c11c88 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -8,6 +8,7 @@ XLIB_LIBSM_VERSION = 1.1.1
 XLIB_LIBSM_SOURCE = libSM-$(XLIB_LIBSM_VERSION).tar.bz2
 XLIB_LIBSM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBSM_AUTORECONF = NO
+XLIB_LIBSM_LIBTOOL_PATCH = NO
 XLIB_LIBSM_INSTALL_STAGING = YES
 XLIB_LIBSM_DEPENDENCIES = xlib_libICE xlib_xtrans xproto_xproto
 XLIB_LIBSM_CONF_OPT = --enable-shared --disable-static --without-libuuid
diff --git a/package/x11r7/xproto_scrnsaverproto/Config.in b/package/x11r7/xproto_scrnsaverproto/Config.in
index fa3857b..3c70e87 100644
--- a/package/x11r7/xproto_scrnsaverproto/Config.in
+++ b/package/x11r7/xproto_scrnsaverproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_SCRNSAVERPROTO
 	bool "scrnsaverproto"
 	help
-	  scrnsaverproto 1.1.0
+	  scrnsaverproto 1.2.0
 	  X.Org ScrnSaver protocol headers
diff --git a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
index 320f25d..f7f53e6 100644
--- a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
+++ b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_SCRNSAVERPROTO_VERSION = 1.1.0
+XPROTO_SCRNSAVERPROTO_VERSION = 1.2.0
 XPROTO_SCRNSAVERPROTO_SOURCE = scrnsaverproto-$(XPROTO_SCRNSAVERPROTO_VERSION).tar.bz2
 XPROTO_SCRNSAVERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_SCRNSAVERPROTO_AUTORECONF = NO
-- 
1.6.3.3
