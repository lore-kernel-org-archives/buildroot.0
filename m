From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 28 Mar 2008 03:39:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080328103922.139C03C33E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-28 03:39:21 -0700 (Fri, 28 Mar 2008)
New Revision: 21530

Log:
packages: enable java submenu per default like the other submenus


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-03-28 07:53:02 UTC (rev 21529)
+++ trunk/buildroot/package/Config.in	2008-03-28 10:39:21 UTC (rev 21530)
@@ -459,7 +459,7 @@
 
 menuconfig BR2_JAVA_SUPPORT
         bool "Java"
-        default n
+        default y
         help
           Support java programs (classpath, vm, osgi)
 
