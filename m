From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 23 Nov 2007 07:40:33 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20071123154033.E123B30048@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-11-23 07:40:32 -0800 (Fri, 23 Nov 2007)
New Revision: 20502

Log:
Removed redundant configure settings

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2007-11-23 13:24:55 UTC (rev 20501)
+++ trunk/buildroot/package/avahi/avahi.mk	2007-11-23 15:40:32 UTC (rev 20502)
@@ -113,17 +113,8 @@
 		--host=$(REAL_GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
-		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
 		$(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
 		--disable-glib \
