From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 10 Jul 2008 07:58:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080710145805.319383C6BA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-10 07:58:04 -0700 (Thu, 10 Jul 2008)
New Revision: 22761

Log:
Update 'latest' kernel info

Modified:
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2008-07-10 14:16:11 UTC (rev 22760)
+++ trunk/buildroot/target/linux/Config.in.advanced	2008-07-10 14:58:04 UTC (rev 22761)
@@ -42,7 +42,7 @@
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.25.9"
+	default "2.6.25.10"
 
 config BR2_KERNEL_NEXT_VERSION
 	string
