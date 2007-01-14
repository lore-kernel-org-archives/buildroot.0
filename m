From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 16:54:15 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/acpid
Message-ID: <20070114005415.7B46348585@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 16:54:14 -0800 (Sat, 13 Jan 2007)
New Revision: 17267

Log:
x86 is the only thing that uses this monstrosity.


Modified:
   trunk/buildroot/package/acpid/Config.in


Changeset:
Modified: trunk/buildroot/package/acpid/Config.in
===================================================================
--- trunk/buildroot/package/acpid/Config.in	2007-01-13 21:45:00 UTC (rev 17266)
+++ trunk/buildroot/package/acpid/Config.in	2007-01-14 00:54:14 UTC (rev 17267)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ACPID
 	bool "acpid"
+	depends on BR2_x86_64 || BR2_i386
 	default n
 	help
 	  Advanced Configuration and Power Interface event daemon.
