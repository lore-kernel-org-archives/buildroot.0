From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 13:24:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/project
Message-ID: <20070919202401.ACF3330088@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 13:24:01 -0700 (Wed, 19 Sep 2007)
New Revision: 19900

Log:
- add a SVN_UP command for updating an already checked-out tree


Modified:
   trunk/buildroot/project/Makefile.in


Changeset:
Modified: trunk/buildroot/project/Makefile.in
===================================================================
--- trunk/buildroot/project/Makefile.in	2007-09-19 20:22:58 UTC (rev 19899)
+++ trunk/buildroot/project/Makefile.in	2007-09-19 20:24:01 UTC (rev 19900)
@@ -11,8 +11,10 @@
 #"))
 WGET:=$(strip $(subst ",, $(BR2_WGET))) $(SPIDER)
 #"))
-SVN:=$(strip $(subst ",, $(BR2_SVN)))
+SVN_CO:=$(strip $(subst ",, $(BR2_SVN_CO)))
 #"))
+SVN_UP:=$(strip $(subst ",, $(BR2_SVN_UP)))
+#"))
 GIT:=$(strip $(subst ",, $(BR2_GIT)))
 #"))
 ZCAT:=$(strip $(subst ",, $(BR2_ZCAT)))
