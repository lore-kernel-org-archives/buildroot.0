From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 27 Feb 2017 19:09:05 +0200
Subject: [Buildroot] [PATCH next 1/2] usb_modeswitch: bump to version 2.5.0
Message-ID: <a328be860a55e9fbce938ca984eaa63ae522d9e0.1488215346.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/usb_modeswitch/usb_modeswitch.hash | 2 +-
 package/usb_modeswitch/usb_modeswitch.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usb_modeswitch/usb_modeswitch.hash b/package/usb_modeswitch/usb_modeswitch.hash
index 807b63f02310..b202e6353afd 100644
--- a/package/usb_modeswitch/usb_modeswitch.hash
+++ b/package/usb_modeswitch/usb_modeswitch.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	17dc32bf10df8e370f2369b5137d34dfd8f2347faaa51524c5f21c922f42e212	usb-modeswitch-2.4.0.tar.bz2
+sha256	31c0be280d49a99ec3dc0be3325bef320d9c04b50714ef0ce1e36a614d687633	usb-modeswitch-2.5.0.tar.bz2
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index e196db582de5..57996ab5f95e 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_VERSION = 2.4.0
+USB_MODESWITCH_VERSION = 2.5.0
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
-- 
2.11.0
