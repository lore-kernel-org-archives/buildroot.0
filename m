From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  2 Jan 2009 08:30:44 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20090102083044.83FE3769FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-02 08:30:44 +0000 (Fri, 02 Jan 2009)
New Revision: 24644

Log:
Remove whitespace damage in uclibc.mk

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2009-01-02 08:29:31 UTC (rev 24643)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2009-01-02 08:30:44 UTC (rev 24644)
@@ -440,7 +440,6 @@
 		RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		HOSTCC="$(HOSTCC)" headers \
 		$(if $(BR2_UCLIBC_VERSION_0_9_28_3),install_dev,install_headers)
-
 	# Install the kernel headers to the first stage gcc include dir
 	# if necessary
 ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
