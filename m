From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  2 Nov 2008 12:22:00 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: directfb pciutils
Message-ID: <20081102202200.4602DF8073@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-02 12:21:59 -0800 (Sun, 02 Nov 2008)
New Revision: 23906

Log:
package/: remove more 'default n' (see r22874)

Modified:
   trunk/buildroot/package/directfb/Config.in
   trunk/buildroot/package/pciutils/Config.in


Changeset:
Modified: trunk/buildroot/package/directfb/Config.in
===================================================================
--- trunk/buildroot/package/directfb/Config.in	2008-11-02 19:21:21 UTC (rev 23905)
+++ trunk/buildroot/package/directfb/Config.in	2008-11-02 20:21:59 UTC (rev 23906)
@@ -15,18 +15,15 @@
 
 config BR2_PACKAGE_DIRECTFB_XSERVER
 	bool "build with X server backend"
-	default n
 	depends on BR2_PACKAGE_DIRECTFB
 	depends on !BR2_PACKAGE_XSERVER_none
 
 config BR2_PACKAGE_DIRECTFB_UNIQUE
 	bool "enable unique window manager"
-	default n
 	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_ATI128
 	bool "compile ati128 graphics driver"
-	default n
 	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_CLE266
@@ -36,7 +33,6 @@
 
 config BR2_PACKAGE_DIRECTFB_MATROX
 	bool "compile matrox graphics driver"
-	default n
 	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_UNICHROME

Modified: trunk/buildroot/package/pciutils/Config.in
===================================================================
--- trunk/buildroot/package/pciutils/Config.in	2008-11-02 19:21:21 UTC (rev 23905)
+++ trunk/buildroot/package/pciutils/Config.in	2008-11-02 20:21:59 UTC (rev 23906)
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PCIUTILS
 	bool "pciutils"
-	default n
 	help
 	  Various utilities dealing with the PCI bus.
 	  Provides things like setpci and lspci.
