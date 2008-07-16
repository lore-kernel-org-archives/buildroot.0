From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 16 Jul 2008 07:37:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl_ttf
Message-ID: <20080716143744.1DAE73C78C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-16 07:37:43 -0700 (Wed, 16 Jul 2008)
New Revision: 22843

Log:
sdl_ttf: needs freetype

Update help text while we're at it.

Based on patch by artemys. Closes #4154.

Modified:
   trunk/buildroot/package/sdl_ttf/Config.in


Changeset:
Modified: trunk/buildroot/package/sdl_ttf/Config.in
===================================================================
--- trunk/buildroot/package/sdl_ttf/Config.in	2008-07-16 11:00:16 UTC (rev 22842)
+++ trunk/buildroot/package/sdl_ttf/Config.in	2008-07-16 14:37:43 UTC (rev 22843)
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_SDL_TTF
 	bool "SDL_TTF"
 	default n
+	select BR2_PACKAGE_FREETYPE
 	help
+	  SDL_ttf is a sample TrueType font library. It allows you to
+	  use TrueType fonts in your SDL applications.
 
 	  http://www.libsdl.org/projects/SDL_ttf/
+
