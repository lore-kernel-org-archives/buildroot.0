From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Nov 2006 13:02:22 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20061122210222.41F36485CB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-22 13:02:21 -0800 (Wed, 22 Nov 2006)
New Revision: 16636

Log:
- bump version


Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-11-22 20:26:06 UTC (rev 16635)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-11-22 21:02:21 UTC (rev 16636)
@@ -98,9 +98,9 @@
 PATCHLEVEL:=6
 SUBLEVEL:=18
 LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
-LINUX_HEADERS_SOURCE:=linux-2.6.18.tar.bz2
+LINUX_HEADERS_SOURCE:=linux-2.6.18.3.tar.bz2
 LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-2.6.18
+LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-2.6.18.3
 LINUX_HEADERS_IS_KERNEL=y
 endif
 
