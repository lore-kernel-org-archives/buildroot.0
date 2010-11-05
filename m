From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 10:27:37 +0100
Subject: [Buildroot] [git commit master 1/1] xapp_xinit: Bump to 1.2.1
Message-ID: <20101105092849.2C7948DBA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d906f6de9ff582dc74b708500686182dd9abee48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                |    2 +-
 package/x11r7/xapp_xinit/xapp_xinit.mk |    3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 76c4ea4..889f787 100644
--- a/CHANGES
+++ b/CHANGES
@@ -51,7 +51,7 @@
 	sysstat, taglib, tcpdump, thttpd, tiff, tn5250, torsmo, udev,
 	udpcast, usbmount, usbutils, vsftpd, vtun, which,
 	wpa_supplicant, xapp_twm, xapp_xbacklight, xapp_xcursorgen,
-	xapp_xinput, xapp_xmore,
+	xapp_xinit, xapp_xinput, xapp_xmore,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
index 40f68ec..52105c2 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-XAPP_XINIT_VERSION = 1.0.5
+XAPP_XINIT_VERSION = 1.2.1
 XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.bz2
 XAPP_XINIT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XINIT_AUTORECONF = NO
 XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xinit))
-- 
1.7.1
