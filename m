From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 15 Dec 2006 05:36:49 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/microperl
Message-ID: <20061215133649.1013748578@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-15 05:36:48 -0800 (Fri, 15 Dec 2006)
New Revision: 16940

Log:
- remove unused variable


Modified:
   trunk/buildroot/package/microperl/microperl.mk


Changeset:
Modified: trunk/buildroot/package/microperl/microperl.mk
===================================================================
--- trunk/buildroot/package/microperl/microperl.mk	2006-12-15 13:34:29 UTC (rev 16939)
+++ trunk/buildroot/package/microperl/microperl.mk	2006-12-15 13:36:48 UTC (rev 16940)
@@ -35,7 +35,6 @@
 	$(MAKE) -f Makefile.micro CC=$(TARGET_CC) \
 		OPTIMIZE="$(TARGET_CFLAGS)" -C $(MICROPERL_DIR)
 
-__perl_tgt_dir=$(TARGET_DIR)/$(MICROPERL_MODS_DIR)/$(dir $$i)
 $(TARGET_DIR)/usr/bin/microperl: $(MICROPERL_DIR)/microperl
 ifneq ($(MICROPERL_MODS),)
 	(cd $(MICROPERL_DIR) ; \
