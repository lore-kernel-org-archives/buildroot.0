From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 18 May 2007 02:55:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mdadm
Message-ID: <20070518095510.D6A6848081@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-05-18 02:55:09 -0700 (Fri, 18 May 2007)
New Revision: 18650

Log:
- bump patch version


Modified:
   trunk/buildroot/package/mdadm/mdadm.mk


Changeset:
Modified: trunk/buildroot/package/mdadm/mdadm.mk
===================================================================
--- trunk/buildroot/package/mdadm/mdadm.mk	2007-05-18 09:45:36 UTC (rev 18649)
+++ trunk/buildroot/package/mdadm/mdadm.mk	2007-05-18 09:55:09 UTC (rev 18650)
@@ -5,7 +5,7 @@
 #############################################################
 MDADM_VERSION:=2.6.1
 MDADM_SOURCE:=mdadm_$(MDADM_VERSION).orig.tar.gz
-MDADM_PATCH:=mdadm_$(MDADM_VERSION)-1~exp.5.diff.gz
+MDADM_PATCH:=mdadm_$(MDADM_VERSION)-1.diff.gz
 MDADM_CAT:=$(ZCAT)
 MDADM_SITE:=http://ftp.debian.org/debian/pool/main/m/mdadm
 MDADM_DIR:=$(BUILD_DIR)/mdadm-$(MDADM_VERSION)
