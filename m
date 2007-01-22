From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 22 Jan 2007 04:27:34 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070122122734.8F8354857C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-22 04:27:33 -0800 (Mon, 22 Jan 2007)
New Revision: 17457

Log:
- fix typo in compressor submenu


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-22 09:36:41 UTC (rev 17456)
+++ trunk/buildroot/package/Config.in	2007-01-22 12:27:33 UTC (rev 17457)
@@ -291,7 +291,7 @@
 	help
 	  Support for compressors and decompressors like lzo, lzma, bzip2
 
-if BR2_COMPRESSOR_SUPPORT_SUPPORT
+if BR2_COMPRESSOR_SUPPORT
 source "package/gzip/Config.in"
 source "package/lzo/Config.in"
 source "package/lzma/Config.in"
