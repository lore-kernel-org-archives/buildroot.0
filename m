From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 13:27:08 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xerces
Message-ID: <20090116132709.0DCF0774FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-16 13:27:08 +0000 (Fri, 16 Jan 2009)
New Revision: 24878

Log:
xerces: tarball moved to archive.apache.org

Modified:
   trunk/buildroot/package/xerces/xerces.mk


Changeset:
Modified: trunk/buildroot/package/xerces/xerces.mk
===================================================================
--- trunk/buildroot/package/xerces/xerces.mk	2009-01-16 13:23:56 UTC (rev 24877)
+++ trunk/buildroot/package/xerces/xerces.mk	2009-01-16 13:27:08 UTC (rev 24878)
@@ -5,7 +5,7 @@
 #############################################################
 XERCES_VERSION:=2.7.0
 XERCES_SOURCE:=xerces-c-src_2_7_0.tar.gz
-XERCES_SITE:=http://www.apache.org/dist/xml/xerces-c/source/
+XERCES_SITE:=http://archive.apache.org/dist/xml/xerces-c/source/
 XERCES_CAT:=$(ZCAT)
 XERCES_DIR:=$(BUILD_DIR)/xerces-c-src_2_7_0
 XERCES_BINARY:=lib/libxerces-c.so.27.0
