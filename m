From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu, 18 Sep 2008 08:22:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bridge-utils
Message-ID: <20080918152216.7199F3C6FB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-09-18 08:22:16 -0700 (Thu, 18 Sep 2008)
New Revision: 23434

Log:
bridge-utils: remove whitespace at end of file



Modified:
   trunk/buildroot/package/bridge-utils/bridge.mk


Changeset:
Modified: trunk/buildroot/package/bridge-utils/bridge.mk
===================================================================
--- trunk/buildroot/package/bridge-utils/bridge.mk	2008-09-18 15:16:30 UTC (rev 23433)
+++ trunk/buildroot/package/bridge-utils/bridge.mk	2008-09-18 15:22:16 UTC (rev 23434)
@@ -27,4 +27,3 @@
 	rm -f $(addprefix $(TARGET_DIR)/usr/,lib/libbridge.a \
 		include/libbridge.h man/man8/brctl.8 sbin/brctl)
 	rm -f $(BRIDGE_TARGET_INSTALL_TARGET) $(BRIDGE_HOOK_POST_INSTALL)
-
