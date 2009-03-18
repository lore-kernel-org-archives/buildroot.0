From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 19:19:19 +0000 (UTC)
Subject: [Buildroot] svn commit: [25723] trunk/buildroot/package/libglib2
Message-ID: <20090318191919.517C476459@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 19:19:18 +0000 (Wed, 18 Mar 2009)
New Revision: 25723

Log:
libglib2: no longer needs glib2-dev package on host

Modified:
   trunk/buildroot/package/libglib2/Config.in


Changeset:
Modified: trunk/buildroot/package/libglib2/Config.in
===================================================================
--- trunk/buildroot/package/libglib2/Config.in	2009-03-18 19:19:10 UTC (rev 25722)
+++ trunk/buildroot/package/libglib2/Config.in	2009-03-18 19:19:18 UTC (rev 25723)
@@ -5,6 +5,5 @@
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
-	  Requires libglib2 (-dev) on the host. 
 
 	  http://www.gtk.org/
