From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue, 12 Dec 2006 22:18:42 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20061213061842.9E3A548599@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-12 22:18:41 -0800 (Tue, 12 Dec 2006)
New Revision: 16868

Log:
Use a stable version of busybox by default.  The daily snapshot of
busybox tends to break often and is thus not a great default.


Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2006-12-13 04:26:28 UTC (rev 16867)
+++ trunk/buildroot/package/busybox/Config.in	2006-12-13 06:18:41 UTC (rev 16868)
@@ -12,7 +12,7 @@
 config BR2_PACKAGE_BUSYBOX_SNAPSHOT
 	bool "Use the daily snapshot of BusyBox?"
 	depends BR2_PACKAGE_BUSYBOX
-	default y
+	default n
 	help
 	  Use the latest BusyBox daily snapshot instead of release.
 
