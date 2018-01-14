From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jan 2018 15:00:08 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: fix incorrect
 line-continuation
Message-ID: <20180114140023.B5B9383B3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbceda5654feef0a5888021ade4508097a349226
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Partially fixes:
    https://gitlab.com/buildroot.org/buildroot/-/jobs/47806089

And add myself to the list of devloppers for it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                               | 1 +
 package/linux-firmware/linux-firmware.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2f7d051..bbe9d40 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1862,6 +1862,7 @@ F:	package/libiscsi/
 F:	package/libpri/
 F:	package/libseccomp/
 F:	package/libss7/
+F:	package/linux-firmware/
 F:	package/linux-tools/
 F:	package/matchbox*
 F:	package/mesa3d-headers/
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 394f286..cf79e56 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -423,7 +423,7 @@ LINUX_FIRMWARE_FILES += \
 	brcm/brcmfmac43362-sdio.bin brcm/brcmfmac43430-sdio.bin \
 	brcm/brcmfmac43430a0-sdio.bin brcm/brcmfmac43455-sdio.bin \
 	brcm/brcmfmac43569.bin brcm/brcmfmac43570-pcie.bin \
-	brcm/brcmfmac43602-pcie.ap.bin brcm/brcmfmac43602-pcie.bin \
+	brcm/brcmfmac43602-pcie.ap.bin brcm/brcmfmac43602-pcie.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
