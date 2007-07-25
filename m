From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 25 Jul 2007 10:39:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
Message-ID: <20070725173927.E0BE0A5E25@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-25 10:39:26 -0700 (Wed, 25 Jul 2007)
New Revision: 19261

Log:
Make SDL seled DirectFB

Modified:
   trunk/buildroot/package/sdl/Config.in


Changeset:
Modified: trunk/buildroot/package/sdl/Config.in
===================================================================
--- trunk/buildroot/package/sdl/Config.in	2007-07-25 17:37:50 UTC (rev 19260)
+++ trunk/buildroot/package/sdl/Config.in	2007-07-25 17:39:26 UTC (rev 19261)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SDL
 	bool "SDL"
 	default n
+	select BR2_PACKAGE_DIRECTFB
 	help
 
 	  http://www.libsdl.org/
