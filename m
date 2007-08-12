From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 17:03:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ed
Message-ID: <20070812000323.DE7A5A6575@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 17:03:23 -0700 (Sat, 11 Aug 2007)
New Revision: 19452

Log:
Remove unknown NLS option from ed

Modified:
   trunk/buildroot/package/ed/ed.mk


Changeset:
Modified: trunk/buildroot/package/ed/ed.mk
===================================================================
--- trunk/buildroot/package/ed/ed.mk	2007-08-11 23:57:19 UTC (rev 19451)
+++ trunk/buildroot/package/ed/ed.mk	2007-08-12 00:03:23 UTC (rev 19452)
@@ -29,7 +29,6 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--exec-prefix=/usr \
-		$(DISABLE_NLS) \
 	);
 	touch $@
 
