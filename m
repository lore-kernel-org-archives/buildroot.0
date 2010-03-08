From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXxf86vm to 1.1.0
Message-ID: <20100308133657.8A622776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bbab07f58de04aaf8710f5bdc2e9a0d2b9e8bb90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXxf86vm/Config.in          |    2 +-
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXxf86vm/Config.in b/package/x11r7/xlib_libXxf86vm/Config.in
index 6471c3b..7ef8ec9 100644
--- a/package/x11r7/xlib_libXxf86vm/Config.in
+++ b/package/x11r7/xlib_libXxf86vm/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_XLIB_LIBXXF86VM
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXxf86vm 1.0.1
+	  libXxf86vm 1.1.0
 	  X.Org Xxf86vm library
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
index b1b5bcd..90b88e1 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XLIB_LIBXXF86VM_VERSION = 1.0.2
+XLIB_LIBXXF86VM_VERSION = 1.1.0
 XLIB_LIBXXF86VM_SOURCE = libXxf86vm-$(XLIB_LIBXXF86VM_VERSION).tar.bz2
 XLIB_LIBXXF86VM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXXF86VM_AUTORECONF = NO
+XLIB_LIBXXF86VM_LIBTOOL_PATCH = NO
 XLIB_LIBXXF86VM_INSTALL_STAGING = YES
 XLIB_LIBXXF86VM_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86vidmodeproto xproto_xproto
 XLIB_LIBXXF86VM_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
-- 
1.6.3.3
