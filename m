From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 10 Sep 2007 02:05:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dnsmasq
Message-ID: <20070910090558.10234A682F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-09-10 02:05:58 -0700 (Mon, 10 Sep 2007)
New Revision: 19810

Log:
Bump version

Modified:
   trunk/buildroot/package/dnsmasq/dnsmasq.mk


Changeset:
Modified: trunk/buildroot/package/dnsmasq/dnsmasq.mk
===================================================================
--- trunk/buildroot/package/dnsmasq/dnsmasq.mk	2007-09-10 09:04:03 UTC (rev 19809)
+++ trunk/buildroot/package/dnsmasq/dnsmasq.mk	2007-09-10 09:05:58 UTC (rev 19810)
@@ -6,7 +6,7 @@
 
 DNSMASQ_SITE:=http://thekelleys.org.uk/dnsmasq
 ifeq ($(filter $(TARGETS),dnsmasq1),)
-DNSMASQ_UPVER:=2.39
+DNSMASQ_UPVER:=2.40
 DNSMASQ_VERSION:=dnsmasq2
 else
 DNSMASQ_UPVER:=1.18
