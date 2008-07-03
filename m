From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu,  3 Jul 2008 01:27:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device: KwikByte
	KwikByte/kb9202 KwikByte/kb920 etc...
Message-ID: <20080703082751.DE6EC3C65B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-03 01:27:50 -0700 (Thu, 03 Jul 2008)
New Revision: 22618

Log:
Add support for KwikByte KB9202 board, courtesy Brian Beattie

Added:
   trunk/buildroot/target/device/KwikByte/
   trunk/buildroot/target/device/KwikByte/Config.in
   trunk/buildroot/target/device/KwikByte/Makefile.in
   trunk/buildroot/target/device/KwikByte/kb9202/
   trunk/buildroot/target/device/KwikByte/kb9202/Makefile.in
   trunk/buildroot/target/device/KwikByte/kb9202/busybox.config
   trunk/buildroot/target/device/KwikByte/kb9202/device_table.txt
   trunk/buildroot/target/device/KwikByte/kb9202/kb9202-linux-2.6.20.config
   trunk/buildroot/target/device/KwikByte/kb9202/kb9202-linux-2.6.24.config
   trunk/buildroot/target/device/KwikByte/kb9202/kb9202_defconfig
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/bin/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/fstab
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/group
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/hostname
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/init.d/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/init.d/rcS
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/inittab
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/issue
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/issue.net
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/ld.so.cache
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/ld.so.conf
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/mdev.conf
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/mtab
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/network/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/network/if-down.d/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/network/if-post-down.d/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/network/if-pre-up.d/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/network/if-up.d/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/network/interfaces
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/passwd
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/profile
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/protocols
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/services
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/shadow
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/vsftpd.conf
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/home/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/lib/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/proc/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/root/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/root/.ash_history
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/sbin/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/sbin/automount.script
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/sys/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/tmp/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/usr/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/usr/bin/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/usr/lib/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/usr/sbin/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/usr/share/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/usr/share/udhcpc/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/usr/share/udhcpc/default.script
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/var/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/var/adm
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/var/log/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/var/run/
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/var/tmp


Changeset:

Sorry, the patch is too large to include (5236 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=22618
