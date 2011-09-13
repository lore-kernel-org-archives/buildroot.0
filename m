From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Sep 2011 13:40:12 -0300
Subject: [Buildroot] [PATCH 2/7] usbutils: bump to version 004
In-Reply-To: <1315932017-20307-1-git-send-email-gustavo@zacarias.com.ar>
References: <1315932017-20307-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1315932017-20307-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/usbutils/usbutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 1ddadbe..7b5e47b 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-USBUTILS_VERSION = 003
+USBUTILS_VERSION = 004
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkg-config libusb
 USBUTILS_INSTALL_STAGING = YES
-- 
1.7.3.4
