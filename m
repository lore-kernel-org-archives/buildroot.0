From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 11:16:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lighttpd
Message-ID: <20070708181612.01F933004F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 11:16:12 -0700 (Sun, 08 Jul 2007)
New Revision: 19042

Log:
- remove cruft


Modified:
   trunk/buildroot/package/lighttpd/lighttpd.mk


Changeset:
Modified: trunk/buildroot/package/lighttpd/lighttpd.mk
===================================================================
--- trunk/buildroot/package/lighttpd/lighttpd.mk	2007-07-08 18:14:51 UTC (rev 19041)
+++ trunk/buildroot/package/lighttpd/lighttpd.mk	2007-07-08 18:16:12 UTC (rev 19042)
@@ -12,10 +12,6 @@
 LIGHTTPD_BINARY:=src/lighttpd
 LIGHTTPD_TARGET_BINARY:=usr/sbin/lighttpd
 
-ifneq ($(BR2_LARGEFILE),y)
-LIGHTTPD_LFS:=--disable-lfs
-endif
-
 $(DL_DIR)/$(LIGHTTPD_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(LIGHTTPD_SITE)/$(LIGHTTPD_SOURCE)
 ifneq ($(LIGHTTPD_PATCH),)
