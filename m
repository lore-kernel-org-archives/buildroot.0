From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 21 Dec 2020 21:39:52 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/rpi-firmware: bump version to
 d016a6e
In-Reply-To: <20201221203952.22168-1-ps.report@gmx.net>
References: <20201221203952.22168-1-ps.report@gmx.net>
Message-ID: <20201221203952.22168-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Keep rpi-firmware up-to-date with the kernel
version bump (5.10.1).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 7767479daf..691b200259 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fdf199b1af35d8ba874c1e963344f8e6edf21a7f37a9633fa4bddaea19aad84a  rpi-firmware-08ed7a0c9ad4d9db559aaec462520ab435c7ce1c.tar.gz
+sha256  ae4e317681995e0f7becd7900ae667cba394e3a0b7ca93a267f3303df7284697  rpi-firmware-d016a6eb01c8c7326a89cb42809fed2a21525de5.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 0255a5bff5..f3d28ef825 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 08ed7a0c9ad4d9db559aaec462520ab435c7ce1c
+RPI_FIRMWARE_VERSION = d016a6eb01c8c7326a89cb42809fed2a21525de5
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.29.2
