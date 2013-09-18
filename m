From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 18 Sep 2013 17:24:18 +0200
Subject: [Buildroot] [PATCH 1/1] package: remove the trailing slash sign
	from the URL address
Message-ID: <1379517858-28720-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 boot/at91bootstrap/at91bootstrap.mk                |    2 +-
 boot/at91dataflashboot/at91dataflashboot.mk        |    2 +-
 boot/barebox/barebox.mk                            |    2 +-
 boot/grub/grub.mk                                  |    2 +-
 boot/mxs-bootlets/mxs-bootlets.mk                  |    2 +-
 boot/syslinux/syslinux.mk                          |    2 +-
 linux/linux.mk                                     |    4 +-
 package/aespipe/aespipe.mk                         |    2 +-
 package/aiccu/aiccu.mk                             |    2 +-
 package/alsamixergui/alsamixergui.mk               |    2 +-
 package/argus/argus.mk                             |    2 +-
 package/atk/atk.mk                                 |    2 +-
 package/avahi/avahi.mk                             |    2 +-
 package/b43-firmware/b43-firmware.mk               |    4 +-
 package/b43-fwcutter/b43-fwcutter.mk               |    2 +-
 package/bcusdk/bcusdk.mk                           |    2 +-
 package/boa/boa.mk                                 |    2 +-
 package/bonnie/bonnie.mk                           |    2 +-
 package/bustle/bustle.mk                           |    2 +-
 package/bwm-ng/bwm-ng.mk                           |    2 +-
 package/chrony/chrony.mk                           |    2 +-
 package/cmake/cmake.mk                             |    2 +-
 package/connman/connman.mk                         |    2 +-
 package/crosstool-ng/crosstool-ng.mk               |    2 +-
 package/ctorrent/ctorrent.mk                       |    2 +-
 package/cvs/cvs.mk                                 |    2 +-
 package/dbus-glib/dbus-glib.mk                     |    2 +-
 package/dbus-python/dbus-python.mk                 |    2 +-
 package/dfu-util/dfu-util.mk                       |    2 +-
 package/dhcpcd/dhcpcd.mk                           |    2 +-
 package/dhcpdump/dhcpdump.mk                       |    2 +-
 package/dhrystone/dhrystone.mk                     |    2 +-
 package/distcc/distcc.mk                           |    2 +-
 package/dmidecode/dmidecode.mk                     |    2 +-
 package/doom-wad/doom-wad.mk                       |    2 +-
 package/dropwatch/dropwatch.mk                     |    2 +-
 package/dsp-tools/dsp-tools.mk                     |    2 +-
 package/efl/expedite/expedite.mk                   |    2 +-
 package/efl/libecore/libecore.mk                   |    2 +-
 package/efl/libedbus/libedbus.mk                   |    2 +-
 package/efl/libedje/libedje.mk                     |    2 +-
 package/efl/libeet/libeet.mk                       |    2 +-
 package/efl/libefreet/libefreet.mk                 |    2 +-
 package/efl/libeina/libeina.mk                     |    2 +-
 package/efl/libeio/libeio.mk                       |    2 +-
 package/efl/libelementary/libelementary.mk         |    2 +-
 package/efl/libembryo/libembryo.mk                 |    2 +-
 package/efl/libethumb/libethumb.mk                 |    2 +-
 .../libevas-generic-loaders.mk                     |    2 +-
 package/efl/libevas/libevas.mk                     |    2 +-
 package/eigen/eigen.mk                             |    2 +-
 package/enlightenment/enlightenment.mk             |    2 +-
 package/enscript/enscript.mk                       |    2 +-
 package/evtest/evtest.mk                           |    2 +-
 package/explorercanvas/explorercanvas.mk           |    2 +-
 package/fakeroot/fakeroot.mk                       |    2 +-
 package/fan-ctrl/fan-ctrl.mk                       |    2 +-
 package/fconfig/fconfig.mk                         |    2 +-
 package/feh/feh.mk                                 |    2 +-
 package/fltk/fltk.mk                               |    2 +-
 package/fmtools/fmtools.mk                         |    2 +-
 package/gadgetfs-test/gadgetfs-test.mk             |    2 +-
 package/gcc/gcc.mk                                 |    4 +-
 package/gdb/gdb.mk                                 |    2 +-
 package/genimage/genimage.mk                       |    2 +-
 package/genpart/genpart.mk                         |    2 +-
 package/gesftpserver/gesftpserver.mk               |    2 +-
 package/giblib/giblib.mk                           |    2 +-
 package/git/git.mk                                 |    2 +-
 package/glibc/glibc.mk                             |    2 +-
 package/gpsd/gpsd.mk                               |    2 +-
 package/gstreamer/gst-dsp/gst-dsp.mk               |    2 +-
 package/gstreamer/gst-omapfb/gst-omapfb.mk         |    2 +-
 .../gstreamer/gst-plugin-x170/gst-plugin-x170.mk   |    2 +-
 package/gstreamer1/gst-omx/gst-omx.mk              |    2 +-
 package/gtest/gtest.mk                             |    2 +-
 .../gtk2-theme-hicolor/gtk2-theme-hicolor.mk       |    2 +-
 package/harfbuzz/harfbuzz.mk                       |    2 +-
 package/heirloom-mailx/heirloom-mailx.mk           |    2 +-
 package/hwdata/hwdata.mk                           |    2 +-
 package/iftop/iftop.mk                             |    2 +-
 package/igh-ethercat/igh-ethercat.mk               |    2 +-
 package/imagemagick/imagemagick.mk                 |    2 +-
 package/imlib2/imlib2.mk                           |    2 +-
 package/inotify-tools/inotify-tools.mk             |    2 +-
 package/input-tools/input-tools.mk                 |    2 +-
 package/intltool/intltool.mk                       |    2 +-
 package/ipsec-tools/ipsec-tools.mk                 |    2 +-
 package/json-c/json-c.mk                           |    2 +-
 package/kmod/kmod.mk                               |    2 +-
 package/kobs-ng/kobs-ng.mk                         |    2 +-
 package/latencytop/latencytop.mk                   |    2 +-
 package/libaio/libaio.mk                           |    2 +-
 package/libart/libart.mk                           |    2 +-
 package/libassuan/libassuan.mk                     |    2 +-
 package/libcap-ng/libcap-ng.mk                     |    2 +-
 package/libcdaudio/libcdaudio.mk                   |    2 +-
 package/libconfig/libconfig.mk                     |    2 +-
 package/libconfuse/libconfuse.mk                   |    2 +-
 package/libdrm/libdrm.mk                           |    2 +-
 package/libeXosip2/libeXosip2.mk                   |    2 +-
 package/libebml/libebml.mk                         |    2 +-
 package/libedit/libedit.mk                         |    2 +-
 package/libelf/libelf.mk                           |    2 +-
 package/libev/libev.mk                             |    2 +-
 package/libffi/libffi.mk                           |    2 +-
 package/libfribidi/libfribidi.mk                   |    2 +-
 package/libftdi/libftdi.mk                         |    2 +-
 package/libglade/libglade.mk                       |    2 +-
 package/libgpgme/libgpgme.mk                       |    2 +-
 package/libjpeg/libjpeg.mk                         |    2 +-
 package/liblockfile/liblockfile.mk                 |    2 +-
 package/libmatroska/libmatroska.mk                 |    2 +-
 package/libnfc-llcp/libnfc-llcp.mk                 |    2 +-
 package/libnfc/libnfc.mk                           |    2 +-
 package/libnspr/libnspr.mk                         |    2 +-
 package/libplayer/libplayer.mk                     |    2 +-
 package/libpthsem/libpthsem.mk                     |    2 +-
 package/libqmi/libqmi.mk                           |    2 +-
 package/libraw/libraw.mk                           |    2 +-
 package/libroxml/libroxml.mk                       |    2 +-
 package/librsvg/librsvg.mk                         |    2 +-
 package/libsexy/libsexy.mk                         |    2 +-
 package/libssh2/libssh2.mk                         |    2 +-
 package/libsvg-cairo/libsvg-cairo.mk               |    2 +-
 package/libsvg/libsvg.mk                           |    2 +-
 package/liburcu/liburcu.mk                         |    2 +-
 package/libv4l/libv4l.mk                           |    2 +-
 package/libvorbis/libvorbis.mk                     |    2 +-
 package/libxkbcommon/libxkbcommon.mk               |    2 +-
 package/libxml-parser-perl/libxml-parser-perl.mk   |    2 +-
 package/libyaml/libyaml.mk                         |    2 +-
 package/linphone/linphone.mk                       |    2 +-
 package/linux-headers/linux-headers.mk             |    4 +-
 package/linux-pam/linux-pam.mk                     |    2 +-
 package/live555/live555.mk                         |    2 +-
 package/lmbench/lmbench.mk                         |    2 +-
 package/localedef/localedef.mk                     |    2 +-
 package/lockdev/lockdev.mk                         |    2 +-
 package/lockfile-progs/lockfile-progs.mk           |    2 +-
 package/logrotate/logrotate.mk                     |    2 +-
 package/lsof/lsof.mk                               |    2 +-
 package/lttng-babeltrace/lttng-babeltrace.mk       |    2 +-
 package/lttng-libust/lttng-libust.mk               |    2 +-
 package/lttng-modules/lttng-modules.mk             |    2 +-
 package/lttng-tools/lttng-tools.mk                 |    2 +-
 package/luasec/luasec.mk                           |    2 +-
 package/lzma/lzma.mk                               |    2 +-
 package/lzop/lzop.mk                               |    2 +-
 package/memtester/memtester.mk                     |    2 +-
 package/midori/midori.mk                           |    2 +-
 package/minicom/minicom.mk                         |    2 +-
 package/monit/monit.mk                             |    2 +-
 package/msgpack/msgpack.mk                         |    2 +-
 package/mtdev/mtdev.mk                             |    2 +-
 package/mtools/mtools.mk                           |    2 +-
 package/ncdu/ncdu.mk                               |    2 +-
 package/ndisc6/ndisc6.mk                           |    2 +-
 package/neon/neon.mk                               |    2 +-
 package/netkitbase/netkitbase.mk                   |    2 +-
 package/netkittelnet/netkittelnet.mk               |    2 +-
 package/newt/newt.mk                               |    2 +-
 package/ngircd/ngircd.mk                           |    2 +-
 package/numactl/numactl.mk                         |    2 +-
 package/nuttcp/nuttcp.mk                           |    2 +-
 package/on2-8170-libs/on2-8170-libs.mk             |    2 +-
 package/open2300/open2300.mk                       |    2 +-
 package/openpgm/openpgm.mk                         |    2 +-
 package/opkg/opkg.mk                               |    2 +-
 package/orc/orc.mk                                 |    2 +-
 package/picocom/picocom.mk                         |    2 +-
 package/pkg-config/pkg-config.mk                   |    2 +-
 package/polkit/polkit.mk                           |    2 +-
 package/popt/popt.mk                               |    2 +-
 package/procps/procps.mk                           |    2 +-
 package/proftpd/proftpd.mk                         |    2 +-
 package/protobuf/protobuf.mk                       |    2 +-
 package/pulseaudio/pulseaudio.mk                   |    2 +-
 package/python-mad/python-mad.mk                   |    2 +-
 package/python-meld3/python-meld3.mk               |    2 +-
 package/python-pyro/python-pyro.mk                 |    2 +-
 package/python-pyzmq/python-pyzmq.mk               |    2 +-
 package/qextserialport/qextserialport.mk           |    2 +-
 package/qt5/qt5.mk                                 |    2 +-
 package/read-edid/read-edid.mk                     |    2 +-
 package/rpm/rpm.mk                                 |    2 +-
 package/rsyslog/rsyslog.mk                         |    2 +-
 package/rt-tests/rt-tests.mk                       |    2 +-
 package/rtai/rtai.mk                               |    2 +-
 package/sam-ba/sam-ba.mk                           |    2 +-
 package/sdl_gfx/sdl_gfx.mk                         |    2 +-
 package/sdl_mixer/sdl_mixer.mk                     |    2 +-
 package/sdl_sound/sdl_sound.mk                     |    2 +-
 package/sdl_ttf/sdl_ttf.mk                         |    2 +-
 package/setserial/setserial.mk                     |    2 +-
 package/sg3_utils/sg3_utils.mk                     |    2 +-
 package/slang/slang.mk                             |    2 +-
 package/socat/socat.mk                             |    2 +-
 package/spice-protocol/spice-protocol.mk           |    2 +-
 package/spice/spice.mk                             |    2 +-
 package/statserial/statserial.mk                   |    2 +-
 package/supervisor/supervisor.mk                   |    2 +-
 package/systemd/systemd.mk                         |    2 +-
 package/thttpd/thttpd.mk                           |    2 +-
 package/ti-gfx/ti-gfx.mk                           |    2 +-
 package/tidsp-binaries/tidsp-binaries.mk           |    2 +-
 package/transmission/transmission.mk               |    2 +-
 package/tree/tree.mk                               |    2 +-
 package/tremor/tremor.mk                           |    2 +-
 package/tstools/tstools.mk                         |    2 +-
 package/udev/udev.mk                               |    2 +-
 package/udisks/udisks.mk                           |    2 +-
 package/uemacs/uemacs.mk                           |    2 +-
 package/urg/urg.mk                                 |    2 +-
 package/ux500-firmware/ux500-firmware.mk           |    2 +-
 package/valgrind/valgrind.mk                       |    2 +-
 package/wayland/wayland.mk                         |    2 +-
 .../webrtc-audio-processing.mk                     |    2 +-
 package/weston/weston.mk                           |    2 +-
 package/whetstone/whetstone.mk                     |    2 +-
 package/x11r7/libxcb/libxcb.mk                     |    2 +-
 package/x11r7/xcb-proto/xcb-proto.mk               |    2 +-
 package/x11r7/xcb-util-image/xcb-util-image.mk     |    2 +-
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk |    2 +-
 package/x11r7/xcb-util-wm/xcb-util-wm.mk           |    2 +-
 package/x11r7/xcb-util/xcb-util.mk                 |    2 +-
 .../xcursor-transparent-theme.mk                   |    2 +-
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    2 +-
 .../xlib_libpthread-stubs/xlib_libpthread-stubs.mk |    2 +-
 package/xenomai/xenomai.mk                         |    2 +-
 package/xerces/xerces.mk                           |    2 +-
 package/xz/xz.mk                                   |    2 +-
 package/yasm/yasm.mk                               |    2 +-
 package/zeromq/zeromq.mk                           |    2 +-
 toolchain/toolchain-external/ext-tool.mk           |   66 ++++++++++----------
 235 files changed, 271 insertions(+), 271 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index c5fd099..d379580 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 AT91BOOTSTRAP_VERSION = 1.16
-AT91BOOTSTRAP_SITE = ftp://www.at91.com/pub/at91bootstrap/
+AT91BOOTSTRAP_SITE = ftp://www.at91.com/pub/at91bootstrap
 AT91BOOTSTRAP_SOURCE = AT91Bootstrap$(AT91BOOTSTRAP_VERSION).zip
 
 AT91BOOTSTRAP_BOARD = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index 2c2b4d9..0ad8b6f 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -6,7 +6,7 @@
 
 AT91DATAFLASHBOOT_VERSION = 1.05
 AT91DATAFLASHBOOT_SOURCE = DataflashBoot-$(AT91DATAFLASHBOOT_VERSION).tar.bz2
-AT91DATAFLASHBOOT_SITE = ftp://www.at91.com/pub/buildroot/
+AT91DATAFLASHBOOT_SITE = ftp://www.at91.com/pub/buildroot
 
 AT91DATAFLASHBOOT_INSTALL_TARGET = NO
 AT91DATAFLASHBOOT_INSTALL_IMAGES = YES
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 9324c25..573e800 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -17,7 +17,7 @@ BAREBOX_SITE_METHOD = git
 else
 # Handle stable official Barebox versions
 BAREBOX_SOURCE = barebox-$(BAREBOX_VERSION).tar.bz2
-BAREBOX_SITE = http://www.barebox.org/download/
+BAREBOX_SITE = http://www.barebox.org/download
 endif
 
 BAREBOX_DEPENDENCIES = host-lzop
diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index fd27620..daadd80 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -7,7 +7,7 @@
 GRUB_VERSION = 0.97
 GRUB_SOURCE = grub_$(GRUB_VERSION).orig.tar.gz
 GRUB_PATCH  = grub_$(GRUB_VERSION)-35.diff.gz
-GRUB_SITE   = http://snapshot.debian.org/archive/debian/20080329T000000Z/pool/main/g/grub/
+GRUB_SITE   = http://snapshot.debian.org/archive/debian/20080329T000000Z/pool/main/g/grub
 
 GRUB_LICENSE = GPLv2+
 GRUB_LICENSE_FILES = COPYING
diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index 6b81030..d9d0af2 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -14,7 +14,7 @@ else ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT),y)
 	MXS_BOOTLETS_VERSION = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_VERSION))
 else
 	MXS_BOOTLETS_VERSION = 10.12.01
-	MXS_BOOTLETS_SITE = http://download.ossystems.com.br/bsp/freescale/source/
+	MXS_BOOTLETS_SITE = http://download.ossystems.com.br/bsp/freescale/source
 	MXS_BOOTLETS_SOURCE = imx-bootlets-src-$(MXS_BOOTLETS_VERSION).tar.gz
 endif
 
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index b6b804e..4040774 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -6,7 +6,7 @@
 
 SYSLINUX_VERSION = 4.07
 SYSLINUX_SOURCE  = syslinux-$(SYSLINUX_VERSION).tar.bz2
-SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/4.xx/
+SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/4.xx
 
 SYSLINUX_LICENSE = GPLv2+
 SYSLINUX_LICENSE_FILES = COPYING
diff --git a/linux/linux.mk b/linux/linux.mk
index 901ce25..b6c4c6f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -22,9 +22,9 @@ LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
 # to use the $(word) function. We support versions such as 3.1,
 # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
 ifeq ($(findstring x2.6.,x$(LINUX_VERSION)),x2.6.)
-LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
+LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
 else
-LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x/
+LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
 endif
 # release candidates are in testing/ subdir
 ifneq ($(findstring -rc,$(LINUX_VERSION)),)
diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
index ed40568..a220688 100644
--- a/package/aespipe/aespipe.mk
+++ b/package/aespipe/aespipe.mk
@@ -6,7 +6,7 @@
 
 AESPIPE_VERSION = 2.4c
 AESPIPE_SOURCE = aespipe-v$(AESPIPE_VERSION).tar.bz2
-AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe/
+AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe
 AESPIPE_LICENSE = GPL
 
 $(eval $(autotools-package))
diff --git a/package/aiccu/aiccu.mk b/package/aiccu/aiccu.mk
index 2c54644..bfc6957 100644
--- a/package/aiccu/aiccu.mk
+++ b/package/aiccu/aiccu.mk
@@ -6,7 +6,7 @@
 
 AICCU_VERSION = 20070115
 AICCU_SOURCE = aiccu_$(AICCU_VERSION).tar.gz
-AICCU_SITE = http://www.sixxs.net/archive/sixxs/aiccu/unix/
+AICCU_SITE = http://www.sixxs.net/archive/sixxs/aiccu/unix
 AICCU_LICENSE = SixXS License, concise redistribution license
 AICCU_LICENSE_FILES = doc/LICENSE
 AICCU_DEPENDENCIES = gnutls
diff --git a/package/alsamixergui/alsamixergui.mk b/package/alsamixergui/alsamixergui.mk
index 8f05350..c762543 100644
--- a/package/alsamixergui/alsamixergui.mk
+++ b/package/alsamixergui/alsamixergui.mk
@@ -6,7 +6,7 @@
 
 ALSAMIXERGUI_VERSION = 0.9.0rc2-1
 ALSAMIXERGUI_SOURCE = alsamixergui_$(ALSAMIXERGUI_VERSION).orig.tar.gz
-ALSAMIXERGUI_SITE = http://snapshot.debian.org/archive/debian/20080319T000000Z/pool/main/a/alsamixergui/
+ALSAMIXERGUI_SITE = http://snapshot.debian.org/archive/debian/20080319T000000Z/pool/main/a/alsamixergui
 ALSAMIXERGUI_AUTORECONF = YES
 
 ALSAMIXERGUI_CONF_ENV = ac_cv_lib_fltk_numericsort=yes \
diff --git a/package/argus/argus.mk b/package/argus/argus.mk
index f169506..1eebb01 100644
--- a/package/argus/argus.mk
+++ b/package/argus/argus.mk
@@ -7,7 +7,7 @@
 ARGUS_VERSION = 3.0.0.rc.34
 ARGUS_SOURCE = argus_$(ARGUS_VERSION).orig.tar.gz
 ARGUS_PATCH = argus_$(ARGUS_VERSION)-1.diff.gz
-ARGUS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/argus/
+ARGUS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/argus
 ARGUS_DEPENDENCIES = libpcap
 ARGUS_LICENSE = GPLv2+
 ARGUS_LICENSE_FILES = COPYING
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 433e1e3..bc0328f 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -7,7 +7,7 @@
 ATK_VERSION_MAJOR = 2.9
 ATK_VERSION = $(ATK_VERSION_MAJOR).4
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
-ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)/
+ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
 ATK_LICENSE = LGPLv2+
 ATK_LICENSE_FILES = COPYING
 ATK_INSTALL_STAGING = YES
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index eb76d79..230c0fb 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -13,7 +13,7 @@
 
 AVAHI_VERSION = 0.6.31
 AVAHI_SOURCE = avahi-$(AVAHI_VERSION).tar.gz
-AVAHI_SITE = http://www.avahi.org/download/
+AVAHI_SITE = http://www.avahi.org/download
 AVAHI_LICENSE = LGPLv2.1+
 AVAHI_LICENSE_FILES = LICENSE
 AVAHI_INSTALL_STAGING = YES
diff --git a/package/b43-firmware/b43-firmware.mk b/package/b43-firmware/b43-firmware.mk
index 5d036e0..601ab66 100644
--- a/package/b43-firmware/b43-firmware.mk
+++ b/package/b43-firmware/b43-firmware.mk
@@ -6,12 +6,12 @@
 
 ifeq ($(BR2_PACKAGE_B43_FIRMWARE_KERNEL_AFTER_3_2),y)
 B43_FIRMWARE_VERSION = 5.100.138
-B43_FIRMWARE_SITE = http://www.lwfinger.com/b43-firmware/
+B43_FIRMWARE_SITE = http://www.lwfinger.com/b43-firmware
 B43_FIRMWARE_SOURCE = broadcom-wl-$(B43_FIRMWARE_VERSION).tar.bz2
 B43_FIRMWARE_DRIVER_FILE = linux/wl_apsta.o
 else ifeq ($(BR2_PACKAGE_B43_FIRMWARE_KERNEL_BEFORE_3_2),y)
 B43_FIRMWARE_VERSION = 5.10.56.27.3
-B43_FIRMWARE_SITE = http://mirror2.openwrt.org/sources/
+B43_FIRMWARE_SITE = http://mirror2.openwrt.org/sources
 B43_FIRMWARE_SOURCE = broadcom-wl-$(B43_FIRMWARE_VERSION)_mipsel.tar.bz2
 B43_FIRMWARE_DRIVER_FILE = driver/wl_apsta/wl_prebuilt.o
 endif
diff --git a/package/b43-fwcutter/b43-fwcutter.mk b/package/b43-fwcutter/b43-fwcutter.mk
index bc11c0b..d264b64 100644
--- a/package/b43-fwcutter/b43-fwcutter.mk
+++ b/package/b43-fwcutter/b43-fwcutter.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 B43_FWCUTTER_VERSION = 015
-B43_FWCUTTER_SITE = http://bues.ch/b43/fwcutter/
+B43_FWCUTTER_SITE = http://bues.ch/b43/fwcutter
 B43_FWCUTTER_SOURCE = b43-fwcutter-$(B43_FWCUTTER_VERSION).tar.bz2
 B43_FWCUTTER_LICENSE = BSD-2c
 B43_FWCUTTER_LICENSE_FILES = COPYING
diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
index 880b7d9..d551131 100644
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -6,7 +6,7 @@
 
 BCUSDK_VERSION = 0.0.5
 BCUSDK_SOURCE = bcusdk_$(BCUSDK_VERSION).tar.gz
-BCUSDK_SITE = http://www.auto.tuwien.ac.at/~mkoegler/eib/
+BCUSDK_SITE = http://www.auto.tuwien.ac.at/~mkoegler/eib
 BCUSDK_LICENSE = GPLv2+
 BCUSDK_LICENSE_FILES = COPYING
 BCUSDK_INSTALL_STAGING = YES
diff --git a/package/boa/boa.mk b/package/boa/boa.mk
index d6a8e23..5d42fb7 100644
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BOA_VERSION = 0.94.14rc21
-BOA_SITE = http://www.boa.org/
+BOA_SITE = http://www.boa.org
 BOA_LICENSE = GPLv2+
 BOA_LICENSE_FILES = COPYING
 
diff --git a/package/bonnie/bonnie.mk b/package/bonnie/bonnie.mk
index 75cb155..110a215 100644
--- a/package/bonnie/bonnie.mk
+++ b/package/bonnie/bonnie.mk
@@ -6,7 +6,7 @@
 
 BONNIE_VERSION = 1.03e
 BONNIE_SOURCE = bonnie++-$(BONNIE_VERSION).tgz
-BONNIE_SITE = http://www.coker.com.au/bonnie++/
+BONNIE_SITE = http://www.coker.com.au/bonnie++
 
 define BONNIE_INSTALL_TARGET_CMDS
 	install -D -m 755 $(@D)/bonnie++ $(TARGET_DIR)/usr/sbin/bonnie++
diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index 68b7b24..3581a06 100644
--- a/package/bustle/bustle.mk
+++ b/package/bustle/bustle.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BUSTLE_VERSION = 0.4.2
-BUSTLE_SITE = http://www.willthompson.co.uk/bustle/releases/$(BUSTLE_VERSION)/
+BUSTLE_SITE = http://www.willthompson.co.uk/bustle/releases/$(BUSTLE_VERSION)
 BUSTLE_LICENSE = LGPLv2.1+
 BUSTLE_LICENSE_FILES = LICENSE
 BUSTLE_DEPENDENCIES = libglib2 libpcap host-pkgconf
diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index b7dc8b2..a9baafe 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BWM_NG_VERSION = 0.6
-BWM_NG_SITE = http://downloads.sourceforge.net/project/bwmng/bwmng/$(BWM_NG_VERSION)/
+BWM_NG_SITE = http://downloads.sourceforge.net/project/bwmng/bwmng/$(BWM_NG_VERSION)
 BWM_NG_CONF_OPT = --with-procnetdev --with-diskstats
 BWM_NG_LICENSE = GPLv2
 BWM_NG_LICENSE_FILES = COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 59fd3cb..f73890f 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CHRONY_VERSION = 1.27
-CHRONY_SITE = http://download.tuxfamily.org/chrony/
+CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPLv2
 CHRONY_LICENSE_FILES = COPYING
 
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index fd1cdd2..59aee35 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CMAKE_VERSION = 2.8.10.2
-CMAKE_SITE = http://www.cmake.org/files/v2.8/
+CMAKE_SITE = http://www.cmake.org/files/v2.8
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
 
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 4a6bb78..f62ce2c 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -6,7 +6,7 @@
 
 CONNMAN_VERSION = 1.12
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
-CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman/
+CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables gnutls
 CONNMAN_INSTALL_STAGING = YES
 CONNMAN_LICENSE = GPLv2
diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index 8d98db4..2308fb1 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -6,7 +6,7 @@
 
 CROSSTOOL_NG_VERSION           = 1.18.0
 CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
-CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
+CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng
 CROSSTOOL_NG_INSTALL_TARGET    = NO
 CROSSTOOL_NG_MAKE              = $(MAKE1)
 
diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
index d4f6b98..a541dce 100644
--- a/package/ctorrent/ctorrent.mk
+++ b/package/ctorrent/ctorrent.mk
@@ -6,7 +6,7 @@
 
 CTORRENT_VERSION = dnh3.3.2
 CTORRENT_SOURCE = ctorrent-$(CTORRENT_VERSION).tar.gz
-CTORRENT_SITE = http://www.rahul.net/dholmes/ctorrent/
+CTORRENT_SITE = http://www.rahul.net/dholmes/ctorrent
 CTORRENT_LICENSE = GPLv2
 CTORRENT_LICENSE_FILES = COPYING
 
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index d2a1033..3fba8f3 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -7,7 +7,7 @@
 CVS_VERSION = 1.12.13
 CVS_SOURCE = cvs_$(CVS_VERSION).orig.tar.gz
 CVS_PATCH = cvs_$(CVS_VERSION)-12.diff.gz
-CVS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/c/cvs/
+CVS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/c/cvs
 CVS_DEPENDENCIES = ncurses
 
 CVS_CONF_ENV = cvs_cv_func_printf_ptr=yes
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index d4685f6..8c72c3d 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -6,7 +6,7 @@
 
 DBUS_GLIB_VERSION = 0.98
 DBUS_GLIB_SOURCE = dbus-glib-$(DBUS_GLIB_VERSION).tar.gz
-DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib/
+DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
 DBUS_GLIB_INSTALL_STAGING = YES
 
 DBUS_GLIB_CONF_ENV = ac_cv_have_abstract_sockets=yes \
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 6e260d0..5b56c91 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -6,7 +6,7 @@
 
 DBUS_PYTHON_VERSION = 0.83.0
 DBUS_PYTHON_SOURCE = dbus-python-$(DBUS_PYTHON_VERSION).tar.gz
-DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python/
+DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python
 DBUS_PYTHON_INSTALL_STAGING = YES
 
 DBUS_PYTHON_CONF_ENV = am_cv_pathless_PYTHON=python \
diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index eab8c73..a9fc072 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -6,7 +6,7 @@
 
 DFU_UTIL_VERSION = 0.6
 DFU_UTIL_SOURCE = dfu-util-$(DFU_UTIL_VERSION).tar.gz
-DFU_UTIL_SITE = http://dfu-util.gnumonks.org/releases/
+DFU_UTIL_SITE = http://dfu-util.gnumonks.org/releases
 
 HOST_DFU_UTIL_DEPENDENCIES = host-libusb
 
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 5296db8..e96e93e 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -6,7 +6,7 @@
 
 DHCPCD_VERSION = 5.6.7
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
-DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd/
+DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_LICENSE = BSD-2c
 
 ifeq ($(BR2_USE_MMU),)
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index 0c47d06..af4d619 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DHCPDUMP_VERSION = 1.8
-DHCPDUMP_SITE    = http://www.mavetju.org/download/
+DHCPDUMP_SITE    = http://www.mavetju.org/download
 DHCPDUMP_SOURCE  = dhcpdump-$(DHCPDUMP_VERSION).tar.gz
 
 DHCPDUMP_DEPENDENCIES = libpcap
diff --git a/package/dhrystone/dhrystone.mk b/package/dhrystone/dhrystone.mk
index 47c2ef2..a5f7012 100644
--- a/package/dhrystone/dhrystone.mk
+++ b/package/dhrystone/dhrystone.mk
@@ -6,7 +6,7 @@
 
 DHRYSTONE_VERSION = 2
 DHRYSTONE_SOURCE = dhry-c
-DHRYSTONE_SITE = http://www.netlib.org/benchmark/
+DHRYSTONE_SITE = http://www.netlib.org/benchmark
 
 define DHRYSTONE_EXTRACT_CMDS
 	(cd $(@D) && $(SHELL) $(DL_DIR)/$($(PKG)_SOURCE))
diff --git a/package/distcc/distcc.mk b/package/distcc/distcc.mk
index 9e1c669..b0dd34b 100644
--- a/package/distcc/distcc.mk
+++ b/package/distcc/distcc.mk
@@ -6,7 +6,7 @@
 
 DISTCC_VERSION = 2.18.3
 DISTCC_SOURCE = distcc-$(DISTCC_VERSION).tar.bz2
-DISTCC_SITE = http://distcc.googlecode.com/files/
+DISTCC_SITE = http://distcc.googlecode.com/files
 DISTCC_CONF_OPT = --with-included-popt --without-gtk --without-gnome
 DISTCC_LICENSE = GPLv2+
 DISTCC_LICENSE_FILES = COPYING
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index 86a3be5..8f8f7b2 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DMIDECODE_VERSION = 2.11
-DMIDECODE_SITE    = http://download.savannah.gnu.org/releases/dmidecode/
+DMIDECODE_SITE    = http://download.savannah.gnu.org/releases/dmidecode
 
 define DMIDECODE_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
diff --git a/package/doom-wad/doom-wad.mk b/package/doom-wad/doom-wad.mk
index b21fed8..2351f67 100644
--- a/package/doom-wad/doom-wad.mk
+++ b/package/doom-wad/doom-wad.mk
@@ -6,7 +6,7 @@
 
 DOOM_WAD_VERSION = 1.8
 DOOM_WAD_SOURCE = doom-$(DOOM_WAD_VERSION).wad.gz
-DOOM_WAD_SITE = ftp://ftp.idsoftware.com/idstuff/doom/
+DOOM_WAD_SITE = ftp://ftp.idsoftware.com/idstuff/doom
 
 define DOOM_WAD_EXTRACT_CMDS
 	$(ZCAT) $(DL_DIR)/$($(PKG)_SOURCE) > $(@D)/doom1.wad
diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index 5d65d86..749c9bf 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -6,7 +6,7 @@
 
 DROPWATCH_VERSION = 1.4
 DROPWATCH_SOURCE = dropwatch-$(DROPWATCH_VERSION).tar.xz
-DROPWATCH_SITE = https://git.fedorahosted.org/cgit/dropwatch.git/snapshot/
+DROPWATCH_SITE = https://git.fedorahosted.org/cgit/dropwatch.git/snapshot
 DROPWATCH_DEPENDENCIES = binutils libnl readline host-pkgconf
 DROPWATCH_LICENSE = GPLv2
 DROPWATCH_LICENSE_FILES = COPYING
diff --git a/package/dsp-tools/dsp-tools.mk b/package/dsp-tools/dsp-tools.mk
index e91c7bc..3cac168 100644
--- a/package/dsp-tools/dsp-tools.mk
+++ b/package/dsp-tools/dsp-tools.mk
@@ -6,7 +6,7 @@
 
 DSP_TOOLS_VERSION = 2.0
 DSP_TOOLS_SOURCE = dsp-tools-$(DSP_TOOLS_VERSION).tar.gz
-DSP_TOOLS_SITE = http://gst-dsp.googlecode.com/files/
+DSP_TOOLS_SITE = http://gst-dsp.googlecode.com/files
 DSP_TOOLS_DEPENDENCIES = tidsp-binaries
 
 define DSP_TOOLS_BUILD_CMDS
diff --git a/package/efl/expedite/expedite.mk b/package/efl/expedite/expedite.mk
index dfd3a4a..f0361bf 100644
--- a/package/efl/expedite/expedite.mk
+++ b/package/efl/expedite/expedite.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 EXPEDITE_VERSION = $(EFL_VERSION)
-EXPEDITE_SITE = http://download.enlightenment.org/releases/
+EXPEDITE_SITE = http://download.enlightenment.org/releases
 EXPEDITE_LICENSE = BSD-2c
 EXPEDITE_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index 98496ac..101fad4 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -6,7 +6,7 @@
 
 LIBECORE_VERSION = $(EFL_VERSION)
 LIBECORE_SOURCE = ecore-$(LIBECORE_VERSION).tar.bz2
-LIBECORE_SITE = http://download.enlightenment.org/releases/
+LIBECORE_SITE = http://download.enlightenment.org/releases
 LIBECORE_LICENSE = BSD-2c
 LIBECORE_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
index e6f9b08..c5e76c2 100644
--- a/package/efl/libedbus/libedbus.mk
+++ b/package/efl/libedbus/libedbus.mk
@@ -6,7 +6,7 @@
 
 LIBEDBUS_VERSION = $(EFL_VERSION)
 LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
-LIBEDBUS_SITE = http://download.enlightenment.org/releases/
+LIBEDBUS_SITE = http://download.enlightenment.org/releases
 LIBEDBUS_LICENSE = BSD-2c
 LIBEDBUS_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
index 12d1999..52e54e0 100644
--- a/package/efl/libedje/libedje.mk
+++ b/package/efl/libedje/libedje.mk
@@ -6,7 +6,7 @@
 
 LIBEDJE_VERSION = $(EFL_VERSION)
 LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
-LIBEDJE_SITE =  http://download.enlightenment.org/releases/
+LIBEDJE_SITE =  http://download.enlightenment.org/releases
 LIBEDJE_LICENSE = GPLv2+ (epp binary), BSD-2c (everything else)
 LIBEDJE_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
index ee33a0d..455ea43 100644
--- a/package/efl/libeet/libeet.mk
+++ b/package/efl/libeet/libeet.mk
@@ -6,7 +6,7 @@
 
 LIBEET_VERSION = $(EFL_VERSION)
 LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
-LIBEET_SITE = http://download.enlightenment.org/releases/
+LIBEET_SITE = http://download.enlightenment.org/releases
 LIBEET_LICENSE = BSD-2c
 LIBEET_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libefreet/libefreet.mk b/package/efl/libefreet/libefreet.mk
index 27b8fa2..670bbb5 100644
--- a/package/efl/libefreet/libefreet.mk
+++ b/package/efl/libefreet/libefreet.mk
@@ -6,7 +6,7 @@
 
 LIBEFREET_VERSION = $(EFL_VERSION)
 LIBEFREET_SOURCE = efreet-$(LIBEFREET_VERSION).tar.bz2
-LIBEFREET_SITE = http://download.enlightenment.org/releases/
+LIBEFREET_SITE = http://download.enlightenment.org/releases
 LIBEFREET_LICENSE = BSD-2c
 LIBEFREET_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
index 1a11ae0..5b288dd 100644
--- a/package/efl/libeina/libeina.mk
+++ b/package/efl/libeina/libeina.mk
@@ -6,7 +6,7 @@
 
 LIBEINA_VERSION = $(EFL_VERSION)
 LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
-LIBEINA_SITE = http://download.enlightenment.org/releases/
+LIBEINA_SITE = http://download.enlightenment.org/releases
 LIBEINA_LICENSE = LGPLv2.1+
 LIBEINA_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libeio/libeio.mk b/package/efl/libeio/libeio.mk
index 65d2a32..6109f94 100644
--- a/package/efl/libeio/libeio.mk
+++ b/package/efl/libeio/libeio.mk
@@ -6,7 +6,7 @@
 
 LIBEIO_VERSION = $(EFL_VERSION)
 LIBEIO_SOURCE = eio-$(LIBEIO_VERSION).tar.bz2
-LIBEIO_SITE = http://download.enlightenment.org/releases/
+LIBEIO_SITE = http://download.enlightenment.org/releases
 LIBEIO_LICENSE = LGPLv2.1
 LIBEIO_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
index 82a8c1c..0b2141e 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -6,7 +6,7 @@
 
 LIBELEMENTARY_VERSION = $(EFL_VERSION)
 LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.bz2
-LIBELEMENTARY_SITE = http://download.enlightenment.org/releases/
+LIBELEMENTARY_SITE = http://download.enlightenment.org/releases
 LIBELEMENTARY_LICENSE = LGPLv2.1
 LIBELEMENTARY_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libembryo/libembryo.mk b/package/efl/libembryo/libembryo.mk
index 727c424..ebbf0b2 100644
--- a/package/efl/libembryo/libembryo.mk
+++ b/package/efl/libembryo/libembryo.mk
@@ -6,7 +6,7 @@
 
 LIBEMBRYO_VERSION = $(EFL_VERSION)
 LIBEMBRYO_SOURCE = embryo-$(LIBEMBRYO_VERSION).tar.bz2
-LIBEMBRYO_SITE = http://download.enlightenment.org/releases/
+LIBEMBRYO_SITE = http://download.enlightenment.org/releases
 LIBEMBRYO_LICENSE = BSD-2c, Embryo license
 LIBEMBRYO_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libethumb/libethumb.mk b/package/efl/libethumb/libethumb.mk
index 62ce752..67231f0 100644
--- a/package/efl/libethumb/libethumb.mk
+++ b/package/efl/libethumb/libethumb.mk
@@ -6,7 +6,7 @@
 
 LIBETHUMB_VERSION = $(EFL_VERSION)
 LIBETHUMB_SOURCE = ethumb-$(LIBETHUMB_VERSION).tar.bz2
-LIBETHUMB_SITE = http://download.enlightenment.org/releases/
+LIBETHUMB_SITE = http://download.enlightenment.org/releases
 LIBETHUMB_LICENSE = LGPLv2.1+
 LIBETHUMB_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk b/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
index 6de7d64..152a75b 100644
--- a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
+++ b/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
@@ -6,7 +6,7 @@
 
 LIBEVAS_GENERIC_LOADERS_VERSION = $(EFL_VERSION)
 LIBEVAS_GENERIC_LOADERS_SOURCE = evas_generic_loaders-$(LIBEVAS_GENERIC_LOADERS_VERSION).tar.bz2
-LIBEVAS_GENERIC_LOADERS_SITE = http://download.enlightenment.org/releases/
+LIBEVAS_GENERIC_LOADERS_SITE = http://download.enlightenment.org/releases
 LIBEVAS_GENERIC_LOADERS_LICENSE = GPLv2
 LIBEVAS_GENERIC_LOADERS_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 46de4cb..b55d33c 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -6,7 +6,7 @@
 
 LIBEVAS_VERSION = $(EFL_VERSION)
 LIBEVAS_SOURCE = evas-$(LIBEVAS_VERSION).tar.bz2
-LIBEVAS_SITE = http://download.enlightenment.org/releases/
+LIBEVAS_SITE = http://download.enlightenment.org/releases
 LIBEVAS_LICENSE = BSD-2c
 LIBEVAS_LICENSE_FILES = COPYING
 
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 5abd464..a9c948f 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -6,7 +6,7 @@
 
 # version 3.2
 EIGEN_VERSION = ffa86ffb5570
-EIGEN_SITE    = https://bitbucket.org/eigen/eigen/
+EIGEN_SITE    = https://bitbucket.org/eigen/eigen
 EIGEN_SITE_METHOD = hg
 EIGEN_LICENSE = MPL2, BSD-3c, LGPLv2.1
 EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.LGPL COPYING.README
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index b415486..ec3ce0d 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ENLIGHTENMENT_VERSION = 0.17.3
-ENLIGHTENMENT_SITE = http://download.enlightenment.org/releases/
+ENLIGHTENMENT_SITE = http://download.enlightenment.org/releases
 ENLIGHTENMENT_LICENSE = BSD-2c
 ENLIGHTENMENT_LICENSE_FILES = COPYING
 
diff --git a/package/enscript/enscript.mk b/package/enscript/enscript.mk
index 3b15d55..1712560 100644
--- a/package/enscript/enscript.mk
+++ b/package/enscript/enscript.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ENSCRIPT_VERSION = 1.6.6
-ENSCRIPT_SITE = $(BR2_GNU_MIRROR)/enscript/
+ENSCRIPT_SITE = $(BR2_GNU_MIRROR)/enscript
 ENSCRIPT_LICENSE = GPLv3+
 ENSCRIPT_LICENSE_FILES = COPYING
 
diff --git a/package/evtest/evtest.mk b/package/evtest/evtest.mk
index 2a87553..8bfe4a1 100644
--- a/package/evtest/evtest.mk
+++ b/package/evtest/evtest.mk
@@ -7,7 +7,7 @@
 EVTEST_VERSION = 1.30
 EVTEST_SOURCE = evtest-$(EVTEST_VERSION).tar.bz2
 # no official upstream tarball
-EVTEST_SITE = http://pkgs.fedoraproject.org/repo/pkgs/evtest/evtest-1.30.tar.bz2/27c0902839babfd07136f232c63c895c/
+EVTEST_SITE = http://pkgs.fedoraproject.org/repo/pkgs/evtest/evtest-1.30.tar.bz2/27c0902839babfd07136f232c63c895c
 EVTEST_LICENSE = GPLv2
 EVTEST_LICENSE_FILES = COPYING
 EVTEST_DEPENDENCIES = host-pkgconf
diff --git a/package/explorercanvas/explorercanvas.mk b/package/explorercanvas/explorercanvas.mk
index 976082a..0ac5ef2 100644
--- a/package/explorercanvas/explorercanvas.mk
+++ b/package/explorercanvas/explorercanvas.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 EXPLORERCANVAS_VERSION = r3
-EXPLORERCANVAS_SITE = http://explorercanvas.googlecode.com/files/
+EXPLORERCANVAS_SITE = http://explorercanvas.googlecode.com/files
 EXPLORERCANVAS_SOURCE = excanvas_$(EXPLORERCANVAS_VERSION).zip
 
 define EXPLORERCANVAS_EXTRACT_CMDS
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index e655b8f..2f26b68 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -6,7 +6,7 @@
 
 FAKEROOT_VERSION = 1.18.2
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
-FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20111201T093630Z/pool/main/f/fakeroot/
+FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20111201T093630Z/pool/main/f/fakeroot
 FAKEROOT_LICENSE = GPLv3+
 FAKEROOT_LICENSE_FILES = COPYING
 
diff --git a/package/fan-ctrl/fan-ctrl.mk b/package/fan-ctrl/fan-ctrl.mk
index 5f39813..644f13a 100644
--- a/package/fan-ctrl/fan-ctrl.mk
+++ b/package/fan-ctrl/fan-ctrl.mk
@@ -7,7 +7,7 @@
 # no release, so grab .c file directly from viewvc
 FAN_CTRL_VERSION = 1.3
 FAN_CTRL_SOURCE = fan-ctrl.c?revision=$(FAN_CTRL_VERSION)
-FAN_CTRL_SITE = http://fan-ctrl.cvs.sourceforge.net/viewvc/fan-ctrl/fan-ctrl/
+FAN_CTRL_SITE = http://fan-ctrl.cvs.sourceforge.net/viewvc/fan-ctrl/fan-ctrl
 FAN_CTRL_LICENSE = GPLv2+
 
 define FAN_CTRL_EXTRACT_CMDS
diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
index 45fd2a0..35a8098 100644
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -6,7 +6,7 @@
 
 FCONFIG_VERSION = 20080329
 FCONFIG_SOURCE = fconfig-$(FCONFIG_VERSION).tar.gz
-FCONFIG_SITE = http://andrzejekiert.ovh.org/software/fconfig/
+FCONFIG_SITE = http://andrzejekiert.ovh.org/software/fconfig
 
 define FCONFIG_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 360d03a..2a62014 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -6,7 +6,7 @@
 
 FEH_VERSION = 2.9.1
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
-FEH_SITE = http://feh.finalrewind.org/
+FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = libcurl giblib imlib2 libpng xlib_libXinerama xlib_libXt
 
 define FEH_BUILD_CMDS
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index 08781fb..145424b 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -6,7 +6,7 @@
 
 FLTK_VERSION = 1.1.7
 FLTK_SOURCE = fltk-$(FLTK_VERSION)-source.tar.bz2
-FLTK_SITE = http://ftp.easysw.com/pub/fltk/1.1.7/
+FLTK_SITE = http://ftp.easysw.com/pub/fltk/1.1.7
 FLTK_INSTALL_STAGING = YES
 FLTK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) STRIP=$(TARGET_STRIP) install
 FLTK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) install
diff --git a/package/fmtools/fmtools.mk b/package/fmtools/fmtools.mk
index 407b702..dcf105a 100644
--- a/package/fmtools/fmtools.mk
+++ b/package/fmtools/fmtools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FMTOOLS_VERSION = 1.0.2
-FMTOOLS_SITE = http://www.stanford.edu/~blp/fmtools/
+FMTOOLS_SITE = http://www.stanford.edu/~blp/fmtools
 
 define FMTOOLS_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
index 341ce67..98d0b36 100644
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GADGETFS_TEST_SOURCE = gadgetfs-test.tar.bz2
-GADGETFS_TEST_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/GadgetFsTest/
+GADGETFS_TEST_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/GadgetFsTest
 
 GADGETFS_TEST_MAKEOPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 0c0cc99..7dbdc71 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -16,9 +16,9 @@ GCC_SNAP_DATE = $(call qstrip,$(BR2_GCC_SNAP_DATE))
 endif
 
 ifneq ($(GCC_SNAP_DATE),)
-GCC_SITE = ftp://gcc.gnu.org/pub/gcc/snapshots/$(GCC_SNAP_DATE)/
+GCC_SITE = ftp://gcc.gnu.org/pub/gcc/snapshots/$(GCC_SNAP_DATE)
 else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
-GCC_SITE = ftp://www.at91.com/pub/buildroot/
+GCC_SITE = ftp://www.at91.com/pub/buildroot
 else ifeq ($(findstring arc,$(GCC_VERSION)),arc)
 GCC_SITE = $(BR2_ARC_SITE)
 else
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 9cf90e3..b4d0f4c 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -26,7 +26,7 @@ GDB_SITE = $(BR2_ARC_SITE)
 endif
 
 ifeq ($(GDB_VERSION),6.7.1-avr32-2.1.5)
-GDB_SITE = ftp://www.at91.com/pub/buildroot/
+GDB_SITE = ftp://www.at91.com/pub/buildroot
 endif
 
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.bz2
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index e9ad52e..2748b81 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -6,7 +6,7 @@
 
 GENIMAGE_VERSION        = 4
 GENIMAGE_SOURCE         = genimage-$(GENIMAGE_VERSION).tar.xz
-GENIMAGE_SITE           = http://www.pengutronix.de/software/genimage/download/
+GENIMAGE_SITE           = http://www.pengutronix.de/software/genimage/download
 GENIMAGE_DEPENDENCIES   = host-pkgconf libconfuse
 GENIMAGE_LICENSE        = GPLv2
 
