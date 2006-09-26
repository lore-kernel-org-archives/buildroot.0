From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Sep 2006 08:56:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/readline
Message-ID: <20060926155604.93976486B2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-09-26 08:56:03 -0700 (Tue, 26 Sep 2006)
New Revision: 16226

Log:
The target is readline-target, not readline_target

Modified:
   trunk/buildroot/package/readline/readline.mk


Changeset:
Modified: trunk/buildroot/package/readline/readline.mk
===================================================================
--- trunk/buildroot/package/readline/readline.mk	2006-09-26 12:48:43 UTC (rev 16225)
+++ trunk/buildroot/package/readline/readline.mk	2006-09-26 15:56:03 UTC (rev 16226)
@@ -86,5 +86,5 @@
 TARGETS+=readline
 endif
 ifeq ($(strip $(BR2_PACKAGE_READLINE_TARGET)),y)
-TARGETS+=readline_target
+TARGETS+=readline-target
 endif
