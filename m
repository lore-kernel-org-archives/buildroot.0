From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  2 Sep 2008 06:54:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/file
Message-ID: <20080902135459.34CAB3C68B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-02 06:54:58 -0700 (Tue, 02 Sep 2008)
New Revision: 23306

Log:
file: select zlib

file depends on zlib, so make it visible in kconfig.

Modified:
   trunk/buildroot/package/file/Config.in


Changeset:
Modified: trunk/buildroot/package/file/Config.in
===================================================================
--- trunk/buildroot/package/file/Config.in	2008-09-02 13:54:55 UTC (rev 23305)
+++ trunk/buildroot/package/file/Config.in	2008-09-02 13:54:58 UTC (rev 23306)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FILE
 	bool "file"
+	select BR2_PACKAGE_ZLIB
 	help
 	  Program to identify a file's format by scanning binary data
 	  for known patterns.
