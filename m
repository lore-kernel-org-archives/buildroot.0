From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 15 Sep 2007 05:12:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070915121257.C2F1130048@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-15 05:12:56 -0700 (Sat, 15 Sep 2007)
New Revision: 19852

Log:
- fix copy'n paste error in ABI configuration


Modified:
   trunk/buildroot/toolchain/gcc/Makefile.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2007-09-15 11:05:11 UTC (rev 19851)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2007-09-15 12:12:56 UTC (rev 19852)
@@ -64,7 +64,7 @@
 endif
 ifneq ($(strip $(subst ",,$(BR2_GCC_TARGET_ABI))),)
 # ")))
-GCC_WITH_ABI:=--with-tune=$(BR2_GCC_TARGET_ABI)
+GCC_WITH_ABI:=--with-abi=$(BR2_GCC_TARGET_ABI)
 endif
 endif
 
