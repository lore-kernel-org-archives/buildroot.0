From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 28 Mar 2008 14:42:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ace_of_penguins
Message-ID: <20080328214244.7E57E3C484@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-28 14:42:43 -0700 (Fri, 28 Mar 2008)
New Revision: 21543

Log:
ace of penguins: cleanup help text


Modified:
   trunk/buildroot/package/ace_of_penguins/Config.in


Changeset:
Modified: trunk/buildroot/package/ace_of_penguins/Config.in
===================================================================
--- trunk/buildroot/package/ace_of_penguins/Config.in	2008-03-28 21:27:03 UTC (rev 21542)
+++ trunk/buildroot/package/ace_of_penguins/Config.in	2008-03-28 21:42:43 UTC (rev 21543)
@@ -4,7 +4,9 @@
 	default n
 	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
 	help
-	  The Ace of Penguins is a set of Unix/X solitaire games based on the ones available for Windows but with a number of enhancements.
+	  The Ace of Penguins is a set of Unix/X solitaire games based
+	  on the ones available for Windows but with a number of
+	  enhancements.
 
 	  http://www.delorie.com/store/ace/
 
