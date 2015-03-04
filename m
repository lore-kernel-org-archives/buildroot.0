From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 21:27:43 +0100
Subject: [Buildroot] [git commit] rpi-firmware: remove no longer used
	BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
Message-ID: <20150304202748.6C184817F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e92ffdc47cc4c857c5d635b4583a61bc4b3cb08
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-firmware/Config.in |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 80ba88a..cd45be4 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -45,15 +45,4 @@ config BR2_PACKAGE_RPI_FIRMWARE_BOOT
 	default "_x"    if BR2_PACKAGE_RPI_FIRMWARE_X
 	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD
 
-config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
-	bool "Install Device Tree Blobs (DTBs)"
-	help
-	  Say 'y' here if you want to boot your kernel that has support
-	  for the device tree.
-
-	  Note that the defconfig files in the Raspberry Pi fork of the
-	  Linux kernel do not enable support for the Device Tree. You'll
-	  have to provide your own Linux config or defconfig file with
-	  device tree enabled, to make use of those DTBs.
-
 endif # BR2_PACKAGE_RPI_FIRMWARE
