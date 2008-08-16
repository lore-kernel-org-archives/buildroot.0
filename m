From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 16 Aug 2008 05:00:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pcre
Message-ID: <20080816120000.053F7F800C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-16 04:59:59 -0700 (Sat, 16 Aug 2008)
New Revision: 23090

Log:
pcre: add homepage to description

Modified:
   trunk/buildroot/package/pcre/Config.in


Changeset:
Modified: trunk/buildroot/package/pcre/Config.in
===================================================================
--- trunk/buildroot/package/pcre/Config.in	2008-08-16 11:59:56 UTC (rev 23089)
+++ trunk/buildroot/package/pcre/Config.in	2008-08-16 11:59:59 UTC (rev 23090)
@@ -2,3 +2,5 @@
 	bool "pcre"
 	help
 	  Perl Compatible Regular Expressions
+
+	  http://www.pcre.org/
