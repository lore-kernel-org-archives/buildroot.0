From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  6 Dec 2020 12:42:47 +0100
Subject: [Buildroot] [PATCH v1 4/5] package/rpi-wifi-firmware: bump version
 to 9c0ffe9
In-Reply-To: <20201206114248.24700-1-ps.report@gmx.net>
References: <20201206114248.24700-1-ps.report@gmx.net>
Message-ID: <20201206114248.24700-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: David Barbion <davidb@230ruedubac.fr>

Signed-off-by: David Barbion <davidb@230ruedubac.fr>
[Trim patch subject line version hash to 7 digits,
 Correct hash file spacing - two spaces]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-wifi-firmware/rpi-wifi-firmware.hash | 4 ++--
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
index b8931d2c45..71e323e806 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  05db087504be2f6bc1d902cca605114c7f9d458be0adb3b8026369357a329f7a  rpi-wifi-firmware-d4f7087ecbc8eff9cb64a4650765697157821d64.tar.gz
-sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d   LICENCE.broadcom_bcm43xx
+sha256  cf806f6bdba0f803b90bc210f524a6ac37bac7ad19306c61474bb2dc59875e87  rpi-wifi-firmware-9c0ffe9a7f0753b36ed88f7981905a989d940ea9.tar.gz
+sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
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
2.29.2
