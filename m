From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Fri,  9 Nov 2007 08:53:30 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libungif
Message-ID: <20071109165330.BE5023006E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-11-09 08:53:29 -0800 (Fri, 09 Nov 2007)
New Revision: 20396

Log:
correct LIBUNGIF_SITE for libungif

Modified:
   trunk/buildroot/package/libungif/libungif.mk


Changeset:
Modified: trunk/buildroot/package/libungif/libungif.mk
===================================================================
--- trunk/buildroot/package/libungif/libungif.mk	2007-11-09 13:04:26 UTC (rev 20395)
+++ trunk/buildroot/package/libungif/libungif.mk	2007-11-09 16:53:29 UTC (rev 20396)
@@ -5,7 +5,7 @@
 #############################################################
 LIBUNGIF_VERSION:=4.1.4
 LIBUNGIF_SOURCE:=libungif-$(LIBUNGIF_VERSION).tar.bz2
-LIBUNGIF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libungif/$(LIBUNGIF_SOURCE)
+LIBUNGIF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libungif
 LIBUNGIF_DIR:=$(BUILD_DIR)/libungif-$(LIBUNGIF_VERSION)
 LIBUNGIF_CAT:=$(BZCAT)
 LIBUNGIF_BINARY:=libungif.so.$(LIBUNGIF_VERSION)
