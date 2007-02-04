From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  4 Feb 2007 11:20:46 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/microperl
Message-ID: <20070204192046.6D50148658@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-04 11:20:45 -0800 (Sun, 04 Feb 2007)
New Revision: 17768

Log:
- minor tweak to naming of microperl module list in the config


Modified:
   trunk/buildroot/package/microperl/Config.in


Changeset:
Modified: trunk/buildroot/package/microperl/Config.in
===================================================================
--- trunk/buildroot/package/microperl/Config.in	2007-02-04 18:21:58 UTC (rev 17767)
+++ trunk/buildroot/package/microperl/Config.in	2007-02-04 19:20:45 UTC (rev 17768)
@@ -5,7 +5,7 @@
 	  Perl without operating-specific functions such as readdir.
 
 config BR2_PACKAGE_MICROPERL_MODULES
-	string "perl modules"
+	string "microperl modules"
 	default ""
 	depends on BR2_PACKAGE_MICROPERL
 	help
