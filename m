From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:19:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tcl
Message-ID: <20080827201947.8E39CF8035@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:19:46 -0700 (Wed, 27 Aug 2008)
New Revision: 23267

Log:
tcl: fix long help text lines

Modified:
   trunk/buildroot/package/tcl/Config.in


Changeset:
Modified: trunk/buildroot/package/tcl/Config.in
===================================================================
--- trunk/buildroot/package/tcl/Config.in	2008-08-27 20:19:43 UTC (rev 23266)
+++ trunk/buildroot/package/tcl/Config.in	2008-08-27 20:19:46 UTC (rev 23267)
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_TCL
 	bool "tcl"
 	help
-	  TCL(Tool Command Language) is a simple textual language.
+	  TCL (Tool Command Language) is a simple textual language.
 
 	  http://www.tcl.tk
 
@@ -10,8 +10,10 @@
 	default y
 	depends on BR2_PACKAGE_TCL
 	help
-	  Delete encoding files for TCL. If your programs do not use various tcl
-	  character recoding functions, you may safely choose Y here.
+	  Delete encoding files for TCL. If your programs do not use
+	  various tcl character recoding functions, you may safely
+	  choose Y here.
+
 	  It saves approx. 1.4 Mb of space.
 
 config BR2_PACKAGE_TCL_SHLIB_ONLY
@@ -19,5 +21,7 @@
 	default y
 	depends on BR2_PACKAGE_TCL
 	help
-	  Install only TCL shared library and not binary tcl interpreter(tclsh8.4).
+	  Install only TCL shared library and not binary tcl
+	  interpreter(tclsh8.4).
+
 	  Saves ~14kb.
