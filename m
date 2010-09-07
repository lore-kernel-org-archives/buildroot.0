From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Tue,  7 Sep 2010 20:31:24 +0200
Subject: [Buildroot] [PATCH] bump usb utils to latest version 0.90
Message-ID: <1283884284-4353-1-git-send-email-marcus.osdoba@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcus Osdoba <marcus.osdoba@googlemail.com>
---
 package/usbutils/usbutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index f095297..0f82128 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-USBUTILS_VERSION = 0.87
+USBUTILS_VERSION = 0.90
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkg-config libusb-compat
 
-- 
1.7.1
