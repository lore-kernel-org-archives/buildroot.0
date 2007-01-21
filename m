From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 21 Jan 2007 14:31:04 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20070121223104.3AF4748594@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-21 14:31:03 -0800 (Sun, 21 Jan 2007)
New Revision: 17444

Log:
- remove sedtest temporary file


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-01-21 21:49:55 UTC (rev 17443)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-01-21 22:31:03 UTC (rev 17444)
@@ -101,6 +101,7 @@
 else
 	echo "sed works:					Ok"
 fi
+rm -f .sedtest
 XSED=$HOST_SED_DIR/bin/sed
 
 #############################################################
