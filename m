From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 12 Jan 2009 07:43:23 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20090112074323.83C17766E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-12 07:43:23 +0000 (Mon, 12 Jan 2009)
New Revision: 24782

Log:
Add some whitespace to output, aligning comments, when added

Modified:
   trunk/buildroot/scripts/mkpkg


Changeset:
Modified: trunk/buildroot/scripts/mkpkg
===================================================================
--- trunk/buildroot/scripts/mkpkg	2009-01-12 07:42:09 UTC (rev 24781)
+++ trunk/buildroot/scripts/mkpkg	2009-01-12 07:43:23 UTC (rev 24782)
@@ -33,10 +33,10 @@
 	grep "\.tar\." ${LOG} > ${DEPENDENCY}
 	if [ ${test} == ${OK} ] ; then
 		mv ${LOG} ${LOG_OK_FILE}
-		echo "OK"
+		echo "OK	"
 	else
 		mv ${LOG} ${LOG_FAIL_FILE}
-		echo "FAIL"
+		echo "FAIL	"
 	fi
 }
 
