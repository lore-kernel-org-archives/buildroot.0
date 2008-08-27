From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:18:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sudo
Message-ID: <20080827201845.1767F3C831@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:18:43 -0700 (Wed, 27 Aug 2008)
New Revision: 23250

Log:
sudo: fix long help text lines

Modified:
   trunk/buildroot/package/sudo/Config.in


Changeset:
Modified: trunk/buildroot/package/sudo/Config.in
===================================================================
--- trunk/buildroot/package/sudo/Config.in	2008-08-27 20:18:40 UTC (rev 23249)
+++ trunk/buildroot/package/sudo/Config.in	2008-08-27 20:18:43 UTC (rev 23250)
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SUDO
 	bool "sudo"
 	help
-	 Sudo is a program designed to allow a sysadmin to give limited root
-	 privileges to users and log root activity.  The basic philosophy is to give
-	 as few privileges as possible but still allow people to get their work done.
-
+	  Sudo is a program designed to allow a sysadmin to give
+	  limited root privileges to users and log root activity.  The
+	  basic philosophy is to give as few privileges as possible
+	  but still allow people to get their work done.
