From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 09:35:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
Message-ID: <20070625163524.A615BA45DE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 09:35:23 -0700 (Mon, 25 Jun 2007)
New Revision: 18932

Log:
- fix typo in previous commit


Modified:
   trunk/buildroot/package/ncurses/ncurses.mk


Changeset:
Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2007-06-25 15:38:03 UTC (rev 18931)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2007-06-25 16:35:23 UTC (rev 18932)
@@ -104,7 +104,7 @@
 	touch -c $@
 
 $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VER): $(STAGING_DIR)/usr/lib/libncurses.a
-	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/lib/
 	-cp -dpf $(STAGING_DIR)/usr/lib/terminfo $(TARGET_DIR)/usr/lib/
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm $(TARGET_DIR)/usr/share/terminfo/x
