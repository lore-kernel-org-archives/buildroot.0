From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 21 Jan 2007 03:34:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
Message-ID: <20070121113416.8104448584@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-21 03:34:14 -0800 (Sun, 21 Jan 2007)
New Revision: 17431

Log:
- remove old reminder that is already dealt with.


Modified:
   trunk/buildroot/toolchain/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/Config.in	2007-01-21 11:20:01 UTC (rev 17430)
+++ trunk/buildroot/toolchain/Config.in	2007-01-21 11:34:14 UTC (rev 17431)
@@ -58,15 +58,5 @@
 	  Answer Y if you want these apps (if built) copied into the cross toolchain
 	  dir under <arch>-linux-uclibc/target_utils/.
 
-# Might be worth experimenting with for gcc 3.4.x.
-#GCC_WITH_CPU:=
-#GCC_WITH_ARCH:=
-#GCC_WITH_TUNE:=
-
-#GCC_WITH_CPU:=--with-cpu=
-#GCC_WITH_ARCH:=--with-arch=
-#GCC_WITH_TUNE:=--with-tune=
-
-
 endmenu
 
