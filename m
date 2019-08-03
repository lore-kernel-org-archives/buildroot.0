From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 11:06:44 +0200
Subject: [Buildroot] [git commit] package/rpi-bt-firmware: bump to latest
 version
Message-ID: <20190803090406.3971783D20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bd9af6e613cfa16a8ae3a3282c0fa93641012c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Includes the newest firmware as shipped by Raspbian Buster,
the Raspbian release designed for the Pi4

Signed-off-by: Michael Cullen <michael@michaelcullen.name>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-bt-firmware/rpi-bt-firmware.hash | 2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.hash b/package/rpi-bt-firmware/rpi-bt-firmware.hash
index eeb7b605fe..a3c7281d75 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.hash
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 155ebd5f08b819e0ce4e1950fcc972b2086cee3c16d36aba348beba1910c1fd2  rpi-bt-firmware-8c1e2bff1da9850f68efcfff3da5d939ec27a2ee.tar.gz
+sha256 51a33d23127300dffd6ac088f372b83ab862053f5e4dc7130676ebaaa824e626  rpi-bt-firmware-688531da4bcf802a814d9cb0c8b6d62e3b8a3327.tar.gz
 sha256 b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk b/package/rpi-bt-firmware/rpi-bt-firmware.mk
index f9f300da41..23923453c4 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.mk
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_BT_FIRMWARE_VERSION = 8c1e2bff1da9850f68efcfff3da5d939ec27a2ee
+RPI_BT_FIRMWARE_VERSION = 688531da4bcf802a814d9cb0c8b6d62e3b8a3327
 RPI_BT_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_BT_FIRMWARE_VERSION))
 RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
 RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
