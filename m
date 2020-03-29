From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2020 19:24:28 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version to
 5574077
Message-ID: <20200329172014.CBDFB88F54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2591a3b5ce8de7e0aad527eff0ef7eb936e59e42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.hash | 4 ++--
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 59ab1da0c6..dc059e615e 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 31a84340be08be319570a9d1439f25c0e3513fed73065a56aa5dd61dd605d5d9 rpi-firmware-01ecfd2ba2b7cf3a2f4aa75ada895ee4a3e729f5.tar.gz
-sha256 c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b boot/LICENCE.broadcom
+sha256  0596505f529677906fed30e6c3c1d2387a5d287f668a719484e2f9d8a3059176  rpi-firmware-5574077183389cd4c65077ba18b59144ed6ccd6d.tar.gz
+sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 6fee60b08c..6ad67ab0e5 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 01ecfd2ba2b7cf3a2f4aa75ada895ee4a3e729f5
+RPI_FIRMWARE_VERSION = 5574077183389cd4c65077ba18b59144ed6ccd6d
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
