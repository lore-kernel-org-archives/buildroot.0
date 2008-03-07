From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  7 Mar 2008 02:07:35 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/editors/nano
Message-ID: <20080307100735.DFD33120159@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-07 02:07:35 -0800 (Fri, 07 Mar 2008)
New Revision: 21266

Log:
nano: install to /usr/bin


Modified:
   trunk/buildroot/package/editors/nano/nano.mk


Changeset:
Modified: trunk/buildroot/package/editors/nano/nano.mk
===================================================================
--- trunk/buildroot/package/editors/nano/nano.mk	2008-03-07 10:02:12 UTC (rev 21265)
+++ trunk/buildroot/package/editors/nano/nano.mk	2008-03-07 10:07:35 UTC (rev 21266)
@@ -9,7 +9,7 @@
 NANO_DIR:=$(BUILD_DIR)/nano-$(NANO_VERSION)
 NANO_CAT:=$(ZCAT)
 NANO_BINARY:=src/nano
-NANO_TARGET_BINARY:=bin/nano
+NANO_TARGET_BINARY:=sbin/bin/nano
 
 $(DL_DIR)/$(NANO_SOURCE):
 	$(WGET) -P $(DL_DIR) $(NANO_SITE)/$(NANO_SOURCE)
