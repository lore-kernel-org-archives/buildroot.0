From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Jan 2018 23:24:29 +0100
Subject: [Buildroot] [PATCH] package/linux-firmware: fix incorrect
 line-continuation
Message-ID: <20180113222429.21497-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Partially fixes:
    https://gitlab.com/buildroot.org/buildroot/-/jobs/47806089

And add myself to the list of devloppers for it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 DEVELOPERS                               | 1 +
 package/linux-firmware/linux-firmware.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2f7d051e8a..bbe9d405c1 100644
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
index 394f2868c3..cf79e5603d 100644
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
 
-- 
2.14.1
