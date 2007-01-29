From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 29 Jan 2007 14:12:53 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/grub
Message-ID: <20070129221253.F1F87485A8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-29 14:12:53 -0800 (Mon, 29 Jan 2007)
New Revision: 17649

Log:
- strip a handful of enable


Modified:
   trunk/buildroot/target/x86/grub/Config.in


Changeset:
Modified: trunk/buildroot/target/x86/grub/Config.in
===================================================================
--- trunk/buildroot/target/x86/grub/Config.in	2007-01-29 21:53:20 UTC (rev 17648)
+++ trunk/buildroot/target/x86/grub/Config.in	2007-01-29 22:12:53 UTC (rev 17649)
@@ -6,7 +6,7 @@
 	  The GRand Unified Bootloader for x86 systems.
 
 config BR2_TARGET_GRUB_SPLASH
-	bool "  Splashimage support"
+	bool "Splashimage support"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
@@ -16,154 +16,154 @@
 	  is displayed as background for the grub menu.
 
 config BR2_TARGET_GRUB_DISKLESS
-	bool "enable diskless support"
+	bool "diskless support"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable diskless support
 
 config BR2_TARGET_GRUB_3c595
-	bool "enable 3Com595 driver"
+	bool "3Com595 driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable 3Com595 driver
 
 config BR2_TARGET_GRUB_3c90x
-	bool "enable 3Com90x driver"
+	bool "3Com90x driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable 3Com90x driver
 
 config BR2_TARGET_GRUB_davicom
-	bool "enable Davicom driver"
+	bool "Davicom driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable Davicom driver
 
 config BR2_TARGET_GRUB_e1000
-	bool "enable Etherexpress Pro/1000 driver"
+	bool "Etherexpress Pro/1000 driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable Etherexpress Pro/1000 driver
 
 config BR2_TARGET_GRUB_eepro100
-	bool "enable Etherexpress Pro/100 driver"
+	bool "Etherexpress Pro/100 driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable Etherexpress Pro/100 driver
 
 config BR2_TARGET_GRUB_epic100
-	bool "enable SMC 83c170 EPIC/100 driver"
+	bool "SMC 83c170 EPIC/100 driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable SMC 83c170 EPIC/100 driver
 
 config BR2_TARGET_GRUB_forcedeth
-	bool "enable Nvidia Geforce driver"
+	bool "Nvidia Geforce driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable Nvidia Geforce driver
 
 config BR2_TARGET_GRUB_natsemi
-	bool "enable NatSemi DP8381x driver"
+	bool "NatSemi DP8381x driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable NatSemi DP8381x driver
 
 config BR2_TARGET_GRUB_ns83820
-	bool "enable NS83820 driver"
+	bool "NS83820 driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable NS83820 driver
 
 config BR2_TARGET_GRUB_ns8390
-	bool "enable NE2000 PCI driver"
+	bool "NE2000 PCI driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable NE2000 PCI driver
 
 config BR2_TARGET_GRUB_pcnet32
-	bool "enable AMD Lance/PCI PCNet/32 driver"
+	bool "AMD Lance/PCI PCNet/32 driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable AMD Lance/PCI PCNet/32 driver
 
 config BR2_TARGET_GRUB_pnic
-	bool "enable Bochs Pseudo Nic driver"
+	bool "Bochs Pseudo Nic driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable Bochs Pseudo Nic driver
 
 config BR2_TARGET_GRUB_rtl8139
-	bool "enable Realtek 8139 driver"
+	bool "Realtek 8139 driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable Realtek 8139 driver
 
 config BR2_TARGET_GRUB_r8169
-	bool "enable Realtek 8169 driver"
+	bool "Realtek 8169 driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable Realtek 8169 driver
 
 config BR2_TARGET_GRUB_sis900
-	bool "enable SIS 900 and SIS 7016 driver"
+	bool "SIS 900 and SIS 7016 driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable SIS 900 and SIS 7016 driver
 
 config BR2_TARGET_GRUB_tg3
-	bool "enable Broadcom Tigon3 driver"
+	bool "Broadcom Tigon3 driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable Broadcom Tigon3 driver
 
 config BR2_TARGET_GRUB_tulip
-	bool "enable Tulip driver"
+	bool "Tulip driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable Tulip driver
 
 config BR2_TARGET_GRUB_tlan
-	bool "enable TI ThunderLAN driver"
+	bool "TI ThunderLAN driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable TI ThunderLAN driver
 
 config BR2_TARGET_GRUB_undi
-	bool "enable PXE UNDI driver"
+	bool "PXE UNDI driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable PXE UNDI driver
 
 config BR2_TARGET_GRUB_via_rhine
-	bool "enable Rhine-I/II driver"
+	bool "Rhine-I/II driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
 	  enable Rhine-I/II driver
 
 config BR2_TARGET_GRUB_w89c840
-	bool "enable Winbond W89c840 driver"
+	bool "Winbond W89c840 driver"
 	default n
 	depends on BR2_TARGET_GRUB
 	help
