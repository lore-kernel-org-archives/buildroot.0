From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 01:17:48 +0100
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version
Message-ID: <20131111001829.208819BB30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c6fff0e468e700e81f366bced8374741622eee0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump bootloader and GPU firmware for misc fixes:
  - cec fixes
  - DTS buffering
  - others (pause_burst_frames enabled by default. WTF is that?)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index e6763af..94badf9 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 5343d029a5f2f09bd9801914eac0d4bf95cadc1f
+RPI_FIRMWARE_VERSION = 18a163f9341755b00841312af2878afeb64c131c
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
