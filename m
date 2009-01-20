From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 20 Jan 2009 21:33:57 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lzma
Message-ID: <20090120213357.95702770AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-20 21:33:57 +0000 (Tue, 20 Jan 2009)
New Revision: 24927

Log:
Bump lzma to latest stable, ARM build now completes

Modified:
   trunk/buildroot/package/lzma/lzma.mk


Changeset:
Modified: trunk/buildroot/package/lzma/lzma.mk
===================================================================
--- trunk/buildroot/package/lzma/lzma.mk	2009-01-20 21:32:43 UTC (rev 24926)
+++ trunk/buildroot/package/lzma/lzma.mk	2009-01-20 21:33:57 UTC (rev 24927)
@@ -3,7 +3,7 @@
 # lzma
 #
 #############################################################
-LZMA_VERSION:=4.32.4
+LZMA_VERSION:=4.32.6
 LZMA_SOURCE:=lzma-$(LZMA_VERSION).tar.gz
 LZMA_CAT:=$(ZCAT)
 LZMA_SITE:=http://tukaani.org/lzma/
