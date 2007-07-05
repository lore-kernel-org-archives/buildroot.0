From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Jul 2007 08:55:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/valgrind
Message-ID: <20070705155525.AB630A5E19@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-07-05 08:55:23 -0700 (Thu, 05 Jul 2007)
New Revision: 19003

Log:
Remove configure cruft

Modified:
   trunk/buildroot/package/valgrind/valgrind.mk


Changeset:
Modified: trunk/buildroot/package/valgrind/valgrind.mk
===================================================================
--- trunk/buildroot/package/valgrind/valgrind.mk	2007-07-05 05:15:47 UTC (rev 19002)
+++ trunk/buildroot/package/valgrind/valgrind.mk	2007-07-05 15:55:23 UTC (rev 19003)
@@ -30,16 +30,6 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
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
 		$(DISABLE_NLS) \
 		--without-uiout --disable-valgrindmi \
 		--disable-tui --disable-valgrindtk \
