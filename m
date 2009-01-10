From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Sat, 10 Jan 2009 11:44:47 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
Message-ID: <20090110114447.7FED976A00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2009-01-10 11:44:44 +0000 (Sat, 10 Jan 2009)
New Revision: 24742

Log:
Nice to point out dependencies on host.


Modified:
   trunk/buildroot/package/libglib2/Config.in


Changeset:
Modified: trunk/buildroot/package/libglib2/Config.in
===================================================================
--- trunk/buildroot/package/libglib2/Config.in	2009-01-10 11:36:38 UTC (rev 24741)
+++ trunk/buildroot/package/libglib2/Config.in	2009-01-10 11:44:44 UTC (rev 24742)
@@ -6,5 +6,6 @@
 	select BR2_PACKAGE_PKGCONFIG
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
+	  Requires libglig2 (-dev) on the host. 
 
 	  http://www.gtk.org/
