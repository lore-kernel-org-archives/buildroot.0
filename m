From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  9 Jul 2008 00:14:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gperf
Message-ID: <20080709071454.84F413C6FB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-09 00:14:54 -0700 (Wed, 09 Jul 2008)
New Revision: 22697

Log:
gperf: fix upstream url

Modified:
   trunk/buildroot/package/gperf/Config.in


Changeset:
Modified: trunk/buildroot/package/gperf/Config.in
===================================================================
--- trunk/buildroot/package/gperf/Config.in	2008-07-09 04:27:45 UTC (rev 22696)
+++ trunk/buildroot/package/gperf/Config.in	2008-07-09 07:14:54 UTC (rev 22697)
@@ -4,4 +4,4 @@
 	help
 	  A 'perfect hash function' generator
 
-	  $(BR2_GNU_MIRROR)
+	  http://www.gnu.org/software/gperf/
