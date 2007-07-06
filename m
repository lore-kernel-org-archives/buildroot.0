From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  6 Jul 2007 05:19:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070706121938.55FD0A6108@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-06 05:19:35 -0700 (Fri, 06 Jul 2007)
New Revision: 19012

Log:
Remove some unwanted white space in Makefile

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-06 11:42:03 UTC (rev 19011)
+++ trunk/buildroot/Makefile	2007-07-06 12:19:35 UTC (rev 19012)
@@ -49,7 +49,7 @@
 endif
 
 ifeq ($(KBUILD_VERBOSE),1)
-  quiet =
+  quiet=
   Q =
 else
   quiet=quiet_
