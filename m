From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 28 Aug 2007 16:05:11 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/toolchain/avr32/uClibc-0.9.28.3-avr32-2.0
Message-ID: <20070828230511.6087BA657A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-28 16:05:10 -0700 (Tue, 28 Aug 2007)
New Revision: 19728

Log:
Fix bug in avr32 uClibc patch

Modified:
   trunk/buildroot/target/device/Atmel/toolchain/avr32/uClibc-0.9.28.3-avr32-2.0/uClibc-0.9.28.3-avr32-2.0-002-rm-whitespace.patch


Changeset:
Modified: trunk/buildroot/target/device/Atmel/toolchain/avr32/uClibc-0.9.28.3-avr32-2.0/uClibc-0.9.28.3-avr32-2.0-002-rm-whitespace.patch
===================================================================
--- trunk/buildroot/target/device/Atmel/toolchain/avr32/uClibc-0.9.28.3-avr32-2.0/uClibc-0.9.28.3-avr32-2.0-002-rm-whitespace.patch	2007-08-28 23:02:52 UTC (rev 19727)
+++ trunk/buildroot/target/device/Atmel/toolchain/avr32/uClibc-0.9.28.3-avr32-2.0/uClibc-0.9.28.3-avr32-2.0-002-rm-whitespace.patch	2007-08-28 23:05:10 UTC (rev 19728)
@@ -54,15 +54,6 @@
     ... code requiring gcc 2.8 or later ...
     #endif
     Note - they won't work for gcc1 or glibc1, since the _MINOR macros
-@@ -297,7 +297,7 @@
- /* uClibc does not support _FORTIFY_SOURCE */
- #undef _FORTIFY_SOURCE
- #if defined _FORTIFY_SOURCE && _FORTIFY_SOURCE > 0 \
--    && __GNUC_PREREQ (4, 1) && defined __OPTIMIZE__ && __OPTIMIZE__ > 0
-+    && __GNUC_PREREQ(4, 1) && defined __OPTIMIZE__ && __OPTIMIZE__ > 0
- # if _FORTIFY_SOURCE > 1
- #  define __USE_FORTIFY_LEVEL 2
- # else
 @@ -366,7 +366,7 @@
  #endif	/* !ASSEMBLER */
  
