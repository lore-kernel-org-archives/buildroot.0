From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 15 Feb 2007 03:24:35 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070215112435.2651148577@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-15 03:24:35 -0800 (Thu, 15 Feb 2007)
New Revision: 17894

Log:
- uclibc-menuconfig provides a .config but doesn't provide .configured


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-15 11:12:15 UTC (rev 17893)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-15 11:24:35 UTC (rev 17894)
@@ -262,7 +262,7 @@
 		HOSTCC="$(HOSTCC)" \
 		menuconfig && \
 	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE) && \
-	touch $(UCLIBC_DIR)/.configured
+	touch $(UCLIBC_DIR)/.config
 
 
 $(STAGING_DIR)/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
