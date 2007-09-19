From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 11:18:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/generic
Message-ID: <20070919181810.33FD7A658A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 11:18:09 -0700 (Wed, 19 Sep 2007)
New Revision: 19896

Log:
- add null


Modified:
   trunk/buildroot/target/generic/mini_device_table.txt


Changeset:
Modified: trunk/buildroot/target/generic/mini_device_table.txt
===================================================================
--- trunk/buildroot/target/generic/mini_device_table.txt	2007-09-19 18:07:58 UTC (rev 19895)
+++ trunk/buildroot/target/generic/mini_device_table.txt	2007-09-19 18:18:09 UTC (rev 19896)
@@ -56,7 +56,7 @@
 # Normal system devices
 #/dev/mem	c	640	0	0	1	1	0	0	-
 #/dev/kmem	c	640	0	0	1	2	0	0	-
-#/dev/null	c	666	0	0	1	3	0	0	-
+/dev/null	c	666	0	0	1	3	0	0	-
 #/dev/zero	c	666	0	0	1	5	0	0	-
 #/dev/random	c	666	0	0	1	8	0	0	-
 #/dev/urandom	c	666	0	0	1	9	0	0	-
