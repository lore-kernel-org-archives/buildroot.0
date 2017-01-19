From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 19 Jan 2017 16:13:22 -0500
Subject: [Buildroot] [PATCH 1/2] linux-firmware: sort Realtek GigE firmware
Message-ID: <1484860403-1167-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/linux-firmware/linux-firmware.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 0afb931..b34db46 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -319,6 +319,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169),y)
 LINUX_FIRMWARE_FILES += \
+	rtl_nic/rtl8105e-1.fw \
+	rtl_nic/rtl8106e-1.fw \
+	rtl_nic/rtl8106e-2.fw \
 	rtl_nic/rtl8168d-1.fw \
 	rtl_nic/rtl8168d-2.fw \
 	rtl_nic/rtl8168e-1.fw \
@@ -326,14 +329,11 @@ LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8168e-3.fw \
 	rtl_nic/rtl8168f-1.fw \
 	rtl_nic/rtl8168f-2.fw \
-	rtl_nic/rtl8105e-1.fw \
+	rtl_nic/rtl8168g-2.fw \
+	rtl_nic/rtl8168g-3.fw \
 	rtl_nic/rtl8402-1.fw \
 	rtl_nic/rtl8411-1.fw \
-	rtl_nic/rtl8411-2.fw \
-	rtl_nic/rtl8106e-1.fw \
-	rtl_nic/rtl8106e-2.fw \
-	rtl_nic/rtl8168g-2.fw \
-	rtl_nic/rtl8168g-3.fw
+	rtl_nic/rtl8411-2.fw
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XCx000),y)
-- 
2.7.4
