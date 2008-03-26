From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 26 Mar 2008 06:55:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/editors/nano
Message-ID: <20080326135518.EBABF3C3C0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-26 06:55:18 -0700 (Wed, 26 Mar 2008)
New Revision: 21499

Log:
nano: fix install location

Fix typo in install location. Reported by Simon Pasch.


Modified:
   trunk/buildroot/package/editors/nano/nano.mk


Changeset:
Modified: trunk/buildroot/package/editors/nano/nano.mk
===================================================================
--- trunk/buildroot/package/editors/nano/nano.mk	2008-03-26 13:40:36 UTC (rev 21498)
+++ trunk/buildroot/package/editors/nano/nano.mk	2008-03-26 13:55:18 UTC (rev 21499)
@@ -9,7 +9,7 @@
 NANO_DIR:=$(BUILD_DIR)/nano-$(NANO_VERSION)
 NANO_CAT:=$(ZCAT)
 NANO_BINARY:=src/nano
-NANO_TARGET_BINARY:=sbin/bin/nano
+NANO_TARGET_BINARY:=usr/bin/nano
 
 $(DL_DIR)/$(NANO_SOURCE):
 	$(WGET) -P $(DL_DIR) $(NANO_SITE)/$(NANO_SOURCE)
