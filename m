From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 9 Nov 2015 00:53:06 +0200
Subject: [Buildroot] [PATCH 2/2] linux-firmware: adjust Config.in text for
	mwifiex
In-Reply-To: <c4a720fa59f51fbfe00ec8c1683e1be09f56b593.1447022391.git.alex.suykov@gmail.com>
References: <c4a720fa59f51fbfe00ec8c1683e1be09f56b593.1447022391.git.alex.suykov@gmail.com>
Message-ID: <c03bf0e4e0a807ac3346027a2945338c863c0b79.1447022391.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With SD, USB and PCI-E variants available for several chips,
bus-prefixed entries get mis-aligned badly.
Rearrange them to use bus-suffixes instead.

Config options and the files themselves remain bus-prefixed.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
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
 
-- 
2.0.3
