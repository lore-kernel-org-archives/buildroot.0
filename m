From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 23:45:06 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version,
	add hash
Message-ID: <20160607214727.D99D281DBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55768aff2ef7437248e91c351c3ea6f650a28584
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-firmware/rpi-firmware.hash | 2 ++
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
new file mode 100644
index 0000000..e2e31c9
--- /dev/null
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 b2ce949db3745354383ac0d66107cbbb8902ccbf5fc027be8824519c44d5a302 rpi-firmware-70143fe9d371cd6486a80d6765e93b5574212b64.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index bcb8641..e170780 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = cc6d7bf8b4c03a2a660ff9fdf4083fc165620866
+RPI_FIRMWARE_VERSION = 70143fe9d371cd6486a80d6765e93b5574212b64
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
