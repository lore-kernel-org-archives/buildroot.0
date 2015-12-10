From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Dec 2015 21:52:05 +0100
Subject: [Buildroot] [git commit] linux-firmware: update Broadcom 43xx file
	list
Message-ID: <20151210205359.F4012822E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fda730196e302a29d0b94c6e0df958a1733e5d6a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These files have been added upstream.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index da51d50..2767452 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -329,7 +329,9 @@ LINUX_FIRMWARE_FILES += \
 	brcm/bcm43xx-0.fw brcm/bcm43xx_hdr-0.fw \
 	brcm/bcm4329-fullmac-4.bin brcm/brcmfmac4329-sdio.bin \
 	brcm/brcmfmac4330-sdio.bin brcm/brcmfmac4334-sdio.bin \
-	brcm/brcmfmac4335-sdio.bin
+	brcm/brcmfmac4335-sdio.bin brcm/brcmfmac4339-sdio.bin \
+	brcm/brcmfmac4350-pcie.bin brcm/brcmfmac4354-sdio.bin \
+	brcm/brcmfmac4356-pcie.bin brcm/brcmfmac4371-pcie.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
