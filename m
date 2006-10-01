From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  1 Oct 2006 11:34:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20061001183445.8A884485DD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-10-01 11:34:45 -0700 (Sun, 01 Oct 2006)
New Revision: 16285

Log:
- add missing hung from the BR2_ZCAT introduction


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2006-10-01 16:44:04 UTC (rev 16284)
+++ trunk/buildroot/package/Makefile.in	2006-10-01 18:34:45 UTC (rev 16285)
@@ -8,6 +8,8 @@
 #"
 SVN:=$(strip $(subst ",, $(BR2_SVN)))
 #"
+ZCAT:=$(strip $(subst ",, $(BR2_ZCAT)))
+#"
 TAR_OPTIONS=$(subst ",, $(BR2_TAR_OPTIONS)) -xf
 #"
 
