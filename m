From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 24 Feb 2009 11:13:57 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20090224111357.C4F1B7669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-24 11:13:56 +0000 (Tue, 24 Feb 2009)
New Revision: 25439

Log:
dbus: fix expat typo

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2009-02-24 10:05:15 UTC (rev 25438)
+++ trunk/buildroot/package/dbus/dbus.mk	2009-02-24 11:13:56 UTC (rev 25439)
@@ -20,7 +20,7 @@
 
 ifeq ($(BR2_DBUS_EXPAT),y)
 DBUS_XML:=expat
-DBUS_DEPENDENCIES += ezxml
+DBUS_DEPENDENCIES += expat
 else
 DBUS_XML:=libxml
 DBUS_DEPENDENCIES += libxml2
