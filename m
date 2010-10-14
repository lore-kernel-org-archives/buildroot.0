From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Oct 2010 20:49:28 +0200
Subject: [Buildroot] [git commit master 1/1] xapp_xcursorgen: bump version
Message-ID: <20101014184957.4BCD0825A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=05d5ce590b5f97c0f372ffa0764a0742938d6288
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for libpng 1.4.x support.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                          |    2 +-
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2cd70f7..1d062e9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -44,7 +44,7 @@
 	speex, sqlite, squashfs, strace, sylpheed, taglib, tcpdump,
 	thttpd, tiff, tn5250, torsmo, udev, udpcast, usbmount, usbutils,
 	vsftpd, vtun, which, wpa_supplicant, xapp_twm,
-	xapp_xbacklight, xapp_xinput,
+	xapp_xbacklight, xapp_xcursorgen, xapp_xinput,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index c42ffa4..746564f 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCURSORGEN_VERSION = 1.0.3
+XAPP_XCURSORGEN_VERSION = 1.0.4
 XAPP_XCURSORGEN_SOURCE = xcursorgen-$(XAPP_XCURSORGEN_VERSION).tar.bz2
 XAPP_XCURSORGEN_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCURSORGEN_AUTORECONF = NO
-- 
1.7.1
