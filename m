From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 13:47:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/blackbox
Message-ID: <20080826204702.AAA603C86E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 13:47:01 -0700 (Tue, 26 Aug 2008)
New Revision: 23216

Log:
blackbox: don't show comment if no xserver is selected

Modified:
   trunk/buildroot/package/blackbox/Config.in


Changeset:
Modified: trunk/buildroot/package/blackbox/Config.in
===================================================================
--- trunk/buildroot/package/blackbox/Config.in	2008-08-26 20:46:58 UTC (rev 23215)
+++ trunk/buildroot/package/blackbox/Config.in	2008-08-26 20:47:01 UTC (rev 23216)
@@ -5,6 +5,3 @@
 	  Blackbox is a fast, lightweight window manager for the X Window System.
 
 	  http://blackboxwm.sourceforge.net/
-
-comment "blackbox		- disabled (requires Xorg(7))"
-	depends on !(BR2_PACKAGE_XORG || BR2_PACKAGE_XORG7)
