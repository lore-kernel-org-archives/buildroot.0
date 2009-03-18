From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 21:21:39 +0000 (UTC)
Subject: [Buildroot] svn commit: [25730] trunk/buildroot/package/expat
Message-ID: <20090318212139.DDBBF7763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 21:21:39 +0000 (Wed, 18 Mar 2009)
New Revision: 25730

Log:
expat: fixup help text

Modified:
   trunk/buildroot/package/expat/Config.in


Changeset:
Modified: trunk/buildroot/package/expat/Config.in
===================================================================
--- trunk/buildroot/package/expat/Config.in	2009-03-18 21:21:34 UTC (rev 25729)
+++ trunk/buildroot/package/expat/Config.in	2009-03-18 21:21:39 UTC (rev 25730)
@@ -1,7 +1,6 @@
-#
-
 config BR2_PACKAGE_EXPAT
 	bool"expat"
 	help
 	  The Expat XML Parser.
 
+	  http://expat.sourceforge.net
