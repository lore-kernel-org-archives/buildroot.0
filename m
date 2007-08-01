From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  1 Aug 2007 02:53:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ethtool
Message-ID: <20070801095302.097D5A4047@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-08-01 02:53:01 -0700 (Wed, 01 Aug 2007)
New Revision: 19385

Log:
Bumped version

Modified:
   trunk/buildroot/package/ethtool/ethtool.mk


Changeset:
Modified: trunk/buildroot/package/ethtool/ethtool.mk
===================================================================
--- trunk/buildroot/package/ethtool/ethtool.mk	2007-08-01 09:06:04 UTC (rev 19384)
+++ trunk/buildroot/package/ethtool/ethtool.mk	2007-08-01 09:53:01 UTC (rev 19385)
@@ -4,10 +4,10 @@
 #
 #############################################################
 
-ETHTOOL_VERSION=3
-ETHTOOL_SOURCE=ethtool-$(ETHTOOL_VERSION).tar.gz
-ETHTOOL_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gkernel/
-ETHTOOL_DIR=$(BUILD_DIR)/ethtool-$(ETHTOOL_VERSION)
+ETHTOOL_VERSION:=6
+ETHTOOL_SOURCE:=ethtool-$(ETHTOOL_VERSION).tar.gz
+ETHTOOL_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gkernel/
+ETHTOOL_DIR:=$(BUILD_DIR)/ethtool-$(ETHTOOL_VERSION)
 ETHTOOL_CAT:=$(ZCAT)
 
 $(DL_DIR)/$(ETHTOOL_SOURCE):
