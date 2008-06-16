From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 00:15:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
Message-ID: <20080616071551.53B933C94D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-16 00:15:44 -0700 (Mon, 16 Jun 2008)
New Revision: 22365

Log:
toolchain: move elf2flt+mklibs under 'Common Toolchain Options'


Modified:
   trunk/buildroot/toolchain/Config.in.2


Changeset:
Modified: trunk/buildroot/toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/Config.in.2	2008-06-16 07:15:33 UTC (rev 22364)
+++ trunk/buildroot/toolchain/Config.in.2	2008-06-16 07:15:44 UTC (rev 22365)
@@ -8,11 +8,11 @@
 source "toolchain/gcc/Config.in"
 source "toolchain/ccache/Config.in"
 source "toolchain/gdb/Config.in"
-source "toolchain/elf2flt/Config.in"
-source "toolchain/mklibs/Config.in"
 
 comment "Common Toolchain Options"
 
+source "toolchain/elf2flt/Config.in"
+source "toolchain/mklibs/Config.in"
 source "toolchain/sstrip/Config.in"
 
 config BR2_ENABLE_MULTILIB
