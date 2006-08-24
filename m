From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 24 Aug 2006 12:46:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb/snapshot
Message-ID: <20060824194655.B2FA048A54@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-08-24 12:46:55 -0700 (Thu, 24 Aug 2006)
New Revision: 15981

Log:
- remove patch that was already applied upstream


Removed:
   trunk/buildroot/toolchain/gdb/snapshot/770-debian_vfork-done-spelling.patch


Changeset:
Deleted: trunk/buildroot/toolchain/gdb/snapshot/770-debian_vfork-done-spelling.patch
===================================================================
--- trunk/buildroot/toolchain/gdb/snapshot/770-debian_vfork-done-spelling.patch	2006-08-24 19:45:47 UTC (rev 15980)
+++ trunk/buildroot/toolchain/gdb/snapshot/770-debian_vfork-done-spelling.patch	2006-08-24 19:46:55 UTC (rev 15981)
@@ -1,12 +0,0 @@
-diff -ur gdb-6.3.50.20050915/gdb/linux-nat.c gdb-6.3.50.20050915-patched/gdb/linux-nat.c
---- gdb-6.3.50.20050915/gdb/linux-nat.c	2005-09-10 13:11:02.000000000 -0500
-+++ gdb-6.3.50.20050915-patched/gdb/linux-nat.c	2005-09-15 19:57:23.000000000 -0500
-@@ -458,7 +458,7 @@
- 	 generally not encounter vfork (vfork is defined to fork
- 	 in libpthread.so).
- 
--	 The holding part is very easy if we have VFORKDONE events;
-+	 The holding part is very easy if we have VFORK_DONE events;
- 	 but keeping track of both processes is beyond GDB at the
- 	 moment.  So we don't expose the parent to the rest of GDB.
- 	 Instead we quietly hold onto it until such time as we can
