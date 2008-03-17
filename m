From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 17 Mar 2008 16:06:32 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91sam9260dfc
Message-ID: <20080317230633.0B5E912C5A4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-17 16:06:32 -0700 (Mon, 17 Mar 2008)
New Revision: 21372

Log:
Update sam9260 defconfig

Modified:
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2008-03-17 22:01:42 UTC (rev 21371)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2008-03-17 23:06:32 UTC (rev 21372)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Wed Mar 12 01:51:24 2008
+# Mon Mar 17 22:02:39 2008
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -154,9 +154,15 @@
 # BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
+# BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
 # BR2_STRIP_none is not set
+# BR2_OPTIMIZE_0 is not set
+# BR2_OPTIMIZE_1 is not set
+BR2_OPTIMIZE_2=y
+# BR2_OPTIMIZE_3 is not set
+# BR2_OPTIMIZE_S is not set
 # BR2_PREFER_STATIC_LIB is not set
 # BR2_HAVE_MANPAGES is not set
 # BR2_HAVE_INFOPAGES is not set
