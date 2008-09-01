From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  1 Sep 2008 08:33:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iperf
Message-ID: <20080901153315.C65D33C732@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-01 08:33:15 -0700 (Mon, 01 Sep 2008)
New Revision: 23297

Log:
iperf: bump version

Modified:
   trunk/buildroot/package/iperf/iperf.mk


Changeset:
Modified: trunk/buildroot/package/iperf/iperf.mk
===================================================================
--- trunk/buildroot/package/iperf/iperf.mk	2008-09-01 15:33:12 UTC (rev 23296)
+++ trunk/buildroot/package/iperf/iperf.mk	2008-09-01 15:33:15 UTC (rev 23297)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPERF_VERSION:=2.0.2
+IPERF_VERSION:=2.0.3
 IPERF_SOURCE:=iperf-$(IPERF_VERSION).tar.gz
 IPERF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/iperf
 IPERF_AUTORECONF:=NO
