From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Apr 2010 22:10:18 +0200
Subject: [Buildroot] [git commit master] xproto_xf86miscproto: bump version
Message-ID: <20100408201139.7964C8B35D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b7bf7f00770225c82563e3c396f8d36ee1af6bd3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: remove version from Config.in help]
Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    2 +-
 package/x11r7/xproto_xf86miscproto/Config.in       |    1 -
 .../xproto_xf86miscproto/xproto_xf86miscproto.mk   |    2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 703c459..12e66a2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -17,7 +17,7 @@
 	memstat, mesa3d, mtd-utils, nano, openssl, php, pixman, pppd,
 	pthread-stubs, qt, radvd, setserial, squashfs, usb_modeswith,
 	wget, xlib_libX11, xlib_libXfont, xproto_dri2proto,
-	xproto_fontcacheproto,
+	xproto_fontcacheproto, xproto_xf86miscproto
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/x11r7/xproto_xf86miscproto/Config.in b/package/x11r7/xproto_xf86miscproto/Config.in
index e0b614c..cd19ff3 100644
--- a/package/x11r7/xproto_xf86miscproto/Config.in
+++ b/package/x11r7/xproto_xf86miscproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_XF86MISCPROTO
 	bool "xf86miscproto"
 	help
-	  xf86miscproto 0.9.2
 	  X.Org XF86Misc protocol headers
diff --git a/package/x11r7/xproto_xf86miscproto/xproto_xf86miscproto.mk b/package/x11r7/xproto_xf86miscproto/xproto_xf86miscproto.mk
index c4317cc..8cf8482 100644
--- a/package/x11r7/xproto_xf86miscproto/xproto_xf86miscproto.mk
+++ b/package/x11r7/xproto_xf86miscproto/xproto_xf86miscproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XF86MISCPROTO_VERSION = 0.9.2
+XPROTO_XF86MISCPROTO_VERSION = 0.9.3
 XPROTO_XF86MISCPROTO_SOURCE = xf86miscproto-$(XPROTO_XF86MISCPROTO_VERSION).tar.bz2
 XPROTO_XF86MISCPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XF86MISCPROTO_AUTORECONF = NO
-- 
1.6.3.3
