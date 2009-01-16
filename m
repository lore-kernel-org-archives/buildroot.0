From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 13:23:57 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/quagga
Message-ID: <20090116132357.425F9774FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-16 13:23:56 +0000 (Fri, 16 Jan 2009)
New Revision: 24877

Log:
quagga: tarball moved to attic/ subdir

Modified:
   trunk/buildroot/package/quagga/quagga.mk


Changeset:
Modified: trunk/buildroot/package/quagga/quagga.mk
===================================================================
--- trunk/buildroot/package/quagga/quagga.mk	2009-01-16 13:21:33 UTC (rev 24876)
+++ trunk/buildroot/package/quagga/quagga.mk	2009-01-16 13:23:56 UTC (rev 24877)
@@ -5,8 +5,7 @@
 #############################################################
 QUAGGA_VERSION:=0.99.9
 QUAGGA_SOURCE:=quagga-$(QUAGGA_VERSION).tar.gz
-QUAGGA_SITE:=http://www.quagga.net/download
-QUAGGA_RELIC_SITE:=http://www.quagga.net/download/attic
+QUAGGA_SITE:=http://www.quagga.net/download/attic
 QUAGGA_DIR:=$(BUILD_DIR)/quagga-$(QUAGGA_VERSION)
 QUAGGA_CAT:=$(ZCAT)
 
