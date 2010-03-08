From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libICE to 1.0.6
Message-ID: <20100308133651.CE8B5776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ad29d46c60b9fcb36ecfd6737b06fc23eee5bb60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libICE/Config.in      |    2 +-
 package/x11r7/xlib_libICE/xlib_libICE.mk |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libICE/Config.in b/package/x11r7/xlib_libICE/Config.in
index 5866bc1..1fc57cf 100644
--- a/package/x11r7/xlib_libICE/Config.in
+++ b/package/x11r7/xlib_libICE/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XLIB_LIBICE
 	select BR2_PACKAGE_XLIB_XTRANS
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libICE 1.0.3
+	  libICE 1.0.6
 	  X.Org ICE library
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index 044b091..0d2a480 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XLIB_LIBICE_VERSION = 1.0.4
+XLIB_LIBICE_VERSION = 1.0.6
 XLIB_LIBICE_SOURCE = libICE-$(XLIB_LIBICE_VERSION).tar.bz2
 XLIB_LIBICE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBICE_AUTORECONF = NO
+XLIB_LIBICE_LIBTOOL_PATCH = NO
 XLIB_LIBICE_INSTALL_STAGING = YES
 XLIB_LIBICE_DEPENDENCIES = xlib_xtrans xproto_xproto
 XLIB_LIBICE_CONF_OPT = --enable-shared --disable-static
-- 
1.6.3.3
