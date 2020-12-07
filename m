From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Dec 2020 22:54:18 +0100
Subject: [Buildroot] [git commit] package/rpi-bt-firmware: bump version to
 9c0ffe9
Message-ID: <20201207213941.EE2F78101F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60ec1e975e8e20997f786f614454b875292e691f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: David Barbion <davidb@230ruedubac.fr>
[Trim patch subject line version hash to 7 digits]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpi-bt-firmware/rpi-bt-firmware.hash | 2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.hash b/package/rpi-bt-firmware/rpi-bt-firmware.hash
index 6e88552544..543c737480 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.hash
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  05db087504be2f6bc1d902cca605114c7f9d458be0adb3b8026369357a329f7a  rpi-bt-firmware-d4f7087ecbc8eff9cb64a4650765697157821d64.tar.gz
+sha256  cf806f6bdba0f803b90bc210f524a6ac37bac7ad19306c61474bb2dc59875e87  rpi-bt-firmware-9c0ffe9a7f0753b36ed88f7981905a989d940ea9.tar.gz
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk b/package/rpi-bt-firmware/rpi-bt-firmware.mk
index 785f007cc3..02754c0b46 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.mk
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_BT_FIRMWARE_VERSION = d4f7087ecbc8eff9cb64a4650765697157821d64
+RPI_BT_FIRMWARE_VERSION = 9c0ffe9a7f0753b36ed88f7981905a989d940ea9
 RPI_BT_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_BT_FIRMWARE_VERSION))
 RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
 RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
