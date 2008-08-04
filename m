From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:07:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ltrace
Message-ID: <20080804190749.229FA3C8B1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:07:48 -0700 (Mon, 04 Aug 2008)
New Revision: 23027

Log:
ltrace: expand help text

Modified:
   trunk/buildroot/package/ltrace/Config.in


Changeset:
Modified: trunk/buildroot/package/ltrace/Config.in
===================================================================
--- trunk/buildroot/package/ltrace/Config.in	2008-08-04 19:07:45 UTC (rev 23026)
+++ trunk/buildroot/package/ltrace/Config.in	2008-08-04 19:07:48 UTC (rev 23027)
@@ -4,5 +4,8 @@
 	select BR2_PACKAGE_LIBELF_HEADERS
 	help
 	  Debugging program which runs a specified command until it exits.
+	  While the command is executing, ltrace intercepts and records
+	  the dynamic library calls which are called by the executed
+	  process and the signals received by that process.
 
 	  http://packages.debian.org/unstable/utils/ltrace.html
