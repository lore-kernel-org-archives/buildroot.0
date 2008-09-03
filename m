From: correa at uclibc.org <correa@uclibc.org>
Date: Tue,  2 Sep 2008 20:44:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20080903034432.661263C64F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-09-02 20:44:31 -0700 (Tue, 02 Sep 2008)
New Revision: 23308

Log:
Bump version

Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-09-03 01:09:29 UTC (rev 23307)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-09-03 03:44:31 UTC (rev 23308)
@@ -16,7 +16,7 @@
 # (cd /usr/include; sudo ln -s dbus-1.0/dbus dbus)
 # to fix
 
-QTOPIA4_VERSION:=4.4.0
+QTOPIA4_VERSION:=4.4.1
 QTOPIA4_CAT:=$(BZCAT)
 
 BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)))
