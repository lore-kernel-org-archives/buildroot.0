From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 13 Dec 2006 08:56:59 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20061213165659.E7A904856E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-13 08:56:59 -0800 (Wed, 13 Dec 2006)
New Revision: 16899

Log:
- sh[234][[:alnum:]]* -> sh


Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-12-13 16:50:15 UTC (rev 16898)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-12-13 16:56:59 UTC (rev 16899)
@@ -16,7 +16,8 @@
 	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
 	-e s/arm.*/arm/ -e s/sa110/arm/ \
 	-e s/s390x/s390/ -e s/parisc64/parisc/ \
-	-e s/ppc.*/powerpc/ -e s/mips.*/mips/")
+	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
+	-e s/sh2.*/sh/ -e s/sh3.*/sh/ -e s/sh4.*/sh/")
 
 
 $(DL_DIR)/$(LINUX_HEADERS_SOURCE):
