From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  7 Nov 2019 21:23:36 +0100
Subject: [Buildroot] [PATCH v2 2/5] package/rpi-firmware: bump version to
 1.20190925-1
In-Reply-To: <20191107202339.6371-1-ps.report@gmx.net>
References: <20191107202339.6371-1-ps.report@gmx.net>
Message-ID: <20191107202339.6371-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
 - no changes
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 58737b4585..63d8ac50a0 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 ec2dbd3cd7654f743894ffb9100e7e86ef9d840e7cf113c0b517e0da42cbbb02 rpi-firmware-1.20190819.tar.gz
+sha256 b3c5c9d3cda1f77caf317b8d1f0496cd7ca791ddaeec8207a5a1940111483509 rpi-firmware-1.20190925.tar.gz
 sha256 ba76edfc10a248166d965b8eaf320771c44f4f432d4fce2fd31fd272e7038add boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 3a23bc26d1..ee59ee2f26 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-RPI_FIRMWARE_VERSION = 1.20190819
+RPI_FIRMWARE_VERSION = 1.20190925
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
--
2.23.0
