From: John Keeping <john@keeping.me.uk>
Date: Thu, 10 Dec 2015 14:01:47 +0000
Subject: [Buildroot] [PATCH 2/2] linux-firmware: update Broadcom 43xx file
	list
In-Reply-To: <1449756107-9441-1-git-send-email-john@keeping.me.uk>
References: <1449756107-9441-1-git-send-email-john@keeping.me.uk>
Message-ID: <1449756107-9441-2-git-send-email-john@keeping.me.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: John Keeping <john@metanate.com>

These files have been added upstream.

Signed-off-by: John Keeping <john@metanate.com>
---
 package/linux-firmware/linux-firmware.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9ae4d47..3fbf170 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -293,7 +293,9 @@ LINUX_FIRMWARE_FILES += \
 	brcm/bcm43xx-0.fw brcm/bcm43xx_hdr-0.fw \
 	brcm/bcm4329-fullmac-4.bin brcm/brcmfmac4329-sdio.bin \
 	brcm/brcmfmac4330-sdio.bin brcm/brcmfmac4334-sdio.bin \
-	brcm/brcmfmac4335-sdio.bin
+	brcm/brcmfmac4335-sdio.bin brcm/brcmfmac4339-sdio.bin \
+	brcm/brcmfmac4350-pcie.bin brcm/brcmfmac4354-sdio.bin \
+	brcm/brcmfmac4356-pcie.bin brcm/brcmfmac4371-pcie.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
-- 
2.6.3.462.gbe2c914
