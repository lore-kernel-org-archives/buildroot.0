From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 31 Jul 2007 15:57:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
Message-ID: <20070731225721.D8D0DA464D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-31 15:57:19 -0700 (Tue, 31 Jul 2007)
New Revision: 19371

Log:
Hint taken,  Help text included

Modified:
   trunk/buildroot/target/device/Toolchain.in


Changeset:
Modified: trunk/buildroot/target/device/Toolchain.in
===================================================================
--- trunk/buildroot/target/device/Toolchain.in	2007-07-31 22:41:06 UTC (rev 19370)
+++ trunk/buildroot/target/device/Toolchain.in	2007-07-31 22:57:19 UTC (rev 19371)
@@ -11,7 +11,10 @@
 	bool
 	prompt "Use default sources for toolchain"
 	help
-	  FIXME: Bug Ulf to provide a helptext
+	  Download vanilla binutils, gcc, uclibc and gdb from their 
+	  main download locations, and apply patches from the
+	  "toolchain/<package>" directores.
+	  I.E: Do not download a prepatched vendor source suite.
 
 config BR2_TOOLCHAIN_ATMEL_AVR32
 	bool
