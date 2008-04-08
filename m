From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Tue,  8 Apr 2008 07:45:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bootutils
Message-ID: <20080408144533.7BD6BF8006@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-08 07:45:32 -0700 (Tue, 08 Apr 2008)
New Revision: 21672

Log:
* Fixed bootutils url to point to projects website and not project page on freshmeat


Modified:
   trunk/buildroot/package/bootutils/Config.in


Changeset:
Modified: trunk/buildroot/package/bootutils/Config.in
===================================================================
--- trunk/buildroot/package/bootutils/Config.in	2008-04-08 13:09:29 UTC (rev 21671)
+++ trunk/buildroot/package/bootutils/Config.in	2008-04-08 14:45:32 UTC (rev 21672)
@@ -7,5 +7,5 @@
 	  either by label or explicit label= on the kernel command line, 
 	  mounting it, and 'switchroot'ing is automated.
 
-	  http://www.freshmeat.net/projects/bootutils
+	  http://bootutils.pr.linuxrulz.org/
 
