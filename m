From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  1 Dec 2008 01:08:01 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dnsmasq
Message-ID: <20081201090801.C7E323C608@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-01 01:08:01 -0800 (Mon, 01 Dec 2008)
New Revision: 24199

Log:
dnsmasq: bump version

Modified:
   trunk/buildroot/package/dnsmasq/dnsmasq.mk


Changeset:
Modified: trunk/buildroot/package/dnsmasq/dnsmasq.mk
===================================================================
--- trunk/buildroot/package/dnsmasq/dnsmasq.mk	2008-12-01 09:07:58 UTC (rev 24198)
+++ trunk/buildroot/package/dnsmasq/dnsmasq.mk	2008-12-01 09:08:01 UTC (rev 24199)
@@ -5,7 +5,7 @@
 #############################################################
 
 DNSMASQ_SITE:=http://thekelleys.org.uk/dnsmasq
-DNSMASQ_UPVER:=2.45
+DNSMASQ_UPVER:=2.46
 DNSMASQ_SOURCE:=dnsmasq-$(DNSMASQ_UPVER).tar.gz
 DNSMASQ_DIR:=$(BUILD_DIR)/dnsmasq-$(DNSMASQ_UPVER)
 DNSMASQ_BINARY:=dnsmasq
