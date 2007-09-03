From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  3 Sep 2007 02:00:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libdaemon
Message-ID: <20070903090018.69BE8A65E5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-09-03 02:00:18 -0700 (Mon, 03 Sep 2007)
New Revision: 19772

Log:
Bumped version

Modified:
   trunk/buildroot/package/libdaemon/libdaemon.mk


Changeset:
Modified: trunk/buildroot/package/libdaemon/libdaemon.mk
===================================================================
--- trunk/buildroot/package/libdaemon/libdaemon.mk	2007-09-03 08:56:06 UTC (rev 19771)
+++ trunk/buildroot/package/libdaemon/libdaemon.mk	2007-09-03 09:00:18 UTC (rev 19772)
@@ -11,7 +11,7 @@
 # either version 2.1 of the License, or (at your option) any
 # later version.
 
-LIBDAEMON_VERSION:=0.10
+LIBDAEMON_VERSION:=0.12
 LIBDAEMON_NAME:=libdaemon-$(LIBDAEMON_VERSION)
 LIBDAEMON_DIR:=$(BUILD_DIR)/$(LIBDAEMON_NAME)
 LIBDAEMON_SITE:=http://0pointer.de/lennart/projects/libdaemon/