diff --git a/package/genpart/genpart.mk b/package/genpart/genpart.mk
index 3c26af2..c95acaf 100644
--- a/package/genpart/genpart.mk
+++ b/package/genpart/genpart.mk
@@ -6,7 +6,7 @@
 
 GENPART_VERSION       = 1.0.2
 GENPART_SOURCE        = genpart-$(GENPART_VERSION).tar.bz2
-GENPART_SITE          = http://www.pengutronix.de/software/genpart/download/
+GENPART_SITE          = http://www.pengutronix.de/software/genpart/download
 # genpart has no license embedded in its source release.
 # However, their project page mentions:
 #   > This community portal offers an overview about our own OSS
diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index 2a09927..16f70fd 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -6,7 +6,7 @@
 
 GESFTPSERVER_VERSION = 0.1
 GESFTPSERVER_SOURCE = sftpserver-$(GESFTPSERVER_VERSION).tar.gz
-GESFTPSERVER_SITE = http://www.greenend.org.uk/rjk/sftpserver/
+GESFTPSERVER_SITE = http://www.greenend.org.uk/rjk/sftpserver
 GESFTPSERVER_LICENSE = GPLv2+
 GESFTPSERVER_LICENSE_FILES = COPYING
 # forgets to link against pthread when cross compiling
diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
index 69100c0..59b740b 100644
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -6,7 +6,7 @@
 
 GIBLIB_VERSION = 1.2.4
 GIBLIB_SOURCE = giblib-$(GIBLIB_VERSION).tar.gz
-GIBLIB_SITE = http://linuxbrit.co.uk/downloads/
+GIBLIB_SITE = http://linuxbrit.co.uk/downloads
 GIBLIB_INSTALL_STAGING = YES
 GIBLIB_DEPENDENCIES = imlib2
 GIBLIB_AUTORECONF = YES
diff --git a/package/git/git.mk b/package/git/git.mk
index b8a7623..851178d 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GIT_VERSION         = 1.8.3
-GIT_SITE            = http://git-core.googlecode.com/files/
+GIT_SITE            = http://git-core.googlecode.com/files
 GIT_LICENSE         = GPLv2 LGPLv2.1+
 GIT_LICENSE_FILES   = COPYING LGPL-2.1
 GIT_DEPENDENCIES    = zlib host-gettext
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 4dd2e63..de899c9 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -6,7 +6,7 @@
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),y)
 GLIBC_VERSION = 2.17-svnr22064
-GLIBC_SITE = http://downloads.yoctoproject.org/releases/eglibc/
+GLIBC_SITE = http://downloads.yoctoproject.org/releases/eglibc
 GLIBC_SOURCE = eglibc-$(GLIBC_VERSION).tar.bz2
 GLIBC_SRC_SUBDIR = libc
 else
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index be2e681..249e3a0 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GPSD_VERSION = 3.9
-GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd/
+GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-3c
 GPSD_LICENSE_FILES = COPYING
 GPSD_INSTALL_STAGING = YES
diff --git a/package/gstreamer/gst-dsp/gst-dsp.mk b/package/gstreamer/gst-dsp/gst-dsp.mk
index 1fd6976..e4b4d36 100644
--- a/package/gstreamer/gst-dsp/gst-dsp.mk
+++ b/package/gstreamer/gst-dsp/gst-dsp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GST_DSP_VERSION = 0.10.2
-GST_DSP_SITE = http://gst-dsp.googlecode.com/files/
+GST_DSP_SITE = http://gst-dsp.googlecode.com/files
 
 define GST_DSP_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
diff --git a/package/gstreamer/gst-omapfb/gst-omapfb.mk b/package/gstreamer/gst-omapfb/gst-omapfb.mk
index bfcaa5d..aa4b5d0 100644
--- a/package/gstreamer/gst-omapfb/gst-omapfb.mk
+++ b/package/gstreamer/gst-omapfb/gst-omapfb.mk
@@ -6,7 +6,7 @@
 
 GST_OMAPFB_VERSION = 1.0
 GST_OMAPFB_SOURCE = gst-omapfb-$(GST_OMAPFB_VERSION).tar.gz
-GST_OMAPFB_SITE = http://gst-dsp.googlecode.com/files/
+GST_OMAPFB_SITE = http://gst-dsp.googlecode.com/files
 
 define GST_OMAPFB_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
diff --git a/package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk b/package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk
index e14d460..29929bc 100644
--- a/package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk
+++ b/package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GST_PLUGIN_X170_VERSION = 1.0
-GST_PLUGIN_X170_SITE = ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/
+GST_PLUGIN_X170_SITE = ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec
 
 GST_PLUGIN_X170_LICENSE = BSD-1c
 #A license file is included but it is just a placeholder
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 4b92584..ea5648e 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -6,7 +6,7 @@
 
 GST_OMX_VERSION = 1.0.0
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
-GST_OMX_SITE = http://gstreamer.freedesktop.org/src/gst-omx/
+GST_OMX_SITE = http://gstreamer.freedesktop.org/src/gst-omx
 
 GST_OMX_LICENSE = LGPLv2.1
 GST_OMX_LICENSE_FILES = COPYING
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 52028f5..f07103b 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -6,7 +6,7 @@
 
 GTEST_VERSION = 1.6.0
 GTEST_SOURCE = gtest-$(GTEST_VERSION).zip
-GTEST_SITE = http://googletest.googlecode.com/files/
+GTEST_SITE = http://googletest.googlecode.com/files
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
 
diff --git a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
index ae677f7..cba5efc 100644
--- a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
+++ b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
@@ -6,7 +6,7 @@
 
 GTK2_THEME_HICOLOR_VERSION = 0.10
 GTK2_THEME_HICOLOR_SOURCE = hicolor-icon-theme-$(GTK2_THEME_HICOLOR_VERSION).tar.gz
-GTK2_THEME_HICOLOR_SITE = http://icon-theme.freedesktop.org/releases/
+GTK2_THEME_HICOLOR_SITE = http://icon-theme.freedesktop.org/releases
 
 GTK2_THEME_HICOLOR_DEPENDENCIES = libgtk2
 
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 00651fd..d6bd347 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HARFBUZZ_VERSION = 0.9.19
-HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release/
+HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library), ICU License (icu support library)
 HARFBUZZ_LICENSE_FILES = COPYING src/hb-ucdn/COPYING src/hb-icu-le/COPYING
diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index a4d94b6..75221d4 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -6,7 +6,7 @@
 
 HEIRLOOM_MAILX_VERSION = 12.5
 HEIRLOOM_MAILX_SOURCE  = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
-HEIRLOOM_MAILX_SITE    = http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/h/heirloom-mailx/
+HEIRLOOM_MAILX_SITE    = http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/h/heirloom-mailx
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 HEIRLOOM_MAILX_DEPENDENCIES += openssl
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index bcac8c9..97f4e78 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -7,7 +7,7 @@
 HWDATA_VERSION = 0.230
 HWDATA_SOURCE = hwdata_$(HWDATA_VERSION).orig.tar.gz
 HWDATA_PATCH = hwdata_$(HWDATA_VERSION)-1.diff.gz
-HWDATA_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/h/hwdata/
+HWDATA_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/h/hwdata
 
 define HWDATA_INSTALL_TARGET_CMDS
 	install -D -m 644 $(@D)/pci.ids $(TARGET_DIR)/usr/share/hwdata/pci.ids
diff --git a/package/iftop/iftop.mk b/package/iftop/iftop.mk
index de2f1b1..66d86b7 100644
--- a/package/iftop/iftop.mk
+++ b/package/iftop/iftop.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IFTOP_VERSION = 1.0pre2
-IFTOP_SITE = http://www.ex-parrot.com/pdw/iftop/download/
+IFTOP_SITE = http://www.ex-parrot.com/pdw/iftop/download
 
 IFTOP_DEPENDENCIES = ncurses libpcap
 
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 63bda2f..b1cbc90 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IGH_ETHERCAT_VERSION = 1.5.1
-IGH_ETHERCAT_SITE    = http://etherlab.org/download/ethercat/
+IGH_ETHERCAT_SITE    = http://etherlab.org/download/ethercat
 IGH_ETHERCAT_SOURCE  = ethercat-$(IGH_ETHERCAT_VERSION).tar.bz2
 IGH_ETHERCAT_LICENSE = GPLv2 (IgH EtherCAT master), LGPLv2.1 (libraries)
 IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 2149574..226394a 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -10,7 +10,7 @@ IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
 # older versions.
-IMAGEMAGICK_SITE = ftp://ftp.nluug.nl/pub/ImageMagick/
+IMAGEMAGICK_SITE = ftp://ftp.nluug.nl/pub/ImageMagick
 IMAGEMAGICK_LICENSE = Apache-v2
 IMAGEMAGICK_LICENSE_FILES = LICENSE
 
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 5b9d6b0..05ec16b 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -6,7 +6,7 @@
 
 IMLIB2_VERSION = 1.4.5
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
-IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)/
+IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)
 IMLIB2_LICENSE = imlib2 license
 IMLIB2_LICENSE_FILES = COPYING
 
diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index 1a988a3..96b23ce 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 INOTIFY_TOOLS_VERSION = 3.14
-INOTIFY_TOOLS_SITE = http://github.com/downloads/rvoicilas/inotify-tools/
+INOTIFY_TOOLS_SITE = http://github.com/downloads/rvoicilas/inotify-tools
 INOTIFY_TOOLS_LICENSE = GPL
 INOTIFY_TOOLS_LICENSE_FILES = COPYING
 INOTIFY_TOOLS_INSTALL_STAGING = YES
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index 503f16a..9d6e38e 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -7,7 +7,7 @@
 INPUT_TOOLS_VERSION = 20051019
 INPUT_TOOLS_SOURCE  = joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
 INPUT_TOOLS_PATCH   = joystick_$(INPUT_TOOLS_VERSION)-5.diff.gz
-INPUT_TOOLS_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/j/joystick/
+INPUT_TOOLS_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/j/joystick
 
 INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH) += inputattach
 INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_JSCAL)       += jscal
diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 3772960..9ede2ae 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -6,7 +6,7 @@
 
 INTLTOOL_VERSION = 0.50.2
 INTLTOOL_SOURCE = intltool-$(INTLTOOL_VERSION).tar.gz
-INTLTOOL_SITE = https://launchpad.net/intltool/trunk/$(INTLTOOL_VERSION)/+download/
+INTLTOOL_SITE = https://launchpad.net/intltool/trunk/$(INTLTOOL_VERSION)/+download
 INTLTOOL_LICENSE = GPLv2+
 INTLTOOL_LICENSE_FILES = COPYING
 
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 8eeef1b..e5cc7e5 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -6,7 +6,7 @@
 
 IPSEC_TOOLS_VERSION = 0.8.0
 IPSEC_TOOLS_SOURCE = ipsec-tools-$(IPSEC_TOOLS_VERSION).tar.bz2
-IPSEC_TOOLS_SITE = http://ftp.sunet.se/pub/NetBSD/misc/ipsec-tools/0.8/
+IPSEC_TOOLS_SITE = http://ftp.sunet.se/pub/NetBSD/misc/ipsec-tools/0.8
 IPSEC_TOOLS_INSTALL_STAGING = YES
 IPSEC_TOOLS_MAKE = $(MAKE1)
 IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 0a2f70e..b7b92eb 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 JSON_C_VERSION = 0.11
-JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases/
+JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_MAKE = $(MAKE1)
 JSON_C_CONF_OPT = --disable-oldname-compat
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index a1ad7d6..c9d910d 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -6,7 +6,7 @@
 
 KMOD_VERSION = 15
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
-KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
+KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
 KMOD_DEPENDENCIES = host-pkgconf
 HOST_KMOD_DEPENDENCIES = host-pkgconf
diff --git a/package/kobs-ng/kobs-ng.mk b/package/kobs-ng/kobs-ng.mk
index f7e65e7..13d1faf 100644
--- a/package/kobs-ng/kobs-ng.mk
+++ b/package/kobs-ng/kobs-ng.mk
@@ -6,7 +6,7 @@
 
 # kobs-ng versions have never made much sense :(
 KOBS_NG_VERSION = 3.0.35-4.0.0
-KOBS_NG_SITE = http://repository.timesys.com/buildsources/k/kobs-ng/kobs-ng-$(KOBS_NG_VERSION)/
+KOBS_NG_SITE = http://repository.timesys.com/buildsources/k/kobs-ng/kobs-ng-$(KOBS_NG_VERSION)
 KOBS_NG_LICENSE = GPLv2+
 KOBS_NG_LICENSE_FILES = COPYING
 
diff --git a/package/latencytop/latencytop.mk b/package/latencytop/latencytop.mk
index a19f48a..6363e17 100644
--- a/package/latencytop/latencytop.mk
+++ b/package/latencytop/latencytop.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LATENCYTOP_VERSION = 0.5
-LATENCYTOP_SITE = http://www.latencytop.org/download/
+LATENCYTOP_SITE = http://www.latencytop.org/download
 LATENCYTOP_DEPENDENCIES = libglib2 ncurses
 
 # NOTE: GTK is heavy weight, we intentionally build the text (ncurses)
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index b66c9f5..f958c5a 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -6,7 +6,7 @@
 
 LIBAIO_VERSION = 0.3.109
 LIBAIO_SOURCE = libaio_$(LIBAIO_VERSION).orig.tar.gz
-LIBAIO_SITE = http://snapshot.debian.org/archive/debian/20110227T085214Z/pool/main/liba/libaio/
+LIBAIO_SITE = http://snapshot.debian.org/archive/debian/20110227T085214Z/pool/main/liba/libaio
 LIBAIO_INSTALL_STAGING = YES
 
 define LIBAIO_BUILD_CMDS
diff --git a/package/libart/libart.mk b/package/libart/libart.mk
index 53dfe5a..27a16fc 100644
--- a/package/libart/libart.mk
+++ b/package/libart/libart.mk
@@ -6,7 +6,7 @@
 
 LIBART_VERSION = 2.3.21
 LIBART_SOURCE = libart_lgpl-$(LIBART_VERSION).tar.gz
-LIBART_SITE = http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/2.3/
+LIBART_SITE = http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/2.3
 LIBART_AUTORECONF = YES
 LIBART_INSTALL_STAGING = YES
 LIBART_CONFIG_SCRIPTS = libart2-config
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index 5f5378b..595baa7 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBASSUAN_VERSION = 2.1.1
-LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan/
+LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPLv2.1+ (library), GPLv3 (tests, doc)
 LIBASSUAN_LICENSE_FILES = COPYING.LIB COPYING
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 53c7ee7..7094954 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAP_NG_VERSION = 0.7.3
-LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng/
+LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
 LIBCAP_NG_LICENSE = GPLv2+ LGPLv2.1+
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
 LIBCAP_NG_INSTALL_STAGING = YES
diff --git a/package/libcdaudio/libcdaudio.mk b/package/libcdaudio/libcdaudio.mk
index 151bb8c..8d22e05 100644
--- a/package/libcdaudio/libcdaudio.mk
+++ b/package/libcdaudio/libcdaudio.mk
@@ -6,7 +6,7 @@
 
 LIBCDAUDIO_VERSION = 0.99.12p2
 LIBCDAUDIO_SOURCE = libcdaudio-$(LIBCDAUDIO_VERSION).tar.gz
-LIBCDAUDIO_SITE = http://downloads.sourceforge.net/project/libcdaudio/libcdaudio/$(LIBCDAUDIO_VERSION)/
+LIBCDAUDIO_SITE = http://downloads.sourceforge.net/project/libcdaudio/libcdaudio/$(LIBCDAUDIO_VERSION)
 LIBCDAUDIO_AUTORECONF = YES
 LIBCDAUDIO_LIBTOOL_PATCH = YES
 LIBCDAUDIO_INSTALL_STAGING = YES
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 7a80df3..d2cc9e3 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCONFIG_VERSION = 1.4.9
-LIBCONFIG_SITE = http://www.hyperrealm.com/libconfig/
+LIBCONFIG_SITE = http://www.hyperrealm.com/libconfig
 LIBCONFIG_LICENSE = LGPLv2.1+
 LIBCONFIG_LICENSE_FILES = COPYING.LIB
 LIBCONFIG_INSTALL_STAGING = YES
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 66cabd3..092e222 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -6,7 +6,7 @@
 
 LIBCONFUSE_VERSION = 2.7
 LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.gz
