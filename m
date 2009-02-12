From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 12 Feb 2009 13:39:35 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dnsmasq
Message-ID: <20090212133935.7EE4776440@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-12 13:39:33 +0000 (Thu, 12 Feb 2009)
New Revision: 25307

Log:
dnsmasq: bump version

closes #97.

Modified:
   trunk/buildroot/package/dnsmasq/dnsmasq.mk


Changeset:
Modified: trunk/buildroot/package/dnsmasq/dnsmasq.mk
===================================================================
--- trunk/buildroot/package/dnsmasq/dnsmasq.mk	2009-02-12 12:17:12 UTC (rev 25306)
+++ trunk/buildroot/package/dnsmasq/dnsmasq.mk	2009-02-12 13:39:33 UTC (rev 25307)
@@ -5,7 +5,7 @@
 #############################################################
 
 DNSMASQ_SITE:=http://thekelleys.org.uk/dnsmasq
-DNSMASQ_UPVER:=2.46
+DNSMASQ_UPVER:=2.47
 DNSMASQ_SOURCE:=dnsmasq-$(DNSMASQ_UPVER).tar.gz
 DNSMASQ_DIR:=$(BUILD_DIR)/dnsmasq-$(DNSMASQ_UPVER)
 DNSMASQ_BINARY:=dnsmasq
