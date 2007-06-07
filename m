From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu,  7 Jun 2007 09:18:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070607161821.52BD1480A3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-07 09:18:20 -0700 (Thu, 07 Jun 2007)
New Revision: 18773

Log:
- forgot to supply a default for UCLIBC_EXTRA_CFLAGS


Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2007-06-07 13:22:56 UTC (rev 18772)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2007-06-07 16:18:20 UTC (rev 18773)
@@ -178,6 +178,7 @@
 # uClibc development/debugging options
 #
 CROSS_COMPILER_PREFIX=""
+UCLIBC_EXTRA_CFLAGS=""
 # DODEBUG is not set
 # DODEBUG_PT is not set
 DOSTRIP=y