-LIBCONFUSE_SITE = http://savannah.nongnu.org/download/confuse/
+LIBCONFUSE_SITE = http://savannah.nongnu.org/download/confuse
 LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPT = --disable-rpath
 
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index d3d2b2d..d94814a 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -6,7 +6,7 @@
 
 LIBDRM_VERSION = 2.4.38
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
-LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
+LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
 
 LIBDRM_INSTALL_STAGING = YES
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 6abdaab..62c7c16 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBEXOSIP2_VERSION = 3.6.0
-LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip/
+LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip
 LIBEXOSIP2_INSTALL_STAGING = YES
 LIBEXOSIP2_LICENSE = GPLv2+
 LIBEXOSIP2_LICENSE_FILES = COPYING
diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
index 9aeab77..e555922 100644
--- a/package/libebml/libebml.mk
+++ b/package/libebml/libebml.mk
@@ -6,7 +6,7 @@
 
 LIBEBML_VERSION = 1.2.2
 LIBEBML_SOURCE = libebml-$(LIBEBML_VERSION).tar.bz2
-LIBEBML_SITE = http://dl.matroska.org/downloads/libebml/
+LIBEBML_SITE = http://dl.matroska.org/downloads/libebml
 LIBEBML_INSTALL_STAGING = YES
 LIBEBML_LICENSE = LGPLv2.1+
 LIBEBML_LICENSE_FILES = LICENSE.LGPL
diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index 0ff418a..8f9c176 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBEDIT_VERSION         = 20130712-3.1
-LIBEDIT_SITE            = http://www.thrysoee.dk/editline/
+LIBEDIT_SITE            = http://www.thrysoee.dk/editline
 LIBEDIT_INSTALL_STAGING = YES
 LIBEDIT_DEPENDENCIES    = ncurses
 
diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
index b5aff56..2bb1b61 100644
--- a/package/libelf/libelf.mk
+++ b/package/libelf/libelf.mk
@@ -6,7 +6,7 @@
 
 LIBELF_VERSION = 0.8.12
 LIBELF_SOURCE = libelf-$(LIBELF_VERSION).tar.gz
-LIBELF_SITE = http://www.mr511.de/software/
+LIBELF_SITE = http://www.mr511.de/software
 LIBELF_INSTALL_STAGING = YES
 LIBELF_INSTALL_STAGING_OPT = instroot=$(STAGING_DIR) install
 LIBELF_INSTALL_TARGET_OPT = instroot=$(TARGET_DIR) install
diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 0056501..11fd3b2 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -6,7 +6,7 @@
 
 LIBEV_VERSION = 4.11
 LIBEV_SOURCE = libev-$(LIBEV_VERSION).tar.gz
-LIBEV_SITE = http://dist.schmorp.de/libev/
+LIBEV_SITE = http://dist.schmorp.de/libev
 LIBEV_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 8c84924..db41d8f 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBFFI_VERSION = 3.0.13
-LIBFFI_SITE    = ftp://sourceware.org/pub/libffi/
+LIBFFI_SITE    = ftp://sourceware.org/pub/libffi
 LIBFFI_LICENSE = MIT
 LIBFFI_LICENSE_FILES = LICENSE
 LIBFFI_INSTALL_STAGING = YES
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 99005c2..38c134d 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -6,7 +6,7 @@
 
 LIBFRIBIDI_VERSION = 0.19.5
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.bz2
-LIBFRIBIDI_SITE = http://www.fribidi.org/download/
+LIBFRIBIDI_SITE = http://www.fribidi.org/download
 LIBFRIBIDI_LICENSE = LGPLv2.1+
 LIBFRIBIDI_LICENSE_FILES = COPYING
 LIBFRIBIDI_INSTALL_STAGING = YES
diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index 3cf11a2..dce1150 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -6,7 +6,7 @@
 
 LIBFTDI_VERSION = 0.19
 LIBFTDI_SOURCE = libftdi-$(LIBFTDI_VERSION).tar.gz
-LIBFTDI_SITE = http://www.intra2net.com/en/developer/libftdi/download/
+LIBFTDI_SITE = http://www.intra2net.com/en/developer/libftdi/download
 LIBFTDI_DEPENDENCIES = libusb-compat libusb
 LIBFTDI_INSTALL_STAGING = YES
 LIBFTDI_CONFIG_SCRIPTS = libftdi-config
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 343ecc4..7053b6d 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -6,7 +6,7 @@
 
 LIBGLADE_VERSION = 2.6.4
 LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
-LIBGLADE_SITE = http://ftp.gnome.org/pub/GNOME/sources/libglade/2.6/
+LIBGLADE_SITE = http://ftp.gnome.org/pub/GNOME/sources/libglade/2.6
 LIBGLADE_INSTALL_STAGING = YES
 LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 atk libxml2
 
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 9995d91..2208a4a 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGPGME_VERSION = 1.4.2
-LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme/
+LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPLv2.1+
 LIBGPGME_LICENSE_FILES = COPYING.LESSER
diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index b0b02ad..ec6aff9 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBJPEG_VERSION = 8d
-LIBJPEG_SITE = http://www.ijg.org/files/
+LIBJPEG_SITE = http://www.ijg.org/files
 LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_INSTALL_STAGING = YES
 
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index 6e07704..00a3b01 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -6,7 +6,7 @@
 
 LIBLOCKFILE_VERSION = 1.08
 LIBLOCKFILE_SOURCE = liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
-LIBLOCKFILE_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libl/liblockfile/
+LIBLOCKFILE_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libl/liblockfile
 LIBLOCKFILE_PATCH = liblockfile_$(LIBLOCKFILE_VERSION)-4.debian.tar.bz2
 
 LIBLOCKFILE_LICENSE = LGPLv2+, dotlockfile GPLv2+
diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
index 2833ea7..868eff2 100644
--- a/package/libmatroska/libmatroska.mk
+++ b/package/libmatroska/libmatroska.mk
@@ -6,7 +6,7 @@
 
 LIBMATROSKA_VERSION = 1.3.0
 LIBMATROSKA_SOURCE = libmatroska-$(LIBMATROSKA_VERSION).tar.bz2
-LIBMATROSKA_SITE = http://dl.matroska.org/downloads/libmatroska/
+LIBMATROSKA_SITE = http://dl.matroska.org/downloads/libmatroska
 LIBMATROSKA_INSTALL_STAGING = YES
 LIBMATROSKA_LICENSE = LGPLv2.1+
 LIBMATROSKA_LICENSE_FILES = LICENSE.LGPL
diff --git a/package/libnfc-llcp/libnfc-llcp.mk b/package/libnfc-llcp/libnfc-llcp.mk
index d410b55..4b3c10d 100644
--- a/package/libnfc-llcp/libnfc-llcp.mk
+++ b/package/libnfc-llcp/libnfc-llcp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBNFC_LLCP_VERSION = 1103
-LIBNFC_LLCP_SITE = http://nfc-tools.googlecode.com/svn/trunk/libnfc-llcp/
+LIBNFC_LLCP_SITE = http://nfc-tools.googlecode.com/svn/trunk/libnfc-llcp
 LIBNFC_LLCP_SITE_METHOD = svn
 LIBNFC_LLCP_DEPENDENCIES = libnfc
 LIBNFC_LLCP_AUTORECONF = YES
diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index 2530668..85566da 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBNFC_VERSION = fda8d60ce062
-LIBNFC_SITE = http://libnfc.googlecode.com/git/
+LIBNFC_SITE = http://libnfc.googlecode.com/git
 LIBNFC_SITE_METHOD = git
 LIBNFC_LICENSE = LGPLv3+
 LIBNFC_LICENSE_FILES = COPYING
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 5aa9bdc..02be957 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -6,7 +6,7 @@
 
 LIBNSPR_VERSION = 4.9.6
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
-LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src/
+LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = mozilla/nsprpub
 LIBNSPR_INSTALL_STAGING = YES
 LIBNSPR_CONFIG_SCRIPTS = nspr-config
diff --git a/package/libplayer/libplayer.mk b/package/libplayer/libplayer.mk
index 061c87a..7918642 100644
--- a/package/libplayer/libplayer.mk
+++ b/package/libplayer/libplayer.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBPLAYER_VERSION = 2.0.1
-LIBPLAYER_SITE = http://libplayer.geexbox.org/releases/
+LIBPLAYER_SITE = http://libplayer.geexbox.org/releases
 LIBPLAYER_SOURCE = libplayer-$(LIBPLAYER_VERSION).tar.bz2
 
 # When passing the standard buildroot configure arguments, the configure script
diff --git a/package/libpthsem/libpthsem.mk b/package/libpthsem/libpthsem.mk
index dbfab34..d0b69eb 100644
--- a/package/libpthsem/libpthsem.mk
+++ b/package/libpthsem/libpthsem.mk
@@ -6,7 +6,7 @@
 
 LIBPTHSEM_VERSION = 2.0.8
 LIBPTHSEM_SOURCE = pthsem_$(LIBPTHSEM_VERSION).tar.gz
