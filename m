From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  1 Jul 2008 14:46:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb
Message-ID: <20080701214650.A2ADA3C67A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-01 14:46:50 -0700 (Tue, 01 Jul 2008)
New Revision: 22602

Log:
disable werror in gdb

Modified:
   trunk/buildroot/toolchain/gdb/gdb.mk


Changeset:
Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2008-07-01 21:38:03 UTC (rev 22601)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2008-07-01 21:46:50 UTC (rev 22602)
@@ -208,6 +208,7 @@
 		--disable-tui --disable-gdbtk --without-x \
 		--without-included-gettext \
 		--enable-threads \
+		--disable-werror \
 	)
 	touch $@
 
