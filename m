From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 29 Mar 2008 16:10:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
Message-ID: <20080329231048.1533A3C48B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-29 16:10:47 -0700 (Sat, 29 Mar 2008)
New Revision: 21568

Log:
Force use of bash for patching

Modified:
   trunk/buildroot/toolchain/patch-kernel.sh


Changeset:
Modified: trunk/buildroot/toolchain/patch-kernel.sh
===================================================================
--- trunk/buildroot/toolchain/patch-kernel.sh	2008-03-29 23:09:46 UTC (rev 21567)
+++ trunk/buildroot/toolchain/patch-kernel.sh	2008-03-29 23:10:47 UTC (rev 21568)
@@ -1,4 +1,4 @@
-#! /bin/sh
+#! /bin/bash
 # A little script I whipped up to make it easy to
 # patch source trees and have sane error handling
 # -Erik
