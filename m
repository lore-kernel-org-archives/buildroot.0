From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 15:50:57 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: version bump for
	HDMI and audio fixes
Message-ID: <20130627165839.AFC899B232@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e003d66f855b4523685a4a58fb7f84106f683a9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 391a418..b490296 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 06f6c909e285beceeb7e51f71ba6ffe754f073e8
+RPI_FIRMWARE_VERSION = a0c98fa6bc0f93bad8cbfcf749f7be7dc2276192
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