-LIBPTHSEM_SITE = http://www.auto.tuwien.ac.at/~mkoegler/pth/
+LIBPTHSEM_SITE = http://www.auto.tuwien.ac.at/~mkoegler/pth
 LIBPTHSEM_LICENSE = LGPLv2.1+
 LIBPTHSEM_LICENSE_FILES = COPYING
 LIBPTHSEM_AUTORECONF = YES
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 911b1a7..b72a831 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBQMI_VERSION = 1.4.0
-LIBQMI_SITE    = http://www.freedesktop.org/software/libqmi/
+LIBQMI_SITE    = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE  = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
 LIBQMI_LICENSE_FILES = COPYING
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index bd52cc0..85efdf3 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -6,7 +6,7 @@
 
 LIBRAW_VERSION = 0.13.4
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
-LIBRAW_SITE = http://www.libraw.org/data/
+LIBRAW_SITE = http://www.libraw.org/data
 
 LIBRAW_INSTALL_STAGING = YES
 LIBRAW_CONF_OPT += --disable-examples --disable-lcms \
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index d602513..9f6aea4 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBROXML_VERSION = 2.2.3
-LIBROXML_SITE = http://download.libroxml.net/pool/v2.x/
+LIBROXML_SITE = http://download.libroxml.net/pool/v2.x
 LIBROXML_INSTALL_STAGING = YES
 
 define LIBROXML_BUILD_CMDS
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 8cf2823..ebc2ad0 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -8,7 +8,7 @@ LIBRSVG_VERSION_MAJOR = 2.26
 LIBRSVG_VERSION_MINOR = 3
 LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).$(LIBRSVG_VERSION_MINOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.gz
-LIBRSVG_SITE = http://ftp.gnome.org/pub/GNOME/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)/
+LIBRSVG_SITE = http://ftp.gnome.org/pub/GNOME/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_OPT = --disable-tools
 LIBRSVG_DEPENDENCIES = libxml2 cairo pango libglib2 gdk-pixbuf
diff --git a/package/libsexy/libsexy.mk b/package/libsexy/libsexy.mk
index aec0378..a9e7254 100644
--- a/package/libsexy/libsexy.mk
+++ b/package/libsexy/libsexy.mk
@@ -6,7 +6,7 @@
 
 LIBSEXY_VERSION = 0.1.11
 LIBSEXY_SOURCE = libsexy-$(LIBSEXY_VERSION).tar.gz
-LIBSEXY_SITE = http://releases.chipx86.com/libsexy/libsexy/
+LIBSEXY_SITE = http://releases.chipx86.com/libsexy/libsexy
 LIBSEXY_DEPENDENCIES = libgtk2 libxml2
 LIBSEXY_INSTALL_STAGING = YES
 
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 10eb5ed..c385e65 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH2_VERSION = 1.4.3
-LIBSSH2_SITE = http://www.libssh2.org/download/
+LIBSSH2_SITE = http://www.libssh2.org/download
 LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
 LIBSSH2_INSTALL_STAGING = YES
diff --git a/package/libsvg-cairo/libsvg-cairo.mk b/package/libsvg-cairo/libsvg-cairo.mk
index a168180..93b8f76 100644
--- a/package/libsvg-cairo/libsvg-cairo.mk
+++ b/package/libsvg-cairo/libsvg-cairo.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSVG_CAIRO_VERSION         = 0.1.6
-LIBSVG_CAIRO_SITE            = http://cairographics.org/snapshots/
+LIBSVG_CAIRO_SITE            = http://cairographics.org/snapshots
 LIBSVG_CAIRO_DEPENDENCIES    = cairo libsvg
 LIBSVG_CAIRO_INSTALL_STAGING = YES
 LIBSVG_CAIRO_LICENSE         = LGPLv2.1+
diff --git a/package/libsvg/libsvg.mk b/package/libsvg/libsvg.mk
index 7069647..320d4f0 100644
--- a/package/libsvg/libsvg.mk
+++ b/package/libsvg/libsvg.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSVG_VERSION         = 0.1.4
-LIBSVG_SITE            = http://cairographics.org/snapshots/
+LIBSVG_SITE            = http://cairographics.org/snapshots
 LIBSVG_DEPENDENCIES    = host-pkgconf libpng libjpeg
 LIBSVG_INSTALL_STAGING = YES
 LIBSVG_LICENSE         = LGPLv2+
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index a586382..5dfa852 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBURCU_VERSION = 0.7.7
-LIBURCU_SITE    = http://lttng.org/files/urcu/
+LIBURCU_SITE    = http://lttng.org/files/urcu
 LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE
 LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt LICENSE
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index f62a4b6..6217a5c 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -6,7 +6,7 @@
 
 LIBV4L_VERSION = 0.8.9
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
-LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils/
+LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_MAKE_OPTS = PREFIX=/usr
 LIBV4L_DEPENDENCIES = jpeg
diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index 948a43d..544d17a 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -6,7 +6,7 @@
 
 LIBVORBIS_VERSION = 1.3.3
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.xz
-LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis/
+LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis
 LIBVORBIS_INSTALL_STAGING = YES
 LIBVORBIS_CONF_OPT = --disable-oggtest
 LIBVORBIS_DEPENDENCIES = host-pkgconf libogg
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 27c73ae..3bfe764 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXKBCOMMON_VERSION = 0.3.0
-LIBXKBCOMMON_SITE = http://xkbcommon.org/download/
+LIBXKBCOMMON_SITE = http://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
 LIBXKBCOMMON_LICENSE_FILES = COPYING
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 53f3bcf..3591cf9 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -6,7 +6,7 @@
 
 LIBXML_PARSER_PERL_VERSION = 2.36
 LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
-LIBXML_PARSER_PERL_SITE = http://www.cpan.org/modules/by-module/XML/
+LIBXML_PARSER_PERL_SITE = http://www.cpan.org/modules/by-module/XML
 
 LIBXML_PARSER_PERL_DEPENDENCIES = expat
 
diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
index 17945b2..a328bb6 100644
--- a/package/libyaml/libyaml.mk
+++ b/package/libyaml/libyaml.mk
@@ -6,7 +6,7 @@
 
 LIBYAML_VERSION = 0.1.4
 LIBYAML_SOURCE = yaml-$(LIBYAML_VERSION).tar.gz
-LIBYAML_SITE = http://pyyaml.org/download/libyaml/
+LIBYAML_SITE = http://pyyaml.org/download/libyaml
 LIBYAML_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index 2ff678b..7f1c9cd 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LINPHONE_VERSION = 3.5.2
-LINPHONE_SITE = http://download-mirror.savannah.gnu.org/releases/linphone/3.5.x/sources/
+LINPHONE_SITE = http://download-mirror.savannah.gnu.org/releases/linphone/3.5.x/sources
 LINPHONE_CONF_OPT = \
 	--enable-external-ortp \
 	--enable-external-mediastreamer \
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 30d3076..dd77750 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -9,9 +9,9 @@
 
 LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
 ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
-LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
+LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
 else
-LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x/
+LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
 endif
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
 
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 4472cd4..d4fc39f 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -6,7 +6,7 @@
 
 LINUX_PAM_VERSION = 1.1.6
 LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
-LINUX_PAM_SITE = http://linux-pam.org/library/
+LINUX_PAM_SITE = http://linux-pam.org/library
 LINUX_PAM_INSTALL_STAGING = YES
 LINUX_PAM_CONF_OPT = \
 	--disable-prelude \
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 83fe0e0..e521bde 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -6,7 +6,7 @@
 
 LIVE555_VERSION = 2011.06.16
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
-LIVE555_SITE = http://www.live555.com/liveMedia/public/
+LIVE555_SITE = http://www.live555.com/liveMedia/public
 LIVE555_INSTALL_STAGING = YES
 
 define LIVE555_CONFIGURE_CMDS
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 3d3d68f..a5efebf 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -6,7 +6,7 @@
 
 LMBENCH_VERSION = 3.0-a9
 LMBENCH_SOURCE = lmbench-$(LMBENCH_VERSION).tgz
-LMBENCH_SITE = http://downloads.sourceforge.net/project/lmbench/development/lmbench-$(LMBENCH_VERSION)/
+LMBENCH_SITE = http://downloads.sourceforge.net/project/lmbench/development/lmbench-$(LMBENCH_VERSION)
 LMBENCH_LICENSE =  lmbench license (based on GPLv2)
 LMBENCH_LICENSE_FILES = COPYING COPYING-2
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index cc38559..17ffd14 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -6,7 +6,7 @@
 
 LOCALEDEF_VERSION = 2.14.1-r17443-ptx1
 LOCALEDEF_SOURCE  = localedef-eglibc-$(LOCALEDEF_VERSION).tar.bz2
-LOCALEDEF_SITE    = http://www.pengutronix.de/software/ptxdist/temporary-src/
+LOCALEDEF_SITE    = http://www.pengutronix.de/software/ptxdist/temporary-src
 
 HOST_LOCALEDEF_CONF_OPT += \
 	--prefix=/usr \
diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
index 004b637..d279295 100644
--- a/package/lockdev/lockdev.mk
+++ b/package/lockdev/lockdev.mk
@@ -6,7 +6,7 @@
 
 LOCKDEV_VERSION = 1.0.3
 LOCKDEV_SOURCE = lockdev_$(LOCKDEV_VERSION).orig.tar.gz
-LOCKDEV_SITE = http://snapshot.debian.org/archive/debian/20130508T154517Z/pool/main/l/lockdev/
+LOCKDEV_SITE = http://snapshot.debian.org/archive/debian/20130508T154517Z/pool/main/l/lockdev
 LOCKDEV_LICENSE = LGPLv2.1
 LOCKDEV_LICENSE_FILES = LICENSE
 LOCKDEV_INSTALL_STAGING = YES
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index 35bb881..8a6e5f7 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -6,7 +6,7 @@
 
 LOCKFILE_PROGS_VERSION = 0.1.15
 LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
-LOCKFILE_PROGS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs/
+LOCKFILE_PROGS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs
 LOCKFILE_PROGS_DEPENDENCIES = liblockfile
 LOCKFILE_PROGS_LICENSE = GPLv2
 LOCKFILE_PROGS_LICENSE_FILES = COPYING
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index f5ef0b9..abbb485 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -6,7 +6,7 @@
 
 LOGROTATE_VERSION = 3.8.4
 LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.gz
-LOGROTATE_SITE = https://www.fedorahosted.org/releases/l/o/logrotate/
+LOGROTATE_SITE = https://www.fedorahosted.org/releases/l/o/logrotate
 LOGROTATE_LICENSE = GPLv2+
 LOGROTATE_LICENSE_FILES = COPYING
 
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 693bb91..826e0a3 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -6,7 +6,7 @@
 
 LSOF_VERSION = 4.85
 LSOF_SOURCE = lsof_$(LSOF_VERSION).tar.bz2
-LSOF_SITE = ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
+LSOF_SITE = ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof
 LSOF_LICENSE = lsof license
 # License is repeated in each file, this is a relatively small one.
 # It is also defined in 00README, but that contains a lot of other cruft.
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 044dac0..7c393cf 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace/
+LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace
 LTTNG_BABELTRACE_VERSION = 1.1.1
 LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 LTTNG_BABELTRACE_LICENSE = MIT; LGPLv2 for include/babeltrace/list.h; GPLv3+ for formats/ctf/metadata/ctf-parser.h
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index b0ebd3f..bd3c46a 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust/
+LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust
 LTTNG_LIBUST_VERSION = 2.2.0
 LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPLv2.1; GPLv2 for lttng-gen-tp and ust-ctl
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index baa421e..aae7b38 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_MODULES_VERSION = 2.2.0
-LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules/
+LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 for kernel modules; MIT for lib/bitfield.h and lib/prio_heap/*
 LTTNG_MODULES_LICENSE_FILES = lgpl-2.1.txt gpl-2.0.txt mit-license.txt LICENSE
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index f6eff96..39d4f0b 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_TOOLS_VERSION = 2.2.0
-LTTNG_TOOLS_SITE    = http://lttng.org/files/lttng-tools/
+LTTNG_TOOLS_SITE    = http://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2; LGPLv2.1 for include/lttng/* and src/lib/lttng-ctl/*
 # gpl-2.0.txt and lgpl-2.1.txt files are missing from the sources
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index 053309f..aa64f2e 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUASEC_VERSION = 0.4.1
-LUASEC_SITE = http://www.inf.puc-rio.br/~brunoos/luasec/download/
+LUASEC_SITE = http://www.inf.puc-rio.br/~brunoos/luasec/download
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = LICENSE
 LUASEC_DEPENDENCIES = lua openssl
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index 9049833..239598e 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -6,7 +6,7 @@
 
 LZMA_VERSION = 4.32.7
 LZMA_SOURCE = lzma-$(LZMA_VERSION).tar.xz
-LZMA_SITE = http://tukaani.org/lzma/
+LZMA_SITE = http://tukaani.org/lzma
 LZMA_INSTALL_STAGING = YES
 LZMA_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 
diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 1ac85eb..803bcea 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -6,7 +6,7 @@
 
 LZOP_VERSION = 1.03
 LZOP_SOURCE = lzop-$(LZOP_VERSION).tar.gz
-LZOP_SITE = http://www.lzop.org/download/
+LZOP_SITE = http://www.lzop.org/download
 LZOP_LICENSE = GPLv2+
 LZOP_LICENSE_FILES = COPYING
 LZOP_DEPENDENCIES = lzo
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 3e2092a..f5a1a65 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -6,7 +6,7 @@
 
 MEMTESTER_VERSION = 4.3.0
 MEMTESTER_SOURCE = memtester-$(MEMTESTER_VERSION).tar.gz
-MEMTESTER_SITE = http://pyropus.ca/software/memtester/old-versions/
+MEMTESTER_SITE = http://pyropus.ca/software/memtester/old-versions
 MEMTESTER_LICENSE = GPLv2
 MEMTESTER_LICENSE_FILES = COPYING
 
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 8887e49..0ef29e9 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -6,7 +6,7 @@
 
 MIDORI_VERSION = 0.4.6
 MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
-MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.4/
+MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.4
 MIDORI_LICENSE = LGPLv2.1+
 MIDORI_LICENSE_FILES = COPYING
 MIDORI_DEPENDENCIES = \
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index f967d87..c133ee8 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -6,7 +6,7 @@
 
 MINICOM_VERSION = 2.6.1
 MINICOM_SOURCE = minicom-$(MINICOM_VERSION).tar.gz
-MINICOM_SITE = http://alioth.debian.org/frs/download.php/file/3700/
+MINICOM_SITE = http://alioth.debian.org/frs/download.php/file/3700
 MINICOM_LICENSE = GPLv2+
 MINICOM_LICENSE_FILES = COPYING
 
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index e2847fc..f0efa7b 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MONIT_VERSION = 5.4
-MONIT_SITE = http://mmonit.com/monit/dist/
+MONIT_SITE = http://mmonit.com/monit/dist
 MONIT_LICENSE = AGPLv3 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
 
diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
index c77729f..9e23948 100644
--- a/package/msgpack/msgpack.mk
+++ b/package/msgpack/msgpack.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MSGPACK_VERSION = 0.5.4
-MSGPACK_SITE = http://downloads.sourceforge.net/project/msgpack/msgpack/cpp/
+MSGPACK_SITE = http://downloads.sourceforge.net/project/msgpack/msgpack/cpp
 MSGPACK_LICENSE = Apache-2.0
 MSGPACK_LICENSE_FILES = COPYING
 
diff --git a/package/mtdev/mtdev.mk b/package/mtdev/mtdev.mk
index 5c94352..173bc53 100644
--- a/package/mtdev/mtdev.mk
+++ b/package/mtdev/mtdev.mk
@@ -6,7 +6,7 @@
 
 MTDEV_VERSION = 1.1.3
 MTDEV_SOURCE = mtdev-$(MTDEV_VERSION).tar.bz2
-MTDEV_SITE = http://bitmath.org/code/mtdev/
+MTDEV_SITE = http://bitmath.org/code/mtdev
 
 MTDEV_LICENSE = MIT
 MTDEV_LICENSE_FILES = COPYING
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 6751059..fee933a 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -6,7 +6,7 @@
 
 MTOOLS_VERSION       = 4.0.18
 MTOOLS_SOURCE        = mtools-$(MTOOLS_VERSION).tar.bz2
-MTOOLS_SITE          = $(BR2_GNU_MIRROR)/mtools/
+MTOOLS_SITE          = $(BR2_GNU_MIRROR)/mtools
 MTOOLS_LICENSE       = GPLv3+
 MTOOLS_LICENSE_FILES = COPYING
 
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index a104285..0351970 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NCDU_VERSION = 1.9
-NCDU_SITE = http://dev.yorhel.nl/download/
+NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
 
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index 719f85d..70adc3b 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -6,7 +6,7 @@
 
 NDISC6_VERSION = 1.0.2
 NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
-NDISC6_SITE = http://www.remlab.net/files/ndisc6/
+NDISC6_SITE = http://www.remlab.net/files/ndisc6
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99"
 NDISC6_CONF_OPT = --localstatedir=/var --disable-rpath --disable-suid-install
 
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 2edc6b2..dcc7da1 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NEON_VERSION = 0.29.6
-NEON_SITE = http://www.webdav.org/neon/
+NEON_SITE = http://www.webdav.org/neon
 NEON_LICENSE = LGPLv2+ (library), GPLv2+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README
 NEON_INSTALL_STAGING = YES
diff --git a/package/netkitbase/netkitbase.mk b/package/netkitbase/netkitbase.mk
index b17ee99..03bcfa0 100644
--- a/package/netkitbase/netkitbase.mk
+++ b/package/netkitbase/netkitbase.mk
@@ -6,7 +6,7 @@
 
 NETKITBASE_VERSION = 0.17
 NETKITBASE_SOURCE  = netkit-base-$(NETKITBASE_VERSION).tar.gz
-NETKITBASE_SITE    = ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
+NETKITBASE_SITE    = ftp://ftp.uk.linux.org/pub/linux/Networking/netkit
 NETKITBASE_LICENSE = BSD-4c
 
 define NETKITBASE_CONFIGURE_CMDS
diff --git a/package/netkittelnet/netkittelnet.mk b/package/netkittelnet/netkittelnet.mk
index ca3b930..5f372a1 100644
--- a/package/netkittelnet/netkittelnet.mk
+++ b/package/netkittelnet/netkittelnet.mk
@@ -6,7 +6,7 @@
 
 NETKITTELNET_VERSION = 0.17
 NETKITTELNET_SOURCE  = netkit-telnet-$(NETKITTELNET_VERSION).tar.gz
-NETKITTELNET_SITE    = ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
+NETKITTELNET_SITE    = ftp://ftp.uk.linux.org/pub/linux/Networking/netkit
 NETKITTELNET_LICENSE = BSD-4c
 NETKITTELNET_DEPENDENCIES = netkitbase
 
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index 1d5e7d5..b3de7b1 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NEWT_VERSION         = 0.51.0
-NEWT_SITE            = http://www.uclibc.org/
+NEWT_SITE            = http://www.uclibc.org
 NEWT_SOURCE          = newt-$(NEWT_VERSION).tar.bz2
 NEWT_LICENSE         = GPLv2
 NEWT_LICENSE_FILES   = COPYING
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 41a5b49..4c6ced9 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NGIRCD_VERSION = 17.1
-NGIRCD_SITE = ftp://ftp.berlios.de/pub/ngircd/
+NGIRCD_SITE = ftp://ftp.berlios.de/pub/ngircd
 NGIRCD_DEPENDENCIES = zlib
 
 $(eval $(autotools-package))
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index 5b2b022..3c8b7bd 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -6,7 +6,7 @@
 
 NUMACTL_VERSION = 2.0.8
 NUMACTL_SOURCE = numactl-$(NUMACTL_VERSION).tar.gz
-NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download/
+NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download
 NUMACTL_LICENSE = LGPLv2.1 (libnuma), GPLv2 (programs)
 NUMACTL_LICENSE_FILES = README
 
diff --git a/package/nuttcp/nuttcp.mk b/package/nuttcp/nuttcp.mk
index 406219d..41de8bb 100644
--- a/package/nuttcp/nuttcp.mk
+++ b/package/nuttcp/nuttcp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NUTTCP_VERSION = 6.1.2
-NUTTCP_SITE = http://www.lcp.nrl.navy.mil/nuttcp/
+NUTTCP_SITE = http://www.lcp.nrl.navy.mil/nuttcp
 NUTTCP_SOURCE = nuttcp-$(NUTTCP_VERSION).tar.bz2
 
 define NUTTCP_BUILD_CMDS
diff --git a/package/on2-8170-libs/on2-8170-libs.mk b/package/on2-8170-libs/on2-8170-libs.mk
index 7cdb991..db68f02 100644
--- a/package/on2-8170-libs/on2-8170-libs.mk
+++ b/package/on2-8170-libs/on2-8170-libs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ON2_8170_LIBS_VERSION = 1.0
-ON2_8170_LIBS_SITE = ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/
+ON2_8170_LIBS_SITE = ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec
 
 ON2_8170_LICENSE = PROPRIETARY
 # No license file is included in the archive
diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index d083795..fb60f20 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN2300_SITE        = http://www.lavrsen.dk/svn/open2300/trunk/
+OPEN2300_SITE        = http://www.lavrsen.dk/svn/open2300/trunk
 OPEN2300_SITE_METHOD = svn
 OPEN2300_VERSION     = 12
 
diff --git a/package/openpgm/openpgm.mk b/package/openpgm/openpgm.mk
index 3ec5c77..51b5db8 100644
--- a/package/openpgm/openpgm.mk
+++ b/package/openpgm/openpgm.mk
@@ -6,7 +6,7 @@
 
 OPENPGM_VERSION = 5.1.118~dfsg
 OPENPGM_SOURCE = libpgm-$(OPENPGM_VERSION).tar.gz
-OPENPGM_SITE = http://openpgm.googlecode.com/files/
+OPENPGM_SITE = http://openpgm.googlecode.com/files
 OPENPGM_LICENSE = LGPLv2.1+
 OPENPGM_LICENSE_FILES = openpgm/pgm/LICENSE
 OPENPGM_INSTALL_STAGING = YES
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 5846433..4ea5d2d 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -6,7 +6,7 @@
 
 OPKG_VERSION = 635
 OPKG_SOURCE = opkg-$(OPKG_VERSION).tar.gz
-OPKG_SITE = http://opkg.googlecode.com/svn/trunk/
+OPKG_SITE = http://opkg.googlecode.com/svn/trunk
 OPKG_SITE_METHOD = svn
 OPKG_INSTALL_STAGING = YES
 OPKG_CONF_OPT = --disable-curl
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 8db58e9..ea37188 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ORC_VERSION = 0.4.18
-ORC_SITE = http://code.entropywave.com/download/orc/
+ORC_SITE = http://code.entropywave.com/download/orc
 ORC_LICENSE = BSD-2c, BSD-3c
 ORC_LICENSE_FILES = COPYING
 ORC_INSTALL_STAGING = YES
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index 4298faa..d01be45 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PICOCOM_VERSION = 1.6
-PICOCOM_SITE    = http://picocom.googlecode.com/files/
+PICOCOM_SITE    = http://picocom.googlecode.com/files
 
 define PICOCOM_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
diff --git a/package/pkg-config/pkg-config.mk b/package/pkg-config/pkg-config.mk
index 1f859b5..4b39ca2 100644
--- a/package/pkg-config/pkg-config.mk
+++ b/package/pkg-config/pkg-config.mk
@@ -6,7 +6,7 @@
 
 PKG_CONFIG_VERSION = 0.25
 PKG_CONFIG_SOURCE = pkg-config-$(PKG_CONFIG_VERSION).tar.gz
-PKG_CONFIG_SITE = http://pkgconfig.freedesktop.org/releases/
+PKG_CONFIG_SITE = http://pkgconfig.freedesktop.org/releases
 PKG_CONFIG_DEPENDENCIES = libglib2
 PKG_CONFIG_CONF_OPT = --with-installed-glib
 
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 5ff530b..5638c39 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 POLKIT_VERSION = 0.103
-POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases/
+POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases
 POLKIT_LICENSE = GPLv2
 POLKIT_LICENSE_FILES = COPYING
 
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 180972a..71a2334 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -6,7 +6,7 @@
 
 POPT_VERSION = 1.16
 # rpm5.org down
-POPT_SITE = http://anduin.linuxfromscratch.org/sources/BLFS/svn/p/
+POPT_SITE = http://anduin.linuxfromscratch.org/sources/BLFS/svn/p
 POPT_INSTALL_STAGING = YES
 POPT_LICENSE = MIT
 POPT_LICENSE_FILES = COPYING
diff --git a/package/procps/procps.mk b/package/procps/procps.mk
index dc2b841..5b03693 100644
--- a/package/procps/procps.mk
+++ b/package/procps/procps.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PROCPS_VERSION = 3.2.8
-PROCPS_SITE = http://procps.sourceforge.net/
+PROCPS_SITE = http://procps.sourceforge.net
 PROCPS_LICENSE = GPLv2+, libproc and libps LGPLv2+
 PROCPS_LICENSE_FILES = COPYING COPYING.LIB
 
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 78f952f..c9c008a 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -6,7 +6,7 @@
 
 PROFTPD_VERSION = 1.3.3g
 PROFTPD_SOURCE = proftpd-$(PROFTPD_VERSION).tar.bz2
-PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source/
+PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source
 PROFTPD_LICENSE = GPLv2+
 PROFTPD_LICENSE_FILES = COPYING
 
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 278ed29..b60056f 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -6,7 +6,7 @@
 
 PROTOBUF_VERSION = 2.4.1
 PROTOBUF_SOURCE = protobuf-$(PROTOBUF_VERSION).tar.gz
-PROTOBUF_SITE = http://protobuf.googlecode.com/files/
+PROTOBUF_SITE = http://protobuf.googlecode.com/files
 PROTOBUF_LICENSE = BSD-3c
 PROTOBUF_LICENSE_FILES = COPYING.txt
 
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index cdeabc5..8f4b1ff 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -6,7 +6,7 @@
 
 PULSEAUDIO_VERSION = 4.0
 PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
-PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases/
+PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases
 PULSEAUDIO_INSTALL_STAGING = YES
 PULSEAUDIO_LICENSE = LGPLv2.1+ (specific license for modules, see LICENSE file)
 PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
diff --git a/package/python-mad/python-mad.mk b/package/python-mad/python-mad.mk
index eaa1fae..21f08c2 100644
--- a/package/python-mad/python-mad.mk
+++ b/package/python-mad/python-mad.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MAD_VERSION = 0.6
 PYTHON_MAD_SOURCE  = pymad-$(PYTHON_MAD_VERSION).tar.gz
-PYTHON_MAD_SITE    = http://spacepants.org/src/pymad/download/
+PYTHON_MAD_SITE    = http://spacepants.org/src/pymad/download
 
 PYTHON_MAD_DEPENDENCIES = python libmad
 
diff --git a/package/python-meld3/python-meld3.mk b/package/python-meld3/python-meld3.mk
index 27da9c8..43481c6 100644
--- a/package/python-meld3/python-meld3.mk
+++ b/package/python-meld3/python-meld3.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MELD3_VERSION = 0.6.8
 PYTHON_MELD3_SOURCE = meld3-$(PYTHON_MELD3_VERSION).tar.gz
-PYTHON_MELD3_SITE = http://pypi.python.org/packages/source/m/meld3/
+PYTHON_MELD3_SITE = http://pypi.python.org/packages/source/m/meld3
 PYTHON_MELD3_DEPENDENCIES = python
 PYTHON_MELD3_LICENSE = ZPLv2.1
 PYTHON_MELD3_LICENSE_FILES = COPYRIGHT.txt LICENSE.txt
diff --git a/package/python-pyro/python-pyro.mk b/package/python-pyro/python-pyro.mk
index 67aabc6..fadcc94 100644
--- a/package/python-pyro/python-pyro.mk
+++ b/package/python-pyro/python-pyro.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYRO_VERSION = 3.14
 PYTHON_PYRO_SOURCE  = Pyro-$(PYTHON_PYRO_VERSION).tar.gz
-PYTHON_PYRO_SITE    = https://pypi.python.org/packages/source/P/Pyro/
+PYTHON_PYRO_SITE    = https://pypi.python.org/packages/source/P/Pyro
 PYTHON_PYRO_LICENSE = MIT
 PYTHON_PYRO_LICENSE_FILES = LICENSE
 PYTHON_PYRO_DEPENDENCIES = python
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index a281aed..3621d68 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYZMQ_VERSION = 13.1.0
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = https://pypi.python.org/packages/source/p/pyzmq/
+PYTHON_PYZMQ_SITE = https://pypi.python.org/packages/source/p/pyzmq
 PYTHON_PYZMQ_LICENSE = LGPLv3+ BSD-3c Apache License Version 2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index 373cd69..a4f1d52 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QEXTSERIALPORT_VERSION     = 6c47244de4ce6db
-QEXTSERIALPORT_SITE        = https://qextserialport.googlecode.com/git/
+QEXTSERIALPORT_SITE        = https://qextserialport.googlecode.com/git
 QEXTSERIALPORT_SITE_METHOD = git
 
 QEXTSERIALPORT_LICENSE = MIT
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index fce0ca3..b85519b 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,5 +1,5 @@
 QT5_VERSION = 5.0.2
-QT5_SITE = http://download.qt-project.org/archive/qt/5.0/$(QT5_VERSION)/submodules/
+QT5_SITE = http://download.qt-project.org/archive/qt/5.0/$(QT5_VERSION)/submodules
 include $(sort $(wildcard package/qt5/*/*.mk))
 
 define QT5_LA_PRL_FILES_FIXUP
