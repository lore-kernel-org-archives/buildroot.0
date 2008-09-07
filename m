From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  7 Sep 2008 07:31:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/xapp_xman
Message-ID: <20080907143132.C09FD3C5FB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-07 07:31:32 -0700 (Sun, 07 Sep 2008)
New Revision: 23352

Log:
xapp_xman: fix paths

Patch by Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/package/x11r7/xapp_xman/xapp_xman.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xapp_xman/xapp_xman.mk
===================================================================
--- trunk/buildroot/package/x11r7/xapp_xman/xapp_xman.mk	2008-09-07 14:31:28 UTC (rev 23351)
+++ trunk/buildroot/package/x11r7/xapp_xman/xapp_xman.mk	2008-09-07 14:31:32 UTC (rev 23352)
@@ -16,7 +16,7 @@
 	touch $@
 
 $(XAPP_XMAN_DIR)/.patched: $(XAPP_XMAN_DIR)/.extracted
-	toolchain/patch-kernel.sh $(XAPP_XMAN_DIR) package/xapp_xman/ xapp_xman\*.patch
+	toolchain/patch-kernel.sh $(XAPP_XMAN_DIR) package/x11r7/xapp_xman/ xapp_xman\*.patch
 	touch $@
 
 $(XAPP_XMAN_DIR)/.configured: $(XAPP_XMAN_DIR)/.patched
