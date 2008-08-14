From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 13 Aug 2008 23:52:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device: ARMLTD Atmel
	valka/v100sc2
Message-ID: <20080814065216.187C63C717@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-13 23:52:15 -0700 (Wed, 13 Aug 2008)
New Revision: 23077

Log:
target/device: enable uclibc globbing support

Enable UCLIBC_HAS_GNU_GLOB like in the generic config for target specific
uclibc configs. Fixes globbing issue reported on the uclibc list.

Modified:
   trunk/buildroot/target/device/ARMLTD/uClibc.integrator926.config
   trunk/buildroot/target/device/Atmel/uClibc.config.avr32
   trunk/buildroot/target/device/valka/v100sc2/uClibc.config


Changeset:
Modified: trunk/buildroot/target/device/ARMLTD/uClibc.integrator926.config
===================================================================
--- trunk/buildroot/target/device/ARMLTD/uClibc.integrator926.config	2008-08-12 01:35:34 UTC (rev 23076)
+++ trunk/buildroot/target/device/ARMLTD/uClibc.integrator926.config	2008-08-14 06:52:15 UTC (rev 23077)
@@ -174,7 +174,7 @@
 # UCLIBC_HAS_WORDEXP is not set
 # UCLIBC_HAS_FTW is not set
 UCLIBC_HAS_GLOB=y
-# UCLIBC_HAS_GNU_GLOB is not set
+UCLIBC_HAS_GNU_GLOB=y
 
 #
 # Library Installation Options

Modified: trunk/buildroot/target/device/Atmel/uClibc.config.avr32
===================================================================
--- trunk/buildroot/target/device/Atmel/uClibc.config.avr32	2008-08-12 01:35:34 UTC (rev 23076)
+++ trunk/buildroot/target/device/Atmel/uClibc.config.avr32	2008-08-14 06:52:15 UTC (rev 23077)
@@ -163,7 +163,7 @@
 UCLIBC_HAS_WORDEXP=y
 UCLIBC_HAS_FTW=y
 UCLIBC_HAS_GLOB=y
-# UCLIBC_HAS_GNU_GLOB is not set
+UCLIBC_HAS_GNU_GLOB=y
 
 #
 # Library Installation Options

Modified: trunk/buildroot/target/device/valka/v100sc2/uClibc.config
===================================================================
--- trunk/buildroot/target/device/valka/v100sc2/uClibc.config	2008-08-12 01:35:34 UTC (rev 23076)
+++ trunk/buildroot/target/device/valka/v100sc2/uClibc.config	2008-08-14 06:52:15 UTC (rev 23077)
@@ -164,7 +164,7 @@
 UCLIBC_HAS_WORDEXP=y
 UCLIBC_HAS_FTW=y
 UCLIBC_HAS_GLOB=y
-# UCLIBC_HAS_GNU_GLOB is not set
+UCLIBC_HAS_GNU_GLOB=y
 
 #
 # Library Installation Options
