From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Sat, 12 Apr 2008 02:44:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080412094443.555203C56F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-12 02:44:42 -0700 (Sat, 12 Apr 2008)
New Revision: 21714

Log:
* Remove libbeecrypt, I'll add beecrypt-with-autotools shortly


Removed:
   trunk/buildroot/package/libbeecrypt/

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-04-12 01:34:04 UTC (rev 21713)
+++ trunk/buildroot/package/Config.in	2008-04-12 09:44:42 UTC (rev 21714)
@@ -74,7 +74,6 @@
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/less/Config.in"
 endif
-source "package/libbeecrypt/Config.in"
 source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
