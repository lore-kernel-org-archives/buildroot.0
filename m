From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Oct 2013 23:14:38 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version
Message-ID: <20131011082158.8CB889B9C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=883c4dc43aed75d1dc0875b0ee529d9e72c7f01e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes for de-interlacing of /unusual/ MPEG streams.
Yes, some people seem to enjoy generating MPEG streams in
which interlacing is not constant. That's apparently 100%
valid, but yet very unusual, and at the very least, weird.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index ddb48b3..ecd9dbf 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = e6b21d6
+RPI_FIRMWARE_VERSION = 58036da
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
