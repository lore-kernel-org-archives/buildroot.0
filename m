From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 10 Jul 2008 01:17:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080710081748.DBA873C7BC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-10 01:17:48 -0700 (Thu, 10 Jul 2008)
New Revision: 22740

Log:
gperf: move under "other development stuff"

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-07-10 08:17:44 UTC (rev 22739)
+++ trunk/buildroot/package/Config.in	2008-07-10 08:17:48 UTC (rev 22740)
@@ -48,6 +48,7 @@
 source "package/fakeroot/Config.in"
 source "package/gettext/Config.in"
 source "package/gmp/Config.in"
+source "package/gperf/Config.in"
 source "package/mpfr/Config.in"
 source "package/libtool/Config.in"
 source "package/m4/Config.in"
@@ -71,7 +72,6 @@
 source "package/dash/Config.in"
 source "package/file/Config.in"
 source "package/gamin/Config.in"
-source "package/gperf/Config.in"
 source "package/icu/Config.in"
 source "package/ipkg/Config.in"
 source "package/kexec/Config.in"
