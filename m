From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:41:08 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version to
 358f4c2
Message-ID: <20201024202902.A82BD83A5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=732cba370833f87e14892cacaa01896fc1686fc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 1f1485f246..8730ec959b 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dcea78fcd14e0a0cb9f3b7eba42baf17566e141c3188f348017271d64edacaa3  rpi-firmware-baec4d28b54c7f9c30aabdbc61fa0c4dedcb3e55.tar.gz
+sha256  c7a8c2b8cfe1977095d62086d340d6c15a383562aba2742e21df7f5f792aeb4b  rpi-firmware-358f4c271f2bc10931aae8fe0879ffaded8b9c44.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 91368fa809..8b2b2c7154 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = baec4d28b54c7f9c30aabdbc61fa0c4dedcb3e55
+RPI_FIRMWARE_VERSION = 358f4c271f2bc10931aae8fe0879ffaded8b9c44
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
