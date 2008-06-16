From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 04:42:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libvorbis
Message-ID: <20080616114216.F1D213C96B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-16 04:42:16 -0700 (Mon, 16 Jun 2008)
New Revision: 22376

Log:
libvorbis: make tremor option description more clear

Also remove comment about not being implemented.


Modified:
   trunk/buildroot/package/libvorbis/Config.in


Changeset:
Modified: trunk/buildroot/package/libvorbis/Config.in
===================================================================
--- trunk/buildroot/package/libvorbis/Config.in	2008-06-16 11:34:29 UTC (rev 22375)
+++ trunk/buildroot/package/libvorbis/Config.in	2008-06-16 11:42:16 UTC (rev 22376)
@@ -16,13 +16,12 @@
 	  WMA and PAC.
 
 config BR2_PACKAGE_LIBVORBIS_TREMOR
-	bool "libvorbis integer implementation"
+	bool "use fixed point implementation (tremor)
 	default y if BR2_arm || BR2_avr32
 	default n
 	depends on BR2_PACKAGE_LIBVORBIS
 	help
 	  Use the Tremor fixed point implementation
-	  Not yet implemented
 
 comment "libvorbis requires the package libogg to build"
 	depends on !BR2_PACKAGE_LIBOGG
