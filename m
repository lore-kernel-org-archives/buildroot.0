From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 10 Apr 2008 12:25:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/alsa-lib
Message-ID: <20080410192510.B77683C590@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-10 12:25:10 -0700 (Thu, 10 Apr 2008)
New Revision: 21691

Log:
remove devdir config option from alsa lib, should use mdev rule instead

Modified:
   trunk/buildroot/package/alsa-lib/alsa-lib.mk


Changeset:
Modified: trunk/buildroot/package/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/alsa-lib/alsa-lib.mk	2008-04-10 08:17:14 UTC (rev 21690)
+++ trunk/buildroot/package/alsa-lib/alsa-lib.mk	2008-04-10 19:25:10 UTC (rev 21691)
@@ -45,7 +45,6 @@
 		--enable-shared \
 		--enable-static \
 		--disable-docs \
-		--with-alsa-devdir=/dev \
 		$(SOFT_FLOAT) \
 		$(DISABLE_NLS) \
 	)
