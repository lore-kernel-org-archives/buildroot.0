From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 20 Mar 2009 08:38:33 +0000 (UTC)
Subject: [Buildroot] svn commit: [25768]
	trunk/buildroot/target/generic/target_skeleton/etc
Message-ID: <20090320083833.E0E597643D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-20 08:38:33 +0000 (Fri, 20 Mar 2009)
New Revision: 25768

Log:
target/generic: skeleton: add netdev group for dbus

Modified:
   trunk/buildroot/target/generic/target_skeleton/etc/group


Changeset:
Modified: trunk/buildroot/target/generic/target_skeleton/etc/group
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/etc/group	2009-03-20 07:47:29 UTC (rev 25767)
+++ trunk/buildroot/target/generic/target_skeleton/etc/group	2009-03-20 08:38:33 UTC (rev 25768)
@@ -10,6 +10,7 @@
 staff:x:50:
 haldaemon:x:68:
 dbus:x:81:
+netdev:x:82:
 nobody:x:99:
 nogroup:x:99:
 users:x:100:
