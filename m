From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 12:32:24 +0200
Subject: [Buildroot] [git commit branch/next] package/rpi-wifi-firmware:
 bump version
Message-ID: <20180520103452.8516E81239@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7608198c5cea38f4eb0122fb413f5c9e61ff6b7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpi-wifi-firmware/rpi-wifi-firmware.hash | 2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
index bc0d7c8b02..4659f2a6b8 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 beade89c5c072158b6cf18cf741d2695980fd6a4533dab3897bebf90c0631a30  rpi-wifi-firmware-18d7c931aff0a8a78360b9b9eaeb15d1224fb907.tar.gz
+sha256 c219f1d232fb80fbf23e7f2ed97d9c495855355a36dda373a8985c699ee1dd4b  rpi-wifi-firmware-b5307312a172c8d87d44f6df32f5e24f1c19770e.tar.gz
 sha256 b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
index 32dd3e519b..7e8dbada09 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_WIFI_FIRMWARE_VERSION = 18d7c931aff0a8a78360b9b9eaeb15d1224fb907
+RPI_WIFI_FIRMWARE_VERSION = b5307312a172c8d87d44f6df32f5e24f1c19770e
 RPI_WIFI_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_WIFI_FIRMWARE_VERSION))
 RPI_WIFI_FIRMWARE_LICENSE = PROPRIETARY
 RPI_WIFI_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
