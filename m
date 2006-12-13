From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 13 Dec 2006 04:34:22 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20061213123422.EF01F48574@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-13 04:34:22 -0800 (Wed, 13 Dec 2006)
New Revision: 16890

Log:
oops, typo


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-12-13 12:18:08 UTC (rev 16889)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-12-13 12:34:22 UTC (rev 16890)
@@ -126,23 +126,23 @@
 	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g' $(UCLIBC_DIR)/.config
 endif
 ifeq ("$(KERNEL_ARCH)","i386")
-	/bin/echo "# CONFIG_GENERIC_386 is not set" >> $(UCLIBC_DIR)/.__config
-	/bin/echo "# CONFIG_386 is not set" >> $(UCLIBC_DIR)/.__config
-	/bin/echo "# CONFIG_486 is not set" >> $(UCLIBC_DIR)/.__config
-	/bin/echo "# CONFIG_586 is not set" >> $(UCLIBC_DIR)/.__config
-	/bin/echo "# CONFIG_586MMX is not set" >> $(UCLIBC_DIR)/.__config
-	/bin/echo "# CONFIG_686 is not set" >> $(UCLIBC_DIR)/.__config
-	/bin/echo "# CONFIG_PENTIUMII is not set" >> $(UCLIBC_DIR)/.__config
-	/bin/echo "# CONFIG_PENTIUMIII is not set" >> $(UCLIBC_DIR)/.__config
-	/bin/echo "# CONFIG_PENTIUM4 is not set" >> $(UCLIBC_DIR)/.__config
-	/bin/echo "# CONFIG_K6 is not set" >> $(UCLIBC_DIR)/.__config
-	/bin/echo "# CONFIG_K7 is not set" >> $(UCLIBC_DIR)/.__config
-	/bin/echo "# CONFIG_ELAN is not set" >> $(UCLIBC_DIR)/.__config
-	/bin/echo "# CONFIG_CRUSOE is not set" >> $(UCLIBC_DIR)/.__config
-	/bin/echo "# CONFIG_WINCHIPC6 is not set" >> $(UCLIBC_DIR)/.__config
-	/bin/echo "# CONFIG_WINCHIP2 is not set" >> $(UCLIBC_DIR)/.__config
-	/bin/echo "# CONFIG_CYRIXIII is not set" >> $(UCLIBC_DIR)/.__config
-	/bin/echo "# CONFIG_NEHEMIAH is not set" >> $(UCLIBC_DIR)/.__config
+	/bin/echo "# CONFIG_GENERIC_386 is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_386 is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_486 is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_586 is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_586MMX is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_686 is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_PENTIUMII is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_PENTIUMIII is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_PENTIUM4 is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_K6 is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_K7 is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_ELAN is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_CRUSOE is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_WINCHIPC6 is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_WINCHIP2 is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_CYRIXIII is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_NEHEMIAH is not set" >> $(UCLIBC_DIR)/.config
 ifeq ($(BR2_x86_i386),y)
 	$(SED) 's,# CONFIG_386 is not set,CONFIG_386=y,g' $(UCLIBC_DIR)/.config
 endif
