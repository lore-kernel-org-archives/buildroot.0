From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Sep 2016 14:56:53 -0300
Subject: [Buildroot] [PATCH] linux-firmware: bump version
Message-ID: <1473962213-21519-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And copy firmware for BCM43430 and BCM43438, hence rpi3 wifi support at
last.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-firmware/linux-firmware.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 8c983e4..d5a035e 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = c883a6b6186bb2415761d287cbac773062911212
+LINUX_FIRMWARE_VERSION = c4c07a8d1128d50a5c2885ceea1abbebaa82f820
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
@@ -381,7 +381,8 @@ LINUX_FIRMWARE_FILES += \
 	brcm/brcmfmac43242a.bin brcm/brcmfmac43340-sdio.bin \
 	brcm/brcmfmac43362-sdio.bin brcm/brcmfmac43455-sdio.bin \
 	brcm/brcmfmac43569.bin brcm/brcmfmac43570-pcie.bin \
-	brcm/brcmfmac43602-pcie.ap.bin brcm/brcmfmac43602-pcie.bin
+	brcm/brcmfmac43602-pcie.ap.bin brcm/brcmfmac43602-pcie.bin \
+	brcm/brcmfmac43430-sdio.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
-- 
2.7.3
