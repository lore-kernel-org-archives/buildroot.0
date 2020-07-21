From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 21 Jul 2020 21:05:47 +0200
Subject: [Buildroot] [PATCH v1 1/3] package/rpi-firmware: bump version to
 542aceb
In-Reply-To: <20200721190549.29166-1-ps.report@gmx.net>
References: <20200721190549.29166-1-ps.report@gmx.net>
Message-ID: <20200721190549.29166-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index dc059e615e..32f2076d6e 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0596505f529677906fed30e6c3c1d2387a5d287f668a719484e2f9d8a3059176  rpi-firmware-5574077183389cd4c65077ba18b59144ed6ccd6d.tar.gz
+sha256  bad3eedb256631bdce1e7d3a0ac59fdd38923a68579089a6b64029c5ff7d68f4  rpi-firmware-542aceb30364db3ce87d532ea90451f46bbb84e9.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 253065900e..8aa855d0ef 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 5574077183389cd4c65077ba18b59144ed6ccd6d
+RPI_FIRMWARE_VERSION = 542aceb30364db3ce87d532ea90451f46bbb84e9
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.27.0
