From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 28 Sep 2007 13:52:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070928205210.130EE3004A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-28 13:52:09 -0700 (Fri, 28 Sep 2007)
New Revision: 20098

Log:
- mark the autotools.in part as taken
- fix a typo


Modified:
   trunk/buildroot/TODO


Changeset:
Modified: trunk/buildroot/TODO
===================================================================
--- trunk/buildroot/TODO	2007-09-28 20:42:24 UTC (rev 20097)
+++ trunk/buildroot/TODO	2007-09-28 20:52:09 UTC (rev 20098)
@@ -1,12 +1,13 @@
-Buildroot3 TODOs
+Buildroot2 TODOs
 
-- stabilize for a 0.10.0 release
-
 - fix packages/Makefile.autotools.in to use a package-imposed patchdir
+  (Ivan Kuten)
 - convert all packages that use autoconf to use the infrastructure of
   packages/Makefile.autotools.in
 - fix setting of flags for packages
 
+- stabilize for a 0.10.0 release
+
 - think about using a common --config-cache for configure
   Should take care of expanding TARGET_CONFIGURE_ARGS for cross compiles
   to working presets.
