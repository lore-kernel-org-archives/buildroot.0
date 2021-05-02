From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  2 May 2021 11:48:29 +0200
Subject: [Buildroot] [PATCH v1 5/5] package/rpi-wifi-firmware: bump version
 to 4c47758
In-Reply-To: <20210502094829.8292-1-ps.report@gmx.net>
References: <20210502094829.8292-1-ps.report@gmx.net>
Message-ID: <20210502094829.8292-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-wifi-firmware/rpi-wifi-firmware.hash | 2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
index 71e323e806..4db3e15c80 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cf806f6bdba0f803b90bc210f524a6ac37bac7ad19306c61474bb2dc59875e87  rpi-wifi-firmware-9c0ffe9a7f0753b36ed88f7981905a989d940ea9.tar.gz
+sha256  ae665baa465a09dddf7f4bdec67e108a74b2a3787550cc9ee53c2bea9651f327  rpi-wifi-firmware-4c47758bed7cd547dff3618a1739dcf64b5a52a7.tar.gz
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
index 24ba5941b0..a643c4df9c 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_WIFI_FIRMWARE_VERSION = 9c0ffe9a7f0753b36ed88f7981905a989d940ea9
+RPI_WIFI_FIRMWARE_VERSION = 4c47758bed7cd547dff3618a1739dcf64b5a52a7
 RPI_WIFI_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_WIFI_FIRMWARE_VERSION))
 RPI_WIFI_FIRMWARE_LICENSE = PROPRIETARY
 RPI_WIFI_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
-- 
2.31.1
