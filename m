From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 13:21:35 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openswan
Message-ID: <20090116132135.9C9D7774FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-16 13:21:33 +0000 (Fri, 16 Jan 2009)
New Revision: 24876

Log:
openswan: tarball moved to old/ subdir

Modified:
   trunk/buildroot/package/openswan/openswan.mk


Changeset:
Modified: trunk/buildroot/package/openswan/openswan.mk
===================================================================
--- trunk/buildroot/package/openswan/openswan.mk	2009-01-16 12:34:44 UTC (rev 24875)
+++ trunk/buildroot/package/openswan/openswan.mk	2009-01-16 13:21:33 UTC (rev 24876)
@@ -8,7 +8,7 @@
 #############################################################
 OPENSWAN_VERSION:=2.4.9
 OPENSWAN_SOURCE:=openswan-$(OPENSWAN_VERSION).tar.gz
-OPENSWAN_SITE:=http://www.openswan.org/download/
+OPENSWAN_SITE:=http://www.openswan.org/download/old/
 OPENSWAN_DIR:=$(BUILD_DIR)/openswan-$(OPENSWAN_VERSION)
 OPENSWAN_CAT:=$(ZCAT)
 OPENSWAN_BINARY:=programs/pluto/pluto
