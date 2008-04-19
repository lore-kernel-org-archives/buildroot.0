From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Fri, 18 Apr 2008 22:59:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bootutils
Message-ID: <20080419055907.44C7F3C58F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-18 22:59:07 -0700 (Fri, 18 Apr 2008)
New Revision: 21769

Log:
* This fix is included upstream as from 0.0.8


Removed:
   trunk/buildroot/package/bootutils/bootutils-0.0.7_header-fix.patch


Changeset:
Deleted: trunk/buildroot/package/bootutils/bootutils-0.0.7_header-fix.patch
===================================================================
--- trunk/buildroot/package/bootutils/bootutils-0.0.7_header-fix.patch	2008-04-19 05:28:39 UTC (rev 21768)
+++ trunk/buildroot/package/bootutils/bootutils-0.0.7_header-fix.patch	2008-04-19 05:59:07 UTC (rev 21769)
@@ -1,12 +0,0 @@
-diff -ru bootutils-0.0.7_vanilla/libblkid/blkid.h bootutils-0.0.7_header-fix/libblkid/blkid.h
---- bootutils-0.0.7_vanilla/libblkid/blkid.h	2007-07-16 18:30:48.000000000 +0000
-+++ bootutils-0.0.7_header-fix/libblkid/blkid.h	2008-03-29 15:34:54.000000000 +0000
-@@ -14,7 +14,7 @@
- #define _BLKID_BLKID_H
- 
- #include <sys/types.h>
--#include <blkid/blkid_types.h>
-+#include "blkid_types.h"
- 
- #ifdef __cplusplus
- extern "C" {
