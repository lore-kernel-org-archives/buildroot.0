From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 12 Jan 2009 07:44:09 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
Message-ID: <20090112074409.82580766E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-12 07:44:09 +0000 (Mon, 12 Jan 2009)
New Revision: 24783

Log:
Add ncurse-unpacked target

Modified:
   trunk/buildroot/package/ncurses/ncurses.mk


Changeset:
Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2009-01-12 07:43:23 UTC (rev 24782)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2009-01-12 07:44:09 UTC (rev 24783)
@@ -150,6 +150,8 @@
 
 ncurses: $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION)
 
+ncurses-unpacked: $(NCURSES_DIR)/.patched
+
 ncurses-headers: $(TARGET_DIR)/usr/lib/libncurses.a
 
 ncurses-source: $(DL_DIR)/$(NCURSES_SOURCE)
