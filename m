From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 09:52:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/udev
Message-ID: <20070811165257.F2E5FA5D3C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 09:52:57 -0700 (Sat, 11 Aug 2007)
New Revision: 19429

Log:
Remove udev-install patch (merged into Makefile)

Removed:
   trunk/buildroot/package/udev/udev-install.patch


Changeset:
Deleted: trunk/buildroot/package/udev/udev-install.patch
===================================================================
--- trunk/buildroot/package/udev/udev-install.patch	2007-08-11 16:50:49 UTC (rev 19428)
+++ trunk/buildroot/package/udev/udev-install.patch	2007-08-11 16:52:57 UTC (rev 19429)
@@ -1,11 +0,0 @@
-diff -ur udev-101/Makefile udev-101-patched/Makefile
---- udev-101/Makefile	2006-09-30 07:30:00.000000000 -0500
-+++ udev-101-patched/Makefile	2006-10-20 12:28:18.000000000 -0500
-@@ -275,6 +275,7 @@
- 
- install-bin:
- 	$(INSTALL) -d $(DESTDIR)$(udevdir)
-+	$(INSTALL_PROGRAM) -D udevstart $(DESTDIR)$(sbindir)/udevstart
- 	$(INSTALL_PROGRAM) -D udevd $(DESTDIR)$(sbindir)/udevd
- 	$(INSTALL_PROGRAM) -D udevtrigger $(DESTDIR)$(sbindir)/udevtrigger
- 	$(INSTALL_PROGRAM) -D udevsettle $(DESTDIR)$(sbindir)/udevsettle
