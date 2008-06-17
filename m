From: hamish at uclibc.org <hamish@uclibc.org>
Date: Tue, 17 Jun 2008 00:08:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd/mtd-utils.git
Message-ID: <20080617070834.08E613C6A5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-06-17 00:08:32 -0700 (Tue, 17 Jun 2008)
New Revision: 22389

Log:
Remove patch which isn't required for the specified upstream version


Removed:
   trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-all-argp.patch


Changeset:
Deleted: trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-all-argp.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-all-argp.patch	2008-06-17 05:43:38 UTC (rev 22388)
+++ trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-all-argp.patch	2008-06-17 07:08:32 UTC (rev 22389)
@@ -1,10 +0,0 @@
---- mtd-utils-e6088d987c545d60a86e1f44836ab8ba072fffd9/ubi-utils/new-utils/src/ubicrc32.c.orig	2008-03-26 16:08:13.000000000 +1100
-+++ mtd-utils-e6088d987c545d60a86e1f44836ab8ba072fffd9/ubi-utils/new-utils/src/ubicrc32.c	2008-03-26 16:08:20.000000000 +1100
-@@ -26,7 +26,6 @@
- #include <stdint.h>
- #include <stdlib.h>
- #include <getopt.h>
--#include <argp.h>
- #include <unistd.h>
- #include <mtd/ubi-header.h>
- 
