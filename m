From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 20 Aug 2007 18:53:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: acpid alsa-lib
	argus asterisk atk avahi etc...
Message-ID: <20070821015358.3F7EAA657A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-20 18:53:57 -0700 (Mon, 20 Aug 2007)
New Revision: 19598

Log:
Remove switches if sstrip is run

Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/acpid/acpid.mk
   trunk/buildroot/package/alsa-lib/alsa-lib.mk
   trunk/buildroot/package/argus/argus.mk
   trunk/buildroot/package/asterisk/asterisk.mk
   trunk/buildroot/package/atk/atk.mk
   trunk/buildroot/package/avahi/avahi.mk
   trunk/buildroot/package/berkeleydb/berkeleydb.mk
   trunk/buildroot/package/boa/boa.mk
   trunk/buildroot/package/bzip2/bzip2.mk
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/curl/curl.mk
   trunk/buildroot/package/cvs/cvs.mk
   trunk/buildroot/package/dbus-glib/dbus-glib.mk
   trunk/buildroot/package/dbus/dbus.mk
   trunk/buildroot/package/directfb/directfb.mk
   trunk/buildroot/package/dmalloc/dmalloc.mk
   trunk/buildroot/package/dropbear/dropbear.mk
   trunk/buildroot/package/expat/expat.mk
   trunk/buildroot/package/fbset/fbset.mk
   trunk/buildroot/package/fontconfig/fontconfig.mk
   trunk/buildroot/package/freetype/freetype.mk
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/hal/hal.mk
   trunk/buildroot/package/imagemagick/imagemagick.mk
   trunk/buildroot/package/iperf/iperf.mk
   trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
   trunk/buildroot/package/jpeg/jpeg.mk
   trunk/buildroot/package/kexec/kexec.mk
   trunk/buildroot/package/libaio/libaio.mk
   trunk/buildroot/package/libdrm/libdrm.mk
   trunk/buildroot/package/libglib12/libglib12.mk
   trunk/buildroot/package/libglib2/libglib2.mk
   trunk/buildroot/package/libgtk12/libgtk12.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/libid3tag/libid3tag.mk
   trunk/buildroot/package/liblockfile/liblockfile.mk
   trunk/buildroot/package/libmad/libmad.mk
   trunk/buildroot/package/libpng/libpng.mk
   trunk/buildroot/package/libsysfs/libsysfs.mk
   trunk/buildroot/package/libungif/libungif.mk
   trunk/buildroot/package/libxml2/libxml2.mk
   trunk/buildroot/package/lighttpd/lighttpd.mk
   trunk/buildroot/package/lockfile-progs/lockfile-progs.mk
   trunk/buildroot/package/lzma/lzma.mk
   trunk/buildroot/package/madplay/madplay.mk
   trunk/buildroot/package/matchbox/matchbox.mk
   trunk/buildroot/package/mdadm/mdadm.mk
   trunk/buildroot/package/metacity/metacity.mk
   trunk/buildroot/package/microcom/microcom.mk
   trunk/buildroot/package/mpfr/mpfr.mk
   trunk/buildroot/package/mpg123/mpg123.mk
   trunk/buildroot/package/mplayer/mplayer.mk
   trunk/buildroot/package/ncftp/ncftp.mk
   trunk/buildroot/package/ncurses/ncurses.mk
   trunk/buildroot/package/netcat/netcat.mk
   trunk/buildroot/package/newt/newt.mk
   trunk/buildroot/package/openntpd/openntpd.mk
   trunk/buildroot/package/openssh/openssh.mk
   trunk/buildroot/package/openssl/openssl.mk
   trunk/buildroot/package/pango/pango.mk
   trunk/buildroot/package/php/php.mk
   trunk/buildroot/package/qtopia4/qtopia4.mk
   trunk/buildroot/package/rxvt/rxvt.mk
   trunk/buildroot/package/samba/samba.mk
   trunk/buildroot/package/sdl/sdl.mk
   trunk/buildroot/package/setserial/setserial.mk
   trunk/buildroot/package/slang/slang.mk
   trunk/buildroot/package/sqlite/sqlite.mk
   trunk/buildroot/package/tcl/tcl.mk
   trunk/buildroot/package/tiff/tiff.mk
   trunk/buildroot/package/tinyhttpd/tinyhttpd.mk
   trunk/buildroot/package/tslib/tslib.mk
   trunk/buildroot/package/udev/udev.mk
   trunk/buildroot/package/valgrind/valgrind.mk
   trunk/buildroot/package/vpnc/vpnc.mk
   trunk/buildroot/package/xerces/xerces.mk
   trunk/buildroot/package/xorg/xorg.mk
   trunk/buildroot/package/zlib/zlib.mk


Changeset:

Sorry, the patch is too large to include (1373 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=19598
