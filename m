From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:19:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qte
Message-ID: <20080827201904.6CC463C818@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:19:04 -0700 (Wed, 27 Aug 2008)
New Revision: 23255

Log:
qte: fix long help text lines

Modified:
   trunk/buildroot/package/qte/Config.in


Changeset:
Modified: trunk/buildroot/package/qte/Config.in
===================================================================
--- trunk/buildroot/package/qte/Config.in	2008-08-27 20:19:01 UTC (rev 23254)
+++ trunk/buildroot/package/qte/Config.in	2008-08-27 20:19:04 UTC (rev 23255)
@@ -6,29 +6,32 @@
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBPNG
 	help
-	  Trolltech's Qt/Embedded, which offers the same APIs used in building desktop applications tailored to a smaller footprint.
+	  Trolltech's Qt/Embedded, which offers the same APIs used in
+	  building desktop applications tailored to a smaller footprint.
 
 	  http://trolltech.com/
 
-	  Only tested with threading on, PACKAGE_JPEG, PACKAGE_LIBPNG, but remove those if you like.
+	  Only tested with threading on, PACKAGE_JPEG, PACKAGE_LIBPNG,
+	  but remove those if you like.
 
-
 config BR2_PACKAGE_QTE_COMMERCIAL_USERNAME
 	string "Qt/E Commercial License Username"
 	default ""
 	depends on BR2_PACKAGE_QTE
 	help
-	    Commercial users can download their source directly by providing a username.  I do not mean this to be a political or economic statement, just a convenience function
+	  Commercial users can download their source directly by
+	  providing a username. I do not mean this to be a political
+	  or economic statement, just a convenience function
 
-
 config BR2_PACKAGE_QTE_COMMERCIAL_PASSWORD
 	string "Qt/E Commercial License Password"
 	default ""
 	depends on BR2_PACKAGE_QTE
 	help
-	    Commercial users can download their source directly by providing a password.  I do not mean this to be a political or economic statement, just a convenience function
+	  Commercial users can download their source directly by
+	  providing a password. I do not mean this to be a political
+	  or economic statement, just a convenience function
 
-
 choice
 	prompt "Qt/E Version"
 	default BR2_QTE_VERSION_2_3_11
@@ -62,7 +65,8 @@
 	bool "QVfb"
 	depends on BR2_PACKAGE_QTE
 	help
-	  Trolltech provides a Virtual Framebuffer used to simulate the embedded device during development
+	  Trolltech provides a Virtual Framebuffer used to simulate
+	  the embedded device during development
 
 	  http://trolltech.com/
 
@@ -92,7 +96,9 @@
 	bool "Qt/E-3.3.x for Qtopia build"
 	depends on BR2_PACKAGE_QTE_QTOPIA
 	help
-	  Qtopia requires a Qt/E version >= 3.3.0; when using a Qt/E-2.3.x on the runtime, Qtopia still needs a Qt/E-3.3.x codebase to build
+	  Qtopia requires a Qt/E version >= 3.3.0; when using a
+	  Qt/E-2.3.x on the runtime, Qtopia still needs a Qt/E-3.3.x
+	  codebase to build
 
 	  http://trolltech.com/
 
@@ -101,7 +107,7 @@
 	default BR2_QTE_QT3_VERSION_3_3_4
 	depends on BR2_PACKAGE_QTE_QT3
 	help
-	  Select the version of QVfb you wish to use.
+	  Select the version of Qt/E you wish to use.
 
 	config BR2_QTE_QT3_VERSION_3_3_4
 	        bool "Qt/E 3.3.4"
@@ -121,7 +127,8 @@
 	bool "Qtopia"
 	depends on BR2_PACKAGE_QTE
 	help
-	  Qtopia defines some more advanced components used for mobile devices
+	  Qtopia defines some more advanced components used for mobile
+	  devices
 
 	  http://trolltech.com/
 
