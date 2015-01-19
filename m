From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 Jan 2015 10:23:08 -0300
Subject: [Buildroot] [PATCH 1/2] usb_modeswitch: bump to version 2.2.1
Message-ID: <1421673789-563-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/usb_modeswitch/usb_modeswitch.hash | 2 ++
 package/usb_modeswitch/usb_modeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/usb_modeswitch/usb_modeswitch.hash

diff --git a/package/usb_modeswitch/usb_modeswitch.hash b/package/usb_modeswitch/usb_modeswitch.hash
new file mode 100644
index 0000000..bfe1f59
--- /dev/null
+++ b/package/usb_modeswitch/usb_modeswitch.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	37d926a0b6b6d490173c57e260a69aca49feb774875fc8f2001c1d0f5e8011cb	usb-modeswitch-2.2.1.tar.bz2
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index ea874be..ca992a0 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_VERSION = 2.2.0
+USB_MODESWITCH_VERSION = 2.2.1
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
-- 
2.0.5
