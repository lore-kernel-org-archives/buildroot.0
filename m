From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 25 Sep 2007 01:28:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070925082810.880353004D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-25 01:28:09 -0700 (Tue, 25 Sep 2007)
New Revision: 20005

Log:
- flesh out


Modified:
   trunk/buildroot/TODO


Changeset:
Modified: trunk/buildroot/TODO
===================================================================
--- trunk/buildroot/TODO	2007-09-25 08:24:27 UTC (rev 20004)
+++ trunk/buildroot/TODO	2007-09-25 08:28:09 UTC (rev 20005)
@@ -1,6 +1,9 @@
-miscellaneous TODO items that may be worth thinking about and that could
-be discussed on the mailing-list and/or implemented.
+Buildroot3 TODOs
 
+- fix packages/Makefile.autotools.in to use a package-imposed patchdir
+- convert all packages that use autoconf to use the infrastructure of
+  packages/Makefile.autotools.in
+- fix setting of flags for packages
 
 - think about using a common --config-cache for configure
   Should take care of expanding TARGET_CONFIGURE_ARGS for cross compiles
