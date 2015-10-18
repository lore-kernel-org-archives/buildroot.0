From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Oct 2015 01:03:53 +0200
Subject: [Buildroot] [PATCH] linux-firmware: rtl81xx: also install
	rtl8188eufw firmware variant
Message-ID: <1445209433-19900-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As used by the rtl8188eu staging driver.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 06195c9..768f3c4 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -45,7 +45,8 @@ LINUX_FIRMWARE_FILES += \
 	rtlwifi/rtl8192cfw.bin rtlwifi/rtl8192cfwU.bin 		\
 	rtlwifi/rtl8192cfwU_B.bin rtlwifi/rtl8192cufw.bin	\
 	rtlwifi/rtl8192defw.bin rtlwifi/rtl8192sefw.bin		\
-	rtlwifi/rtl8188efw.bin rtlwifi/rtl8192cufw_A.bin	\
+	rtlwifi/rtl8188efw.bin rtlwifi/rtl8188eufw.bin		\
+	rtlwifi/rtl8192cufw_A.bin				\
 	rtlwifi/rtl8192cufw_B.bin rtlwifi/rtl8192cufw_TMSC.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
-- 
2.1.4
