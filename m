From: Martin Bark <martin@barkynet.com>
Date: Sun,  6 May 2018 21:07:27 +0100
Subject: [Buildroot] [PATCH 3/5] package/rpi-firmware: bump version
In-Reply-To: <20180506200729.31951-1-martin@barkynet.com>
References: <20180506200729.31951-1-martin@barkynet.com>
Message-ID: <20180506200729.31951-4-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 4854deae03..d481ee524f 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 ea451834e20136d249661e0ed7d1fdfa309249d233a387f44dd6c3b746a454c6 rpi-firmware-36f991382326907419f64917624427e59fd8e4a0.tar.gz
+sha256 5edff641f216d2e09c75469dc2e9fc66aff290e212a1cd43ed31c499f99ea055 rpi-firmware-287af2a2be0787a5d45281d1d6183a2161c798d4.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index eab4c5d307..853ab6ed02 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 36f991382326907419f64917624427e59fd8e4a0
+RPI_FIRMWARE_VERSION = 287af2a2be0787a5d45281d1d6183a2161c798d4
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.17.0
