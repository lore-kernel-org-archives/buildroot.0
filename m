From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 24 Jul 2007 11:20:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/config
Message-ID: <20070724182047.84E0DA6104@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-24 11:20:46 -0700 (Tue, 24 Jul 2007)
New Revision: 19256

Log:
- no features with Apple Inc. (Heikki Lindholm)


Modified:
   trunk/buildroot/package/config/foo.h


Changeset:
Modified: trunk/buildroot/package/config/foo.h
===================================================================
--- trunk/buildroot/package/config/foo.h	2007-07-24 18:14:53 UTC (rev 19255)
+++ trunk/buildroot/package/config/foo.h	2007-07-24 18:20:46 UTC (rev 19256)
@@ -1,6 +1,9 @@
 #ifndef __KCONFIG_FOO_H
 #define __KCONFIG_FOO_H
+
+#ifndef __APPLE__
 #include <features.h>
+#endif
 #include <limits.h>
 
 #ifndef PATH_MAX
