From: andersen at uclibc.org <andersen@uclibc.org>
Date: Mon,  9 Oct 2006 14:11:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dmraid
Message-ID: <20061009211107.C1FCF485C2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-10-09 14:11:07 -0700 (Mon, 09 Oct 2006)
New Revision: 16353

Log:
new upstream version


Modified:
   trunk/buildroot/package/dmraid/dmraid.mk


Changeset:
Modified: trunk/buildroot/package/dmraid/dmraid.mk
===================================================================
--- trunk/buildroot/package/dmraid/dmraid.mk	2006-10-09 21:09:20 UTC (rev 16352)
+++ trunk/buildroot/package/dmraid/dmraid.mk	2006-10-09 21:11:07 UTC (rev 16353)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DMRAID_VERSION=1.0.0.rc10
+DMRAID_VERSION=1.0.0.rc11
 DMRAID_SOURCE:=dmraid-$(DMRAID_VERSION).tar.bz2
 DMRAID_SITE:=http://people.redhat.com/~heinzm/sw/dmraid/src
 DMRAID_DIR:=$(BUILD_DIR)/dmraid/$(DMRAID_VERSION)
