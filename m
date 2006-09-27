From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Sep 2006 22:44:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sqlite
Message-ID: <20060927054410.EFFDC48644@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-09-26 22:44:10 -0700 (Tue, 26 Sep 2006)
New Revision: 16231

Log:
Don't disable tcl twice

Modified:
   trunk/buildroot/package/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2006-09-26 20:35:30 UTC (rev 16230)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2006-09-27 05:44:10 UTC (rev 16231)
@@ -31,7 +31,6 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--sysconfdir=/etc \
-		--disable-tcl \
 		--enable-shared \
 		--enable-static \
 		--disable-tcl \
