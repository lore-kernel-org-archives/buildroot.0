From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 13:13:18 +0200
Subject: [Buildroot] [git commit] rpi-firmware: bump to latest version
Message-ID: <20170924111225.AE6377FEE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1734800be3bc9ae5eb500326845642f43b929c93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index db26c1e..833a7fb 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 42edea8317869f5a5ed87dfe009ceffce6a784ff40cb5da3e9e8a4fc61d79610 rpi-firmware-685b3ceb0a6d6d6da7b028ee409850e83fb7ede7.tar.gz
+sha256 0451e1a843bf02df81126a1625d9a15dfdf19dcb2f9e95b0613a63e59fd31ca8 rpi-firmware-2067241bc7cdf238fdeab7f5a3c22faa57dd5617.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 10da04b..22eaaa2 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 685b3ceb0a6d6d6da7b028ee409850e83fb7ede7
+RPI_FIRMWARE_VERSION = 2067241bc7cdf238fdeab7f5a3c22faa57dd5617
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
