From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 17 Sep 2007 02:26:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
Message-ID: <20070917092648.326B5A6830@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-17 02:26:47 -0700 (Mon, 17 Sep 2007)
New Revision: 19863

Log:
Revert bad patch

Modified:
   trunk/buildroot/target/device/Mirrors.in


Changeset:
Modified: trunk/buildroot/target/device/Mirrors.in
===================================================================
--- trunk/buildroot/target/device/Mirrors.in	2007-09-17 07:54:52 UTC (rev 19862)
+++ trunk/buildroot/target/device/Mirrors.in	2007-09-17 09:26:47 UTC (rev 19863)
@@ -12,8 +12,6 @@
 	  The list of mirrors is available here:
 	  http://prdownloads.sourceforge.net/index-sf.html?download
 
-if BR2_avr32
 source	"target/device/Atmel/Mirrors.in"
-endif
 
 endmenu
