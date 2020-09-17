From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 21:28:36 +0200
Subject: [Buildroot] [git commit] package/armbian-firmware: bump version to
 70a0850
Message-ID: <20200917193048.7B53081408@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ec82c7d57f02bc9c330c8b02b4a906a5b7e7bda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While at it, adjust spacing in the hash file.

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/armbian-firmware/armbian-firmware.hash | 2 +-
 package/armbian-firmware/armbian-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armbian-firmware/armbian-firmware.hash b/package/armbian-firmware/armbian-firmware.hash
index 0f3858dedf..edbc9c8282 100644
--- a/package/armbian-firmware/armbian-firmware.hash
+++ b/package/armbian-firmware/armbian-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 876958ce6ba8a4a01a424f2b4455208b7a989eaba96015649c774340553f0c35 armbian-firmware-455d6b6701178dafe7fd0168eb4a4ef78a8d24a3.tar.gz
+sha256  975bc377728496006f058317cccc88e2d3c4ab172ee3df08cfd085cf13221752  armbian-firmware-70a08503ac9e765f5d1ccf4fa3e825db0751e53e.tar.gz
diff --git a/package/armbian-firmware/armbian-firmware.mk b/package/armbian-firmware/armbian-firmware.mk
index 77e518542b..36b0450037 100644
--- a/package/armbian-firmware/armbian-firmware.mk
+++ b/package/armbian-firmware/armbian-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMBIAN_FIRMWARE_VERSION = 455d6b6701178dafe7fd0168eb4a4ef78a8d24a3
+ARMBIAN_FIRMWARE_VERSION = 70a08503ac9e765f5d1ccf4fa3e825db0751e53e
 ARMBIAN_FIRMWARE_SITE = https://github.com/armbian/firmware
 ARMBIAN_FIRMWARE_SITE_METHOD = git
 
