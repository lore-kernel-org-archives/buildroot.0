From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 09:50:03 +0200
Subject: [Buildroot] [git commit] linux-firmware: fix spelling mistake on
	LICENSE.qcom
Message-ID: <20170705074708.47FE37FB25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a3f1f038abc2e699a839bc4cba921acdcd68666
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/3a0233f24f0fc643a36ffff10cd725e326009fca/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index dff15a2..e03788a 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -33,7 +33,7 @@ endif
 # Qualcomm Atheros Rome 6174A Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174A_BT),y)
 LINUX_FIRMWARE_FILES += qca/rampatch_usb_00000302.bin qca/nvm_usb_00000302.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qcom
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom
 endif
 
 # Freescale i.MX SDMA
