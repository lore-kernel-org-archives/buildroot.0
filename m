From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 15 Feb 2007 06:30:57 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20070215143057.28E3C48598@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-15 06:30:56 -0800 (Thu, 15 Feb 2007)
New Revision: 17899

Log:
- might make sense not to print ok if it was nak


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-02-15 14:11:59 UTC (rev 17898)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-02-15 14:30:56 UTC (rev 17899)
@@ -252,8 +252,9 @@
 	echo "makeinfo installed:		    FALSE"
 	/bin/echo -e "\n\nMost likely some packages will fail to build their documentation"
 	/bin/echo -e "Either install 'makeinfo' on your host or fix the respective packages"
+else
+	echo "makeinfo installed:				Ok"
 fi
-echo "makeinfo installed:				Ok"
 
 
 #############################################################
