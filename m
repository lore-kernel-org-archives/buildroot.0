From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Apr 2010 22:10:18 +0200
Subject: [Buildroot] [git commit master] xproto_dri2proto: bump version
Message-ID: <20100408201138.D70DC8B35D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=864950c1a4a873ef0e26025035259c888c0da178
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: remove version from Config.in help]
Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    2 +-
 package/x11r7/xproto_dri2proto/Config.in           |    1 -
 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk |    2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1e68d4b..db6703a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -16,7 +16,7 @@
 	libgcrypt, libglib2, libpng, libxml2, matchbox, mdadm,
 	memstat, mesa3d, mtd-utils, nano, openssl, php, pixman, pppd,
 	pthread-stubs, qt, radvd, setserial, squashfs, usb_modeswith,
-	wget, xlib_libX11, xlib_libXfont
+	wget, xlib_libX11, xlib_libXfont, xproto_dri2proto
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/x11r7/xproto_dri2proto/Config.in b/package/x11r7/xproto_dri2proto/Config.in
index 4ab5ccd..3fe5aa1 100644
--- a/package/x11r7/xproto_dri2proto/Config.in
+++ b/package/x11r7/xproto_dri2proto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_DRI2PROTO
 	bool "dri2proto"
 	help
-	  dri2proto 2.1
 	  X.Org DRI2 protocol headers
diff --git a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
index 2d7de30..f3b37c9 100644
--- a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
+++ b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_DRI2PROTO_VERSION = 2.1
+XPROTO_DRI2PROTO_VERSION = 2.3
 XPROTO_DRI2PROTO_SOURCE = dri2proto-$(XPROTO_DRI2PROTO_VERSION).tar.bz2
 XPROTO_DRI2PROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_DRI2PROTO_AUTORECONF = NO
-- 
1.6.3.3
