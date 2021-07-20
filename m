From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 22:10:15 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: remove duplicated
 entries for brcmfmac4366b-pcie.bin and brcmfmac4366c-pcie.bin
Message-ID: <20210720193658.6B42F88596@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=1ba6a3090547cbf1942078471d0d57c169f0022a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove duplicated entries for brcmfmac4366b-pcie.bin and
brcmfmac4366c-pcie.bin (present since addition with
commit ca6e3f4b900a2cca605d44cffcc463db432ac0ac)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 90a38196fb..9f3f4e8635 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -618,15 +618,13 @@ endif
 
 # brcm4366b1
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM4366B1),y)
-LINUX_FIRMWARE_FILES += \
-	brcm/brcmfmac4366b-pcie.bin brcm/brcmfmac4366b-pcie.bin
+LINUX_FIRMWARE_FILES += brcm/brcmfmac4366b-pcie.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
 # brcm4366c0
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM4366C0),y)
-LINUX_FIRMWARE_FILES += \
-	brcm/brcmfmac4366c-pcie.bin brcm/brcmfmac4366c-pcie.bin
+LINUX_FIRMWARE_FILES += brcm/brcmfmac4366c-pcie.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
