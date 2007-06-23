From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 23 Jun 2007 06:43:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/hdparm
Message-ID: <20070623134339.ECFA6485CC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-23 06:43:39 -0700 (Sat, 23 Jun 2007)
New Revision: 18899

Log:
- fix typo in version


Modified:
   trunk/buildroot/package/hdparm/hdparm.mk


Changeset:
Modified: trunk/buildroot/package/hdparm/hdparm.mk
===================================================================
--- trunk/buildroot/package/hdparm/hdparm.mk	2007-06-23 09:50:29 UTC (rev 18898)
+++ trunk/buildroot/package/hdparm/hdparm.mk	2007-06-23 13:43:39 UTC (rev 18899)
@@ -3,7 +3,7 @@
 # hdparm
 #
 #############################################################
-HDPARM_VERSION:=6.7
+HDPARM_VERSION:=7.6
 HDPARM_SOURCE:=hdparm-$(HDPARM_VERSION).tar.gz
 HDPARM_SITE:=http://www.ibiblio.org/pub/Linux/system/hardware/
 HDPARM_CAT:=$(ZCAT)
