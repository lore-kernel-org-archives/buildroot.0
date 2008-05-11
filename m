From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 10 May 2008 23:45:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/portage
Message-ID: <20080511064518.DA0F6F8005@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-10 23:45:17 -0700 (Sat, 10 May 2008)
New Revision: 21967

Log:
Bump portage version

Modified:
   trunk/buildroot/package/portage/portage.mk


Changeset:
Modified: trunk/buildroot/package/portage/portage.mk
===================================================================
--- trunk/buildroot/package/portage/portage.mk	2008-05-11 06:44:20 UTC (rev 21966)
+++ trunk/buildroot/package/portage/portage.mk	2008-05-11 06:45:17 UTC (rev 21967)
@@ -3,9 +3,9 @@
 # portage
 #
 #############################################################
-PORTAGE_BASE_VERSION:=2.1.3
-PORTAGE_DOWNLOAD_VERSION:=$(PORTAGE_BASE_VERSION).16
-PORTAGE_PATCH_VERSION:=.16
+PORTAGE_BASE_VERSION:=2.1.4
+PORTAGE_DOWNLOAD_VERSION:=$(PORTAGE_BASE_VERSION)
+PORTAGE_PATCH_VERSION:=.4
 PORTAGE_PATCH_APPLY:=n
 PORTAGE_VERSION:=$(PORTAGE_BASE_VERSION)$(PORTAGE_PATCH_VERSION)
 PORTAGE_PATCH:=portage-$(PORTAGE_VERSION).patch.bz2
