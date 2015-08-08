From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:51 -0000
Subject: [Buildroot] [git commit branch/next] linux-firmware: add brcm43143
	support
Message-ID: <20150808105640.1AA2E7F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52491db85e506aa51708496594be503930b9e322
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/linux-firmware.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 674b0dc..06195c9 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -299,6 +299,7 @@ endif
 # brcm43xxx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX),y)
 LINUX_FIRMWARE_FILES += \
+	brcm/brcmfmac43143.bin brcm/brcmfmac43143-sdio.bin \
 	brcm/brcmfmac43236b.bin brcm/brcmfmac43241b0-sdio.bin \
 	brcm/brcmfmac43241b4-sdio.bin brcm/brcmfmac43362-sdio.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
