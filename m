From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 03:42:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070821104206.96D16A659E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 03:42:05 -0700 (Tue, 21 Aug 2007)
New Revision: 19605

Log:
- cosmetic adjustment in help text


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-08-21 10:40:18 UTC (rev 19604)
+++ trunk/buildroot/Makefile	2007-08-21 10:42:05 UTC (rev 19605)
@@ -402,7 +402,7 @@
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
-	@echo '  source-check           - check all packages for valid download URLS'
+	@echo '  source-check           - check all packages for valid download URLs'
 	@echo
 
 .PHONY: dummy subdirs release distclean clean config oldconfig \
