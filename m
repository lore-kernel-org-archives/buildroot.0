From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Jun 2008 08:24:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/generic
Message-ID: <20080630152424.D17DF3C66C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-30 08:24:23 -0700 (Mon, 30 Jun 2008)
New Revision: 22576

Log:
generic: fix fb1..3 device_table.txt entries


Modified:
   trunk/buildroot/target/generic/device_table.txt


Changeset:
Modified: trunk/buildroot/target/generic/device_table.txt
===================================================================
--- trunk/buildroot/target/generic/device_table.txt	2008-06-30 13:35:14 UTC (rev 22575)
+++ trunk/buildroot/target/generic/device_table.txt	2008-06-30 15:24:23 UTC (rev 22576)
@@ -68,7 +68,7 @@
 /dev/ptmx	c	666	0	0	5	2	-	-	-
 /dev/ttyP	c	666	0	0	57	0	0	1	4
 /dev/ttyS	c	666	0	0	4	64	0	1	4
-/dev/fb		c	640	0	5	29	0	0	32	4
+/dev/fb		c	640	0	5	29	0	0	1	4
 #/dev/ttySA	c	666	0	0	204	5	0	1	3
 /dev/psaux	c	666	0	0	10	1	0	0	-
 #/dev/ppp	c	666	0	0	108	0	-	-	-
