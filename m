From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 22 Jan 2009 23:03:18 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20090122230318.C086776724@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-22 23:03:17 +0000 (Thu, 22 Jan 2009)
New Revision: 24972

Log:
Add help for make configured

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2009-01-22 22:58:55 UTC (rev 24971)
+++ trunk/buildroot/Makefile	2009-01-22 23:03:17 UTC (rev 24972)
@@ -506,6 +506,7 @@
 	@echo 'Configuration:'
 	@echo '  menuconfig             - interactive curses-based configurator'
 	@echo '  oldconfig              - resolve any unresolved symbols in .config'
+	@echo '  configured             - make {uclibc/busybox/linux26}-config'
 	@echo '  saveconfig             - save current configuration under local/<project>'
 	@echo '  getconfig              - restore saved configuration from local/<project>'
 	@echo
