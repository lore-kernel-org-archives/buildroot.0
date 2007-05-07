From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sun,  6 May 2007 20:56:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070507035648.5BF4848027@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-05-06 20:56:47 -0700 (Sun, 06 May 2007)
New Revision: 18569

Log:
Create 'bin' directory in staging area.


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-05-06 22:51:52 UTC (rev 18568)
+++ trunk/buildroot/Makefile	2007-05-07 03:56:47 UTC (rev 18569)
@@ -103,6 +103,7 @@
 	@mkdir -p $@
 
 $(STAGING_DIR):
+	@mkdir -p $(STAGING_DIR)/bin
 	@mkdir -p $(STAGING_DIR)/lib
 	@mkdir -p $(STAGING_DIR)/include
 	@mkdir -p $(STAGING_DIR)/usr
