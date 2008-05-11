From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 10 May 2008 23:45:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20080511064548.ED746F801D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-10 23:45:47 -0700 (Sat, 10 May 2008)
New Revision: 21968

Log:
Bump qtopia version

Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-05-11 06:45:17 UTC (rev 21967)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-05-11 06:45:47 UTC (rev 21968)
@@ -16,7 +16,9 @@
 # (cd /usr/include; sudo ln -s dbus-1.0/dbus dbus)
 # to fix
 
-QTOPIA4_VERSION:=4.4.0-snapshot-20080312
+QTOPIA4_VERSION:=4.4.0-snapshot-20080325
+# QTOPIA4_VERSION:=4.4.1-snapshot-20080511
+# QTOPIA4_VERSION:=4.5.0-snapshot-20080511
 QTOPIA4_CAT:=$(ZCAT)
 
 BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)))
