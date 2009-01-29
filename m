From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 17:05:15 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device: Sharp
	Sharp/LNode80 Sharp/LNode80/kerne etc...
Message-ID: <20090129170516.39BFB76D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-29 17:05:12 +0000 (Thu, 29 Jan 2009)
New Revision: 25123

Log:
target/device: remove obsolete Sharp/LNode80 platform

As discussed on the list and requested on irc:

< prpplague> Jacmet: hey, just wanted to drop a note to confirm that the
             LNode80 can be removed, we never went into full scale
             production of it, only 20 were ever made

Removed:
   trunk/buildroot/target/device/Sharp/Config.in
   trunk/buildroot/target/device/Sharp/LNode80/Makefile.in
   trunk/buildroot/target/device/Sharp/LNode80/device_table.txt
   trunk/buildroot/target/device/Sharp/LNode80/kernel-patches/001-patch-2.4.26-vrs1
   trunk/buildroot/target/device/Sharp/LNode80/kernel-patches/002-patch-2.4.26-vrs1-lnode80
   trunk/buildroot/target/device/Sharp/LNode80/linux.config
   trunk/buildroot/target/device/Sharp/LNode80/linux.mk
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/etc/TZ
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/etc/fstab
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/etc/group
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/etc/hostname
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/etc/hosts
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/etc/init.d/rcS
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/etc/inittab
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/etc/inputrc
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/etc/issue
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/etc/network/interfaces
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/etc/passwd
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/etc/profile
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/etc/protocols
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/etc/securetty
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/etc/services
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/etc/shadow
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/root/.bash_logout
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/root/.bash_profile
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/root/.bashrc
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/root/.empty
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/usr/share/udhcpc/default.script
   trunk/buildroot/target/device/Sharp/Makefile.in

Modified:
   trunk/buildroot/target/device/Config.in


Changeset:

Sorry, the patch is too large to include (105659 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=25123
