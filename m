From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Oct 2018 13:16:53 +0200
Subject: [Buildroot] [git commit] rpi-wifi-firmware: bump version to
 8c1e2bff1d
Message-ID: <20181015112324.8AA427FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ba4a7e26439751aec0258842e78f099e351f7b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-wifi-firmware/rpi-wifi-firmware.hash | 2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
index 4659f2a6b8..c61a47ec73 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c219f1d232fb80fbf23e7f2ed97d9c495855355a36dda373a8985c699ee1dd4b  rpi-wifi-firmware-b5307312a172c8d87d44f6df32f5e24f1c19770e.tar.gz
+sha256 155ebd5f08b819e0ce4e1950fcc972b2086cee3c16d36aba348beba1910c1fd2  rpi-wifi-firmware-8c1e2bff1da9850f68efcfff3da5d939ec27a2ee.tar.gz
 sha256 b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
index 7e8dbada09..2eb8ceec3c 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_WIFI_FIRMWARE_VERSION = b5307312a172c8d87d44f6df32f5e24f1c19770e
+RPI_WIFI_FIRMWARE_VERSION = 8c1e2bff1da9850f68efcfff3da5d939ec27a2ee
 RPI_WIFI_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_WIFI_FIRMWARE_VERSION))
 RPI_WIFI_FIRMWARE_LICENSE = PROPRIETARY
 RPI_WIFI_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
