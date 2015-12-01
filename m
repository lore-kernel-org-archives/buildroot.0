From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Dec 2015 23:21:16 -0000
Subject: [Buildroot] [git commit] linux-firmware: adjust Config.in text for
	mwifiex
Message-ID: <20151201232115.86E238220E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ce38192f0cfdf2900f3d8d08e2f7fe58492b1bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With SD, USB and PCI-E variants available for several chips,
bus-prefixed entries get mis-aligned badly.
Rearrange them to use bus-suffixes instead.

Config options and the files themselves remain bus-prefixed.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/Config.in | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 32e9c6e..d838986 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -155,37 +155,37 @@ config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8688
 	  Firmware files for the Marvell SD8688 module
 
 config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787
-	bool "Marvell Wifi-Ex SD 8787"
+	bool "Marvell Wifi-Ex 8787 SDIO"
 	help
 	  Firmware files for the Marvell Wifi-Ex 8787 module on SDIO.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8797
-	bool "Marvell Wifi-Ex SD 8797"
+	bool "Marvell Wifi-Ex 8797 SDIO"
 	help
 	  Firmware files for the Marvell Wifi-Ex 8797 module on SDIO.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_USB8797
-	bool "Marvell Wifi-Ex USB 8797"
+	bool "Marvell Wifi-Ex 8797 USB"
 	help
 	  Firmware files for the Marvell Wifi-Ex 8797 module on USB.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8887
-	bool "Marvell Wifi-Ex SD 8887"
+	bool "Marvell Wifi-Ex 8887 SDIO"
 	help
 	  Firmware files for the Marvell Wifi-Ex 8887 module on SDIO.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8897
-	bool "Marvell Wifi-Ex SD 8897"
+	bool "Marvell Wifi-Ex 8897 SDIO"
 	help
 	  Firmware files for the Marvell Wifi-Ex 8897 module on SDIO.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_USB8897
-	bool "Marvell Wifi-Ex USB 8897"
+	bool "Marvell Wifi-Ex 8897 USB"
 	help
 	  Firmware files for the Marvell Wifi-Ex 8897 module on USB.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_PCIE8897
-	bool "Marvell Wifi-Ex PCI-E 8897"
+	bool "Marvell Wifi-Ex 8897 PCI-E"
 	help
 	  Firmware files for the Marvell Wifi-Ex 8897 module on PCI-E.
 
