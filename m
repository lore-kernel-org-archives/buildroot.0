From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 07:59:49 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20090128075950.4D792769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-28 07:59:48 +0000 (Wed, 28 Jan 2009)
New Revision: 25087

Log:
Config.in: remove extra white space added in r25086.

Thanks to HcE for noticing.

Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2009-01-28 06:32:39 UTC (rev 25086)
+++ trunk/buildroot/Config.in	2009-01-28 07:59:48 UTC (rev 25087)
@@ -243,7 +243,7 @@
 
 config BR2_STRIP_strip
 	bool "strip"
-	depends on !BR2_ENABLE_DEBUG &&  !BR2_ELF2FLT
+	depends on !BR2_ENABLE_DEBUG && !BR2_ELF2FLT
 	help
 	  strip   is the normal strip command
 
