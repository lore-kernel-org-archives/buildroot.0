From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 04:26:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libvorbis
Message-ID: <20080616112657.2B9BDF800B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-16 04:26:56 -0700 (Mon, 16 Jun 2008)
New Revision: 22373

Log:
libvorbis: show comment if libogg isn't enabled, not if libvorbis isn't.


Modified:
   trunk/buildroot/package/libvorbis/Config.in


Changeset:
Modified: trunk/buildroot/package/libvorbis/Config.in
===================================================================
--- trunk/buildroot/package/libvorbis/Config.in	2008-06-16 11:25:25 UTC (rev 22372)
+++ trunk/buildroot/package/libvorbis/Config.in	2008-06-16 11:26:56 UTC (rev 22373)
@@ -33,4 +33,4 @@
 	  Not yet implemented
 
 comment "libvorbis requires the package libogg to build"
-	depends on !BR2_PACKAGE_LIBVORBIS
+	depends on !BR2_PACKAGE_LIBOGG
