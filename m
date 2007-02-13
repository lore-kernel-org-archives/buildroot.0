From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 13 Feb 2007 06:00:52 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dialog
Message-ID: <20070213140052.9AC3B485C4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-02-13 06:00:49 -0800 (Tue, 13 Feb 2007)
New Revision: 17874

Log:
-2 patch no longer available. Patch by Stefan Feilmeier

Modified:
   trunk/buildroot/package/dialog/dialog.mk


Changeset:
Modified: trunk/buildroot/package/dialog/dialog.mk
===================================================================
--- trunk/buildroot/package/dialog/dialog.mk	2007-02-13 09:47:44 UTC (rev 17873)
+++ trunk/buildroot/package/dialog/dialog.mk	2007-02-13 14:00:49 UTC (rev 17874)
@@ -9,7 +9,7 @@
 DIALOG_SITE:=http://ftp.debian.org/debian/pool/main/d/dialog
 DIALOG_DIR:=$(BUILD_DIR)/dialog-$(DIALOG_VERSION)
 # http://ftp.debian.org/debian/pool/main/d/dialog/dialog_1.0-20050306-1.diff.gz
-DIALOG_PATCH1:=dialog_$(DIALOG_VERSION)-2.diff.gz
+DIALOG_PATCH1:=dialog_$(DIALOG_VERSION)-3.diff.gz
 DIALOG_PATCH1_URL:=$(DIALOG_SITE)
 DIALOG_BINARY:=dialog
 DIALOG_TARGET_BINARY:=usr/bin/dialog
