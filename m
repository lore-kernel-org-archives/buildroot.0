From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  7 Mar 2008 05:31:17 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
Message-ID: <20080307133117.57A721201D1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-07 05:31:16 -0800 (Fri, 07 Mar 2008)
New Revision: 21269

Log:
sdl: bump version


Modified:
   trunk/buildroot/package/sdl/sdl.mk


Changeset:
Modified: trunk/buildroot/package/sdl/sdl.mk
===================================================================
--- trunk/buildroot/package/sdl/sdl.mk	2008-03-07 13:31:11 UTC (rev 21268)
+++ trunk/buildroot/package/sdl/sdl.mk	2008-03-07 13:31:16 UTC (rev 21269)
@@ -3,7 +3,7 @@
 # SDL
 #
 #############################################################
-SDL_VERSION:=1.2.12
+SDL_VERSION:=1.2.13
 SDL_SOURCE:=SDL-$(SDL_VERSION).tar.gz
 SDL_SITE:=http://www.libsdl.org/release
 SDL_CAT:=$(ZCAT)
