From: John Keeping <john@keeping.me.uk>
Date: Fri, 11 Dec 2015 12:29:07 +0000
Subject: [Buildroot] [PATCH] linux-firmware: update Broadcom 43xxx file list
Message-ID: <1449836947-28866-1-git-send-email-john@keeping.me.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: John Keeping <john@metanate.com>

These files have been added upstream.

Signed-off-by: John Keeping <john@metanate.com>
---
 package/linux-firmware/linux-firmware.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 2767452..083a381 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -340,7 +340,11 @@ ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX),y)
 LINUX_FIRMWARE_FILES += \
 	brcm/brcmfmac43143.bin brcm/brcmfmac43143-sdio.bin \
 	brcm/brcmfmac43236b.bin brcm/brcmfmac43241b0-sdio.bin \
-	brcm/brcmfmac43241b4-sdio.bin brcm/brcmfmac43362-sdio.bin
+	brcm/brcmfmac43241b4-sdio.bin brcm/brcmfmac43241b5-sdio.bin \
+	brcm/brcmfmac43242a.bin brcm/brcmfmac43340-sdio.bin \
+	brcm/brcmfmac43362-sdio.bin brcm/brcmfmac43455-sdio.bin \
+	brcm/brcmfmac43569.bin brcm/brcmfmac43570-pcie.bin \
+	brcm/brcmfmac43602-pcie.ap.bin brcm/brcmfmac43602-pcie.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
-- 
2.7.0.rc0.76.g531d676
