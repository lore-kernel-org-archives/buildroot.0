From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 13 Oct 2007 16:11:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/readline
Message-ID: <20071013231117.DF2EEA65CE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-13 16:11:17 -0700 (Sat, 13 Oct 2007)
New Revision: 20248

Log:
Config update of Readline subdir

Modified:
   trunk/buildroot/package/readline/readline.mk


Changeset:
Modified: trunk/buildroot/package/readline/readline.mk
===================================================================
--- trunk/buildroot/package/readline/readline.mk	2007-10-13 23:09:49 UTC (rev 20247)
+++ trunk/buildroot/package/readline/readline.mk	2007-10-13 23:11:17 UTC (rev 20248)
@@ -22,6 +22,7 @@
 	mkdir -p $(READLINE_DIR)
 	tar -C $(BUILD_DIR) -zxf $(DL_DIR)/$(READLINE_SOURCE)
 	$(CONFIG_UPDATE) $(READLINE_DIR)
+	$(CONFIG_UPDATE) $(READLINE_DIR)/support
 	touch $@
 
 $(READLINE_DIR)/.configured: $(READLINE_DIR)/.unpacked
