From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXcursor to 1.1.10
Message-ID: <20100308133653.908B2776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3ba3c4f8c3e1913a863fe93d958a46bf6b52197b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXcursor/Config.in          |    2 +-
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXcursor/Config.in b/package/x11r7/xlib_libXcursor/Config.in
index 713598e..4dc0b20 100644
--- a/package/x11r7/xlib_libXcursor/Config.in
+++ b/package/x11r7/xlib_libXcursor/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXcursor 1.1.8
+	  libXcursor 1.1.10
 	  X.Org Xcursor library
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index 4373cc6..f8da364 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XLIB_LIBXCURSOR_VERSION = 1.1.9
+XLIB_LIBXCURSOR_VERSION = 1.1.10
 XLIB_LIBXCURSOR_SOURCE = libXcursor-$(XLIB_LIBXCURSOR_VERSION).tar.bz2
 XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCURSOR_AUTORECONF = NO
+XLIB_LIBXCURSOR_LIBTOOL_PATCH = NO
 XLIB_LIBXCURSOR_INSTALL_STAGING = YES
 XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xproto_xproto
 XLIB_LIBXCURSOR_CONF_OPT = --enable-shared --disable-static
-- 
1.6.3.3
