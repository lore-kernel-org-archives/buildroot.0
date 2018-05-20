From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 12:32:19 +0200
Subject: [Buildroot] [git commit branch/next] package/rpi-firmware: bump
 version
Message-ID: <20180520103452.7CCA581239@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=975fff568f9b5ea99d02b1c24d434ee4cb490864
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
