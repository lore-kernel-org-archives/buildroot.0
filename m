From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Mon, 29 Sep 2008 09:27:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20080929162749.284DB3C360@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-09-29 09:27:48 -0700 (Mon, 29 Sep 2008)
New Revision: 23558

Log:
qtopia4: bump version to 4.4.3

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-09-29 14:34:40 UTC (rev 23557)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-09-29 16:27:48 UTC (rev 23558)
@@ -16,7 +16,7 @@
 # (cd /usr/include; sudo ln -s dbus-1.0/dbus dbus)
 # to fix
 
-QTOPIA4_VERSION:=4.4.1
+QTOPIA4_VERSION:=4.4.3
 QTOPIA4_CAT:=$(BZCAT)
 
 BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)))
