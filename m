From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  1 Oct 2007 01:05:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/matchbox
Message-ID: <20071001080528.BA0CEA4D16@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-10-01 01:05:26 -0700 (Mon, 01 Oct 2007)
New Revision: 20154

Log:
- comment out non-existing source


Modified:
   trunk/buildroot/package/matchbox/matchbox.mk


Changeset:
Modified: trunk/buildroot/package/matchbox/matchbox.mk
===================================================================
--- trunk/buildroot/package/matchbox/matchbox.mk	2007-09-30 23:50:48 UTC (rev 20153)
+++ trunk/buildroot/package/matchbox/matchbox.mk	2007-10-01 08:05:26 UTC (rev 20154)
@@ -84,8 +84,8 @@
 $(DL_DIR)/$(MATCHBOX_SM_SOURCE):
 	$(WGET) -P $(DL_DIR) $(MATCHBOX_SITE)/$(MATCHBOX_SM_BIN)/$(MATCHBOX_SM_MAJORVER)/$(MATCHBOX_SM_SOURCE)
 
-$(DL_DIR)/$(MATCHBOX_DM_SOURCE):
-	$(WGET) -P $(DL_DIR) $(MATCHBOX_SITE)/$(MATCHBOX_SM_BIN)/$(MATCHBOX_SM_MAJORVER)/$(MATCHBOX_SM_SOURCE)
+#$(DL_DIR)/$(MATCHBOX_DM_SOURCE):
+#	$(WGET) -P $(DL_DIR) $(MATCHBOX_SITE)/$(MATCHBOX_SM_BIN)/$(MATCHBOX_SM_MAJORVER)/$(MATCHBOX_SM_SOURCE)
 
 $(DL_DIR)/$(MATCHBOX_CN_SOURCE):
 	$(WGET) -P $(DL_DIR) $(MATCHBOX_SITE)/$(MATCHBOX_CN_BIN)/$(MATCHBOX_CN_MAJORVER)/$(MATCHBOX_CN_SOURCE)
