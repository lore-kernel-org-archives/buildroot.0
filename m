From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  8 Apr 2009 20:50:04 +0000 (UTC)
Subject: [Buildroot] svn commit: [26027] trunk/buildroot/package/lua
Message-ID: <20090408205005.827EC76475@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-08 20:50:03 +0000 (Wed, 08 Apr 2009)
New Revision: 26027

Log:
lua: bump version

Patch by Michael Roth <mroth@nessie.de>.

Modified:
   trunk/buildroot/package/lua/lua.mk


Changeset:
Modified: trunk/buildroot/package/lua/lua.mk
===================================================================
--- trunk/buildroot/package/lua/lua.mk	2009-04-08 16:59:24 UTC (rev 26026)
+++ trunk/buildroot/package/lua/lua.mk	2009-04-08 20:50:03 UTC (rev 26027)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LUA_VERSION=5.1.2
+LUA_VERSION=5.1.4
 
 LUA_SOURCE=lua-$(LUA_VERSION).tar.gz
 LUA_CAT:=$(ZCAT)
