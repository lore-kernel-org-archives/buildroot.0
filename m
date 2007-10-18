From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 18 Oct 2007 00:40:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20071018074020.3A5F3A45B7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-18 00:40:19 -0700 (Thu, 18 Oct 2007)
New Revision: 20280

Log:
Remove debugging info from package/Makefile.in

Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-10-18 05:56:05 UTC (rev 20279)
+++ trunk/buildroot/package/Makefile.in	2007-10-18 07:40:19 UTC (rev 20280)
@@ -317,6 +317,3 @@
 #"))
 
 include package/Makefile.autotools.in
-
-package-status:
-	@echo	IMAGE=$(IMAGE)
