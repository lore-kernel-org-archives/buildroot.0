From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 22 Sep 2007 03:20:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/module-init-tools
Message-ID: <20070922102040.A0312A610F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-22 03:20:35 -0700 (Sat, 22 Sep 2007)
New Revision: 19935

Log:
- remove duplicate module-init-tools-source rule


Modified:
   trunk/buildroot/package/module-init-tools/module-init-tools.mk


Changeset:
Modified: trunk/buildroot/package/module-init-tools/module-init-tools.mk
===================================================================
--- trunk/buildroot/package/module-init-tools/module-init-tools.mk	2007-09-21 22:48:02 UTC (rev 19934)
+++ trunk/buildroot/package/module-init-tools/module-init-tools.mk	2007-09-22 10:20:35 UTC (rev 19935)
@@ -62,8 +62,6 @@
 
 module-init-tools: uclibc $(MODULE_INIT_TOOLS_TARGET_BINARY)
 
-module-init-tools-source: $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE)
-
 module-init-tools-clean:
 	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(MODULE_INIT_TOOLS_DIR) uninstall
 	-$(MAKE) -C $(MODULE_INIT_TOOLS_DIR) clean
