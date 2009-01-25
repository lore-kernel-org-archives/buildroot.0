From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 20:44:25 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libeXosip2
Message-ID: <20090125204425.CEE37768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 20:44:23 +0000 (Sun, 25 Jan 2009)
New Revision: 25018

Log:
Use prefix=/usr for libeXosip2

Modified:
   trunk/buildroot/package/libeXosip2/libeXosip2.mk


Changeset:
Modified: trunk/buildroot/package/libeXosip2/libeXosip2.mk
===================================================================
--- trunk/buildroot/package/libeXosip2/libeXosip2.mk	2009-01-25 20:19:06 UTC (rev 25017)
+++ trunk/buildroot/package/libeXosip2/libeXosip2.mk	2009-01-25 20:44:23 UTC (rev 25018)
@@ -26,16 +26,16 @@
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
-		--prefix=$(STAGING_DIR) \
-		--exec-prefix=/usr \
+		--prefix=/usr \
+		--exec-prefix=/ \
 		--bindir=/usr/bin \
 		--sbindir=/usr/sbin \
+		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
-		--localstatedir=/var \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
-		--libexecdir=/usr/lib \
+		--localstatedir=/var \
 		--libdir=/usr/lib \
 		--includedir=$(STAGING_DIR)/usr/include \
 		--oldincludedir=/usr/include \
