From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 12 Oct 2018 23:09:40 +0200
Subject: [Buildroot] [PATCH v1 4/5] rpi-bt-firmware: bump version to
 8c1e2bff1d
In-Reply-To: <20181012210941.21515-1-ps.report@gmx.net>
References: <20181012210941.21515-1-ps.report@gmx.net>
Message-ID: <20181012210941.21515-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-bt-firmware/rpi-bt-firmware.hash | 2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.hash b/package/rpi-bt-firmware/rpi-bt-firmware.hash
index 043706a1b8..eeb7b605fe 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.hash
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 c219f1d232fb80fbf23e7f2ed97d9c495855355a36dda373a8985c699ee1dd4b  rpi-bt-firmware-b5307312a172c8d87d44f6df32f5e24f1c19770e.tar.gz
+sha256 155ebd5f08b819e0ce4e1950fcc972b2086cee3c16d36aba348beba1910c1fd2  rpi-bt-firmware-8c1e2bff1da9850f68efcfff3da5d939ec27a2ee.tar.gz
 sha256 b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk b/package/rpi-bt-firmware/rpi-bt-firmware.mk
index b1c0aa7c94..f9f300da41 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.mk
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_BT_FIRMWARE_VERSION = b5307312a172c8d87d44f6df32f5e24f1c19770e
+RPI_BT_FIRMWARE_VERSION = 8c1e2bff1da9850f68efcfff3da5d939ec27a2ee
 RPI_BT_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_BT_FIRMWARE_VERSION))
 RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
 RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
-- 
2.19.0
