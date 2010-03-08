From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXdmcp to 1.0.3
Message-ID: <20100308133654.21877776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ea0f92ef934fdccc60d6023be820fdac2bc67cff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXdmcp/Config.in        |    2 +-
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXdmcp/Config.in b/package/x11r7/xlib_libXdmcp/Config.in
index 995103c..aa8f9e8 100644
--- a/package/x11r7/xlib_libXdmcp/Config.in
+++ b/package/x11r7/xlib_libXdmcp/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XLIB_LIBXDMCP
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXdmcp 1.0.2
+	  libXdmcp 1.0.3
 	  X.Org Xdmcp library
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 78adfd4..40b8058 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XLIB_LIBXDMCP_VERSION = 1.0.2
+XLIB_LIBXDMCP_VERSION = 1.0.3
 XLIB_LIBXDMCP_SOURCE = libXdmcp-$(XLIB_LIBXDMCP_VERSION).tar.bz2
 XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDMCP_AUTORECONF = NO
+XLIB_LIBXDMCP_LIBTOOL_PATCH = NO
 XLIB_LIBXDMCP_INSTALL_STAGING = YES
 XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
 XLIB_LIBXDMCP_CONF_OPT = --enable-shared --disable-static
-- 
1.6.3.3
