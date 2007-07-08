From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  7 Jul 2007 17:18:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/config
Message-ID: <20070708001852.A6BADA6837@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-07 17:18:51 -0700 (Sat, 07 Jul 2007)
New Revision: 19026

Log:
- pretty print path for brevity


Modified:
   trunk/buildroot/package/config/kconfig-to-buildroot2.patch


Changeset:
Modified: trunk/buildroot/package/config/kconfig-to-buildroot2.patch
===================================================================
--- trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2007-07-08 00:00:17 UTC (rev 19025)
+++ trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2007-07-08 00:18:51 UTC (rev 19026)
@@ -646,7 +646,7 @@
 Index: confdata.c
 ===================================================================
 --- kconfig/confdata.c	(revision 18967)
-+++ /Buildroot/confdata.c	(working copy)
++++ Buildroot/confdata.c	(working copy)
 @@ -21,7 +21,7 @@ static void conf_warning(const char *fmt
  static const char *conf_filename;
  static int conf_lineno, conf_warnings, conf_unsaved;
@@ -667,9 +667,8 @@
  
  	if (conf_split_config())
  		return 1;
-diff -rdup x/config/confdata.c package/config/confdata.c
---- x/config/confdata.c	2007-07-07 11:13:12.000000000 +0200
-+++ package/config/confdata.c	2007-07-08 01:30:44.000000000 +0200
+--- kconfig/config/confdata.c	2007-07-07 11:13:12.000000000 +0200
++++ Buildroot/config/confdata.c	2007-07-08 01:30:44.000000000 +0200
 @@ -11,6 +11,7 @@
  #include <string.h>
  #include <time.h>
