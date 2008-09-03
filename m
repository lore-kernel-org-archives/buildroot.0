From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  2 Sep 2008 23:58:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/games
Message-ID: <20080903065829.5E9953C375@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-02 23:58:28 -0700 (Tue, 02 Sep 2008)
New Revision: 23309

Log:
games: add games.mk so make will descent down package/games/*/*.mk

Added:
   trunk/buildroot/package/games/games.mk


Changeset:
Added: trunk/buildroot/package/games/games.mk
===================================================================
--- trunk/buildroot/package/games/games.mk	                        (rev 0)
+++ trunk/buildroot/package/games/games.mk	2008-09-03 06:58:28 UTC (rev 23309)
@@ -0,0 +1 @@
+include package/games/*/*.mk
