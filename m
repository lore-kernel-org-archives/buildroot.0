From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 15 Jan 2007 08:01:34 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070115160134.E09994858E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-15 08:01:34 -0800 (Mon, 15 Jan 2007)
New Revision: 17312

Log:
but now there is..


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-15 15:55:43 UTC (rev 17311)
+++ trunk/buildroot/package/Config.in	2007-01-15 16:01:34 UTC (rev 17312)
@@ -64,6 +64,7 @@
 source "package/gmp/Config.in"
 source "package/mpfr/Config.in"
 source "package/gzip/Config.in"
+source "package/hal/Config.in"
 source "package/haserl/Config.in"
 source "package/hdparm/Config.in"
 source "package/hostap/Config.in"
