From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 20 Mar 2008 16:03:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86
Message-ID: <20080320230340.97EA93C35D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-20 16:03:40 -0700 (Thu, 20 Mar 2008)
New Revision: 21423

Log:
Use x86 Makefile only if x86 is choosen

Modified:
   trunk/buildroot/target/x86/Makefile.in


Changeset:
Modified: trunk/buildroot/target/x86/Makefile.in
===================================================================
--- trunk/buildroot/target/x86/Makefile.in	2008-03-20 23:02:41 UTC (rev 21422)
+++ trunk/buildroot/target/x86/Makefile.in	2008-03-20 23:03:40 UTC (rev 21423)
@@ -1 +1,3 @@
+ifeq ($(BR2_i386),y)
 include target/x86/*/*.mk
+endif
