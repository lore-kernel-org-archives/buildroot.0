From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Mon, 17 Dec 2007 05:14:30 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
Message-ID: <20071217131430.F105F1200F2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-12-17 05:14:29 -0800 (Mon, 17 Dec 2007)
New Revision: 20657

Log:
fix default GNU URL

Modified:
   trunk/buildroot/target/device/Config.in.mirrors


Changeset:
Modified: trunk/buildroot/target/device/Config.in.mirrors
===================================================================
--- trunk/buildroot/target/device/Config.in.mirrors	2007-12-17 12:29:06 UTC (rev 20656)
+++ trunk/buildroot/target/device/Config.in.mirrors	2007-12-17 13:14:29 UTC (rev 20657)
@@ -27,7 +27,7 @@
 
 config BR2_GNU_MIRROR
 	string "GNU Software mirror"
-	default "http://ftp.gnu.org"
+	default "http://ftp.gnu.org/pub/gnu"
 	help
 	  GNU has multiple software mirrors scattered around the world.
 	  The following allows you to select your preferred mirror.
@@ -35,7 +35,7 @@
 	  Have a look on the gnu.org site for a list of mirrors, then enter
 	  the URL to the base directory.  Examples:
 
-	     http://ftp.gnu.org/pub/gnu (XX = country code)
+	     http://ftp.gnu.org/pub/gnu
 	     http://mirror.aarnet.edu.au/pub/gnu
 
 source	"target/device/Atmel/Config.in.mirrors"
