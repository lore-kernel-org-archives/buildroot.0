From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Sun, 16 Mar 2008 06:26:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080316132616.AA30012011B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-16 06:26:14 -0700 (Sun, 16 Mar 2008)
New Revision: 21341

Log:
change gcc default optimization to S instead of zero. It is causing kernel compilation problems for people

Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2008-03-16 09:11:31 UTC (rev 21340)
+++ trunk/buildroot/Config.in	2008-03-16 13:26:14 UTC (rev 21341)
@@ -253,7 +253,7 @@
 
 choice
 	prompt "gcc optimization level"
-	default BR2_OPTIMIZE_0
+	default BR2_OPTIMIZE_S
 	help
 	  Set the optimization level for gcc
 
