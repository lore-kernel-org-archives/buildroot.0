From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 29 Sep 2007 07:40:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/generic
Message-ID: <20070929144000.2A463A6816@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-29 07:39:59 -0700 (Sat, 29 Sep 2007)
New Revision: 20114

Log:
- add ttyAMA


Modified:
   trunk/buildroot/target/generic/mini_device_table.txt


Changeset:
Modified: trunk/buildroot/target/generic/mini_device_table.txt
===================================================================
--- trunk/buildroot/target/generic/mini_device_table.txt	2007-09-29 14:27:39 UTC (rev 20113)
+++ trunk/buildroot/target/generic/mini_device_table.txt	2007-09-29 14:39:59 UTC (rev 20114)
@@ -54,6 +54,7 @@
 # uncomment this to allow starting x as non-root
 #/usr/X11R6/bin/Xfbdev		f	4755	0	0	-	-	-	-	-
 # Normal system devices
+#<name>		<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
 #/dev/mem	c	640	0	0	1	1	0	0	-
 #/dev/kmem	c	640	0	0	1	2	0	0	-
 /dev/null	c	666	0	0	1	3	0	0	-
@@ -67,6 +68,7 @@
 /dev/console	c	666	0	0	5	1	-	-	-
 #/dev/tty	c	666	0	0	5	0	-	-	-
 #/dev/tty	c	666	0	0	4	0	0	1	8
+#/dev/ttyAMA	c	600	0	0	204	64	0	1	1
 #/dev/ttyp	c	666	0	0	3	0	0	1	10
 #/dev/ptyp	c       666     0       0       2       0       0       1       10
 #/dev/ptmx	c	666	0	0	5	2	-	-	-
