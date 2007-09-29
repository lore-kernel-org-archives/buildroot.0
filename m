From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 29 Sep 2007 12:47:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20070929194705.46D0A30043@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-29 12:47:04 -0700 (Sat, 29 Sep 2007)
New Revision: 20122

Log:
- better use commonly used digits in ISA config


Modified:
   trunk/buildroot/target/Config.in.arch


Changeset:
Modified: trunk/buildroot/target/Config.in.arch
===================================================================
--- trunk/buildroot/target/Config.in.arch	2007-09-29 19:46:02 UTC (rev 20121)
+++ trunk/buildroot/target/Config.in.arch	2007-09-29 19:47:04 UTC (rev 20122)
@@ -129,13 +129,13 @@
 	  Specific CPU variant to use
 
 config BR2_mips_1
-	bool "mips 1"
+	bool "mips I (generic)"
 config BR2_mips_2
-	bool "mips 2"
+	bool "mips II"
 config BR2_mips_3
-	bool "mips 3"
+	bool "mips III"
 config BR2_mips_4
-	bool "mips 4"
+	bool "mips IV"
 config BR2_mips_32
 	bool "mips 32"
 config BR2_mips_32r2
