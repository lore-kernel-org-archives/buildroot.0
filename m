From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 17:04:34 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070114010434.46F8F485A8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 17:04:33 -0800 (Sat, 13 Jan 2007)
New Revision: 17274

Log:
Include all the new packages.


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-14 01:02:36 UTC (rev 17273)
+++ trunk/buildroot/package/Config.in	2007-01-14 01:04:33 UTC (rev 17274)
@@ -41,6 +41,8 @@
 source "package/cairo/Config.in"
 source "package/customize/Config.in"
 source "package/dash/Config.in"
+source "package/dbus/Config.in"
+source "package/dbus-glib/Config.in"
 source "package/dhcp/Config.in"
 source "package/dialog/Config.in"
 source "package/dillo/Config.in"
@@ -61,10 +63,12 @@
 source "package/gmp/Config.in"
 source "package/mpfr/Config.in"
 source "package/gzip/Config.in"
+source "package/hal/Config.in"
 source "package/haserl/Config.in"
 source "package/hdparm/Config.in"
 source "package/hostap/Config.in"
 source "package/hotplug/Config.in"
+source "package/hwdata/Config.in"
 source "package/iostat/Config.in"
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
@@ -75,6 +79,7 @@
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
 source "package/libelf/Config.in"
+source "package/libevent/Config.in"
 source "package/libfloat/Config.in"
 source "package/libglib12/Config.in"
 source "package/libglib2/Config.in"
@@ -118,6 +123,7 @@
 source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
 source "package/newt/Config.in"
+source "package/nfs-utils/Config.in"
 source "package/ntp/Config.in"
 source "package/openntpd/Config.in"
 source "package/openssh/Config.in"
@@ -132,6 +138,7 @@
 source "package/portmap/Config.in"
 source "package/pppd/Config.in"
 source "package/procps/Config.in"
+source "package/proftpd/Config.in"
 source "package/psmisc/Config.in"
 source "package/python/Config.in"
 source "package/qte/Config.in"
@@ -141,6 +148,7 @@
 source "package/rsync/Config.in"
 source "package/ruby/Config.in"
 source "package/rxvt/Config.in"
+source "package/samba/Config.in"
 source "package/sdl/Config.in"
 source "package/sfdisk/Config.in"
 source "package/slang/Config.in"
@@ -164,6 +172,7 @@
 source "package/udev/Config.in"
 source "package/udhcp/Config.in"
 source "package/uemacs/Config.in"
+source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
 source "package/util-linux/Config.in"
 source "package/valgrind/Config.in"
