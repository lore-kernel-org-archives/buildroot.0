From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 29 Mar 2020 15:25:33 +0200
Subject: [Buildroot] [PATCH v1 4/6] package/rpi-bt-firmware: bump version to
 d4f7087
In-Reply-To: <20200329132535.4811-1-ps.report@gmx.net>
References: <20200329132535.4811-1-ps.report@gmx.net>
Message-ID: <20200329132535.4811-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-bt-firmware/rpi-bt-firmware.hash | 4 ++--
 package/rpi-bt-firmware/rpi-bt-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.hash b/package/rpi-bt-firmware/rpi-bt-firmware.hash
index a3c7281d75..6e88552544 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.hash
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 51a33d23127300dffd6ac088f372b83ab862053f5e4dc7130676ebaaa824e626  rpi-bt-firmware-688531da4bcf802a814d9cb0c8b6d62e3b8a3327.tar.gz
-sha256 b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
+sha256  05db087504be2f6bc1d902cca605114c7f9d458be0adb3b8026369357a329f7a  rpi-bt-firmware-d4f7087ecbc8eff9cb64a4650765697157821d64.tar.gz
+sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk b/package/rpi-bt-firmware/rpi-bt-firmware.mk
index 23923453c4..785f007cc3 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.mk
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_BT_FIRMWARE_VERSION = 688531da4bcf802a814d9cb0c8b6d62e3b8a3327
+RPI_BT_FIRMWARE_VERSION = d4f7087ecbc8eff9cb64a4650765697157821d64
 RPI_BT_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_BT_FIRMWARE_VERSION))
 RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
 RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
-- 
2.26.0
