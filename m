From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  7 Dec 2008 13:22:45 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb
Message-ID: <20081207212245.F331C3C670@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-07 13:22:45 -0800 (Sun, 07 Dec 2008)
New Revision: 24301

Log:
toolchain/gdb: add -source target

Modified:
   trunk/buildroot/toolchain/gdb/gdb.mk


Changeset:
Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2008-12-07 06:55:36 UTC (rev 24300)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2008-12-07 21:22:45 UTC (rev 24301)
@@ -63,6 +63,7 @@
 
 gdb-patched: $(GDB_DIR)/.unpacked
 
+gdb-source: $(DL_DIR)/$(GDB_SOURCE)
 gdb-dirclean:
 	rm -rf $(GDB_DIR)
 
