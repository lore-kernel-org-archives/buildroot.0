From: andersen@uclibc.org <andersen@uclibc.org>
Date: Tue Jul 18 16:42:04 2006
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20060718234203.CD2A548B4A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-07-18 16:42:03 -0700 (Tue, 18 Jul 2006)
New Revision: 15721

Log:
stick an extra blank line after results


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2006-07-18 23:39:39 UTC (rev 15720)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2006-07-18 23:42:03 UTC (rev 15721)
@@ -148,4 +148,5 @@
 #
 #############################################################
 echo "Build system dependencies:	    Ok"
+echo ""
 
