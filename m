From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 24 May 2007 14:23:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070524212319.C4A6D48568@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-24 14:23:19 -0700 (Thu, 24 May 2007)
New Revision: 18686

Log:
Fixed silly typo. Thanks to Petur Thors for reporting

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-05-24 13:52:46 UTC (rev 18685)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-05-24 21:23:19 UTC (rev 18686)
@@ -296,7 +296,7 @@
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 	-cp -dpf $(STAGING_DIR)/lib/libstdc++.so* $(TARGET_DIR)/lib/
-	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libstc++.so*
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libstdc++.so*
 endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
 	-cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/lib/
