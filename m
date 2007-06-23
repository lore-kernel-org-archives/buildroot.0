From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 23 Jun 2007 06:56:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
Message-ID: <20070623135653.61B40485CC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-23 06:56:52 -0700 (Sat, 23 Jun 2007)
New Revision: 18901

Log:
- bump version


Modified:
   trunk/buildroot/package/ncurses/ncurses.mk


Changeset:
Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2007-06-23 13:49:33 UTC (rev 18900)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2007-06-23 13:56:52 UTC (rev 18901)
@@ -23,7 +23,7 @@
 # USA
 
 # TARGETS
-NCURSES_VER:=5.5
+NCURSES_VER:=5.6
 NCURSES_SITE:=http://ftp.gnu.org/pub/gnu/ncurses
 NCURSES_DIR:=$(BUILD_DIR)/ncurses-$(NCURSES_VER)
 NCURSES_SOURCE:=ncurses-$(NCURSES_VER).tar.gz
