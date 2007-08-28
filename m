From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Tue, 28 Aug 2007 23:59:09 +0200 (CEST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pppd
In-Reply-To: <20070828211012.GA31002@aon.at>
References: <20070828182238.96B68A67F9@busybox.net>
	<20070828211012.GA31002@aon.at>
Message-ID: <0708282353420.9733@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Aug 2007, Bernhard Fischer wrote:
>
> > This fixes make clean on pppd package (there is no rule uninstall in
> > pppd's makefile) and does some small bits of cleanup.
>
> Heck, no!
> http://lists.uclibc.org/lists/buildroot/2007-August/004742.html
>
> Ulf, please fix that..

uninstall targets are not that common, AFAIK, but I'd love to be proven
wrong :) A quick search shows these might need to be checked:

package/at/at.mk
package/autoconf/autoconf.mk
package/automake/automake.mk
package/bash/bash.mk
package/bison/bison.mk
package/bridge/bridge.mk
package/bzip2/bzip2.mk
package/coreutils/coreutils.mk
package/dhcp/dhcp.mk
package/dialog/dialog.mk
package/diffutils/diffutils.mk
package/directfb/directfb.mk
package/e2fsprogs/e2fsprogs.mk
package/ed/ed.mk
package/file/file.mk
package/findutils/findutils.mk
package/fontconfig/fontconfig.mk
package/freetype/freetype.mk
package/gawk/gawk.mk
package/gettext/gettext.mk
package/grep/grep.mk
package/gtk2-engines/gtk2-engines.mk
package/gzip/gzip.mk
package/hostap/hostap.mk
package/ipsec-tools/ipsec-tools.mk
package/less/less.mk
package/libdrm/libdrm.mk
package/libelf/libelf.mk
package/libsndfile/libsndfile.mk
package/libsysfs/libsysfs.mk
package/libtool/libtool.mk
package/lighttpd/lighttpd.mk
package/ltrace/ltrace.mk
package/ltt/ltt.mk
package/lvm2/lvm2.mk
package/lzo/lzo.mk
package/m4/m4.mk
package/make/make.mk
package/matchbox/matchbox.mk
package/mdadm/mdadm.mk
package/mkdosfs/mkdosfs.mk
package/module-init-tools/module-init-tools.mk
package/modutils/modutils.mk
package/netkitbase/netkitbase.mk
package/netkittelnet/netkittelnet.mk
package/netsnmp/netsnmp.mk
package/openssh/openssh.mk
package/openswan/openswan.mk
package/openvpn/openvpn.mk
package/pkgconfig/pkgconfig.mk
package/quagga/quagga.mk
package/raidtools/raidtools.mk
package/readline/readline.mk
package/ruby/ruby.mk
package/sdl/sdl.mk
package/sed/sed.mk
package/smartmontools/smartmontools.mk
package/tar/tar.mk
package/tcl/tcl.mk
package/tslib/tslib.mk
package/util-linux/util-linux.mk
package/vtun/vtun.mk
package/wipe/wipe.mk
package/wireless-tools/wireless-tools.mk
package/x11r7/mesa3d/mesa3d.mk
package/x11r7/xapp_xman/xapp_xman.mk
package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
target/x86/grub/grub.mk
target/x86/grub2/grub2.mk


Cheers,

-- 
Cristian
