From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jan 2014 20:45:44 +0100
Subject: [Buildroot] [git commit] package/rpi-firmware: bump for misc
	fixes/improvements
Message-ID: <20140119195139.BB1779C4EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce2f4b24af0832cff244de38a1b4d888e5c079c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bring a slew of fixes and improvements to:
  - boot hang
  - camera zoom, night mode
  - MJPEG decoder/encoder
  - video decoder/encoder
  - dispmanx (3D engine)
  - documentation

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 664f6ad..5d2c0cf 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = e618d4ff2dc20051bc726834b22487fe2e236fe5
+RPI_FIRMWARE_VERSION = 940dc3b5ea0a001096c5fbb2d483a961d42fe85c
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
