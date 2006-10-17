From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue, 17 Oct 2006 13:11:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: binutils gcc
Message-ID: <20061017201147.B3DE8486C8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-10-17 13:11:47 -0700 (Tue, 17 Oct 2006)
New Revision: 16401

Log:
update defaults


Modified:
   trunk/buildroot/toolchain/binutils/Config.in
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2006-10-17 16:57:49 UTC (rev 16400)
+++ trunk/buildroot/toolchain/binutils/Config.in	2006-10-17 20:11:47 UTC (rev 16401)
@@ -4,7 +4,7 @@
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_16_1
+	default BR2_BINUTILS_VERSION_2_16_91_0_7
 	help
 	  Select the version of binutils you wish to use.
 

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2006-10-17 16:57:49 UTC (rev 16400)
+++ trunk/buildroot/toolchain/gcc/Config.in	2006-10-17 20:11:47 UTC (rev 16401)
@@ -4,7 +4,7 @@
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_3_4_5
+	default BR2_GCC_VERSION_3_4_6
 	help
 	  Select the version of gcc you wish to use.
 
