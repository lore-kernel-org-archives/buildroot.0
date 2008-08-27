From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:19:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ntfs-3g
Message-ID: <20080827201901.A9ECD3C864@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:19:01 -0700 (Wed, 27 Aug 2008)
New Revision: 23254

Log:
ntfs-3g: fix long help text lines

Modified:
   trunk/buildroot/package/ntfs-3g/Config.in


Changeset:
Modified: trunk/buildroot/package/ntfs-3g/Config.in
===================================================================
--- trunk/buildroot/package/ntfs-3g/Config.in	2008-08-27 20:18:58 UTC (rev 23253)
+++ trunk/buildroot/package/ntfs-3g/Config.in	2008-08-27 20:19:01 UTC (rev 23254)
@@ -2,6 +2,11 @@
         bool "ntfs-3g"
 	select BR2_PACKAGE_PKGCONFIG
         help
-	  The NTFS-3G driver is an open source, freely available read/write NTFS driver for Linux, FreeBSD, Mac OS X, NetBSD, and Haiku. It provides safe and fast handling of the Windows XP, Windows Server 2003, Windows 2000 and Windows Vista file systems. Most POSIX file system operations are supported, with the exception of full file ownership and access right support.
+	  The NTFS-3G driver is an open source, freely available
+          read/write NTFS driver for Linux, FreeBSD, Mac OS X, NetBSD,
+          and Haiku. It provides safe and fast handling of the Windows
+          XP, Windows Server 2003, Windows 2000 and Windows Vista file
+          systems. Most POSIX file system operations are supported, with
+          the exception of full file ownership and access right support.
 
 	  http://www.ntfs-3g.org/
