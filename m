From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 31 May 2008 00:27:44 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/generic/target_skeleton/etc
Message-ID: <20080531072744.4F4E03C8AC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-05-31 00:27:43 -0700 (Sat, 31 May 2008)
New Revision: 22132

Log:
generic target_skeleton: add /sys to fstab


Modified:
   trunk/buildroot/target/generic/target_skeleton/etc/fstab


Changeset:
Modified: trunk/buildroot/target/generic/target_skeleton/etc/fstab
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/etc/fstab	2008-05-31 07:27:40 UTC (rev 22131)
+++ trunk/buildroot/target/generic/target_skeleton/etc/fstab	2008-05-31 07:27:43 UTC (rev 22132)
@@ -5,4 +5,4 @@
 proc		/proc	       proc     defaults	  0	 0
 devpts		/dev/pts       devpts   defaults,gid=5,mode=620	  0	 0
 tmpfs           /tmp           tmpfs    defaults          0      0
-
+sysfs		/sys	       sysfs    defaults	  0	 0
