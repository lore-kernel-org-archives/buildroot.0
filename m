From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 27 Aug 2007 14:40:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070827214044.6E3F9A65BE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-27 14:40:42 -0700 (Mon, 27 Aug 2007)
New Revision: 19707

Log:
- allow me to point people at 'make help'


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-08-27 17:02:19 UTC (rev 19706)
+++ trunk/buildroot/Makefile	2007-08-27 21:40:42 UTC (rev 19707)
@@ -414,6 +414,8 @@
 	@echo '  source                 - download all sources needed for offline-build'
 	@echo '  source-check           - check all packages for valid download URLs'
 	@echo
+	@echo 'See docs/REAME and docs/buildroot.html for further details'
+	@echo
 
 .PHONY: dummy subdirs release distclean clean config oldconfig \
 	menuconfig tags check test depend defconfig help
