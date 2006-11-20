From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 20 Nov 2006 05:37:09 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ipsec-tools
Message-ID: <20061120133709.ABEB548570@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-20 05:37:09 -0800 (Mon, 20 Nov 2006)
New Revision: 16588

Log:
- setkeys needs libfl


Modified:
   trunk/buildroot/package/ipsec-tools/Config.in


Changeset:
Modified: trunk/buildroot/package/ipsec-tools/Config.in
===================================================================
--- trunk/buildroot/package/ipsec-tools/Config.in	2006-11-20 01:13:09 UTC (rev 16587)
+++ trunk/buildroot/package/ipsec-tools/Config.in	2006-11-20 13:37:09 UTC (rev 16588)
@@ -2,6 +2,7 @@
 	bool "ipsec-tools"
 	default n
         select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_FLEX
 	help
 	  This package is required to support IPSec for Linux 2.6+
 
