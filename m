From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu,  8 Jan 2009 13:16:25 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20090108131625.74DAD77106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2009-01-08 13:16:24 +0000 (Thu, 08 Jan 2009)
New Revision: 24721

Log:
Mention the saveconfig and getconfig targets in make help

I often find myself forgetting what those targets were called, and I imagine
others may not even be aware of their existence.

Signed-off-by: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2009-01-08 11:11:26 UTC (rev 24720)
+++ trunk/buildroot/Makefile	2009-01-08 13:16:24 UTC (rev 24721)
@@ -505,6 +505,8 @@
 	@echo 'Configuration:'
 	@echo '  menuconfig             - interactive curses-based configurator'
 	@echo '  oldconfig              - resolve any unresolved symbols in .config'
+	@echo '  saveconfig             - save current configuration under local/<project>'
+	@echo '  getconfig              - restore saved configuration from local/<project>'
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
