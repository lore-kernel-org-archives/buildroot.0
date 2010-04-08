From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Apr 2010 22:10:18 +0200
Subject: [Buildroot] [git commit master] xlib_libXfontcache: bump version
Message-ID: <20100408201139.EFBAD8B35D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e9f9ef7d67a98a36182e4bf655f93be3d8a6cd1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: remove version from Config.in help]
Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    5 +++--
 package/x11r7/xlib_libXfontcache/Config.in         |    1 -
 .../x11r7/xlib_libXfontcache/xlib_libXfontcache.mk |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index e8ca5b7..63aa0e7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -16,8 +16,9 @@
 	libgcrypt, libglib2, libpng, libxml2, matchbox, mdadm,
 	memstat, mesa3d, mtd-utils, nano, openssl, php, pixman, pppd,
 	pthread-stubs, qt, radvd, setserial, squashfs, usb_modeswith,
-	wget, xlib_libX11, xlib_libXfont, xlib_libpciaccess,
-	xproto_dri2proto, xproto_fontcacheproto, xproto_xf86miscproto
+	wget, xlib_libX11, xlib_libXfont, xlib_libXfontcache,
+	xlib_libpciaccess, xproto_dri2proto, xproto_fontcacheproto,
+	xproto_xf86miscproto
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/x11r7/xlib_libXfontcache/Config.in b/package/x11r7/xlib_libXfontcache/Config.in
index 50d2cce..3a20451 100644
--- a/package/x11r7/xlib_libXfontcache/Config.in
+++ b/package/x11r7/xlib_libXfontcache/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XLIB_LIBXFONTCACHE
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_FONTCACHEPROTO
 	help
-	  libXfontcache 1.0.4
 	  X.Org Xfontcache library
diff --git a/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk b/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
index b51d61b..a0d924b 100644
--- a/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
+++ b/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONTCACHE_VERSION = 1.0.4
+XLIB_LIBXFONTCACHE_VERSION = 1.0.5
 XLIB_LIBXFONTCACHE_SOURCE = libXfontcache-$(XLIB_LIBXFONTCACHE_VERSION).tar.bz2
 XLIB_LIBXFONTCACHE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONTCACHE_AUTORECONF = NO
-- 
1.6.3.3
