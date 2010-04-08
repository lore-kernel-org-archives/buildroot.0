From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Apr 2010 22:10:18 +0200
Subject: [Buildroot] [git commit master] xproto_fontcacheproto: bump version
Message-ID: <20100408201139.2EF918B35D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=24c2ca78414c2136bea27cb1c8c6d940aede1d3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: remove version from Config.in help]
Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    3 ++-
 package/x11r7/xproto_fontcacheproto/Config.in      |    1 -
 .../xproto_fontcacheproto/xproto_fontcacheproto.mk |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index db6703a..703c459 100644
--- a/CHANGES
+++ b/CHANGES
@@ -16,7 +16,8 @@
 	libgcrypt, libglib2, libpng, libxml2, matchbox, mdadm,
 	memstat, mesa3d, mtd-utils, nano, openssl, php, pixman, pppd,
 	pthread-stubs, qt, radvd, setserial, squashfs, usb_modeswith,
-	wget, xlib_libX11, xlib_libXfont, xproto_dri2proto
+	wget, xlib_libX11, xlib_libXfont, xproto_dri2proto,
+	xproto_fontcacheproto,
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/x11r7/xproto_fontcacheproto/Config.in b/package/x11r7/xproto_fontcacheproto/Config.in
index 1c47b5c..daa6c7f 100644
--- a/package/x11r7/xproto_fontcacheproto/Config.in
+++ b/package/x11r7/xproto_fontcacheproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_FONTCACHEPROTO
 	bool "fontcacheproto"
 	help
-	  fontcacheproto 0.1.2
 	  X.Org Fontcache protocol headers
diff --git a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
index 27cf30b..9c2ef47 100644
--- a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
+++ b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_FONTCACHEPROTO_VERSION = 0.1.2
+XPROTO_FONTCACHEPROTO_VERSION = 0.1.3
 XPROTO_FONTCACHEPROTO_SOURCE = fontcacheproto-$(XPROTO_FONTCACHEPROTO_VERSION).tar.bz2
 XPROTO_FONTCACHEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_FONTCACHEPROTO_AUTORECONF = NO
-- 
1.6.3.3
