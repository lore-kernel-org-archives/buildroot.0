From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 17 Nov 2006 08:01:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/hdparm
Message-ID: <20061117160106.15D16485DA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-17 08:01:05 -0800 (Fri, 17 Nov 2006)
New Revision: 16566

Log:
- bump version.


Modified:
   trunk/buildroot/package/hdparm/hdparm.mk


Changeset:
Modified: trunk/buildroot/package/hdparm/hdparm.mk
===================================================================
--- trunk/buildroot/package/hdparm/hdparm.mk	2006-11-17 15:43:51 UTC (rev 16565)
+++ trunk/buildroot/package/hdparm/hdparm.mk	2006-11-17 16:01:05 UTC (rev 16566)
@@ -3,10 +3,11 @@
 # hdparm
 #
 #############################################################
-HDPARM_SOURCE:=hdparm-6.5.tar.gz
+HDPARM_VERSION:=6.7
+HDPARM_SOURCE:=hdparm-$(HDPARM_VERSION).tar.gz
 HDPARM_SITE:=http://www.ibiblio.org/pub/Linux/system/hardware/
 HDPARM_CAT:=$(ZCAT)
-HDPARM_DIR:=$(BUILD_DIR)/hdparm-6.5
+HDPARM_DIR:=$(BUILD_DIR)/hdparm-$(HDPARM_VERSION)
 HDPARM_BINARY:=hdparm
 HDPARM_TARGET_BINARY:=sbin/hdparm
 
