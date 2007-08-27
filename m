From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 27 Aug 2007 14:51:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070827215128.6248BA65E0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-27 14:51:27 -0700 (Mon, 27 Aug 2007)
New Revision: 19708

Log:
- README even.


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-08-27 21:40:42 UTC (rev 19707)
+++ trunk/buildroot/Makefile	2007-08-27 21:51:27 UTC (rev 19708)
@@ -414,7 +414,7 @@
 	@echo '  source                 - download all sources needed for offline-build'
 	@echo '  source-check           - check all packages for valid download URLs'
 	@echo
-	@echo 'See docs/REAME and docs/buildroot.html for further details'
+	@echo 'See docs/README and docs/buildroot.html for further details'
 	@echo
 
 .PHONY: dummy subdirs release distclean clean config oldconfig \
