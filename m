From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 21 Jun 2011 11:55:14 +0200
Subject: [Buildroot] [PATCH] usbutils: bump to 003
Message-ID: <4E006A82.2040606@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

---
 package/usbutils/usbutils.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: b/package/usbutils/usbutils.mk
===================================================================
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-USBUTILS_VERSION = 002
+USBUTILS_VERSION = 003
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkg-config libusb
 USBUTILS_INSTALL_STAGING = YES
