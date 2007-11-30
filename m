From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 30 Nov 2007 01:12:11 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libungif
Message-ID: <20071130091211.857B130046@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-30 01:12:09 -0800 (Fri, 30 Nov 2007)
New Revision: 20593

Log:
Change site for libungif, Courtesy Andrew Dyer

Modified:
   trunk/buildroot/package/libungif/libungif.mk


Changeset:
Modified: trunk/buildroot/package/libungif/libungif.mk
===================================================================
--- trunk/buildroot/package/libungif/libungif.mk	2007-11-30 07:29:05 UTC (rev 20592)
+++ trunk/buildroot/package/libungif/libungif.mk	2007-11-30 09:12:09 UTC (rev 20593)
@@ -5,7 +5,7 @@
 #############################################################
 LIBUNGIF_VERSION:=4.1.4
 LIBUNGIF_SOURCE:=libungif-$(LIBUNGIF_VERSION).tar.bz2
-LIBUNGIF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libungif
+LIBUNGIF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/giflib
 LIBUNGIF_DIR:=$(BUILD_DIR)/libungif-$(LIBUNGIF_VERSION)
 LIBUNGIF_CAT:=$(BZCAT)
 LIBUNGIF_BINARY:=libungif.so.$(LIBUNGIF_VERSION)
