From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed,  3 Jan 2007 06:11:17 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/mklibs
Message-ID: <20070103141117.C564F48641@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-03 06:11:16 -0800 (Wed, 03 Jan 2007)
New Revision: 17144

Log:
- portable cp args


Modified:
   trunk/buildroot/toolchain/mklibs/mklibs.mk


Changeset:
Modified: trunk/buildroot/toolchain/mklibs/mklibs.mk
===================================================================
--- trunk/buildroot/toolchain/mklibs/mklibs.mk	2007-01-03 13:44:01 UTC (rev 17143)
+++ trunk/buildroot/toolchain/mklibs/mklibs.mk	2007-01-03 14:11:16 UTC (rev 17144)
@@ -6,7 +6,7 @@
 MKLIBS_PROGRAM:=$(STAGING_DIR)/bin/mklibs.py
 
 $(MKLIBS_PROGRAM): toolchain/mklibs/mklibs.py
-	cp -a toolchain/mklibs/mklibs.py $@
+	cp -dpf toolchain/mklibs/mklibs.py $@
 
 mklibs-clean:
 	rm -f $(MKLIBS_PROGRAM)
