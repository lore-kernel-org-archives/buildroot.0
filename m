From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 17 Aug 2008 06:20:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/speex
Message-ID: <20080817132028.EA6F33C700@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-17 06:20:28 -0700 (Sun, 17 Aug 2008)
New Revision: 23097

Log:
speex: select libogg

Speex depends on libogg, so make it visible in Kconfig

Modified:
   trunk/buildroot/package/speex/Config.in


Changeset:
Modified: trunk/buildroot/package/speex/Config.in
===================================================================
--- trunk/buildroot/package/speex/Config.in	2008-08-17 13:20:25 UTC (rev 23096)
+++ trunk/buildroot/package/speex/Config.in	2008-08-17 13:20:28 UTC (rev 23097)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SPEEX
 	bool "speex"
+	select BR2_PACKAGE_LIBOGG
 	help
 	  Speex is an Open Source/Free Software patent-free
 	  audio compression format designed for speech.
