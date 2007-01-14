From: andersen at uclibc.org <andersen@uclibc.org>
Date: Sun, 14 Jan 2007 14:18:50 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070114221850.DAD9B485EF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-14 14:18:49 -0800 (Sun, 14 Jan 2007)
New Revision: 17305

Log:
there is no 'package/hal/' at present...


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-14 17:06:11 UTC (rev 17304)
+++ trunk/buildroot/package/Config.in	2007-01-14 22:18:49 UTC (rev 17305)
@@ -64,7 +64,6 @@
 source "package/gmp/Config.in"
 source "package/mpfr/Config.in"
 source "package/gzip/Config.in"
-source "package/hal/Config.in"
 source "package/haserl/Config.in"
 source "package/hdparm/Config.in"
 source "package/hostap/Config.in"
