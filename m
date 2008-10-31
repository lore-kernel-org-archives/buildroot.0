From: antab at uclibc.org <antab@uclibc.org>
Date: Fri, 31 Oct 2008 10:22:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/valka:
	target_skeleton target_skeleton/etc tar etc...
Message-ID: <20081031172259.E2F79F8055@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: antab
Date: 2008-10-31 10:22:59 -0700 (Fri, 31 Oct 2008)
New Revision: 23887

Log:
Update valka target


Added:
   trunk/buildroot/target/device/valka/target_skeleton/etc/lighttpd.conf
   trunk/buildroot/target/device/valka/target_skeleton/etc/rc.d/nbd_swap
   trunk/buildroot/target/device/valka/target_skeleton/valka/
   trunk/buildroot/target/device/valka/target_skeleton/valka/web/
   trunk/buildroot/target/device/valka/v100sc2/busybox.config

Removed:
   trunk/buildroot/target/device/valka/target_skeleton/etc/rc.d/dbus
   trunk/buildroot/target/device/valka/target_skeleton/etc/rc.d/gui
   trunk/buildroot/target/device/valka/target_skeleton/web/
   trunk/buildroot/target/device/valka/v100sc2/busybox-1.9.0.config
   trunk/buildroot/target/device/valka/v100sc2/busybox-1.9.1.config
   trunk/buildroot/target/device/valka/v100sc2/kernel-patches/
   trunk/buildroot/target/device/valka/v100sc2/v100sc2-linux-2.6.24.config

Modified:
   trunk/buildroot/target/device/valka/Config.in
   trunk/buildroot/target/device/valka/Makefile.in
   trunk/buildroot/target/device/valka/target_skeleton/etc/default/rc.conf
   trunk/buildroot/target/device/valka/target_skeleton/etc/ntp.conf
   trunk/buildroot/target/device/valka/target_skeleton/etc/shadow
   trunk/buildroot/target/device/valka/target_skeleton/etc/shells
   trunk/buildroot/target/device/valka/v100sc2/uClibc.config
   trunk/buildroot/target/device/valka/v100sc2_defconfig


Changeset:

Sorry, the patch is too large to include (5085 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=23887
