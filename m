From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 11:10:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device: Atmel valka
Message-ID: <20080306191006.DCA661201BB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 11:10:06 -0800 (Thu, 06 Mar 2008)
New Revision: 21258

Log:
changed source download path to be uniform

Modified:
   trunk/buildroot/target/device/Atmel/atngw100-base_defconfig
   trunk/buildroot/target/device/Atmel/atngw100_defconfig
   trunk/buildroot/target/device/Atmel/atngw100_expanded_defconfig
   trunk/buildroot/target/device/Atmel/atstk1002-no-mplayer_defconfig
   trunk/buildroot/target/device/Atmel/atstk1002_defconfig
   trunk/buildroot/target/device/valka/v100sc2_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100-base_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100-base_defconfig	2008-03-06 19:01:08 UTC (rev 21257)
+++ trunk/buildroot/target/device/Atmel/atngw100-base_defconfig	2008-03-06 19:10:06 UTC (rev 21258)
@@ -89,7 +89,7 @@
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/src/dl"
+BR2_DL_DIR="$(BASE_DIR)/dl"
 
 #
 # Mirrors and Download locations

Modified: trunk/buildroot/target/device/Atmel/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100_defconfig	2008-03-06 19:01:08 UTC (rev 21257)
+++ trunk/buildroot/target/device/Atmel/atngw100_defconfig	2008-03-06 19:10:06 UTC (rev 21258)
@@ -89,7 +89,7 @@
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/src/dl"
+BR2_DL_DIR="$(BASE_DIR)/dl"
 
 #
 # Mirrors and Download locations

Modified: trunk/buildroot/target/device/Atmel/atngw100_expanded_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100_expanded_defconfig	2008-03-06 19:01:08 UTC (rev 21257)
+++ trunk/buildroot/target/device/Atmel/atngw100_expanded_defconfig	2008-03-06 19:10:06 UTC (rev 21258)
@@ -89,7 +89,7 @@
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/src/dl"
+BR2_DL_DIR="$(BASE_DIR)/dl"
 
 #
 # Mirrors and Download locations

Modified: trunk/buildroot/target/device/Atmel/atstk1002-no-mplayer_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002-no-mplayer_defconfig	2008-03-06 19:01:08 UTC (rev 21257)
+++ trunk/buildroot/target/device/Atmel/atstk1002-no-mplayer_defconfig	2008-03-06 19:10:06 UTC (rev 21258)
@@ -89,7 +89,7 @@
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/src/dl"
+BR2_DL_DIR="$(BASE_DIR)/dl"
 
 #
 # Mirrors and Download locations

Modified: trunk/buildroot/target/device/Atmel/atstk1002_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002_defconfig	2008-03-06 19:01:08 UTC (rev 21257)
+++ trunk/buildroot/target/device/Atmel/atstk1002_defconfig	2008-03-06 19:10:06 UTC (rev 21258)
@@ -89,7 +89,7 @@
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/src/dl"
+BR2_DL_DIR="$(BASE_DIR)/dl"
 
 #
 # Mirrors and Download locations

Modified: trunk/buildroot/target/device/valka/v100sc2_defconfig
===================================================================
--- trunk/buildroot/target/device/valka/v100sc2_defconfig	2008-03-06 19:01:08 UTC (rev 21257)
+++ trunk/buildroot/target/device/valka/v100sc2_defconfig	2008-03-06 19:10:06 UTC (rev 21258)
@@ -65,7 +65,7 @@
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/src/dl"
+BR2_DL_DIR="$(BASE_DIR)/dl"
 
 #
 # Mirrors and Download locations
