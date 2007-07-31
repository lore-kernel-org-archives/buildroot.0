From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 31 Jul 2007 11:25:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070731182530.7FC0BA5E1E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-31 11:25:29 -0700 (Tue, 31 Jul 2007)
New Revision: 19363

Log:
- add a TODO file to record misc possible extensions/improvements


Added:
   trunk/buildroot/TODO


Changeset:
Added: trunk/buildroot/TODO
===================================================================
--- trunk/buildroot/TODO	                        (rev 0)
+++ trunk/buildroot/TODO	2007-07-31 18:25:29 UTC (rev 19363)
@@ -0,0 +1,8 @@
+miscellaneous TODO items that may be worth thinking about and that could
+be discussed on the mailing-list and/or implemented.
+
+
+- think about using a common --config-cache for configure
+  Should take care of expanding TARGET_CONFIGURE_ARGS for cross compiles
+  to working presets.
+
