From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Fri, 16 Nov 2007 04:48:15 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/portage
Message-ID: <20071116124815.3542030042@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-11-16 04:48:14 -0800 (Fri, 16 Nov 2007)
New Revision: 20436

Log:
update portage version and site

Modified:
   trunk/buildroot/package/portage/portage.mk


Changeset:
Modified: trunk/buildroot/package/portage/portage.mk
===================================================================
--- trunk/buildroot/package/portage/portage.mk	2007-11-16 12:39:16 UTC (rev 20435)
+++ trunk/buildroot/package/portage/portage.mk	2007-11-16 12:48:14 UTC (rev 20436)
@@ -3,7 +3,7 @@
 # portage
 #
 #############################################################
-PORTAGE_DOWNLOAD_VERSION:=2.1.2
+PORTAGE_DOWNLOAD_VERSION:=2.1.3
 PORTAGE_PATCH_VERSION:=.9
 PORTAGE_VERSION:=$(PORTAGE_DOWNLOAD_VERSION)$(PORTAGE_PATCH_VERSION)
 PORTAGE_PATCH:=portage-$(PORTAGE_VERSION).patch.bz2
@@ -17,8 +17,7 @@
 
 SANDBOX_VERSION:=1.2.18.1
 SANDBOX_SOURCE:=sandbox-$(SANDBOX_VERSION).tar.bz2
-SANDBOX_SITE:=http://dev.gentoo.org/~azarah/sandbox/
-#SANDBOX_SITE:=$(PORTAGE_SITE)
+SANDBOX_SITE:=$(PORTAGE_SITE)
 SANDBOX_CAT:=$(PORTAGE_CAT)
 SANDBOX_DIR:=$(BUILD_DIR)/sandbox-$(SANDBOX_VERSION)
 SANDBOX_TARGET_BINARY:=usr/bin/sandbox
