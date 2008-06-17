From: hamish at uclibc.org <hamish@uclibc.org>
Date: Tue, 17 Jun 2008 00:23:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/axel
Message-ID: <20080617072304.74D523C6A7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-06-17 00:22:29 -0700 (Tue, 17 Jun 2008)
New Revision: 22390

Log:
Fix options to configure

Modified:
   trunk/buildroot/package/axel/axel.mk


Changeset:
Modified: trunk/buildroot/package/axel/axel.mk
===================================================================
--- trunk/buildroot/package/axel/axel.mk	2008-06-17 07:08:32 UTC (rev 22389)
+++ trunk/buildroot/package/axel/axel.mk	2008-06-17 07:22:29 UTC (rev 22390)
@@ -23,7 +23,7 @@
 
 $(AXEL_DIR)/Makefile.settings: $(AXEL_DIR)/.unpacked
 	(cd $(AXEL_DIR); \
-		./configure --enable-i18n=0 --prefix=/usr \
+		./configure --i18n=0 --prefix=/usr \
 	)
 	touch $@
 
