From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Nov 2006 15:09:20 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/microwin
Message-ID: <20061122230920.46EA8485D7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-22 15:09:20 -0800 (Wed, 22 Nov 2006)
New Revision: 16640

Log:
- type fix


Modified:
   trunk/buildroot/package/microwin/microwin.mk


Changeset:
Modified: trunk/buildroot/package/microwin/microwin.mk
===================================================================
--- trunk/buildroot/package/microwin/microwin.mk	2006-11-22 23:03:57 UTC (rev 16639)
+++ trunk/buildroot/package/microwin/microwin.mk	2006-11-22 23:09:20 UTC (rev 16640)
@@ -29,7 +29,7 @@
 
 $(MICROWIN_DIR)/.prepared: $(MICROWIN_DIR)/.unpacked
 	mv $(MICROWIN_DIR)/microwindows-$(MICROWIN_VERSION)/* $(MICROWIN_DIR)
-	toolchain/patch-kernel.sh $(UEMACS_DIR) package/uemacs/ microwindows-$(MICROWIN_VERSION)\*.patch
+	toolchain/patch-kernel.sh $(MICROWIN_DIR) package/microwin/ microwindows-$(MICROWIN_VERSION)\*.patch
 	touch $(MICROWIN_DIR)/.prepared
 
 $(MICROWIN_DIR)/.configured: $(MICROWIN_DIR)/.prepared
