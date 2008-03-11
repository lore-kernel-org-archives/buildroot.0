From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Tue, 11 Mar 2008 11:32:18 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91sam9260dfc
Message-ID: <20080311183218.7CED1120135@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-11 11:32:17 -0700 (Tue, 11 Mar 2008)
New Revision: 21304

Log:
fix for defconfig

Modified:
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2008-03-11 18:26:07 UTC (rev 21303)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2008-03-11 18:32:17 UTC (rev 21304)
@@ -121,7 +121,7 @@
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="dl"
+BR2_DL_DIR="$(BASE_DIR)/dl"
 
 #
 # Mirrors and Download locations
