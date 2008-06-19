From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 19 Jun 2008 12:06:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/argus
	package/asterisk package/ etc...
Message-ID: <20080619190627.77B053C67D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-19 12:06:25 -0700 (Thu, 19 Jun 2008)
New Revision: 22455

Log:
buildroot: s/depends/depends on/

The new kconfig is more strict regarding depends/depends on, so fixup
the tree.


Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/package/argus/Config.in
   trunk/buildroot/package/asterisk/Config.in
   trunk/buildroot/package/atk/Config.in
   trunk/buildroot/package/avahi/Config.in
   trunk/buildroot/package/blackbox/Config.in
   trunk/buildroot/package/busybox/Config.in
   trunk/buildroot/package/dbus/Config.in
   trunk/buildroot/package/dhcp/Config.in
   trunk/buildroot/package/dillo/Config.in
   trunk/buildroot/package/editors/vim/Config.in
   trunk/buildroot/package/fltk/Config.in
   trunk/buildroot/package/freetype/Config.in
   trunk/buildroot/package/gtk2-engines/Config.in
   trunk/buildroot/package/gtk2-themes/Config.in
   trunk/buildroot/package/ipsec-tools/Config.in
   trunk/buildroot/package/matchbox/Config.in
   trunk/buildroot/package/midori/Config.in
   trunk/buildroot/package/modutils/Config.in
   trunk/buildroot/package/mtd/Config.in
   trunk/buildroot/package/ncftp/Config.in
   trunk/buildroot/package/neon/Config.in
   trunk/buildroot/package/nfs-utils/Config.in
   trunk/buildroot/package/ntp/Config.in
   trunk/buildroot/package/pcmcia/Config.in
   trunk/buildroot/package/qte/Config.in
   trunk/buildroot/package/qtopia4/Config.in
   trunk/buildroot/package/quagga/Config.in
   trunk/buildroot/package/rxvt/Config.in
   trunk/buildroot/package/samba/Config.in
   trunk/buildroot/package/sdl/Config.in
   trunk/buildroot/package/synergy/Config.in
   trunk/buildroot/package/tcl/Config.in
   trunk/buildroot/package/udev/Config.in
   trunk/buildroot/package/valgrind/Config.in
   trunk/buildroot/package/vpnc/Config.in
   trunk/buildroot/package/webif/Config.in
   trunk/buildroot/package/x11r7/xdata_xkbdata/Config.in
   trunk/buildroot/package/xorg/Config.in
   trunk/buildroot/target/Config.in.arch
   trunk/buildroot/target/device/AMD/Config.in
   trunk/buildroot/target/device/ARMLTD/Config.in
   trunk/buildroot/target/device/Atmel/AT91_Config.in
   trunk/buildroot/target/device/Atmel/AVR32_Config.in
   trunk/buildroot/target/device/Atmel/Config.in
   trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in
   trunk/buildroot/target/device/Hitachi/Config.in
   trunk/buildroot/target/device/Sharp/Config.in
   trunk/buildroot/target/device/Soekris/Config.in
   trunk/buildroot/target/device/Via/Config.in
   trunk/buildroot/target/device/jp/Config.in
   trunk/buildroot/target/device/valka/Config.in
   trunk/buildroot/target/device/x86/Config.in
   trunk/buildroot/target/linux/Config.in.advanced
   trunk/buildroot/target/linux/Config.in.experimental
   trunk/buildroot/toolchain/binutils/Config.in
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/kernel-headers/Config.in
   trunk/buildroot/toolchain/uClibc/Config.in


Changeset:

Sorry, the patch is too large to include (2281 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=22455
