From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 24 Apr 2007 06:42:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dropbear
Message-ID: <20070424134209.61AFE4807C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-04-24 06:42:03 -0700 (Tue, 24 Apr 2007)
New Revision: 18516

Log:
Bump version

Modified:
   trunk/buildroot/package/dropbear/dropbear.mk


Changeset:
Modified: trunk/buildroot/package/dropbear/dropbear.mk
===================================================================
--- trunk/buildroot/package/dropbear/dropbear.mk	2007-04-24 05:24:08 UTC (rev 18515)
+++ trunk/buildroot/package/dropbear/dropbear.mk	2007-04-24 13:42:03 UTC (rev 18516)
@@ -3,7 +3,7 @@
 # dropbear
 #
 #############################################################
-DROPBEAR_VER:=0.48.1
+DROPBEAR_VER:=0.49
 DROPBEAR_SOURCE:=dropbear-$(DROPBEAR_VER).tar.gz
 DROPBEAR_SITE:=http://matt.ucc.asn.au/dropbear/releases/
 DROPBEAR_DIR:=$(BUILD_DIR)/dropbear-$(DROPBEAR_VER)
