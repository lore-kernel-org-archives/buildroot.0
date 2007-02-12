From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 12 Feb 2007 02:42:01 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20070212104201.95E4A485C6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-12 02:41:59 -0800 (Mon, 12 Feb 2007)
New Revision: 17861

Log:
- cosmetics


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-02-12 10:14:12 UTC (rev 17860)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-02-12 10:41:59 UTC (rev 17861)
@@ -50,7 +50,7 @@
 	echo "INCLUDES clean:					FALSE"
 	/bin/echo -e "WARNING: INCLUDES contains:\n\t'$INCLUDES'"
 else
-	echo "INCLUDES clean:				Ok"
+	echo "INCLUDES clean:					Ok"
 fi
 
 if test -n "$CXXFLAGS" ; then
