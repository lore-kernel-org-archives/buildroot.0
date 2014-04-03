From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:48:23 +0200
Subject: [Buildroot] [git commit] usb_modeswitch: bump to version 2.1.1
Message-ID: <20140403195201.B4AC399C96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f863ce291b9061b43836d9afc43f7995a43e2571
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/usb_modeswitch/usb_modeswitch.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 5d3bace..dce7817 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_VERSION = 2.1.0
+USB_MODESWITCH_VERSION = 2.1.1
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
