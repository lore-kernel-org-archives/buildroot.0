From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 13 Jul 2007 05:21:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070713122120.4ADB1A6833@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-13 05:21:19 -0700 (Fri, 13 Jul 2007)
New Revision: 19081

Log:
- use established style


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-13 05:03:46 UTC (rev 19080)
+++ trunk/buildroot/Makefile	2007-07-13 12:21:19 UTC (rev 19081)
@@ -156,9 +156,12 @@
 TARGETS:=uclibc
 endif
 
-PROJECT:=$(strip $(subst ",,$(BR2_PROJECT)))  # "))
-TARGET_HOSTNAME:=$(strip $(subst ",,$(BR2_HOSTNAME))) # " ))
-BANNER:=$(strip $(subst ",,$(BR2_BANNER))) # " ))
+PROJECT:=$(strip $(subst ",,$(BR2_PROJECT)))
+#"))
+TARGET_HOSTNAME:=$(strip $(subst ",,$(BR2_HOSTNAME)))
+#"))
+BANNER:=$(strip $(subst ",,$(BR2_BANNER)))
+#"))
 
 
 include toolchain/Makefile.in
