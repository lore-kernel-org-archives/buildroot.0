From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 14 Mar 2007 09:38:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/x86/i386
Message-ID: <20070314163840.267CD4857F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-14 09:38:38 -0700 (Wed, 14 Mar 2007)
New Revision: 18105

Log:
- turn off some broken modules


Modified:
   trunk/buildroot/target/device/x86/i386/linux26.config


Changeset:
Modified: trunk/buildroot/target/device/x86/i386/linux26.config
===================================================================
--- trunk/buildroot/target/device/x86/i386/linux26.config	2007-03-14 13:55:32 UTC (rev 18104)
+++ trunk/buildroot/target/device/x86/i386/linux26.config	2007-03-14 16:38:38 UTC (rev 18105)
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.20.3
-# Wed Mar 14 12:44:05 2007
+# Wed Mar 14 16:32:35 2007
 #
 CONFIG_X86_32=y
 CONFIG_GENERIC_TIME=y
@@ -1138,8 +1138,7 @@
 CONFIG_WAFER_WDT=m
 CONFIG_I6300ESB_WDT=m
 CONFIG_I8XX_TCO=m
-CONFIG_ITCO_WDT=m
-CONFIG_ITCO_VENDOR_SUPPORT=y
+# CONFIG_ITCO_WDT is not set
 CONFIG_SC1200_WDT=m
 CONFIG_PC87413_WDT=m
 CONFIG_60XX_WDT=m
@@ -1602,17 +1601,15 @@
 #
 # DMA Engine support
 #
-CONFIG_DMA_ENGINE=y
+# CONFIG_DMA_ENGINE is not set
 
 #
 # DMA Clients
 #
-CONFIG_NET_DMA=y
 
 #
 # DMA Devices
 #
-CONFIG_INTEL_IOATDMA=m
 
 #
 # Virtualization
