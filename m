From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Oct 2013 00:03:06 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version
Message-ID: <20131004220445.3A9F99B941@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d06678b78342b55f63a56f5800035fc0ce86bbce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix for issues with USB, audio, and GLESv2.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 9319429..ddb48b3 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = fadc4cb
+RPI_FIRMWARE_VERSION = e6b21d6
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
