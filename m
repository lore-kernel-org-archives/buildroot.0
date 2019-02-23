From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 23 Feb 2019 11:32:58 +0100
Subject: [Buildroot] [PATCH/next v1 2/2] package/rpi-firmware: bump version
 to ebf7b40cdc
In-Reply-To: <20190223103258.4274-1-ps.report@gmx.net>
References: <20190223103258.4274-1-ps.report@gmx.net>
Message-ID: <20190223103258.4274-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index b6b8824f3f..d719fa6e08 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 9a34ccc4a51695a33206cc6c8534f615ba5a30fcbce5fa3add400ecc6b80ad8a rpi-firmware-83977fe3b6ef54c1d29c83b0a778d330f523441f.tar.gz
+sha256 e911f6342ea8aa9380cae97c6f5ac4ddd370527265f23d5b5d4b2c6f679d4ba8 rpi-firmware-ebf7b40cdc6effe7ffa3fd5195e8be01b94f80da.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index b883e9d989..d6b499d418 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 83977fe3b6ef54c1d29c83b0a778d330f523441f
+RPI_FIRMWARE_VERSION = ebf7b40cdc6effe7ffa3fd5195e8be01b94f80da
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.20.1
