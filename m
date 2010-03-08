From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libdmx to 1.1.0
Message-ID: <20100308133657.BF5C3776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3c559a96b3c001efecb3b55d9a18fdc557c15c97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libdmx/Config.in      |    2 +-
 package/x11r7/xlib_libdmx/xlib_libdmx.mk |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libdmx/Config.in b/package/x11r7/xlib_libdmx/Config.in
index c57cc8f..6a4fae5 100644
--- a/package/x11r7/xlib_libdmx/Config.in
+++ b/package/x11r7/xlib_libdmx/Config.in
@@ -4,5 +4,5 @@ config BR2_PACKAGE_XLIB_LIBDMX
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_DMXPROTO
 	help
-	  libdmx 1.0.2
+	  libdmx 1.1.0
 	  X.Org dmx library
diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
index b4927ff..93da5b0 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XLIB_LIBDMX_VERSION = 1.0.2
+XLIB_LIBDMX_VERSION = 1.1.0
 XLIB_LIBDMX_SOURCE = libdmx-$(XLIB_LIBDMX_VERSION).tar.bz2
 XLIB_LIBDMX_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBDMX_AUTORECONF = NO
+XLIB_LIBDMX_LIBTOOL_PATCH = NO
 XLIB_LIBDMX_INSTALL_STAGING = YES
 XLIB_LIBDMX_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_dmxproto
 XLIB_LIBDMX_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
-- 
1.6.3.3
