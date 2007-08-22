From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 02:56:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/alsa-utils
	package/argus package etc...
Message-ID: <20070822095645.8F638A60E7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 02:56:41 -0700 (Wed, 22 Aug 2007)
New Revision: 19639

Log:
- semicolon touchup. No other changes


Modified:
   trunk/buildroot/package/alsa-utils/alsa-utils.mk
   trunk/buildroot/package/argus/argus.mk
   trunk/buildroot/package/boa/boa.mk
   trunk/buildroot/package/bsdiff/bsdiff.mk
   trunk/buildroot/package/bzip2/bzip2.mk
   trunk/buildroot/package/customize/customize.mk
   trunk/buildroot/package/cvs/cvs.mk
   trunk/buildroot/package/dbus-glib/dbus-glib.mk
   trunk/buildroot/package/dillo/dillo.mk
   trunk/buildroot/package/e2fsprogs/e2fsprogs.mk
   trunk/buildroot/package/findutils/findutils.mk
   trunk/buildroot/package/flex/flex.mk
   trunk/buildroot/package/fontconfig/fontconfig.mk
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/grep/grep.mk
   trunk/buildroot/package/iperf/iperf.mk
   trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
   trunk/buildroot/package/kexec/kexec.mk
   trunk/buildroot/package/l2tp/l2tp.mk
   trunk/buildroot/package/libfloat/libfloat.mk
   trunk/buildroot/package/libid3tag/libid3tag.mk
   trunk/buildroot/package/libmad/libmad.mk
   trunk/buildroot/package/libpcap/libpcap.mk
   trunk/buildroot/package/libraw1394/libraw1394.mk
   trunk/buildroot/package/libsysfs/libsysfs.mk
   trunk/buildroot/package/libxml2/libxml2.mk
   trunk/buildroot/package/lighttpd/lighttpd.mk
   trunk/buildroot/package/ltrace/ltrace.mk
   trunk/buildroot/package/lzma/lzma.mk
   trunk/buildroot/package/mdadm/mdadm.mk
   trunk/buildroot/package/microcom/microcom.mk
   trunk/buildroot/package/microperl/microperl.mk
   trunk/buildroot/package/mpatrol/mpatrol.mk
   trunk/buildroot/package/mpfr/mpfr.mk
   trunk/buildroot/package/nbd/nbd.mk
   trunk/buildroot/package/ncurses/ncurses.mk
   trunk/buildroot/package/netkitbase/netkitbase.mk
   trunk/buildroot/package/nfs-utils/nfs-utils.mk
   trunk/buildroot/package/openntpd/openntpd.mk
   trunk/buildroot/package/openssh/openssh.mk
   trunk/buildroot/package/openssl/openssl.mk
   trunk/buildroot/package/pcmcia/pcmcia.mk
   trunk/buildroot/package/portage/portage.mk
   trunk/buildroot/package/procps/procps.mk
   trunk/buildroot/package/proftpd/proftpd.mk
   trunk/buildroot/package/psmisc/psmisc.mk
   trunk/buildroot/package/quagga/quagga.mk
   trunk/buildroot/package/rdesktop/rdesktop.mk
   trunk/buildroot/package/samba/samba.mk
   trunk/buildroot/package/sdl/sdl.mk
   trunk/buildroot/package/setserial/setserial.mk
   trunk/buildroot/package/socat/socat.mk
   trunk/buildroot/package/sqlite/sqlite.mk
   trunk/buildroot/package/sysvinit/sysvinit.mk
   trunk/buildroot/package/tar/tar.mk
   trunk/buildroot/package/tcpdump/dhcpdump.mk
   trunk/buildroot/package/tcpdump/tcpdump.mk
   trunk/buildroot/package/tftpd/tftpd.mk
   trunk/buildroot/package/tinyx-old/tinyx.mk
   trunk/buildroot/package/tinyx/tinyx.mk
   trunk/buildroot/package/usbmount/usbmount.mk
   trunk/buildroot/package/vpnc/vpnc.mk
   trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk
   trunk/buildroot/package/x11r7/xapp_xman/xapp_xman.mk
   trunk/buildroot/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
   trunk/buildroot/package/xfsprogs/xfsprogs.mk
   trunk/buildroot/package/xorg/xorg.mk
   trunk/buildroot/package/zlib/zlib.mk
   trunk/buildroot/target/cloop/cloop.mk
   trunk/buildroot/target/cpio/cpioroot.mk
   trunk/buildroot/target/cramfs/cramfs.mk
   trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
   trunk/buildroot/target/device/Sharp/LNode80/linux.mk
   trunk/buildroot/target/device/Soekris/net4521/linux.mk
   trunk/buildroot/target/device/Via/epia-mii/linux.mk
   trunk/buildroot/target/device/jp/q5/linux.mk
   trunk/buildroot/target/ext2/ext2root.mk
   trunk/buildroot/target/initramfs/initramfs.mk
   trunk/buildroot/target/iso9660/iso9660.mk
   trunk/buildroot/target/jffs2/jffs2root.mk
   trunk/buildroot/target/squashfs/squashfsroot.mk
   trunk/buildroot/target/tar/tarroot.mk
   trunk/buildroot/target/x86/grub/grub.mk
   trunk/buildroot/target/x86/grub2/grub2.mk
   trunk/buildroot/toolchain/binutils/binutils.mk
   trunk/buildroot/toolchain/ccache/ccache.mk
   trunk/buildroot/toolchain/external-toolchain/ext-tool.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
   trunk/buildroot/toolchain/gdb/gdb.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:

Sorry, the patch is too large to include (2135 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=19639
