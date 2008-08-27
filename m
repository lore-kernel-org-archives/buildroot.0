From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 00:29:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libdaemon
Message-ID: <20080827072910.474923C66C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 00:29:09 -0700 (Wed, 27 Aug 2008)
New Revision: 23232

Log:
libdaemon: bump version

Modified:
   trunk/buildroot/package/libdaemon/libdaemon.mk


Changeset:
Modified: trunk/buildroot/package/libdaemon/libdaemon.mk
===================================================================
--- trunk/buildroot/package/libdaemon/libdaemon.mk	2008-08-27 05:27:27 UTC (rev 23231)
+++ trunk/buildroot/package/libdaemon/libdaemon.mk	2008-08-27 07:29:09 UTC (rev 23232)
@@ -11,7 +11,7 @@
 # either version 2.1 of the License, or (at your option) any
 # later version.
 
-LIBDAEMON_VERSION:=0.12
+LIBDAEMON_VERSION:=0.13
 LIBDAEMON_NAME:=libdaemon-$(LIBDAEMON_VERSION)
 LIBDAEMON_DIR:=$(BUILD_DIR)/$(LIBDAEMON_NAME)
 LIBDAEMON_SITE:=http://0pointer.de/lennart/projects/libdaemon/
