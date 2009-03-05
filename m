From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Mar 2009 19:25:17 +0000 (UTC)
Subject: [Buildroot] svn commit: [25558] trunk/buildroot/package/xerces
Message-ID: <20090305192517.8EFAA775EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-05 19:25:17 +0000 (Thu, 05 Mar 2009)
New Revision: 25558

Log:
xerces: bump version

Modified:
   trunk/buildroot/package/xerces/xerces.mk


Changeset:
Modified: trunk/buildroot/package/xerces/xerces.mk
===================================================================
--- trunk/buildroot/package/xerces/xerces.mk	2009-03-05 19:25:13 UTC (rev 25557)
+++ trunk/buildroot/package/xerces/xerces.mk	2009-03-05 19:25:17 UTC (rev 25558)
@@ -3,7 +3,7 @@
 # xerces
 #
 #############################################################
-XERCES_VERSION:=3.0.0
+XERCES_VERSION:=3.0.1
 XERCES_SOURCE:=xerces-c-$(XERCES_VERSION).tar.gz
 XERCES_SITE:=http://apache.jumper.nu/xerces/c/3/sources/
 XERCES_CAT:=$(ZCAT)