diff --git a/package/read-edid/read-edid.mk b/package/read-edid/read-edid.mk
index 02d80d0..62602e0 100644
--- a/package/read-edid/read-edid.mk
+++ b/package/read-edid/read-edid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 READ_EDID_VERSION = 1.4.2
-READ_EDID_SITE = http://www.polypux.org/projects/read-edid/
+READ_EDID_SITE = http://www.polypux.org/projects/read-edid
 
 define READ_EDID_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 89ce70e..4b8a5c7 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RPM_VERSION = 5.2.0
-RPM_SITE = http://rpm5.org/files/rpm/rpm-5.2/
+RPM_SITE = http://rpm5.org/files/rpm/rpm-5.2
 RPM_DEPENDENCIES = zlib beecrypt neon popt
 
 RPM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon -DHAVE_MUTEX_THREAD_ONLY" \
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index daae010..45e0670 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RSYSLOG_VERSION = 5.8.0
-RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog/
+RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_DEPENDENCIES = zlib
 
 # Build after Busybox
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index e6455d5..ef01fbc 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RT_TESTS_SITE    = http://snapshot.debian.org/archive/debian/20111202T222101Z/pool/main/r/rt-tests/
+RT_TESTS_SITE    = http://snapshot.debian.org/archive/debian/20111202T222101Z/pool/main/r/rt-tests
 RT_TESTS_VERSION = 0.83
 RT_TESTS_SOURCE  = rt-tests_$(RT_TESTS_VERSION).orig.tar.gz
 
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index c24fa41..697e9ff 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -6,7 +6,7 @@
 
 RTAI_VERSION = 3.8.1
 RTAI_SOURCE  = rtai-$(RTAI_VERSION).tar.bz2
-RTAI_SITE    = http://www.rtai.org/RTAI/
+RTAI_SITE    = http://www.rtai.org/RTAI
 
 RTAI_DEPENDENCIES = linux
 
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index e425503..80497ff 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
+SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents
 SAM_BA_VERSION = 2.12
 SAM_BA_SOURCE  = sam-ba_$(SAM_BA_VERSION).zip
 SAM_BA_LICENSE = BSD-like (partly binary-only)
diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
index c6b9451..16a63f3 100644
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -6,7 +6,7 @@
 
 SDL_GFX_VERSION = 2.0.23
 SDL_GFX_SOURCE = SDL_gfx-$(SDL_GFX_VERSION).tar.gz
-SDL_GFX_SITE = http://www.ferzkopp.net/Software/SDL_gfx-2.0/
+SDL_GFX_SITE = http://www.ferzkopp.net/Software/SDL_gfx-2.0
 SDL_GFX_LICENSE = zlib
 SDL_GFX_LICENSE_FILES = COPYING LICENSE
 SDL_GFX_INSTALL_STAGING = YES
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index a192b5a..0f6b92a 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -6,7 +6,7 @@
 
 SDL_MIXER_VERSION = 1.2.12
 SDL_MIXER_SOURCE = SDL_mixer-$(SDL_MIXER_VERSION).tar.gz
-SDL_MIXER_SITE = http://www.libsdl.org/projects/SDL_mixer/release/
+SDL_MIXER_SITE = http://www.libsdl.org/projects/SDL_mixer/release
 SDL_MIXER_LICENSE = zlib
 SDL_MIXER_LICENSE_FILES = COPYING
 
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index ae351dc..430160b 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -6,7 +6,7 @@
 
 SDL_SOUND_VERSION = 1.0.3
 SDL_SOUND_SOURCE = SDL_sound-$(SDL_SOUND_VERSION).tar.gz
-SDL_SOUND_SITE = http://icculus.org/SDL_sound/downloads/
+SDL_SOUND_SITE = http://icculus.org/SDL_sound/downloads
 SDL_SOUND_INSTALL_STAGING = YES
 SDL_SOUND_DEPENDENCIES = sdl
 
diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index 23fb335..c3e8d29 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -6,7 +6,7 @@
 
 SDL_TTF_VERSION = 2.0.11
 SDL_TTF_SOURCE = SDL_ttf-$(SDL_TTF_VERSION).tar.gz
-SDL_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release/
+SDL_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
 SDL_TTF_LICENSE = zlib
 SDL_TTF_LICENSE_FILES = COPYING
 
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index e6846b2..1627318 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -7,7 +7,7 @@
 SETSERIAL_VERSION            = 2.17
 SETSERIAL_PATCH              = setserial_2.17-45.2.diff.gz
 SETSERIAL_SOURCE             = setserial_$(SETSERIAL_VERSION).orig.tar.gz
-SETSERIAL_SITE               = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/setserial/
+SETSERIAL_SITE               = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/setserial
 
 define SETSERIAL_APPLY_DEBIAN_PATCHES
 	# Touching gorhack.h is needed for the Debian patch 18 to work
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 8bb79b5..912203a 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -6,7 +6,7 @@
 
 SG3_UTILS_VERSION = 1.34
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
-SG3_UTILS_SITE    = http://sg.danny.cz/sg/p/
+SG3_UTILS_SITE    = http://sg.danny.cz/sg/p
 SG3_UTILS_LICENSE = BSD-3c
 # utils progs are GPLv2+ licenced
 ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),y)
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 2fb9692..4ba7aca 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -6,7 +6,7 @@
 
 SLANG_VERSION = 1.4.5
 SLANG_SOURCE = slang-$(SLANG_VERSION)-mini.tar.bz2
-SLANG_SITE = http://www.uclibc.org/
+SLANG_SITE = http://www.uclibc.org
 SLANG_INSTALL_STAGING = YES
 
 # We need to add -fPIC since we're busting original CFLAGS
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 8ba399b..eff2ad3 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -6,7 +6,7 @@
 
 SOCAT_VERSION = 2.0.0-b5
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
-SOCAT_SITE = http://www.dest-unreach.org/socat/download/
+SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPLv2
 SOCAT_LICENSE_FILES = COPYING
 SOCAT_CONF_ENV = sc_cv_termios_ispeed=no \
diff --git a/package/spice-protocol/spice-protocol.mk b/package/spice-protocol/spice-protocol.mk
index 62a028d..534e847 100644
--- a/package/spice-protocol/spice-protocol.mk
+++ b/package/spice-protocol/spice-protocol.mk
@@ -6,7 +6,7 @@
 
 SPICE_PROTOCOL_VERSION         = 0.12.2
 SPICE_PROTOCOL_SOURCE          = spice-protocol-$(SPICE_PROTOCOL_VERSION).tar.bz2
-SPICE_PROTOCOL_SITE            = http://www.spice-space.org/download/releases/
+SPICE_PROTOCOL_SITE            = http://www.spice-space.org/download/releases
 SPICE_PROTOCOL_LICENSE         = BSD-3c
 SPICE_PROTOCOL_LICENSE_FILES   = COPYING
 SPICE_PROTOCOL_INSTALL_STAGING = YES
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index a016da6..5650af0 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -6,7 +6,7 @@
 
 SPICE_VERSION         = 0.12.0
 SPICE_SOURCE          = spice-$(SPICE_VERSION).tar.bz2
-SPICE_SITE            = http://www.spice-space.org/download/releases/
+SPICE_SITE            = http://www.spice-space.org/download/releases
 SPICE_LICENSE         = LGPLv2.1+
 SPICE_LICENSE_FILES   = COPYING
 SPICE_INSTALL_STAGING = YES
diff --git a/package/statserial/statserial.mk b/package/statserial/statserial.mk
index 22dc8c6..b75a011 100644
--- a/package/statserial/statserial.mk
+++ b/package/statserial/statserial.mk
@@ -6,7 +6,7 @@
 
 STATSERIAL_VERSION = 1.1
 STATSERIAL_SOURCE = statserial-$(STATSERIAL_VERSION).tar.gz
-STATSERIAL_SITE = http://www.ibiblio.org/pub/Linux/system/serial/
+STATSERIAL_SITE = http://www.ibiblio.org/pub/Linux/system/serial
 STATSERIAL_DEPENDENCIES = ncurses
 
 define STATSERIAL_BUILD_CMDS
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index 516065b..406246c 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -6,7 +6,7 @@
 
 SUPERVISOR_VERSION = 3.0a12
 SUPERVISOR_SOURCE = supervisor-$(SUPERVISOR_VERSION).tar.gz
-SUPERVISOR_SITE = http://pypi.python.org/packages/source/s/supervisor/
+SUPERVISOR_SITE = http://pypi.python.org/packages/source/s/supervisor
 SUPERVISOR_LICENSE_FILES = LICENSES.txt
 
 SUPERVISOR_DEPENDENCIES = python host-python-setuptools
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1bb429c..f3bd37a 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SYSTEMD_VERSION = 44
-SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
+SYSTEMD_SITE = http://www.freedesktop.org/software/systemd
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index 7431cbc..f29daca 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -7,7 +7,7 @@
 THTTPD_VERSION = 2.25b
 THTTPD_SOURCE = thttpd_$(THTTPD_VERSION).orig.tar.gz
 THTTPD_PATCH = thttpd_$(THTTPD_VERSION)-11.diff.gz
-THTTPD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/t/thttpd/
+THTTPD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/t/thttpd
 
 ifneq ($(THTTPD_PATCH),)
 define THTTPD_DEBIAN_PATCHES
diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index a94f00d..f5d9b85 100644
--- a/package/ti-gfx/ti-gfx.mk
+++ b/package/ti-gfx/ti-gfx.mk
@@ -13,7 +13,7 @@ else
 TI_GFX_SOURCE = Graphics_SDK_setuplinux_$(TI_GFX_VERSION)_minimal_demos.bin
 endif
 
-TI_GFX_SITE = http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/$(TI_GFX_VERSION)/exports/
+TI_GFX_SITE = http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/$(TI_GFX_VERSION)/exports
 TI_GFX_LICENSE = Technology / Software Publicly Available
 TI_GFX_LICENSE_FILES = TSPA.txt
 TI_GFX_INSTALL_STAGING = YES
diff --git a/package/tidsp-binaries/tidsp-binaries.mk b/package/tidsp-binaries/tidsp-binaries.mk
index fd799fb..441b01b 100644
--- a/package/tidsp-binaries/tidsp-binaries.mk
+++ b/package/tidsp-binaries/tidsp-binaries.mk
@@ -6,7 +6,7 @@
 
 TIDSP_BINARIES_VERSION = 23.i3.8
 TIDSP_BINARIES_SOURCE = tidsp-binaries-$(TIDSP_BINARIES_VERSION).tar.gz
-TIDSP_BINARIES_SITE = http://gst-dsp.googlecode.com/files/
+TIDSP_BINARIES_SITE = http://gst-dsp.googlecode.com/files
 
 define TIDSP_BINARIES_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 1e7ee48..69143f7 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TRANSMISSION_VERSION = 2.33
-TRANSMISSION_SITE = http://download.transmissionbt.com/files/
+TRANSMISSION_SITE = http://download.transmissionbt.com/files
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_DEPENDENCIES = \
 	host-pkgconf \
diff --git a/package/tree/tree.mk b/package/tree/tree.mk
index 509ba45..aab47d9 100644
--- a/package/tree/tree.mk
+++ b/package/tree/tree.mk
@@ -6,7 +6,7 @@
 
 TREE_VERSION = 1.6.0
 TREE_SOURCE = tree-$(TREE_VERSION).tgz
-TREE_SITE = http://mama.indstate.edu/users/ice/tree/src/
+TREE_SITE = http://mama.indstate.edu/users/ice/tree/src
 TREE_LICENSE = GPLv2+
 TREE_LICENSE_FILES = LICENSE
 
