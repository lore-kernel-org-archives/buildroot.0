From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 31 May 2008 00:28:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20080531072809.B05F13C8C0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-05-31 00:28:09 -0700 (Sat, 31 May 2008)
New Revision: 22138

Log:
uclibc-0.9.28.3: correct arch list (avr32 missing, stuff only in 0.9.29+)


Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.config


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.config	2008-05-31 07:28:04 UTC (rev 22137)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.config	2008-05-31 07:28:09 UTC (rev 22138)
@@ -3,6 +3,7 @@
 #
 # TARGET_alpha is not set
 # TARGET_arm is not set
+# TARGET_avr32 is not set
 # TARGET_bfin is not set
 # TARGET_cris is not set
 # TARGET_e1 is not set
@@ -10,7 +11,6 @@
 # TARGET_h8300 is not set
 # TARGET_i386 is not set
 # TARGET_i960 is not set
-# TARGET_ia64 is not set
 # TARGET_m68k is not set
 # TARGET_microblaze is not set
 # TARGET_mips is not set
@@ -21,7 +21,6 @@
 # TARGET_sh64 is not set
 # TARGET_sparc is not set
 # TARGET_v850 is not set
-# TARGET_vax is not set
 # TARGET_x86_64 is not set
 
 #
