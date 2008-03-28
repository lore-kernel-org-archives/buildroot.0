From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 28 Mar 2008 00:53:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/concierge
Message-ID: <20080328075302.A4B143C34D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-28 00:53:02 -0700 (Fri, 28 Mar 2008)
New Revision: 21529

Log:
concierge: cleanup help text


Modified:
   trunk/buildroot/package/concierge/Config.in


Changeset:
Modified: trunk/buildroot/package/concierge/Config.in
===================================================================
--- trunk/buildroot/package/concierge/Config.in	2008-03-28 07:32:54 UTC (rev 21528)
+++ trunk/buildroot/package/concierge/Config.in	2008-03-28 07:53:02 UTC (rev 21529)
@@ -4,5 +4,8 @@
         depends on BR2_PACKAGE_JAMVM
 
 	help
-	  Concierge is an optimized OSGi R3 framework implementations with a file footprint of about 80 kBytes. This makes it ideal for mobile or embedded devices. 
+	  Concierge is an optimized OSGi R3 framework implementations
+	  with a file footprint of about 80 kBytes. This makes it
+	  ideal for mobile or embedded devices.
+
 	  http://concierge.sourceforge.net/
