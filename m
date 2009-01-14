From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 14 Jan 2009 23:49:25 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libeXosip2
Message-ID: <20090114234926.0B74B7697C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-14 23:49:24 +0000 (Wed, 14 Jan 2009)
New Revision: 24847

Log:
libeXosip2 is dependent on libosip2

Modified:
   trunk/buildroot/package/libeXosip2/libeXosip2.mk


Changeset:
Modified: trunk/buildroot/package/libeXosip2/libeXosip2.mk
===================================================================
--- trunk/buildroot/package/libeXosip2/libeXosip2.mk	2009-01-14 22:52:31 UTC (rev 24846)
+++ trunk/buildroot/package/libeXosip2/libeXosip2.mk	2009-01-14 23:49:24 UTC (rev 24847)
@@ -84,7 +84,7 @@
 
 
 
-libeXosip2: uclibc $(TARGET_DIR)/usr/lib/libeXosip2.so
+libeXosip2: uclibc libosip2 $(TARGET_DIR)/usr/lib/libeXosip2.so
 
 libeXosip2-source: $(DL_DIR)/$(LIBEXOSIP2_SOURCE)
 
