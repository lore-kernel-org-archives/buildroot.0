From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Apr 2010 22:10:18 +0200
Subject: [Buildroot] [git commit master] xkeyboard-config: bump version
Message-ID: <20100408201140.3D6188B35D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9b02ce9e9d98e32b6e658bf7217a43a65a51787a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    6 +++---
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 63aa0e7..4ff57ee 100644
--- a/CHANGES
+++ b/CHANGES
@@ -16,9 +16,9 @@
 	libgcrypt, libglib2, libpng, libxml2, matchbox, mdadm,
 	memstat, mesa3d, mtd-utils, nano, openssl, php, pixman, pppd,
 	pthread-stubs, qt, radvd, setserial, squashfs, usb_modeswith,
-	wget, xlib_libX11, xlib_libXfont, xlib_libXfontcache,
-	xlib_libpciaccess, xproto_dri2proto, xproto_fontcacheproto,
-	xproto_xf86miscproto
+	wget, xkeyboard-config, xlib_libX11, xlib_libXfont,
+	xlib_libXfontcache, xlib_libpciaccess, xproto_dri2proto,
+	xproto_fontcacheproto, xproto_xf86miscproto
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 7128d7e..9c9c8b5 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -3,7 +3,7 @@
 # xkeyboard-config
 #
 #############################################################
-XKEYBOARD_CONFIG_VERSION = 1.2
+XKEYBOARD_CONFIG_VERSION = 1.8
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://xlibs.freedesktop.org/xkbdesc
 XKEYBOARD_CONFIG_AUTORECONF = NO
-- 
1.6.3.3
