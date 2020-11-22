From: David Barbion <davidb@230ruedubac.fr>
Date: Sun, 22 Nov 2020 22:43:04 +0100
Subject: [Buildroot] [PATCH 3/3] package/rpi-wifi-firmware: bump version to
 9c0ffe9a
In-Reply-To: <20201122214304.266821-1-davidb@230ruedubac.fr>
References: <20201122214304.266821-1-davidb@230ruedubac.fr>
Message-ID: <20201122214304.266821-4-davidb@230ruedubac.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David Barbion <davidb@230ruedubac.fr>
---
 package/rpi-wifi-firmware/rpi-wifi-firmware.hash | 2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
index b8931d2c45..3af31e2b3f 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  05db087504be2f6bc1d902cca605114c7f9d458be0adb3b8026369357a329f7a  rpi-wifi-firmware-d4f7087ecbc8eff9cb64a4650765697157821d64.tar.gz
+sha256  cf806f6bdba0f803b90bc210f524a6ac37bac7ad19306c61474bb2dc59875e87   rpi-wifi-firmware-9c0ffe9a7f0753b36ed88f7981905a989d940ea9.tar.gz
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d   LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
index 6be02509fe..24ba5941b0 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_WIFI_FIRMWARE_VERSION = d4f7087ecbc8eff9cb64a4650765697157821d64
+RPI_WIFI_FIRMWARE_VERSION = 9c0ffe9a7f0753b36ed88f7981905a989d940ea9
 RPI_WIFI_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_WIFI_FIRMWARE_VERSION))
 RPI_WIFI_FIRMWARE_LICENSE = PROPRIETARY
 RPI_WIFI_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
-- 
2.27.0
