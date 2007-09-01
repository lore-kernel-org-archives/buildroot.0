From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  1 Sep 2007 05:21:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/quagga
Message-ID: <20070901122142.0160DA65B4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-01 05:21:42 -0700 (Sat, 01 Sep 2007)
New Revision: 19745

Log:
- bump version


Modified:
   trunk/buildroot/package/quagga/quagga.mk


Changeset:
Modified: trunk/buildroot/package/quagga/quagga.mk
===================================================================
--- trunk/buildroot/package/quagga/quagga.mk	2007-09-01 12:21:07 UTC (rev 19744)
+++ trunk/buildroot/package/quagga/quagga.mk	2007-09-01 12:21:42 UTC (rev 19745)
@@ -3,7 +3,7 @@
 # quagga suite
 #
 #############################################################
-QUAGGA_VERSION:=0.99.7
+QUAGGA_VERSION:=0.99.8
 QUAGGA_SOURCE:=quagga-$(QUAGGA_VERSION).tar.gz
 QUAGGA_SITE:=http://www.quagga.net/download
 QUAGGA_DIR:=$(BUILD_DIR)/quagga-$(QUAGGA_VERSION)
