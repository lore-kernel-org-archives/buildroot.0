From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 28 Dec 2008 16:08:53 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/netsnmp
Message-ID: <20081228160854.280DA76D44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-28 16:08:53 +0000 (Sun, 28 Dec 2008)
New Revision: 24577

Log:
netsnmp: bump version, fixes security hole in snmpv3

Modified:
   trunk/buildroot/package/netsnmp/netsnmp.mk


Changeset:
Modified: trunk/buildroot/package/netsnmp/netsnmp.mk
===================================================================
--- trunk/buildroot/package/netsnmp/netsnmp.mk	2008-12-28 13:50:53 UTC (rev 24576)
+++ trunk/buildroot/package/netsnmp/netsnmp.mk	2008-12-28 16:08:53 UTC (rev 24577)
@@ -3,7 +3,7 @@
 # netsnmp
 #
 #############################################################
-NETSNMP_VERSION:=5.4.1
+NETSNMP_VERSION:=5.4.2.1
 NETSNMP_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/net-snmp/
 NETSNMP_DIR:=$(BUILD_DIR)/net-snmp-$(NETSNMP_VERSION)
 NETSNMP_SOURCE:=net-snmp-$(NETSNMP_VERSION).tar.gz
