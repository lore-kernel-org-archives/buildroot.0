From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jan 2018 15:18:06 +0100
Subject: [Buildroot] [git commit] linux-firmware: update Broadcom 43xxx file
 list
Message-ID: <20180106141809.637AF83A5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c1001ee53b1e149adcd31ca0c54f5817096c8fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add firmware file 'brcmfmac43430a0-sdio.bin' for bcm43430 revision 0.
Fix alphatical order for entry 'brcmfmac43430-sdio.bin'.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/linux-firmware.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 2cfc5e6..b636f79 100644
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
 
