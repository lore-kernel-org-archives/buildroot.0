From: correa at uclibc.org <correa@uclibc.org>
Date: Thu,  9 Oct 2008 11:36:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20081009183619.125263C8AE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-10-09 11:36:18 -0700 (Thu, 09 Oct 2008)
New Revision: 23644

Log:
Fix whitespace damage

Modified:
   trunk/buildroot/package/directfb/Config.in


Changeset:
Modified: trunk/buildroot/package/directfb/Config.in
===================================================================
--- trunk/buildroot/package/directfb/Config.in	2008-10-09 16:29:44 UTC (rev 23643)
+++ trunk/buildroot/package/directfb/Config.in	2008-10-09 18:36:18 UTC (rev 23644)
@@ -14,71 +14,71 @@
 	  http://www.directfb.org/
 
 config BR2_PACKAGE_DIRECTFB_XSERVER
-        bool "build with X server backend"
-        default n
-        depends on BR2_PACKAGE_DIRECTFB
-	depends on BR2_PACKAGE_XSERVER_x11r7 || BR2_PACKAGE_XSERVER_tinyx
+	bool "build with X server backend"
+	default n
+	depends on BR2_PACKAGE_DIRECTFB
+	depends on !BR2_PACKAGE_XSERVER_none
 
 config BR2_PACKAGE_DIRECTFB_UNIQUE
-        bool "enable unique window manager"
-        default n
-        depends on BR2_PACKAGE_DIRECTFB
+	bool "enable unique window manager"
+	default n
+	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_ATI128
-        bool "compile ati128 graphics driver"
-        default n
-        depends on BR2_PACKAGE_DIRECTFB
+	bool "compile ati128 graphics driver"
+	default n
+	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_CLE266
-        bool "compile cle266 graphics driver"
-        default y
-        depends on BR2_PACKAGE_DIRECTFB
+	bool "compile cle266 graphics driver"
+	default y
+	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_MATROX
-        bool "compile matrox graphics driver"
-        default n
-        depends on BR2_PACKAGE_DIRECTFB
+	bool "compile matrox graphics driver"
+	default n
+	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_UNICHROME
-        bool "compile unichrome graphics driver"
-        default y
-        depends on BR2_PACKAGE_DIRECTFB
+	bool "compile unichrome graphics driver"
+	default y
+	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_KEYBOARD
-        bool "compile keyboard input driver"
-        default y
-        depends on BR2_PACKAGE_DIRECTFB
+	bool "compile keyboard input driver"
+	default y
+	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_PS2MOUSE
-        bool "compile PS2 mouse input driver"
-        default y
-        depends on BR2_PACKAGE_DIRECTFB
+	bool "compile PS2 mouse input driver"
+	default y
+	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_SERIALMOUSE
-        bool "compile serial mouse input driver"
-        default y
-        depends on BR2_PACKAGE_DIRECTFB
+	bool "compile serial mouse input driver"
+	default y
+	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_PNG
-        bool "enable PNG support"
-        default y
-        depends on BR2_PACKAGE_DIRECTFB
+	bool "enable PNG support"
+	default y
+	depends on BR2_PACKAGE_DIRECTFB
 	select BR2_PACKAGE_LIBPNG
 
 config BR2_PACKAGE_DIRECTFB_TSLIB
-        bool "enable touchscreen support"
-        default y
-        depends on BR2_PACKAGE_DIRECTFB
+	bool "enable touchscreen support"
+	default y
+	depends on BR2_PACKAGE_DIRECTFB
 	select BR2_PACKAGE_TSLIB
 
 config BR2_PACKAGE_DIRECTFB_GIF
-        bool "enable GIF support"
-        default y
-        depends on BR2_PACKAGE_DIRECTFB
+	bool "enable GIF support"
+	default y
+	depends on BR2_PACKAGE_DIRECTFB
 	select BR2_PACKAGE_LIBUNGIF
 
 config BR2_PACKAGE_DIRECTFB_JPEG
-        bool "enable JPEG support"
-        default y
-        depends on BR2_PACKAGE_DIRECTFB
+	bool "enable JPEG support"
+	default y
+	depends on BR2_PACKAGE_DIRECTFB
 	select BR2_PACKAGE_JPEG
