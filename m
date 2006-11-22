From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Nov 2006 07:23:31 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iproute2
Message-ID: <20061122152331.8B2F04859A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-22 07:23:31 -0800 (Wed, 22 Nov 2006)
New Revision: 16621

Log:
- bump version


Modified:
   trunk/buildroot/package/iproute2/iproute2.mk


Changeset:
Modified: trunk/buildroot/package/iproute2/iproute2.mk
===================================================================
--- trunk/buildroot/package/iproute2/iproute2.mk	2006-11-22 15:22:57 UTC (rev 16620)
+++ trunk/buildroot/package/iproute2/iproute2.mk	2006-11-22 15:23:31 UTC (rev 16621)
@@ -3,8 +3,8 @@
 # iproute2
 #
 #############################################################
-IPROUTE2_VER:=2.6.14
-IPROUTE2_STAMP:=051107
+IPROUTE2_VER:=2.6.18
+IPROUTE2_STAMP:=061002
 IPROUTE2_SOURCE:=iproute2-$(IPROUTE2_VER)-$(IPROUTE2_STAMP).tar.gz
 IPROUTE2_SITE:=http://developer.osdl.org/dev/iproute2/download/
 IPROUTE2_DIR:=$(BUILD_DIR)/iproute2-$(IPROUTE2_VER)-$(IPROUTE2_STAMP)
