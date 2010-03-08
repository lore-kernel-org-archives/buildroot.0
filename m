From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXi to 1.3
Message-ID: <20100308133618.218FD776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fe7ad3e8e22799281eb54302417de2ef02811787
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXi/Config.in     |    2 +-
 package/x11r7/xlib_libXi/xlib_libXi.mk |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXi/Config.in b/package/x11r7/xlib_libXi/Config.in
index e80863c..5f060f4 100644
--- a/package/x11r7/xlib_libXi/Config.in
+++ b/package/x11r7/xlib_libXi/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXi 1.0.2
+	  libXi 1.3
 	  X.Org Xi library
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index 002a4d3..a711247 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XLIB_LIBXI_VERSION = 1.1.3
+XLIB_LIBXI_VERSION = 1.3
 XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.bz2
 XLIB_LIBXI_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXI_AUTORECONF = NO
+XLIB_LIBXI_LIBTOOL_PATCH = NO
 XLIB_LIBXI_INSTALL_STAGING = YES
 XLIB_LIBXI_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXext xproto_xproto
 XLIB_LIBXI_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
-- 
1.6.3.3
