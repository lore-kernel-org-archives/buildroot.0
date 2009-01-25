From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 23:32:14 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libeXosip2
Message-ID: <20090125233216.211FC76D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 23:32:13 +0000 (Sun, 25 Jan 2009)
New Revision: 25030

Log:
Fix exec-prefix for libeXosip2

Modified:
   trunk/buildroot/package/libeXosip2/libeXosip2.mk


Changeset:
Modified: trunk/buildroot/package/libeXosip2/libeXosip2.mk
===================================================================
--- trunk/buildroot/package/libeXosip2/libeXosip2.mk	2009-01-25 23:16:11 UTC (rev 25029)
+++ trunk/buildroot/package/libeXosip2/libeXosip2.mk	2009-01-25 23:32:13 UTC (rev 25030)
@@ -27,14 +27,10 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--exec-prefix=/ \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
+		--exec-prefix=/usr \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
 		--localstatedir=/var \
 		--libdir=/usr/lib \
 		--includedir=$(STAGING_DIR)/usr/include \
