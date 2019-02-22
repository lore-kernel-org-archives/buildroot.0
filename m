From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 22 Feb 2019 23:37:04 +0100
Subject: [Buildroot] [PATCH 2/2] package/rpi-firmware: bump version to
 83977fe3b6
In-Reply-To: <20190222223704.6202-1-ps.report@gmx.net>
References: <20190222223704.6202-1-ps.report@gmx.net>
Message-ID: <20190222223704.6202-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 9988dda717..b6b8824f3f 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	f1d631920ed4ae15f368ba7b8b3caa4ed604f5223372cc6debbd39a101eb8d74  rpi-firmware-81cca1a9380c828299e884dba5efd0d4acb39e8d.tar.gz
+sha256 9a34ccc4a51695a33206cc6c8534f615ba5a30fcbce5fa3add400ecc6b80ad8a rpi-firmware-83977fe3b6ef54c1d29c83b0a778d330f523441f.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index e41b3442e6..b883e9d989 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 81cca1a9380c828299e884dba5efd0d4acb39e8d
+RPI_FIRMWARE_VERSION = 83977fe3b6ef54c1d29c83b0a778d330f523441f
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.20.1
