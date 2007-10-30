From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 30 Oct 2007 03:31:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20071030103100.96013A4B70@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-30 03:30:59 -0700 (Tue, 30 Oct 2007)
New Revision: 20330

Log:
FIx syntax error

Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-10-30 09:16:51 UTC (rev 20329)
+++ trunk/buildroot/package/Makefile.in	2007-10-30 10:30:59 UTC (rev 20330)
@@ -75,7 +75,7 @@
 endif
 
 ifeq ($(strip $(subst ",, $(BR2_FPU_SUFFIX))),y)
-COND_ARCH_FPU_SUFFIX:=(ARCH_FPU_SUFFIX)
+COND_ARCH_FPU_SUFFIX:=$(ARCH_FPU_SUFFIX)
 else
 COND_ARCH_FPU_SUFFIX:=
 endif
