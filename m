From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Apr 2010 22:10:18 +0200
Subject: [Buildroot] [git commit master] xlib_libXxf86misc: bump version
Message-ID: <20100408201140.9F8E88B35D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ec0db92559f94729f11747f83b6aebd121aae344
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: remove version from Config.in help]
Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    5 +++--
 package/x11r7/xlib_libXxf86misc/Config.in          |    1 -
 .../x11r7/xlib_libXxf86misc/xlib_libXxf86misc.mk   |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index c222c43..43fbf6a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -17,8 +17,9 @@
 	memstat, mesa3d, mtd-utils, nano, openssl, php, pixman, pppd,
 	pthread-stubs, qt, radvd, setserial, squashfs, usb_modeswith,
 	wget, xkeyboard-config, xlib_libX11, xlib_libXfont,
-	xlib_libXfontcache, xlib_libpciaccess, xproto_dri2proto,
-	xproto_eviext, xproto_fontcacheproto, xproto_xf86miscproto
+	xlib_libXfontcache, xlib_libXxf86misc, xlib_libpciaccess,
+	xproto_dri2proto, xproto_eviext, xproto_fontcacheproto,
+	xproto_xf86miscproto
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/x11r7/xlib_libXxf86misc/Config.in b/package/x11r7/xlib_libXxf86misc/Config.in
index 3f8bac1..205140c 100644
--- a/package/x11r7/xlib_libXxf86misc/Config.in
+++ b/package/x11r7/xlib_libXxf86misc/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XLIB_LIBXXF86MISC
 	select BR2_PACKAGE_XPROTO_XF86MISCPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXxf86misc 1.0.1
 	  X.Org Xxf86misc library
diff --git a/package/x11r7/xlib_libXxf86misc/xlib_libXxf86misc.mk b/package/x11r7/xlib_libXxf86misc/xlib_libXxf86misc.mk
index 821170b..5f4b793 100644
--- a/package/x11r7/xlib_libXxf86misc/xlib_libXxf86misc.mk
+++ b/package/x11r7/xlib_libXxf86misc/xlib_libXxf86misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXXF86MISC_VERSION = 1.0.1
+XLIB_LIBXXF86MISC_VERSION = 1.0.2
 XLIB_LIBXXF86MISC_SOURCE = libXxf86misc-$(XLIB_LIBXXF86MISC_VERSION).tar.bz2
 XLIB_LIBXXF86MISC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXXF86MISC_AUTORECONF = NO
-- 
1.6.3.3
