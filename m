From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Jul 2015 10:53:58 -0300
Subject: [Buildroot] [PATCH 1/2] usb_modeswitch: bump to version 2.2.3
Message-ID: <1436277239-10479-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/usb_modeswitch/usb_modeswitch.hash | 2 +-
 package/usb_modeswitch/usb_modeswitch.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usb_modeswitch/usb_modeswitch.hash b/package/usb_modeswitch/usb_modeswitch.hash
index bfe1f59..1e8df22 100644
--- a/package/usb_modeswitch/usb_modeswitch.hash
+++ b/package/usb_modeswitch/usb_modeswitch.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	37d926a0b6b6d490173c57e260a69aca49feb774875fc8f2001c1d0f5e8011cb	usb-modeswitch-2.2.1.tar.bz2
+sha256	d1a0d9a9e7411f07796611881a8f264daa946e2a28418abed34639b3583d7593	usb-modeswitch-2.2.3.tar.bz2
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 9c16416..0a2b8db 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_VERSION = 2.2.1
+USB_MODESWITCH_VERSION = 2.2.3
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
-- 
2.3.6
