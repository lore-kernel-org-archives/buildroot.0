From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 13:47:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/neon
Message-ID: <20080826204709.EDE02F800C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 13:47:09 -0700 (Tue, 26 Aug 2008)
New Revision: 23218

Log:
neon: bump version

Fixes CVE-2008-3746.

Modified:
   trunk/buildroot/package/neon/neon.mk


Changeset:
Modified: trunk/buildroot/package/neon/neon.mk
===================================================================
--- trunk/buildroot/package/neon/neon.mk	2008-08-26 20:47:05 UTC (rev 23217)
+++ trunk/buildroot/package/neon/neon.mk	2008-08-26 20:47:09 UTC (rev 23218)
@@ -3,7 +3,7 @@
 # neon
 #
 #############################################################
-NEON_VERSION = 0.28.2
+NEON_VERSION = 0.28.3
 NEON_SITE = http://www.webdav.org/neon/
 NEON_INSTALL_STAGING = YES
 
