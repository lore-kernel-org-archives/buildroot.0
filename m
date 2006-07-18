From: andersen@uclibc.org <andersen@uclibc.org>
Date: Tue Jul 18 16:54:32 2006
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20060718235432.0EC5C48B57@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-07-18 16:54:31 -0700 (Tue, 18 Jul 2006)
New Revision: 15723

Log:
trivial cosmetic stuff


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2006-07-18 23:43:58 UTC (rev 15722)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2006-07-18 23:54:31 UTC (rev 15723)
@@ -3,8 +3,8 @@
 set -e
 #set -x
 
+echo ""
 echo "Checking build system dependencies:"
-echo ""
 
 #############################################################
 #
