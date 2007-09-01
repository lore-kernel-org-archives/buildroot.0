From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  1 Sep 2007 10:12:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iptables
Message-ID: <20070901171248.1DD0DA65F0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-01 10:12:48 -0700 (Sat, 01 Sep 2007)
New Revision: 19752

Log:
- explicitely download via http


Modified:
   trunk/buildroot/package/iptables/iptables.mk


Changeset:
Modified: trunk/buildroot/package/iptables/iptables.mk
===================================================================
--- trunk/buildroot/package/iptables/iptables.mk	2007-09-01 17:12:23 UTC (rev 19751)
+++ trunk/buildroot/package/iptables/iptables.mk	2007-09-01 17:12:48 UTC (rev 19752)
@@ -4,7 +4,7 @@
 #
 #############################################################
 IPTABLES_VERSION:=1.3.8
-IPTABLES_SOURCE_URL:=ftp.netfilter.org/pub/iptables
+IPTABLES_SOURCE_URL:=http://ftp.netfilter.org/pub/iptables
 IPTABLES_SOURCE:=iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_CAT:=$(BZCAT)
 IPTABLES_BUILD_DIR:=$(BUILD_DIR)/iptables-$(IPTABLES_VERSION)
