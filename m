From: andersen at uclibc.org <andersen@uclibc.org>
Date: Mon,  9 Oct 2006 14:08:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/modutils
Message-ID: <20061009210856.DE027485AC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-10-09 14:08:56 -0700 (Mon, 09 Oct 2006)
New Revision: 16351

Log:
use http for kernel.org


Modified:
   trunk/buildroot/package/modutils/modutils.mk


Changeset:
Modified: trunk/buildroot/package/modutils/modutils.mk
===================================================================
--- trunk/buildroot/package/modutils/modutils.mk	2006-10-09 20:44:04 UTC (rev 16350)
+++ trunk/buildroot/package/modutils/modutils.mk	2006-10-09 21:08:56 UTC (rev 16351)
@@ -4,7 +4,7 @@
 #
 #############################################################
 MODUTILS_SOURCE=modutils-2.4.27.tar.bz2
-MODUTILS_SITE=ftp://ftp.kernel.org/pub/linux/utils/kernel/modutils/v2.4/
+MODUTILS_SITE=http://ftp.kernel.org/pub/linux/utils/kernel/modutils/v2.4/
 MODUTILS_DIR1=$(BUILD_DIR)/modutils-2.4.27
 MODUTILS_DIR2=$(TOOL_BUILD_DIR)/modutils-2.4.27
 MODUTILS_BINARY=depmod/depmod
