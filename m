From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXtst to 1.1.0
Message-ID: <20100308133622.4D192776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=322445e9b0e8e137e21eb9136af9b21104fdff7c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXtst/Config.in       |    2 +-
 package/x11r7/xlib_libXtst/xlib_libXtst.mk |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXtst/Config.in b/package/x11r7/xlib_libXtst/Config.in
index 2da92ae..db50a33 100644
--- a/package/x11r7/xlib_libXtst/Config.in
+++ b/package/x11r7/xlib_libXtst/Config.in
@@ -4,5 +4,5 @@ config BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_RECORDPROTO
 	help
-	  libXtst 1.0.1
+	  libXtst 1.1.0
 	  X.Org Xtst library
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index 14d02b8..7e6427e 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XLIB_LIBXTST_VERSION = 1.0.3
+XLIB_LIBXTST_VERSION = 1.1.0
 XLIB_LIBXTST_SOURCE = libXtst-$(XLIB_LIBXTST_VERSION).tar.bz2
 XLIB_LIBXTST_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXTST_AUTORECONF = NO
+XLIB_LIBXTST_LIBTOOL_PATCH = NO
 XLIB_LIBXTST_INSTALL_STAGING = YES
 XLIB_LIBXTST_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_recordproto
 XLIB_LIBXTST_CONF_OPT = --enable-shared --disable-static
-- 
1.6.3.3
