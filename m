From: laird at uclibc.org <laird@uclibc.org>
Date: Tue, 13 Jan 2009 16:57:22 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libidn
Message-ID: <20090113165723.1761476850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2009-01-13 16:57:21 +0000 (Tue, 13 Jan 2009)
New Revision: 24818

Log:
package/libidn/Config.in: Fix line length of text

Could not count properly.... line length > 80.

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/package/libidn/Config.in


Changeset:
Modified: trunk/buildroot/package/libidn/Config.in
===================================================================
--- trunk/buildroot/package/libidn/Config.in	2009-01-13 16:36:16 UTC (rev 24817)
+++ trunk/buildroot/package/libidn/Config.in	2009-01-13 16:57:21 UTC (rev 24818)
@@ -2,5 +2,6 @@
 	bool "libidn"
 	help
 	  http://www.gnu.org/software/libidn/
-	  Libidn's purpose is to encode and decode internationalized domain names. 
+	  Libidn's purpose is to encode and decode internationalized 
+	  domain names. 
 
