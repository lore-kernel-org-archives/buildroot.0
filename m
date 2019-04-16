From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Apr 2019 22:39:39 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version to
 83977fe3b6
Message-ID: <20190416203728.BB5228ED2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5304b72d35f1bb219edcb17c9a3a8fb5d6883bba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index 630bc670ca..b57ed2ef4c 100644
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
