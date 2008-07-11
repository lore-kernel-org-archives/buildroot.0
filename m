From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 11 Jul 2008 06:43:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fuse
Message-ID: <20080711134356.C1A8A3C6A7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-11 06:43:56 -0700 (Fri, 11 Jul 2008)
New Revision: 22778

Log:
fuse: re-add missing --program-prefix

--program-prefix got errorously removed in the recent cleanup work.

Modified:
   trunk/buildroot/package/fuse/libfuse.mk


Changeset:
Modified: trunk/buildroot/package/fuse/libfuse.mk
===================================================================
--- trunk/buildroot/package/fuse/libfuse.mk	2008-07-11 12:19:14 UTC (rev 22777)
+++ trunk/buildroot/package/fuse/libfuse.mk	2008-07-11 13:43:56 UTC (rev 22778)
@@ -27,6 +27,7 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--sysconfdir=/etc \
+		--program-prefix="" \
 		--enable-shared \
 		--enable-static \
 		--disable-nls \
