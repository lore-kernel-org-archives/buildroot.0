From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 16 Feb 2007 01:34:12 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20070216093412.5115D48560@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-16 01:34:11 -0800 (Fri, 16 Feb 2007)
New Revision: 17904

Log:
- mention the package that usually provides makeinfo


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-02-16 09:32:12 UTC (rev 17903)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-02-16 09:34:11 UTC (rev 17904)
@@ -251,7 +251,8 @@
 if ! which makeinfo > /dev/null ; then \
 	echo "makeinfo installed:		    FALSE"
 	/bin/echo -e "\n\nMost likely some packages will fail to build their documentation"
-	/bin/echo -e "Either install 'makeinfo' on your host or fix the respective packages"
+	echo "Either install 'makeinfo' on your host or fix the respective packages."
+	echo "Makeinfo can usually be found in the texinfo package for your host."
 else
 	echo "makeinfo installed:				Ok"
 fi
