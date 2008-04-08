From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Tue,  8 Apr 2008 06:06:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pciutils
Message-ID: <20080408130611.0BE893C305@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-08 06:06:07 -0700 (Tue, 08 Apr 2008)
New Revision: 21670

Log:
* Bump pciutils version


Modified:
   trunk/buildroot/package/pciutils/pciutils.mk


Changeset:
Modified: trunk/buildroot/package/pciutils/pciutils.mk
===================================================================
--- trunk/buildroot/package/pciutils/pciutils.mk	2008-04-08 10:21:16 UTC (rev 21669)
+++ trunk/buildroot/package/pciutils/pciutils.mk	2008-04-08 13:06:07 UTC (rev 21670)
@@ -3,7 +3,7 @@
 # pciutils
 #
 #############################################################
-PCIUTILS_VERSION:=2.2.6
+PCIUTILS_VERSION:=2.2.10
 PCIUTILS_SOURCE:=pciutils-$(PCIUTILS_VERSION).tar.gz
 PCIUTILS_CAT:=$(ZCAT)
 PCIUTILS_SITE:=ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
