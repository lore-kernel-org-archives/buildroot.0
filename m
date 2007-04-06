From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  6 Apr 2007 09:32:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/readline
Message-ID: <20070406163205.E4541485E8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-06 09:32:05 -0700 (Fri, 06 Apr 2007)
New Revision: 18352

Log:
- commentary typo fix


Modified:
   trunk/buildroot/package/readline/readline.mk


Changeset:
Modified: trunk/buildroot/package/readline/readline.mk
===================================================================
--- trunk/buildroot/package/readline/readline.mk	2007-04-06 15:05:05 UTC (rev 18351)
+++ trunk/buildroot/package/readline/readline.mk	2007-04-06 16:32:05 UTC (rev 18352)
@@ -63,7 +63,7 @@
 
 # Install to Target directory
 $(TARGET_DIR)/$(READLINE_TARGET_BINARY): $(READLINE_DIR)/$(READLINE_BINARY)
-	# make sure we don't end up with lib{readline,hostory}...old
+	# make sure we don't end up with lib{readline,history}...old
 	$(MAKE1) DESTDIR=$(TARGET_DIR) includedir=/usr/include \
 		-C $(READLINE_DIR) uninstall
 	BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" CC=$(TARGET_CC) \
