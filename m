From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Dec 2020 22:54:17 +0100
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version to
 08ed7a0
Message-ID: <20201207213941.E3DB98101F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b5ec3a84face62aaf74813ff75a305d852a0299
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 8730ec959b..7767479daf 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c7a8c2b8cfe1977095d62086d340d6c15a383562aba2742e21df7f5f792aeb4b  rpi-firmware-358f4c271f2bc10931aae8fe0879ffaded8b9c44.tar.gz
+sha256  fdf199b1af35d8ba874c1e963344f8e6edf21a7f37a9633fa4bddaea19aad84a  rpi-firmware-08ed7a0c9ad4d9db559aaec462520ab435c7ce1c.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 8b2b2c7154..0255a5bff5 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 358f4c271f2bc10931aae8fe0879ffaded8b9c44
+RPI_FIRMWARE_VERSION = 08ed7a0c9ad4d9db559aaec462520ab435c7ce1c
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
