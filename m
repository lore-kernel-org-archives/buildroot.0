From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:18:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/olsr
Message-ID: <20080827201854.D36B23C84E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:18:54 -0700 (Wed, 27 Aug 2008)
New Revision: 23252

Log:
olsr: fix long help text lines

Modified:
   trunk/buildroot/package/olsr/Config.in


Changeset:
Modified: trunk/buildroot/package/olsr/Config.in
===================================================================
--- trunk/buildroot/package/olsr/Config.in	2008-08-27 20:18:51 UTC (rev 23251)
+++ trunk/buildroot/package/olsr/Config.in	2008-08-27 20:18:54 UTC (rev 23252)
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_OLSR
 	bool "OLSR mesh networking Daemon"
 	help
-	  olsr
-	
-	  The Optimized Link State Routing protocol (OLSR) is a routing protocol that is optimised
-	  for mobile ad-hoc networks, sometimes called wireless mesh networks. It is a proactive
-	  link-state routing protocol that floods a full topology table to all nodes in the network
-	  which then compute optimal forwarding paths locally.
+	  The Optimized Link State Routing protocol (OLSR) is a
+	  routing protocol that is optimised for mobile ad-hoc
+	  networks, sometimes called wireless mesh networks. It is a
+	  proactive link-state routing protocol that floods a full
+	  topology table to all nodes in the network which then
+	  compute optimal forwarding paths locally.
 
 	  http://www.olsr.org/
