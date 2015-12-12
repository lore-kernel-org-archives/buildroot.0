From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 14:17:58 +0100
Subject: [Buildroot] [git commit] linux-firmware: update Broadcom 43xxx file
	list
Message-ID: <20151212132927.014A080ACF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e29134e96220060e2f8d7e08602cd544ca82eb12
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These files have been added upstream.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
