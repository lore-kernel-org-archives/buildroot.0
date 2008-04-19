From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 19 Apr 2008 13:44:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080419204414.A8EDA3C5DB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-19 13:44:13 -0700 (Sat, 19 Apr 2008)
New Revision: 21777

Log:
blockdev: sort entries alphabetically


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-04-19 20:19:45 UTC (rev 21776)
+++ trunk/buildroot/package/Config.in	2008-04-19 20:44:13 UTC (rev 21777)
@@ -235,9 +235,9 @@
 
 if BR2_BLOCKDEV_SUPPORT
 source "package/acpid/Config.in"
-source "package/devmem2/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
+source "package/devmem2/Config.in"
 source "package/dm/Config.in"
 source "package/dmraid/Config.in"
 source "package/e2fsprogs/Config.in"
