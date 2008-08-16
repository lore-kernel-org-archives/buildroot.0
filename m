From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 16 Aug 2008 05:32:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pcre
Message-ID: <20080816123258.13D433C838@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-16 05:32:57 -0700 (Sat, 16 Aug 2008)
New Revision: 23092

Log:
pcre: bump version

Modified:
   trunk/buildroot/package/pcre/pcre.mk


Changeset:
Modified: trunk/buildroot/package/pcre/pcre.mk
===================================================================
--- trunk/buildroot/package/pcre/pcre.mk	2008-08-16 12:32:54 UTC (rev 23091)
+++ trunk/buildroot/package/pcre/pcre.mk	2008-08-16 12:32:57 UTC (rev 23092)
@@ -3,7 +3,7 @@
 # PCRE
 #
 #############################################################
-PCRE_VERSION = 7.6
+PCRE_VERSION = 7.7
 PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_INSTALL_STAGING = YES
