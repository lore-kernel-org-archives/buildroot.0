From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:19:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libsexy
Message-ID: <20080827201916.8DE79F8012@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:19:15 -0700 (Wed, 27 Aug 2008)
New Revision: 23258

Log:
libsexy: fix long help text lines

Make it depend on libgtk2 while we're at it.

Modified:
   trunk/buildroot/package/libsexy/Config.in


Changeset:
Modified: trunk/buildroot/package/libsexy/Config.in
===================================================================
--- trunk/buildroot/package/libsexy/Config.in	2008-08-27 20:19:12 UTC (rev 23257)
+++ trunk/buildroot/package/libsexy/Config.in	2008-08-27 20:19:15 UTC (rev 23258)
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_LIBSEXY
 	bool "libsexy"
+	depends on BR2_PACKAGE_LIBGTK2
 	help
-	  libsexy is a collection of GTK+ widgets that extend the functionality of such standard widgets as GtkEntry and GtkLabel by subclassing them and working around the limitations of the widgets.
+	  libsexy is a collection of GTK+ widgets that extend the
+	  functionality of such standard widgets as GtkEntry and
+	  GtkLabel by subclassing them and working around the
+	  limitations of the widgets.
 
 	  http://www.chipx86.com/wiki/Libsexy