diff --git a/package/tremor/tremor.mk b/package/tremor/tremor.mk
index 291a413..8a95db5 100644
--- a/package/tremor/tremor.mk
+++ b/package/tremor/tremor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TREMOR_SITE = http://svn.xiph.org/trunk/Tremor/
+TREMOR_SITE = http://svn.xiph.org/trunk/Tremor
 TREMOR_SITE_METHOD = svn
 TREMOR_VERSION = 18153
 
diff --git a/package/tstools/tstools.mk b/package/tstools/tstools.mk
index 377cc34..d4f9f78 100644
--- a/package/tstools/tstools.mk
+++ b/package/tstools/tstools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TSTOOLS_VERSION = 1_11
-TSTOOLS_SITE    = https://tstools.googlecode.com/files/
+TSTOOLS_SITE    = https://tstools.googlecode.com/files
 TSTOOLS_SOURCE  = tstools-$(TSTOOLS_VERSION).tgz
 TSTOOLS_LICENSE = MPL v1.1
 
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index db86850..6d62853 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -6,7 +6,7 @@
 
 UDEV_VERSION = 182
 UDEV_SOURCE = udev-$(UDEV_VERSION).tar.xz
-UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
+UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug
 UDEV_LICENSE = GPLv2+
 UDEV_LICENSE_FILES = COPYING
 UDEV_INSTALL_STAGING = YES
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 28855dd..dac6c7c 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 UDISKS_VERSION = 1.0.4
-UDISKS_SITE    = http://hal.freedesktop.org/releases/
+UDISKS_SITE    = http://hal.freedesktop.org/releases
 UDISKS_LICENSE = GPLv2+
 UDISKS_LICENSE_FILES = COPYING
 
diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
index 9452062..af5cc2e 100644
--- a/package/uemacs/uemacs.mk
+++ b/package/uemacs/uemacs.mk
@@ -6,7 +6,7 @@
 
 UEMACS_VERSION = 4.0.15-lt
 UEMACS_SOURCE = em-$(UEMACS_VERSION).tar.bz2
-UEMACS_SITE = $(BR2_KERNEL_MIRROR)/software/editors/uemacs/
+UEMACS_SITE = $(BR2_KERNEL_MIRROR)/software/editors/uemacs
 UEMACS_DEPENDENCIES = ncurses
 
 define UEMACS_BUILD_CMDS
diff --git a/package/urg/urg.mk b/package/urg/urg.mk
index e16393a..f95dff5 100644
--- a/package/urg/urg.mk
+++ b/package/urg/urg.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 URG_VERSION = 0.8.18
-URG_SITE = http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en/
+URG_SITE = http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en
 URG_SOURCE = urg-$(URG_VERSION).zip
 URG_LICENSE = LGPLv3
 URG_LICENSE_FILES = COPYING
diff --git a/package/ux500-firmware/ux500-firmware.mk b/package/ux500-firmware/ux500-firmware.mk
index 14b4a8e..7e947f3 100644
--- a/package/ux500-firmware/ux500-firmware.mk
+++ b/package/ux500-firmware/ux500-firmware.mk
@@ -6,7 +6,7 @@
 
 UX500_FIRMWARE_VERSION = 1.1.3-6
 UX500_FIRMWARE_SOURCE = ux500-firmware_$(UX500_FIRMWARE_VERSION)linaro1.tar.gz
-UX500_FIRMWARE_SITE = https://launchpad.net/~igloocommunity-maintainers/+archive/snowball/+files/
+UX500_FIRMWARE_SITE = https://launchpad.net/~igloocommunity-maintainers/+archive/snowball/+files
 UX500_FIRMWARE_LICENSE = Snowball click-wrap license
 UX500_FIRMWARE_LICENSE_FILES = license.txt 
 UX500_FIRMWARE_REDISTRIBUTE = NO
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index f40784e..f725879 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 VALGRIND_VERSION = 3.8.1
-VALGRIND_SITE    = http://valgrind.org/downloads/
+VALGRIND_SITE    = http://valgrind.org/downloads
 VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPLv2 GFDLv1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index b5fe94d..c66884b 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 WAYLAND_VERSION = 1.1.0
-WAYLAND_SITE = http://wayland.freedesktop.org/releases/
+WAYLAND_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
 WAYLAND_LICENSE_FILES = COPYING
diff --git a/package/webrtc-audio-processing/webrtc-audio-processing.mk b/package/webrtc-audio-processing/webrtc-audio-processing.mk
index 9f76cba..46ee7b0 100644
--- a/package/webrtc-audio-processing/webrtc-audio-processing.mk
+++ b/package/webrtc-audio-processing/webrtc-audio-processing.mk
@@ -6,7 +6,7 @@
 
 WEBRTC_AUDIO_PROCESSING_VERSION = 0.1
 WEBRTC_AUDIO_PROCESSING_SOURCE = webrtc-audio-processing-$(WEBRTC_AUDIO_PROCESSING_VERSION).tar.xz
-WEBRTC_AUDIO_PROCESSING_SITE = http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/
+WEBRTC_AUDIO_PROCESSING_SITE = http://freedesktop.org/software/pulseaudio/webrtc-audio-processing
 WEBRTC_AUDIO_PROCESSING_INSTALL_STAGING = YES
 
 ifeq ($(BR2_SOFT_FLOAT),y)
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 6f7703e..7628685 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 WESTON_VERSION = 1.1.0
-WESTON_SITE = http://wayland.freedesktop.org/releases/
+WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WAYLAND_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
diff --git a/package/whetstone/whetstone.mk b/package/whetstone/whetstone.mk
index f9318d8..b011dd3 100644
--- a/package/whetstone/whetstone.mk
+++ b/package/whetstone/whetstone.mk
@@ -6,7 +6,7 @@
 
 WHETSTONE_VERSION = 1.2
 WHETSTONE_SOURCE = whetstone.c
-WHETSTONE_SITE = http://www.netlib.org/benchmark/
+WHETSTONE_SITE = http://www.netlib.org/benchmark
 
 define WHETSTONE_EXTRACT_CMDS
 	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index dfcf6fa..da54ce5 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -6,7 +6,7 @@
 
 LIBXCB_VERSION = 1.8.1
 LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.bz2
-LIBXCB_SITE = http://xcb.freedesktop.org/dist/
+LIBXCB_SITE = http://xcb.freedesktop.org/dist
 LIBXCB_LICENSE = MIT
 LIBXCB_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 98d0f02..00a8428 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -6,7 +6,7 @@
 
 XCB_PROTO_VERSION = 1.7.1
 XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.bz2
-XCB_PROTO_SITE = http://xcb.freedesktop.org/dist/
+XCB_PROTO_SITE = http://xcb.freedesktop.org/dist
 XCB_PROTO_LICENSE = MIT
 XCB_PROTO_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xcb-util-image/xcb-util-image.mk b/package/x11r7/xcb-util-image/xcb-util-image.mk
index 7933b74..6978236 100644
--- a/package/x11r7/xcb-util-image/xcb-util-image.mk
+++ b/package/x11r7/xcb-util-image/xcb-util-image.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 XCB_UTIL_IMAGE_VERSION = 0.3.9
-XCB_UTIL_IMAGE_SITE = http://xcb.freedesktop.org/dist/
+XCB_UTIL_IMAGE_SITE = http://xcb.freedesktop.org/dist
 XCB_UTIL_IMAGE_SOURCE = xcb-util-image-$(XCB_UTIL_IMAGE_VERSION).tar.bz2
 XCB_UTIL_IMAGE_INSTALL_STAGING = YES
 XCB_UTIL_IMAGE_LICENSE = MIT
diff --git a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
index 8598b20..0f653c3 100644
--- a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
+++ b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
@@ -6,7 +6,7 @@
 
 XCB_UTIL_KEYSYMS_VERSION = 0.3.9
 XCB_UTIL_KEYSYMS_SOURCE = xcb-util-keysyms-$(XCB_UTIL_KEYSYMS_VERSION).tar.bz2
-XCB_UTIL_KEYSYMS_SITE = http://xcb.freedesktop.org/dist/
+XCB_UTIL_KEYSYMS_SITE = http://xcb.freedesktop.org/dist
 
 # unfortunately, no license file
 XCB_UTIL_KEYSYMS_LICENSE = MIT
diff --git a/package/x11r7/xcb-util-wm/xcb-util-wm.mk b/package/x11r7/xcb-util-wm/xcb-util-wm.mk
index 622f295..4658a29 100644
--- a/package/x11r7/xcb-util-wm/xcb-util-wm.mk
+++ b/package/x11r7/xcb-util-wm/xcb-util-wm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 XCB_UTIL_WM_VERSION = 0.3.9
-XCB_UTIL_WM_SITE = http://xcb.freedesktop.org/dist/
+XCB_UTIL_WM_SITE = http://xcb.freedesktop.org/dist
 XCB_UTIL_WM_SOURCE = xcb-util-wm-$(XCB_UTIL_WM_VERSION).tar.bz2
 XCB_UTIL_WM_INSTALL_STAGING = YES
 XCB_UTIL_WM_LICENSE = MIT
diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index a3531d0..4416d80 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -6,7 +6,7 @@
 
 XCB_UTIL_VERSION = 0.3.9
 XCB_UTIL_SOURCE = xcb-util-$(XCB_UTIL_VERSION).tar.bz2
-XCB_UTIL_SITE = http://xcb.freedesktop.org/dist/
+XCB_UTIL_SITE = http://xcb.freedesktop.org/dist
 
 # unfortunately, no license file
 XCB_UTIL_LICENSE = MIT
diff --git a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
index f2bccb0..a52f8d0 100644
--- a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
+++ b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 XCURSOR_TRANSPARENT_THEME_VERSION = 0.1.1
-XCURSOR_TRANSPARENT_THEME_SITE = http://downloads.yoctoproject.org/releases/matchbox/utils/
+XCURSOR_TRANSPARENT_THEME_SITE = http://downloads.yoctoproject.org/releases/matchbox/utils
 XCURSOR_TRANSPARENT_THEME_DEPENDENCIES = xlib_libXcursor host-xapp_xcursorgen
 XCURSOR_TRANSPARENT_THEME_LICENSE = GPLv2
 XCURSOR_TRANSPARENT_THEME_LICENSE_FILES = COPYING
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 49540df..f0b5b66 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -6,7 +6,7 @@
 
 XKEYBOARD_CONFIG_VERSION = 2.6
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
-XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config/
+XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config
 XKEYBOARD_CONFIG_LICENSE = MIT
 XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk b/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
index 5ea02e9..397849f 100644
--- a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
+++ b/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
@@ -6,7 +6,7 @@
 
 XLIB_LIBPTHREAD_STUBS_VERSION = 0.3
 XLIB_LIBPTHREAD_STUBS_SOURCE = libpthread-stubs-$(XLIB_LIBPTHREAD_STUBS_VERSION).tar.bz2
-XLIB_LIBPTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist/
+XLIB_LIBPTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist
 XLIB_LIBPTHREAD_STUBS_LICENSE = MIT
 XLIB_LIBPTHREAD_STUBS_LICENSE_FILES = COPYING
 
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index f10dec0..fafb931 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -9,7 +9,7 @@ ifeq ($(XENOMAI_VERSION),)
 XENOMAI_VERSION = 2.6.2.1
 endif
 
-XENOMAI_SITE = http://download.gna.org/xenomai/stable/
+XENOMAI_SITE = http://download.gna.org/xenomai/stable
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
 XENOMAI_LICENSE = headers: GPLv2+ with exception, libraries: LGPLv2.1+, kernel: GPLv2+, docs: GFDLv1.2+, ipipe patch and can driver: GPLv2
 # GFDL is not included but refers to gnu.org
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 7bd7070..529b85f 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -6,7 +6,7 @@
 
 XERCES_VERSION = 3.1.1
 XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.gz
-XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources/
+XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
 XERCES_MAKE = $(MAKE1)
 XERCES_INSTALL_STAGING = YES
 XERCES_CONF_OPT = --disable-threads \
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 98fca3a..1266cf2 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -6,7 +6,7 @@
 
 XZ_VERSION = 5.0.4
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
-XZ_SITE = http://tukaani.org/xz/
+XZ_SITE = http://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 XZ_LICENSE = GPLv2+ GPLv3+ LGPLv2.1+
diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
index 26324da..a833975 100644
--- a/package/yasm/yasm.mk
+++ b/package/yasm/yasm.mk
@@ -6,7 +6,7 @@
 
 YASM_VERSION = 1.2.0
 YASM_SOURCE = yasm-$(YASM_VERSION).tar.gz
-YASM_SITE = http://www.tortall.net/projects/yasm/releases/
+YASM_SITE = http://www.tortall.net/projects/yasm/releases
 
 define YASM_PRE_CONFIGURE_FIXUP
 # This sed prevents it compiling 2 programs (vsyasm and ytasm) 
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 4847ed8..6abb24a 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ZEROMQ_VERSION = 3.2.3
-ZEROMQ_SITE = http://download.zeromq.org/
+ZEROMQ_SITE = http://download.zeromq.org
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_LICENSE = LGPLv3+ with exceptions
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index db2a99e..79b6f96 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -207,111 +207,111 @@ TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(TOOLCHAIN_EXTERNAL_DIR)/.extracted
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
 TOOLCHAIN_EXTERNAL_SOURCE = arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
 TOOLCHAIN_EXTERNAL_SOURCE = arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
 TOOLCHAIN_EXTERNAL_SOURCE = arm-2013.05-24-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109),y)
-TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports/
+TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
 TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
 define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	mv $(@D)/arago-2011.09/armv7a/* $(@D)/
 	rm -rf $(@D)/arago-2011.09/
 endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109),y)
-TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports/
+TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
 TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
 define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	mv $(@D)/arago-2011.09/armv5te/* $(@D)/
 	rm -rf $(@D)/arago-2011.09/
 endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06),y)
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/13.06/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/13.06/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.07/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.07/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.08/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.08/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.08_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2012.03-63-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2012.09-99-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2013.05-66-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = freescale-2011.03-38-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = renesas-2011.03-37-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.03-35-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209),y)
-TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-uclinux/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-uclinux
 TOOLCHAIN_EXTERNAL_SOURCE = renesas-2010.09-60-sh-uclinux-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-uclinux/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-uclinux
 TOOLCHAIN_EXTERNAL_SOURCE = renesas-2011.03-36-sh-uclinux-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109),y)
-TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = ia32-2011.09-24-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.03-27-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209),y)
-TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1),y)
-TOOLCHAIN_EXTERNAL_SITE_1   = http://blackfin.uclinux.org/gf/download/frsrelease/559/9858/
+TOOLCHAIN_EXTERNAL_SITE_1   = http://blackfin.uclinux.org/gf/download/frsrelease/559/9858
 TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2012R1-RC2.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_SITE_2   = http://blackfin.uclinux.org/gf/download/frsrelease/559/9866/
+TOOLCHAIN_EXTERNAL_SITE_2   = http://blackfin.uclinux.org/gf/download/frsrelease/559/9866
 TOOLCHAIN_EXTERNAL_SOURCE_2 = blackfin-toolchain-uclibc-full-2012R1-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_SOURCE   = $(TOOLCHAIN_EXTERNAL_SOURCE_1) $(TOOLCHAIN_EXTERNAL_SOURCE_2)
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
-TOOLCHAIN_EXTERNAL_SITE_1   = http://blackfin.uclinux.org/gf/download/frsrelease/588/10139/
+TOOLCHAIN_EXTERNAL_SITE_1   = http://blackfin.uclinux.org/gf/download/frsrelease/588/10139
 TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2012R2-RC2.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_SITE_2   = http://blackfin.uclinux.org/gf/download/frsrelease/588/10147/
+TOOLCHAIN_EXTERNAL_SITE_2   = http://blackfin.uclinux.org/gf/download/frsrelease/588/10147
 TOOLCHAIN_EXTERNAL_SOURCE_2 = blackfin-toolchain-uclibc-full-2012R2-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_SOURCE   = $(TOOLCHAIN_EXTERNAL_SOURCE_1) $(TOOLCHAIN_EXTERNAL_SOURCE_2)
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
+TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net
 TOOLCHAIN_EXTERNAL_SOURCE = lin32-microblazeel-unknown-linux-gnu_14.3_early.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
+TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net
 TOOLCHAIN_EXTERNAL_SOURCE = microblazeel-unknown-linux-gnu.tgz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
+TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net
 TOOLCHAIN_EXTERNAL_SOURCE = lin32-microblaze-unknown-linux-gnu_14.3_early.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
+TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net
 TOOLCHAIN_EXTERNAL_SOURCE = microblaze-unknown-linux-gnu.tgz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_06),y)
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/13.06/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/13.06/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.06_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_07),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.07/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.07/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.07-1_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_08),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.08/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.08/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.08_linux.tar.xz
 else
 # Custom toolchain
-- 
1.7.9.5
