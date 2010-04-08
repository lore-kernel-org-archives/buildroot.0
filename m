From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Apr 2010 22:10:18 +0200
Subject: [Buildroot] [git commit master] xproto_evieext: bump version
Message-ID: <20100408201140.6D1B68B35D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=de6d1e532f82083fcb55713dbddee5acb8418a99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: remove version from Config.in help]
Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                        |    2 +-
 package/x11r7/xproto_evieext/Config.in         |    1 -
 package/x11r7/xproto_evieext/xproto_evieext.mk |    2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4ff57ee..c222c43 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,7 +18,7 @@
 	pthread-stubs, qt, radvd, setserial, squashfs, usb_modeswith,
 	wget, xkeyboard-config, xlib_libX11, xlib_libXfont,
 	xlib_libXfontcache, xlib_libpciaccess, xproto_dri2proto,
-	xproto_fontcacheproto, xproto_xf86miscproto
+	xproto_eviext, xproto_fontcacheproto, xproto_xf86miscproto
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/x11r7/xproto_evieext/Config.in b/package/x11r7/xproto_evieext/Config.in
index 3e66118..95bfd6f 100644
--- a/package/x11r7/xproto_evieext/Config.in
+++ b/package/x11r7/xproto_evieext/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_EVIEEXT
 	bool "evieext"
 	help
-	  evieext 1.0.2
 	  X.Org EvIE protocol headers
diff --git a/package/x11r7/xproto_evieext/xproto_evieext.mk b/package/x11r7/xproto_evieext/xproto_evieext.mk
index aa0a733..1c45f12 100644
--- a/package/x11r7/xproto_evieext/xproto_evieext.mk
+++ b/package/x11r7/xproto_evieext/xproto_evieext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_EVIEEXT_VERSION = 1.0.2
+XPROTO_EVIEEXT_VERSION = 1.1.0
 XPROTO_EVIEEXT_SOURCE = evieext-$(XPROTO_EVIEEXT_VERSION).tar.bz2
 XPROTO_EVIEEXT_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_EVIEEXT_AUTORECONF = NO
-- 
1.6.3.3
