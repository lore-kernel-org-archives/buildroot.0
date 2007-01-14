From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 20:25:42 -0800 (PST)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/generic/target_skeleton/etc
Message-ID: <20070114042542.4258F485C2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 20:25:41 -0800 (Sat, 13 Jan 2007)
New Revision: 17290

Log:
Add users and groups for D-Bus and HAL.


Modified:
   trunk/buildroot/target/generic/target_skeleton/etc/group
   trunk/buildroot/target/generic/target_skeleton/etc/passwd


Changeset:
Modified: trunk/buildroot/target/generic/target_skeleton/etc/group
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/etc/group	2007-01-14 04:20:57 UTC (rev 17289)
+++ trunk/buildroot/target/generic/target_skeleton/etc/group	2007-01-14 04:25:41 UTC (rev 17290)
@@ -8,6 +8,8 @@
 wheel:x:10:root
 utmp:x:43:
 staff:x:50:
+haldaemon:x:68:
+dbus:x:81:
 nobody:x:99:
 nogroup:x:99:
 users:x:100:

Modified: trunk/buildroot/target/generic/target_skeleton/etc/passwd
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/etc/passwd	2007-01-14 04:20:57 UTC (rev 17289)
+++ trunk/buildroot/target/generic/target_skeleton/etc/passwd	2007-01-14 04:25:41 UTC (rev 17290)
@@ -8,6 +8,8 @@
 www-data:x:33:33:www-data:/var/www:/bin/sh
 backup:x:34:34:backup:/var/backups:/bin/sh
 operator:x:37:37:Operator:/var:/bin/sh
+haldaemon:x:68:68:hald:/:/bin/sh
+dbus:x:81:81:dbus:/var/run/dbus:/bin/sh
+nobody:x:99:99:nobody:/home:/bin/sh
 sshd:x:103:99:Operator:/var:/bin/sh
-nobody:x:99:99:nobody:/home:/bin/sh
 default:x:1000:1000:Default non-root user:/home/default:/bin/sh
