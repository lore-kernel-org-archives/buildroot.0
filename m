From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 11:46:26 +0100
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version
Message-ID: <20140311104936.AB5589BED3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b62fe9a04eaa11200feab1502dd16d056ebfc487
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to latest changeset:
  - fix for detecting monitor

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index b6c9667..a849d32 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = bec4bd0f70aa46f55a980996e8774547c0f909c8
+RPI_FIRMWARE_VERSION = a0eb06736a3f1583fc6cd575149c7835dc43582d
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
