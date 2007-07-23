From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 01:33:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
Message-ID: <20070723083342.4342AA6591@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 01:33:41 -0700 (Mon, 23 Jul 2007)
New Revision: 19204

Log:
Add some additional terminals to ncurses

Modified:
   trunk/buildroot/package/ncurses/ncurses.mk


Changeset:
Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2007-07-23 08:23:54 UTC (rev 19203)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2007-07-23 08:33:41 UTC (rev 19204)
@@ -111,7 +111,9 @@
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-xfree86 $(TARGET_DIR)/usr/share/terminfo/x
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/v
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt100 $(TARGET_DIR)/usr/share/terminfo/v
+	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt102 $(TARGET_DIR)/usr/share/terminfo/v
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt200 $(TARGET_DIR)/usr/share/terminfo/v
+	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt220 $(TARGET_DIR)/usr/share/terminfo/v
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/a
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/a/ansi $(TARGET_DIR)/usr/share/terminfo/a
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/l
