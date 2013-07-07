From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Jul 2013 21:38:08 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version
Message-ID: <20130707200244.1F8C19A591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ca310b0a0a38f193f573aac65628adac57ebf49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes for:
  - sound volume
  - GL deadlock
  - ressources leak
  - compressed audio streams
  - audio sampling up to 192kHz
  - display scaling
  - cache flush for mailbox

Switch to using a 7-char cset, instead of the long one.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index b490296..6ea621f 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = a0c98fa6bc0f93bad8cbfcf749f7be7dc2276192
+RPI_FIRMWARE_VERSION = 320084a
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
