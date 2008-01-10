From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 10 Jan 2008 01:27:26 -0800 (PST)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/root/target_skeleton/etc
Message-ID: <20080110092726.77C3912C570@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-01-10 01:27:25 -0800 (Thu, 10 Jan 2008)
New Revision: 20837

Log:
Add /etc/ld.so.conf to Atmel based root fs

Added:
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/ld.so.conf


Changeset:
Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/ld.so.conf
===================================================================
--- trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/ld.so.conf	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/ld.so.conf	2008-01-10 09:27:25 UTC (rev 20837)
@@ -0,0 +1 @@
+include /etc/ld.so.conf.d/*.conf
