From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  9 Feb 2007 05:35:42 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070209133542.5479C48652@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-09 05:35:41 -0800 (Fri, 09 Feb 2007)
New Revision: 17835

Log:
- speeling fix


Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-02-09 13:33:26 UTC (rev 17834)
+++ trunk/buildroot/Config.in	2007-02-09 13:35:41 UTC (rev 17835)
@@ -362,10 +362,10 @@
 	  WARNING: This is highly experimental at the moment.
 
 config BR2_DEPRECATED
-	bool "Show packages that are depretated or obsolete"
+	bool "Show packages that are deprecated or obsolete"
 	default n
 	help
-	  This option hides outdated/obsoleted versions of packages.
+	  This option hides outdated/obsolete versions of packages.
 
 endmenu
 
