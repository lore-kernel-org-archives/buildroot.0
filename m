From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  7 Mar 2008 05:31:07 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
Message-ID: <20080307133107.C1F36120195@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-07 05:31:07 -0800 (Fri, 07 Mar 2008)
New Revision: 21267

Log:
sdl: remove wrong comment


Modified:
   trunk/buildroot/package/sdl/sdl.mk


Changeset:
Modified: trunk/buildroot/package/sdl/sdl.mk
===================================================================
--- trunk/buildroot/package/sdl/sdl.mk	2008-03-07 10:07:35 UTC (rev 21266)
+++ trunk/buildroot/package/sdl/sdl.mk	2008-03-07 13:31:07 UTC (rev 21267)
@@ -4,8 +4,6 @@
 #
 #############################################################
 SDL_VERSION:=1.2.12
-# 1.2.12 is available, but depends on Pulse Audio 0.9
-# which is not available in buildroot (yet)
 SDL_SOURCE:=SDL-$(SDL_VERSION).tar.gz
 SDL_SITE:=http://www.libsdl.org/release
 SDL_CAT:=$(ZCAT)
