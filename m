From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed,  1 Aug 2007 01:11:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070801081149.D90C1A4680@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-01 01:11:48 -0700 (Wed, 01 Aug 2007)
New Revision: 19375

Log:
make needs menuconfig to allow configuration

Modified:
   trunk/buildroot/docs/README


Changeset:
Modified: trunk/buildroot/docs/README
===================================================================
--- trunk/buildroot/docs/README	2007-08-01 06:17:34 UTC (rev 19374)
+++ trunk/buildroot/docs/README	2007-08-01 08:11:48 UTC (rev 19375)
@@ -1,6 +1,6 @@
 To build and use the buildroot stuff, do the following:
 
-1) run 'make'
+1) run 'make menuconfig'
 2) select the packages you wish to compile
 3) run 'make'
 4) wait while it compiles
