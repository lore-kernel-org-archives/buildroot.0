From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 30 Oct 2007 14:26:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/quagga
Message-ID: <20071030212651.3B896A4640@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-30 14:26:50 -0700 (Tue, 30 Oct 2007)
New Revision: 20337

Log:
Bump quagga version

Modified:
   trunk/buildroot/package/quagga/quagga.mk


Changeset:
Modified: trunk/buildroot/package/quagga/quagga.mk
===================================================================
--- trunk/buildroot/package/quagga/quagga.mk	2007-10-30 21:15:46 UTC (rev 20336)
+++ trunk/buildroot/package/quagga/quagga.mk	2007-10-30 21:26:50 UTC (rev 20337)
@@ -3,9 +3,10 @@
 # quagga suite
 #
 #############################################################
-QUAGGA_VERSION:=0.99.8
+QUAGGA_VERSION:=0.99.9
 QUAGGA_SOURCE:=quagga-$(QUAGGA_VERSION).tar.gz
 QUAGGA_SITE:=http://www.quagga.net/download
+QUAGGA_RELIC_SITE:=http://www.quagga.net/download/attic
 QUAGGA_DIR:=$(BUILD_DIR)/quagga-$(QUAGGA_VERSION)
 QUAGGA_CAT:=$(ZCAT)
 
