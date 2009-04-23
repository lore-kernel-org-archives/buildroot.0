From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 23 Apr 2009 12:49:37 +0000 (UTC)
Subject: [Buildroot] svn commit: [26195] trunk/buildroot/package/qtopia4
Message-ID: <20090423124937.4166977108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-23 12:49:36 +0000 (Thu, 23 Apr 2009)
New Revision: 26195

Log:
package/qtopia4: fix GPL download URL

Patch by Will Newton <will.newton@gmail.com>

Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2009-04-23 11:45:02 UTC (rev 26194)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2009-04-23 12:49:36 UTC (rev 26195)
@@ -37,7 +37,7 @@
 QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION)
 QTOPIA4_CONFIGURE+= -no-sql-oci -no-sql-tds -no-sql-db2
 else # Good, good, we are free:
-QTOPIA4_SITE=ftp://ftp.trolltech.com/qt/source
+QTOPIA4_SITE=http://get.qtsoftware.com/qt/source
 QTOPIA4_SOURCE:=qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION).tar.bz2
 QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION)
 ifeq ($(BR2_PACKAGE_QTOPIA4_LICENSE_APPROVED),y)
