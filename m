From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Mon,  1 Dec 2008 06:23:57 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20081201142357.7C50A3C765@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-01 06:23:57 -0800 (Mon, 01 Dec 2008)
New Revision: 24217

Log:
uClibc: set 0.9.30 as default

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/toolchain/uClibc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2008-12-01 14:23:09 UTC (rev 24216)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2008-12-01 14:23:57 UTC (rev 24217)
@@ -5,7 +5,7 @@
 
 choice
 	prompt "uClibc C library Version"
-	default BR2_UCLIBC_VERSION_0_9_29
+	default BR2_UCLIBC_VERSION_0_9_30
 	help
 	  Select the version of uClibc you wish to use.
 
