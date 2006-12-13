From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 13 Dec 2006 00:55:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iptables
Message-ID: <20061213085556.0D37F4855F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-13 00:55:55 -0800 (Wed, 13 Dec 2006)
New Revision: 16877

Log:
- bump version.


Modified:
   trunk/buildroot/package/iptables/iptables.mk


Changeset:
Modified: trunk/buildroot/package/iptables/iptables.mk
===================================================================
--- trunk/buildroot/package/iptables/iptables.mk	2006-12-13 07:33:07 UTC (rev 16876)
+++ trunk/buildroot/package/iptables/iptables.mk	2006-12-13 08:55:55 UTC (rev 16877)
@@ -3,8 +3,8 @@
 # iptables
 #
 #############################################################
-IPTABLES_VER:=1.3.6-20061129
-IPTABLES_SOURCE_URL:=ftp.netfilter.org/pub/iptables/snapshot
+IPTABLES_VER:=1.3.7
+IPTABLES_SOURCE_URL:=ftp.netfilter.org/pub/iptables
 IPTABLES_SOURCE:=iptables-$(IPTABLES_VER).tar.bz2
 IPTABLES_CAT:=$(BZCAT)
 IPTABLES_BUILD_DIR:=$(BUILD_DIR)/iptables-$(IPTABLES_VER)
