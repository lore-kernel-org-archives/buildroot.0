From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  4 Jan 2018 14:20:20 +0100
Subject: [Buildroot] [PATCH] linux-firmware: update Broadcom 43xxx file list
Message-ID: <20180104132020.13429-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add firmware file 'brcmfmac43430a0-sdio.bin' for bcm43430 revision 0.
Fix alphatical order for entry 'brcmfmac43430-sdio.bin'.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/linux-firmware/linux-firmware.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 2cfc5e6eda..b636f79b64 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -415,10 +415,10 @@ LINUX_FIRMWARE_FILES += \
 	brcm/brcmfmac43236b.bin brcm/brcmfmac43241b0-sdio.bin \
 	brcm/brcmfmac43241b4-sdio.bin brcm/brcmfmac43241b5-sdio.bin \
 	brcm/brcmfmac43242a.bin brcm/brcmfmac43340-sdio.bin \
-	brcm/brcmfmac43362-sdio.bin brcm/brcmfmac43455-sdio.bin \
+	brcm/brcmfmac43362-sdio.bin brcm/brcmfmac43430-sdio.bin \
+	brcm/brcmfmac43430a0-sdio.bin brcm/brcmfmac43455-sdio.bin \
 	brcm/brcmfmac43569.bin brcm/brcmfmac43570-pcie.bin \
 	brcm/brcmfmac43602-pcie.ap.bin brcm/brcmfmac43602-pcie.bin \
-	brcm/brcmfmac43430-sdio.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
-- 
2.15.1
