From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 30 Sep 2007 05:42:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20070930124212.2B4763004D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-30 05:42:11 -0700 (Sun, 30 Sep 2007)
New Revision: 20139

Log:
- fix typo


Modified:
   trunk/buildroot/target/Config.in.arch


Changeset:
Modified: trunk/buildroot/target/Config.in.arch
===================================================================
--- trunk/buildroot/target/Config.in.arch	2007-09-30 00:08:58 UTC (rev 20138)
+++ trunk/buildroot/target/Config.in.arch	2007-09-30 12:42:11 UTC (rev 20139)
@@ -142,7 +142,7 @@
 	bool "mips 32r2"
 config BR2_mips_64
 	bool "mips 64"
-config BR2_mips16_
+config BR2_mips_16
 	bool "mips 16"
 endchoice
 
