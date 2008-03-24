From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Mon, 24 Mar 2008 12:19:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mdadm
Message-ID: <20080324191916.C19E23C361@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-03-24 12:19:16 -0700 (Mon, 24 Mar 2008)
New Revision: 21474

Log:
* Updated mdadm to version 2.6.4


Modified:
   trunk/buildroot/package/mdadm/mdadm.mk


Changeset:
Modified: trunk/buildroot/package/mdadm/mdadm.mk
===================================================================
--- trunk/buildroot/package/mdadm/mdadm.mk	2008-03-24 18:40:32 UTC (rev 21473)
+++ trunk/buildroot/package/mdadm/mdadm.mk	2008-03-24 19:19:16 UTC (rev 21474)
@@ -3,9 +3,9 @@
 # mdadm
 #
 #############################################################
-MDADM_VERSION:=2.6.2
+MDADM_VERSION:=2.6.4
 MDADM_SOURCE:=mdadm_$(MDADM_VERSION).orig.tar.gz
-MDADM_PATCH:=mdadm_$(MDADM_VERSION)-2.diff.gz
+MDADM_PATCH:=mdadm_$(MDADM_VERSION)-1.diff.gz
 MDADM_CAT:=$(ZCAT)
 MDADM_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mdadm
 MDADM_DIR:=$(BUILD_DIR)/mdadm-$(MDADM_VERSION)
