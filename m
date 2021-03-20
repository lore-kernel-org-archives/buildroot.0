From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:52:13 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: add missing
 closing double quotes
Message-ID: <20210320212816.E6EF38859F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d60df1d400176f1a32a7a948155f3c997279808
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 4cf39ddbc1..01d43f21dd 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -305,7 +305,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_PCIE8897
 	  Firmware files for the Marvell Wifi-Ex 8897 module on PCI-E.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_PCIEUART8997
-	bool "Marvell Wifi-Ex 8997 PCI-E/UART
+	bool "Marvell Wifi-Ex 8997 PCI-E/UART"
 	help
 	  Firmware files for the Marvell Wifi-Ex 8997 module on
 	  PCI-E/UART.
