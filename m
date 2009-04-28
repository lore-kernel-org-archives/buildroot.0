From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 28 Apr 2009 18:42:08 +0000 (UTC)
Subject: [Buildroot] svn commit: [26231] trunk/buildroot/toolchain/gdb:
	6.2.1 6.3
Message-ID: <20090428184208.F283F77118@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-28 18:42:08 +0000 (Tue, 28 Apr 2009)
New Revision: 26231

Log:
toolchain/gdb: remove ancient deprecated versions

They shouldn't be used anymore, needs havily patching (6.3 has more than
200k patches) and no one tests them with current toolchains.

Removed:
   trunk/buildroot/toolchain/gdb/6.2.1/100-uclibc-conf.patch
   trunk/buildroot/toolchain/gdb/6.2.1/200-uclibc-readline-conf.patch
   trunk/buildroot/toolchain/gdb/6.2.1/400-mips-coredump.patch-2.4.23-29
   trunk/buildroot/toolchain/gdb/6.2.1/500-thread-timeout.patch
   trunk/buildroot/toolchain/gdb/6.3/100-uclibc-conf.patch
   trunk/buildroot/toolchain/gdb/6.3/200-uclibc-readline-conf.patch
   trunk/buildroot/toolchain/gdb/6.3/400-mips-coredump.patch-2.4.23-29
   trunk/buildroot/toolchain/gdb/6.3/500-thread-timeout.patch
   trunk/buildroot/toolchain/gdb/6.3/600-debian_10.selected-frame.patch
   trunk/buildroot/toolchain/gdb/6.3/620-debian_static-thread-db.patch
   trunk/buildroot/toolchain/gdb/6.3/630-debian_24.tracepoint-segv.patch
   trunk/buildroot/toolchain/gdb/6.3/640-debian_dwarf2-frame-signal-unwinder.patch
   trunk/buildroot/toolchain/gdb/6.3/650-debian_vsyscall-gdb-support.patch
   trunk/buildroot/toolchain/gdb/6.3/660-debian_dwarf-cfa-restore.patch
   trunk/buildroot/toolchain/gdb/6.3/680-debian_sim-destdir.patch
   trunk/buildroot/toolchain/gdb/6.3/690-debian_member-field-symtab.patch
   trunk/buildroot/toolchain/gdb/6.3/700-debian_cp-pass-by-reference.patch
   trunk/buildroot/toolchain/gdb/6.3/710-debian_thread-db-multiple-libraries.patch
   trunk/buildroot/toolchain/gdb/6.3/720-debian_static-threads-test.patch
   trunk/buildroot/toolchain/gdb/6.3/730-debian_gdb-fix-tracefork-check.patch
   trunk/buildroot/toolchain/gdb/6.3/740-debian_make-cv-type-crash.patch
   trunk/buildroot/toolchain/gdb/6.3/750-debian_sparc-singlestep.patch
   trunk/buildroot/toolchain/gdb/6.3/760-debian_vsyscall-bfd-close-result.patch
   trunk/buildroot/toolchain/gdb/6.3/770-debian_vfork-done-spelling.patch
   trunk/buildroot/toolchain/gdb/6.3/780-debian_gdbserver-rdynamic.patch
   trunk/buildroot/toolchain/gdb/6.3/790-debian_dwarf2-cfi-warning.patch
   trunk/buildroot/toolchain/gdb/6.3/800-debian_linux-use-underscore-exit.patch
   trunk/buildroot/toolchain/gdb/6.3/810-debian_bfd-no-kylix-crash.patch
   trunk/buildroot/toolchain/gdb/6.3/820-debian_disable-linux-fork-messages.patch

Modified:
   trunk/buildroot/toolchain/gdb/Config.in
   trunk/buildroot/toolchain/gdb/gdb.mk


Changeset:

Sorry, the patch is too large to include (4515 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=26231
