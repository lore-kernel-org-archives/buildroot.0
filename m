From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 19 Jan 2007 03:00:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070119110005.24E4E485A3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-19 03:00:05 -0800 (Fri, 19 Jan 2007)
New Revision: 17376

Log:
- add missing space


Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-01-19 10:57:03 UTC (rev 17375)
+++ trunk/buildroot/docs/buildroot.html	2007-01-19 11:00:05 UTC (rev 17376)
@@ -563,7 +563,7 @@
     configures the software. It depends on the previous target (the
     hidden <code>.source</code> file) so that we are sure the software has
     been uncompressed. In order to configure it, it basically runs the
-    well-known <code>./configure</code>script. As we may be doing
+    well-known <code>./configure</code> script. As we may be doing
     cross-compilation, <code>target</code>, <code>host</code> and
     <code>build</code> arguments are given. The prefix is also set to
     <code>/usr</code>, not because the software will be installed in
