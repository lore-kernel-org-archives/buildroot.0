From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 10:47:05 +0100
Subject: [Buildroot] [git commit] rpi-firmware: bump version to 81cca1a93
Message-ID: <20190124094754.56DBE8E4B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcc66605f09b551c9f101997ab7ed5285cd29f32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index b74991db78..9988dda717 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 58dc9d1080582964943b509ed9444602ce7fb50c1124199d3f06a5b121aa0706 rpi-firmware-e1bd9b0b8cda901ee9b23cbb8b3334cde71320a7.tar.gz
+sha256	f1d631920ed4ae15f368ba7b8b3caa4ed604f5223372cc6debbd39a101eb8d74  rpi-firmware-81cca1a9380c828299e884dba5efd0d4acb39e8d.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 70985880e9..e41b3442e6 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = e1bd9b0b8cda901ee9b23cbb8b3334cde71320a7
+RPI_FIRMWARE_VERSION = 81cca1a9380c828299e884dba5efd0d4acb39e8d
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
