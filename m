From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 23 Jul 2008 03:36:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/grep
Message-ID: <20080723103600.46D573C828@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-23 03:35:59 -0700 (Wed, 23 Jul 2008)
New Revision: 22932

Log:
grep: cleanup configure args

Modified:
   trunk/buildroot/package/grep/grep.mk


Changeset:
Modified: trunk/buildroot/package/grep/grep.mk
===================================================================
--- trunk/buildroot/package/grep/grep.mk	2008-07-23 10:35:56 UTC (rev 22931)
+++ trunk/buildroot/package/grep/grep.mk	2008-07-23 10:35:59 UTC (rev 22932)
@@ -37,17 +37,7 @@
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
+		--prefix=/ \
 		$(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
 		--disable-perl-regexp \
