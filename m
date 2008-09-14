From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 14 Sep 2008 12:19:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080915150245.F0AB63C2A7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-14 12:19:06 -0700 (Sun, 14 Sep 2008)
New Revision: 23394

Log:
Makefile.autotools.in: fix FOO_UNINSTALL_TARGET_OPT help text

It defaults to TARGET_DIR, not STAGING_DIR.

Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-09-13 20:26:06 UTC (rev 23393)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-09-14 19:19:06 UTC (rev 23394)
@@ -52,7 +52,7 @@
 # FOO_UNINSTALL_STAGING_OPT  [default DESTDIR=$(STAGING_DIR)/usr uninstall]
 #	arguments passed to <make> while uninstalling from the staging
 #	directory
-# FOO_UNINSTALL_TARGET_OPT [default DESTDIR=$(STAGING_DIR)/usr uninstall]
+# FOO_UNINSTALL_TARGET_OPT [default DESTDIR=$(TARGET_DIR)/usr uninstall]
 #	arguments passed to <make> while uninstalling from the target
 #	directory
 # FOO_SUBDIR [default empty]
