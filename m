From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 18 Oct 2008 06:00:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target:
	device/Atmel/atngw100-expanded/target_sk etc...
Message-ID: <20081018130059.227603C879@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-18 06:00:58 -0700 (Sat, 18 Oct 2008)
New Revision: 23711

Log:
target: add /sys directory to target skeletons needing it

The remaining target_skeletons where /etc/fstab mentions sysfs

Added:
   trunk/buildroot/target/device/Atmel/atngw100-expanded/target_skeleton/sys/
   trunk/buildroot/target/device/Atmel/atngw100-expanded/target_skeleton/sys/.empty
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/sys/
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/sys/.empty
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/sys/.empty
   trunk/buildroot/target/generic/target_busybox_skeleton/sys/
   trunk/buildroot/target/generic/target_busybox_skeleton/sys/.empty


Changeset:
Added: trunk/buildroot/target/device/Atmel/atngw100-expanded/target_skeleton/sys/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/sys/.empty
===================================================================

Added: trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/sys/.empty
===================================================================

Added: trunk/buildroot/target/generic/target_busybox_skeleton/sys/.empty
===================================================================
