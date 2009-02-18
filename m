From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Feb 2009 14:16:35 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tslib
Message-ID: <20090218141635.2E03F76A00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-18 14:16:34 +0000 (Wed, 18 Feb 2009)
New Revision: 25363

Log:
tslib: doesn't use C++, so don't require it in the configure script

Added:
   trunk/buildroot/package/tslib/tslib-1.0-no-cxx.patch


Changeset:
Added: trunk/buildroot/package/tslib/tslib-1.0-no-cxx.patch
===================================================================
--- trunk/buildroot/package/tslib/tslib-1.0-no-cxx.patch	                        (rev 0)
+++ trunk/buildroot/package/tslib/tslib-1.0-no-cxx.patch	2009-02-18 14:16:34 UTC (rev 25363)
@@ -0,0 +1,17 @@
+tslib: Doesn't use C++, so don't require it in the configure script
+---
+ configure.ac |    1 -
+ 1 file changed, 1 deletion(-)
+
+Index: tslib-1.0/configure.ac
+===================================================================
+--- tslib-1.0.orig/configure.ac
++++ tslib-1.0/configure.ac
+@@ -15,7 +15,6 @@
+ TS_DEFAULT_FLAGS
+ 
+ # Checks for programs.
+-AC_PROG_CXX
+ AC_PROG_CC
+ AC_PROG_CPP
+ TS_CC_HIDDEN_VISIBILITY
