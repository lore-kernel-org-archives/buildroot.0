From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 25 Sep 2007 15:03:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
Message-ID: <20070925220318.BB0ECA60CE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-25 15:03:18 -0700 (Tue, 25 Sep 2007)
New Revision: 20028

Log:
- add more help text


Modified:
   trunk/buildroot/toolchain/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/Config.in	2007-09-25 21:49:37 UTC (rev 20027)
+++ trunk/buildroot/toolchain/Config.in	2007-09-25 22:03:18 UTC (rev 20028)
@@ -6,6 +6,9 @@
 	  Select whether to use the toolchain provided by buildroot
 	  or an external toolchain.
 
+	  Some vendors provide toolchains in binary form, some in
+	  source form.
+
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	depends on !BR2_avr32
