From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 17 Jan 2007 05:49:36 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/cairo
Message-ID: <20070117134936.E4C15485B3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-01-17 05:49:35 -0800 (Wed, 17 Jan 2007)
New Revision: 17343

Log:
Fixup description (pango cut'n'paste)

Modified:
   trunk/buildroot/package/cairo/Config.in


Changeset:
Modified: trunk/buildroot/package/cairo/Config.in
===================================================================
--- trunk/buildroot/package/cairo/Config.in	2007-01-17 13:46:45 UTC (rev 17342)
+++ trunk/buildroot/package/cairo/Config.in	2007-01-17 13:49:35 UTC (rev 17343)
@@ -5,10 +5,10 @@
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_XORG
 	help
-	  Pango is a library for laying out and rendering of text, with an
-	  emphasis on internationalization. Pango can be used anywhere that
-	  text layout is needed, though most of the work on Pango so far has
-	  been done in the context of the GTK+ widget toolkit. Pango forms the
-	  core of text and font handling for GTK+-2.x.
+	  Cairo is a 2D graphics library with support for multiple
+	  output devices. Currently supported output targets include
+	  the X Window System, Win32, image buffers, and PostScript,
+	  PDF, and SVG file output. Experimental backends include
+	  OpenGL (through glitz), Quartz, and XCB.
 
-	  http://www.pango.org/
+	  http://cairographics.org/
