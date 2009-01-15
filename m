From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 15 Jan 2009 14:50:04 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/project
Message-ID: <20090115145004.C752376850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-15 14:50:03 +0000 (Thu, 15 Jan 2009)
New Revision: 24856

Log:
BR2_BANNER: set to 'Welcome to Buildroot'

Seems a bit more sensible as default.

Modified:
   trunk/buildroot/project/Config.in


Changeset:
Modified: trunk/buildroot/project/Config.in
===================================================================
--- trunk/buildroot/project/Config.in	2009-01-15 08:43:33 UTC (rev 24855)
+++ trunk/buildroot/project/Config.in	2009-01-15 14:50:03 UTC (rev 24856)
@@ -19,7 +19,7 @@
 
 config BR2_BANNER
 	string "banner"
-	default "Welcome to the Erik's uClibc development environment."
+	default "Welcome to Buildroot"
 	help
 	  The banner string is stored in "/etc/issue"
 
