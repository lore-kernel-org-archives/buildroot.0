From: laird at uclibc.org <laird@uclibc.org>
Date: Wed, 14 Jan 2009 08:31:45 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libidn
Message-ID: <20090114083145.8BEC4769A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2009-01-14 08:31:41 +0000 (Wed, 14 Jan 2009)
New Revision: 24825

Log:
package/libidn/Config.in: Fix layout of text as per coding guidelines.

Update description to match required ->
help
	Description
	Empty line
	Homepage

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/package/libidn/Config.in


Changeset:
Modified: trunk/buildroot/package/libidn/Config.in
===================================================================
--- trunk/buildroot/package/libidn/Config.in	2009-01-14 00:28:03 UTC (rev 24824)
+++ trunk/buildroot/package/libidn/Config.in	2009-01-14 08:31:41 UTC (rev 24825)
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBIDN
 	bool "libidn"
 	help
-	  http://www.gnu.org/software/libidn/
 	  Libidn's purpose is to encode and decode internationalized 
 	  domain names. 
 
+	  http://www.gnu.org/software/libidn/
