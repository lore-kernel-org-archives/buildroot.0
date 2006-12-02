From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  2 Dec 2006 10:13:31 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iptables
Message-ID: <20061202181331.036AD48593@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-02 10:13:31 -0800 (Sat, 02 Dec 2006)
New Revision: 16756

Log:
- bump version to cope with changes imposed by 2.6.19.


Modified:
   trunk/buildroot/package/iptables/iptables.mk


Changeset:
Modified: trunk/buildroot/package/iptables/iptables.mk
===================================================================
--- trunk/buildroot/package/iptables/iptables.mk	2006-12-02 18:12:18 UTC (rev 16755)
+++ trunk/buildroot/package/iptables/iptables.mk	2006-12-02 18:13:31 UTC (rev 16756)
@@ -3,8 +3,8 @@
 # iptables
 #
 #############################################################
-IPTABLES_VER:=1.3.5
-IPTABLES_SOURCE_URL:=ftp.netfilter.org/pub/iptables/
+IPTABLES_VER:=1.3.6-20061129
+IPTABLES_SOURCE_URL:=ftp.netfilter.org/pub/iptables/snapshot
 IPTABLES_SOURCE:=iptables-$(IPTABLES_VER).tar.bz2
 IPTABLES_CAT:=$(BZCAT)
 IPTABLES_BUILD_DIR:=$(BUILD_DIR)/iptables-$(IPTABLES_VER)
