From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 30 Aug 2008 23:26:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/generic
Message-ID: <20080831062641.6BEF93C72F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-30 23:26:40 -0700 (Sat, 30 Aug 2008)
New Revision: 23284

Log:
target/generic/mini: remove udhcpc default.script entry

It isn't provided in the target skeleton, and avahi gets the
permissions correct so it isn't needed and just confuses users.

Modified:
   trunk/buildroot/target/generic/mini_device_table.txt


Changeset:
Modified: trunk/buildroot/target/generic/mini_device_table.txt
===================================================================
--- trunk/buildroot/target/generic/mini_device_table.txt	2008-08-29 13:27:37 UTC (rev 23283)
+++ trunk/buildroot/target/generic/mini_device_table.txt	2008-08-31 06:26:40 UTC (rev 23284)
@@ -50,7 +50,6 @@
 /etc/network/if-pre-up.d		d	755	0	0	-	-	-	-	-
 /etc/network/if-down.d			d	755	0	0	-	-	-	-	-
 /etc/network/if-post-down.d		d	755	0	0	-	-	-	-	-
-/usr/share/udhcpc/default.script	f	755	0	0	-	-	-	-	-
 # uncomment this to allow starting x as non-root
 #/usr/X11R6/bin/Xfbdev		f	4755	0	0	-	-	-	-	-
 # Normal system devices
