From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 17 Oct 2008 03:19:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/external-toolchain
Message-ID: <20081017101938.CA47D3C8DA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-17 03:19:38 -0700 (Fri, 17 Oct 2008)
New Revision: 23700

Log:
Typo fix in toolchain/external-toolchain/ext-tool.mk

From: Grant Likely <grant.likely@secretlab.ca>

Comment block header documentation typo

Modified:
   trunk/buildroot/toolchain/external-toolchain/ext-tool.mk


Changeset:
Modified: trunk/buildroot/toolchain/external-toolchain/ext-tool.mk
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/ext-tool.mk	2008-10-17 07:52:50 UTC (rev 23699)
+++ trunk/buildroot/toolchain/external-toolchain/ext-tool.mk	2008-10-17 10:19:38 UTC (rev 23700)
@@ -3,7 +3,7 @@
 #
 # $1: source
 # $2: destination
-# $2: strip (y|n)       default is to strip
+# $3: strip (y|n)       default is to strip
 #
 copy_toolchain_lib_root = \
 	LIB="$(strip $1)"; \
