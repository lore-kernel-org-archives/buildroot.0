From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu,  6 Jun 2013 11:53:25 +0200
Subject: [Buildroot] [PATCH 2/7] Fix package headers to comply with coding
	style
In-Reply-To: <1370512410-8553-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1370512410-8553-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <1370512410-8553-3-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 boot/at91bootstrap/at91bootstrap.mk                                      | 1 +
 boot/at91bootstrap3/at91bootstrap3.mk                                    | 1 +
 boot/uboot/uboot.mk                                                      | 1 +
 boot/xloader/xloader.mk                                                  | 1 +
 linux/linux.mk                                                           | 1 +
 package/acpid/acpid.mk                                                   | 1 +
 package/alsamixergui/alsamixergui.mk                                     | 1 +
 package/apr-util/apr-util.mk                                             | 1 +
 package/apr/apr.mk                                                       | 1 +
 package/avahi/avahi.mk                                                   | 1 +
 package/axel/axel.mk                                                     | 1 +
 package/beecrypt/beecrypt.mk                                             | 1 +
 package/berkeleydb/berkeleydb.mk                                         | 1 +
 package/boa/boa.mk                                                       | 1 +
 package/bootutils/bootutils.mk                                           | 1 +
 package/bsdiff/bsdiff.mk                                                 | 1 +
 package/cairo/cairo.mk                                                   | 1 +
 package/ccid/ccid.mk                                                     | 1 +
 package/cjson/cjson.mk                                                   | 1 +
 package/cvs/cvs.mk                                                       | 1 +
 package/dbus-glib/dbus-glib.mk                                           | 1 +
 package/dbus-python/dbus-python.mk                                       | 1 +
 package/dfu-util/dfu-util.mk                                             | 1 +
 package/directfb/directfb.mk                                             | 1 +
 package/docker/docker.mk                                                 | 1 +
 package/elftosb/elftosb.mk                                               | 1 +
 package/elfutils/elfutils.mk                                             | 1 +
 package/empty/empty.mk                                                   | 1 +
 package/enchant/enchant.mk                                               | 1 +
 package/ezxml/ezxml.mk                                                   | 1 +
 package/fakeroot/fakeroot.mk                                             | 1 +
 package/fconfig/fconfig.mk                                               | 1 +
 package/flashrom/flashrom.mk                                             | 1 +
 package/fontconfig/fontconfig.mk                                         | 1 +
 package/fxload/fxload.mk                                                 | 1 +
 package/gadgetfs-test/gadgetfs-test.mk                                   | 1 +
 package/gamin/gamin.mk                                                   | 1 +
 package/gdbm/gdbm.mk                                                     | 1 +
 package/giblib/giblib.mk                                                 | 1 +
 package/gqview/gqview.mk                                                 | 1 +
 package/gsl/gsl.mk                                                       | 1 +
 package/gtk2-engines/gtk2-engines.mk                                     | 1 +
 package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk             | 1 +
 package/gvfs/gvfs.mk                                                     | 1 +
 package/hwdata/hwdata.mk                                                 | 1 +
 package/imlib2/imlib2.mk                                                 | 1 +
 package/infozip/infozip.mk                                               | 1 +
 package/input-tools/input-tools.mk                                       | 1 +
 package/iperf/iperf.mk                                                   | 1 +
 package/lcdapi/lcdapi.mk                                                 | 1 +
 package/lcdproc/lcdproc.mk                                               | 1 +
 package/leafpad/leafpad.mk                                               | 1 +
 package/libaio/libaio.mk                                                 | 1 +
 package/libarchive/libarchive.mk                                         | 1 +
 package/libatasmart/libatasmart.mk                                       | 1 +
 package/libcgicc/libcgicc.mk                                             | 1 +
 package/libconfuse/libconfuse.mk                                         | 1 +
 package/libelf/libelf.mk                                                 | 1 +
 package/liberation/liberation.mk                                         | 1 +
 package/libesmtp/libesmtp.mk                                             | 1 +
 package/libev/libev.mk                                                   | 1 +
 package/libevent/libevent.mk                                             | 1 +
 package/libfcgi/libfcgi.mk                                               | 1 +
 package/libfreefare/libfreefare.mk                                       | 1 +
 package/libftdi/libftdi.mk                                               | 1 +
 package/libgail/libgail.mk                                               | 1 +
 package/libgeotiff/libgeotiff.mk                                         | 1 +
 package/libglade/libglade.mk                                             | 1 +
 package/libglib2/libglib2.mk                                             | 1 +
 package/libgtk2/libgtk2.mk                                               | 1 +
 package/libiconv/libiconv.mk                                             | 1 +
 package/liblo/liblo.mk                                                   | 1 +
 package/liblog4c-localtime/liblog4c-localtime.mk                         | 1 +
 package/libmms/libmms.mk                                                 | 1 +
 package/libmodbus/libmodbus.mk                                           | 1 +
 package/libmpeg2/libmpeg2.mk                                             | 1 +
 package/libnfc-llcp/libnfc-llcp.mk                                       | 1 +
 package/libnfc/libnfc.mk                                                 | 1 +
 package/libnspr/libnspr.mk                                               | 1 +
 package/liboauth/liboauth.mk                                             | 1 +
 package/libogg/libogg.mk                                                 | 1 +
 package/libplayer/libplayer.mk                                           | 1 +
 package/libtheora/libtheora.mk                                           | 1 +
 package/libtool/libtool.mk                                               | 1 +
 package/libtpl/libtpl.mk                                                 | 1 +
 package/liburcu/liburcu.mk                                               | 1 +
 package/libusb-compat/libusb-compat.mk                                   | 1 +
 package/libusb/libusb.mk                                                 | 1 +
 package/libv4l/libv4l.mk                                                 | 1 +
 package/libyaml/libyaml.mk                                               | 1 +
 package/linenoise/linenoise.mk                                           | 1 +
 package/linux-fusion/linux-fusion.mk                                     | 1 +
 package/lockfile-progs/lockfile-progs.mk                                 | 1 +
 package/logrotate/logrotate.mk                                           | 1 +
 package/lttng-libust/lttng-libust.mk                                     | 1 +
 package/lttng-modules/lttng-modules.mk                                   | 1 +
 package/lttng-tools/lttng-tools.mk                                       | 1 +
 package/lua-msgpack-native/lua-msgpack-native.mk                         | 1 +
 package/luacjson/luacjson.mk                                             | 1 +
 package/lvm2/lvm2.mk                                                     | 1 +
 package/lzo/lzo.mk                                                       | 1 +
 package/macchanger/macchanger.mk                                         | 1 +
 package/matchbox/matchbox-common/matchbox-common.mk                      | 1 +
 package/matchbox/matchbox-panel/matchbox-panel.mk                        | 1 +
 package/memtester/memtester.mk                                           | 1 +
 package/mii-diag/mii-diag.mk                                             | 1 +
 package/minicom/minicom.mk                                               | 1 +
 package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk | 1 +
 package/mtd/mtd.mk                                                       | 1 +
 package/mtdev/mtdev.mk                                                   | 1 +
 package/mtdev2tuio/mtdev2tuio.mk                                         | 1 +
 package/multimedia/bellagio/bellagio.mk                                  | 1 +
 package/multimedia/gst-plugins-bad/gst-plugins-bad.mk                    | 1 +
 package/multimedia/gst-plugins-base/gst-plugins-base.mk                  | 1 +
 package/multimedia/gst-plugins-good/gst-plugins-good.mk                  | 1 +
 package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk                  | 1 +
 package/multimedia/gstreamer/gstreamer.mk                                | 1 +
 package/multimedia/mplayer/mplayer.mk                                    | 1 +
 package/multimedia/pulseaudio/pulseaudio.mk                              | 1 +
 package/mxml/mxml.mk                                                     | 1 +
 package/nanocom/nanocom.mk                                               | 1 +
 package/neon/neon.mk                                                     | 1 +
 package/netatalk/netatalk.mk                                             | 1 +
 package/netkitbase/netkitbase.mk                                         | 1 +
 package/netkittelnet/netkittelnet.mk                                     | 1 +
 package/netplug/netplug.mk                                               | 1 +
 package/newt/newt.mk                                                     | 1 +
 package/nss-mdns/nss-mdns.mk                                             | 1 +
 package/opencv/opencv.mk                                                 | 1 +
 package/orc/orc.mk                                                       | 1 +
 package/owl-linux/owl-linux.mk                                           | 1 +
 package/pango/pango.mk                                                   | 1 +
 package/pcmanfm/pcmanfm.mk                                               | 1 +
 package/pixman/pixman.mk                                                 | 1 +
 package/poco/poco.mk                                                     | 1 +
 package/popt/popt.mk                                                     | 1 +
 package/prboom/prboom.mk                                                 | 1 +
 package/protobuf/protobuf.mk                                             | 1 +
 package/python-nfc/python-nfc.mk                                         | 1 +
 package/python-pygame/python-pygame.mk                                   | 1 +
 package/python/python.mk                                                 | 1 +
 package/python3/python3.mk                                               | 1 +
 package/qtuio/qtuio.mk                                                   | 1 +
 package/rpm/rpm.mk                                                       | 1 +
 package/rsyslog/rsyslog.mk                                               | 1 +
 package/rubix/rubix.mk                                                   | 1 +
 package/sane-backends/sane-backends.mk                                   | 1 +
 package/sawman/sawman.mk                                                 | 1 +
 package/schifra/schifra.mk                                               | 1 +
 package/sdl_net/sdl_net.mk                                               | 1 +
 package/sdl_sound/sdl_sound.mk                                           | 1 +
 package/setserial/setserial.mk                                           | 1 +
 package/shared-mime-info/shared-mime-info.mk                             | 1 +
 package/slang/slang.mk                                                   | 1 +
 package/snowball-hdmiservice/snowball-hdmiservice.mk                     | 1 +
 package/snowball-init/snowball-init.mk                                   | 1 +
 package/socketcand/socketcand.mk                                         | 1 +
 package/sound-theme-borealis/sound-theme-borealis.mk                     | 1 +
 package/sound-theme-freedesktop/sound-theme-freedesktop.mk               | 1 +
 package/speex/speex.mk                                                   | 1 +
 package/sqlcipher/sqlcipher.mk                                           | 1 +
 package/startup-notification/startup-notification.mk                     | 1 +
 package/statserial/statserial.mk                                         | 1 +
 package/sysklogd/sysklogd.mk                                             | 1 +
 package/systemd/systemd.mk                                               | 1 +
 package/sysvinit/sysvinit.mk                                             | 1 +
 package/tcl/tcl.mk                                                       | 1 +
 package/tcllib/tcllib.mk                                                 | 1 +
 package/thttpd/thttpd.mk                                                 | 1 +
 package/tinyhttpd/tinyhttpd.mk                                           | 1 +
 package/torsmo/torsmo.mk                                                 | 1 +
 package/transmission/transmission.mk                                     | 1 +
 package/tslib/tslib.mk                                                   | 1 +
 package/ttcp/ttcp.mk                                                     | 1 +
 package/uboot-tools/uboot-tools.mk                                       | 1 +
 package/usbmount/usbmount.mk                                             | 1 +
 package/ux500-firmware/ux500-firmware.mk                                 | 1 +
 package/x11r7/libxcb/libxcb.mk                                           | 1 +
 package/x11r7/xapp_xman/xapp_xman.mk                                     | 1 +
 package/x11r7/xcb-proto/xcb-proto.mk                                     | 1 +
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk                       | 1 +
 package/x11r7/xcb-util/xcb-util.mk                                       | 1 +
 .../x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk | 1 +
 package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk             | 1 +
 package/x11vnc/x11vnc.mk                                                 | 1 +
 package/xerces/xerces.mk                                                 | 1 +
 package/xfsprogs/xfsprogs.mk                                             | 1 +
 package/xinetd/xinetd.mk                                                 | 1 +
 package/xstroke/xstroke.mk                                               | 1 +
 package/xvkbd/xvkbd.mk                                                   | 1 +
 package/yasm/yasm.mk                                                     | 1 +
 package/zxing/zxing.mk                                                   | 1 +
 192 files changed, 192 insertions(+)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index 0b1ee29..9d5c125 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -3,6 +3,7 @@
 # at91bootstrap
 #
 #############################################################
+
 AT91BOOTSTRAP_VERSION = 1.16
 AT91BOOTSTRAP_SITE = ftp://www.at91.com/pub/at91bootstrap/
 AT91BOOTSTRAP_SOURCE = AT91Bootstrap$(AT91BOOTSTRAP_VERSION).zip
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 74f08e8..32486be 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -3,6 +3,7 @@
 # at91bootstrap3
 #
 #############################################################
+
 AT91BOOTSTRAP3_VERSION = 3.2
 AT91BOOTSTRAP3_SITE = \
 	ftp://www.at91.com/pub/at91bootstrap/AT91Bootstrap$(AT91BOOTSTRAP3_VERSION)
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 004bdf2..1b708d5 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -3,6 +3,7 @@
 # U-Boot
 #
 #############################################################
+
 UBOOT_VERSION    = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
 UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 
diff --git a/boot/xloader/xloader.mk b/boot/xloader/xloader.mk
index b15d9b9..28a32eb 100644
--- a/boot/xloader/xloader.mk
+++ b/boot/xloader/xloader.mk
@@ -3,6 +3,7 @@
 # x-loader
 #
 #############################################################
+
 XLOADER_VERSION    = 6f3a26101303051e0f91b6213735b68ce804e94e
 XLOADER_SITE       = git://gitorious.org/x-loader/x-loader.git
 XLOADER_BOARD_NAME = $(call qstrip,$(BR2_TARGET_XLOADER_BOARDNAME))
diff --git a/linux/linux.mk b/linux/linux.mk
index 177446d..57956dd 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -3,6 +3,7 @@
 # Linux kernel target
 #
 ###############################################################################
+
 LINUX_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_LICENSE = GPLv2
 LINUX_LICENSE_FILES = COPYING
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index b557617..b64fa7d 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -3,6 +3,7 @@
 # acpid
 #
 #############################################################
+
 ACPID_VERSION = 2.0.11
 ACPID_SOURCE = acpid_$(ACPID_VERSION).orig.tar.gz
 ACPID_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/acpid
diff --git a/package/alsamixergui/alsamixergui.mk b/package/alsamixergui/alsamixergui.mk
index b59de59..eca3dd0 100644
--- a/package/alsamixergui/alsamixergui.mk
+++ b/package/alsamixergui/alsamixergui.mk
@@ -3,6 +3,7 @@
 # alsamixergui
 #
 #############################################################
+
 ALSAMIXERGUI_VERSION = 0.9.0rc2-1
 ALSAMIXERGUI_SOURCE = alsamixergui_$(ALSAMIXERGUI_VERSION).orig.tar.gz
 ALSAMIXERGUI_SITE = http://snapshot.debian.org/archive/debian/20080319T000000Z/pool/main/a/alsamixergui/
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index cc90f9e..f7313b0 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -3,6 +3,7 @@
 # apr-util
 #
 #############################################################
+
 APR_UTIL_VERSION = 1.4.1
 APR_UTIL_SITE = http://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index a9dcb40..ef5c486 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -3,6 +3,7 @@
 # apr
 #
 #############################################################
+
 APR_VERSION = 1.4.6
 APR_SITE = http://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index e8ca560..5240e26 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -3,6 +3,7 @@
 # avahi (zeroconf implementation)
 #
 #############################################################
+
 #
 # This program is free software; you can redistribute it
 # and/or modify it under the terms of the GNU Lesser General
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index f823b4a..58ce774 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -3,6 +3,7 @@
 # axel
 #
 #############################################################
+
 AXEL_VERSION = 2.4
 AXEL_SOURCE = axel-$(AXEL_VERSION).tar.gz
 AXEL_SITE = https://alioth.debian.org/frs/download.php/3015
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index a9cf133..9f145b7 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -3,6 +3,7 @@
 # beecrypt
 #
 #############################################################
+
 BEECRYPT_VERSION = 4.2.1
 BEECRYPT_SITE = http://downloads.sourceforge.net/project/beecrypt/beecrypt/$(BEECRYPT_VERSION)
 BEECRYPT_AUTORECONF = YES
diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 3037da6..9a2e5f0 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -3,6 +3,7 @@
 # berkeley db
 #
 #############################################################
+
 BERKELEYDB_VERSION = 5.3.21
 BERKELEYDB_SITE = http://download.oracle.com/berkeley-db
 BERKELEYDB_SOURCE = db-$(BERKELEYDB_VERSION).NC.tar.gz
diff --git a/package/boa/boa.mk b/package/boa/boa.mk
index 1099808..8789e8a 100644
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -3,6 +3,7 @@
 # boa
 #
 #############################################################
+
 BOA_VERSION = 0.94.14rc21
 BOA_SOURCE = boa-$(BOA_VERSION).tar.gz
 BOA_SITE = http://www.boa.org/
diff --git a/package/bootutils/bootutils.mk b/package/bootutils/bootutils.mk
index 3f943a7..7ac11fc 100644
--- a/package/bootutils/bootutils.mk
+++ b/package/bootutils/bootutils.mk
@@ -3,6 +3,7 @@
 # bootutils
 #
 #############################################################
+
 BOOTUTILS_VERSION = 1.0.0
 BOOTUTILS_SITE = http://downloads.sourceforge.net/project/bootutils/Stable/v$(BOOTUTILS_VERSION)
 
diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
index 1e05c83..9a39ed5 100644
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -3,6 +3,7 @@
 # bsdiff
 #
 #############################################################
+
 BSDIFF_VERSION = 4.3
 BSDIFF_SOURCE = bsdiff-$(BSDIFF_VERSION).tar.gz
 BSDIFF_SITE = http://www.daemonology.net/bsdiff
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 203dbbe..445b554 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -3,6 +3,7 @@
 # cairo
 #
 #############################################################
+
 CAIRO_VERSION = 1.12.10
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPLv2.1+
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index 570b1e8..735e689 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -3,6 +3,7 @@
 # CCID
 #
 ##########################################################
+
 CCID_VERSION = 1.4.8
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
 CCID_SITE = http://alioth.debian.org/frs/download.php/3768
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 3722adb..fa815ed 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -3,6 +3,7 @@
 # cjson
 #
 #############################################################
+
 CJSON_VERSION         = 42
 CJSON_SITE_METHOD     = svn
 CJSON_SITE            = https://cjson.svn.sourceforge.net/svnroot/cjson
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index 2bc0af2..d8eee42 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -3,6 +3,7 @@
 # cvs
 #
 #############################################################
+
 CVS_VERSION = 1.12.13
 CVS_SOURCE = cvs_$(CVS_VERSION).orig.tar.gz
 CVS_PATCH = cvs_$(CVS_VERSION)-12.diff.gz
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 6a4aab2..447fc0c 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -3,6 +3,7 @@
 # dbus-glib
 #
 #############################################################
+
 DBUS_GLIB_VERSION = 0.98
 DBUS_GLIB_SOURCE = dbus-glib-$(DBUS_GLIB_VERSION).tar.gz
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib/
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index c011642..06a48e4 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -3,6 +3,7 @@
 # dbus-python
 #
 #############################################################
+
 DBUS_PYTHON_VERSION = 0.83.0
 DBUS_PYTHON_SOURCE = dbus-python-$(DBUS_PYTHON_VERSION).tar.gz
 DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python/
diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index 77470fa..bc94264 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -3,6 +3,7 @@
 # dfu-util
 #
 #############################################################
+
 DFU_UTIL_VERSION = 0.6
 DFU_UTIL_SOURCE = dfu-util-$(DFU_UTIL_VERSION).tar.gz
 DFU_UTIL_SITE = http://dfu-util.gnumonks.org/releases/
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 5ead084..dc1071b 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -3,6 +3,7 @@
 # directfb
 #
 #############################################################
+
 DIRECTFB_VERSION_MAJOR = 1.6
 DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).3
 DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index b452386..015cd36 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -3,6 +3,7 @@
 # docker
 #
 #############################################################
+
 DOCKER_VERSION = 1.5
 DOCKER_SOURCE = docker-$(DOCKER_VERSION).tar.gz
 DOCKER_SITE = http://icculus.org/openbox/2/docker
diff --git a/package/elftosb/elftosb.mk b/package/elftosb/elftosb.mk
index 5803b75..d540afb 100644
--- a/package/elftosb/elftosb.mk
+++ b/package/elftosb/elftosb.mk
@@ -3,6 +3,7 @@
 # elftosb
 #
 #############################################################
+
 ELFTOSB_VERSION = 10.12.01
 ELFTOSB_SOURCE = elftosb-$(ELFTOSB_VERSION).tar.gz
 ELFTOSB_SITE = http://repository.timesys.com/buildsources/e/elftosb/elftosb-$(ELFTOSB_VERSION)
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 39407db..fbde905 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -3,6 +3,7 @@
 # elfutils
 #
 #############################################################
+
 ELFUTILS_VERSION = 0.155
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://fedorahosted.org/releases/e/l/elfutils/$(ELFUTILS_VERSION)
diff --git a/package/empty/empty.mk b/package/empty/empty.mk
index 005f880..cf1e737 100644
--- a/package/empty/empty.mk
+++ b/package/empty/empty.mk
@@ -3,6 +3,7 @@
 # empty
 #
 #############################################################
+
 EMPTY_VERSION = 0.6.18b
 EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
 EMPTY_SITE = http://downloads.sourceforge.net/project/empty/empty/empty-$(EMPTY_VERSION)
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index 896dfc6..3425c56 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -3,6 +3,7 @@
 # enchant
 #
 #############################################################
+
 ENCHANT_VERSION = 1.5.0
 ENCHANT_SOURCE = enchant-$(ENCHANT_VERSION).tar.gz
 ENCHANT_SITE = http://www.abisource.com/downloads/enchant/$(ENCHANT_VERSION)
diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index 89e1957..2f6f793 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -3,6 +3,7 @@
 # ezxml
 #
 #############################################################
+
 EZXML_VERSION = 0.8.6
 EZXML_SOURCE = ezxml-$(EZXML_VERSION).tar.gz
 EZXML_SITE = http://downloads.sourceforge.net/project/ezxml/ezXML/ezXML%20$(EZXML_VERSION)
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 734b065..0a36181 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -3,6 +3,7 @@
 # fakeroot
 #
 #############################################################
+
 FAKEROOT_VERSION = 1.18.2
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
 FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20111201T093630Z/pool/main/f/fakeroot/
diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
index 4eb7c9e..e6ccb32 100644
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -3,6 +3,7 @@
 # fconfig
 #
 #############################################################
+
 FCONFIG_VERSION = 20080329
 FCONFIG_SOURCE = fconfig-$(FCONFIG_VERSION).tar.gz
 FCONFIG_SITE = http://andrzejekiert.ovh.org/software/fconfig/
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 675cc6e..7689a8f 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -3,6 +3,7 @@
 # flashrom
 #
 #############################################################
+
 FLASHROM_VERSION = 0.9.6.1
 FLASHROM_SOURCE  = flashrom-$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE    = http://download.flashrom.org/releases
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 6762126..299a86b 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -3,6 +3,7 @@
 # fontconfig
 #
 #############################################################
+
 FONTCONFIG_VERSION = 2.6.0
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.gz
 FONTCONFIG_SITE = http://fontconfig.org/release
diff --git a/package/fxload/fxload.mk b/package/fxload/fxload.mk
index 8508084..7df9da5 100644
--- a/package/fxload/fxload.mk
+++ b/package/fxload/fxload.mk
@@ -3,6 +3,7 @@
 # fxload
 #
 #############################################################
+
 FXLOAD_VERSION = 2008_10_13
 FXLOAD_SITE = http://downloads.sourceforge.net/project/linux-hotplug/fxload/$(FXLOAD_VERSION)
 FXLOAD_LICENSE = GPLv2+
diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
index 0fc8221..356c2cb 100644
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -3,6 +3,7 @@
 # gadgetfs-test
 #
 #############################################################
+
 GADGETFS_TEST_SOURCE=gadgetfs-test.tar.bz2
 GADGETFS_TEST_SITE=http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/GadgetFsTest/
 
diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index b13a9ac..36e10d3 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -3,6 +3,7 @@
 # gamin
 #
 #############################################################
+
 GAMIN_VERSION = 0.1.10
 GAMIN_SOURCE = gamin-$(GAMIN_VERSION).tar.gz
 GAMIN_SITE = http://www.gnome.org/~veillard/gamin/sources
diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 4971b12..6aeffe3 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -3,6 +3,7 @@
 # gdbm
 #
 #############################################################
+
 GDBM_VERSION = 1.10
 GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
 GDBM_LICENSE = GPLv3
diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
index ab2bbef..5a90170 100644
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -3,6 +3,7 @@
 # giblib
 #
 #############################################################
+
 GIBLIB_VERSION = 1.2.4
 GIBLIB_SOURCE = giblib-$(GIBLIB_VERSION).tar.gz
 GIBLIB_SITE = http://linuxbrit.co.uk/downloads/
diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
index 6f64175..178f4ad 100644
--- a/package/gqview/gqview.mk
+++ b/package/gqview/gqview.mk
@@ -3,6 +3,7 @@
 # gqview
 #
 #############################################################
+
 GQVIEW_VERSION = 2.1.5
 GQVIEW_SOURCE = gqview-$(GQVIEW_VERSION).tar.gz
 GQVIEW_SITE = http://prdownloads.sourceforge.net/gqview
diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index ef426cf..fafb49b 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -3,6 +3,7 @@
 # gnu gsl
 #
 #############################################################
+
 GSL_VERSION = 1.15
 GSL_SOURCE = gsl-$(GSL_VERSION).tar.gz
 GSL_SITE = $(BR2_GNU_MIRROR)/gsl
diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
index 1551ad5..a7e2a3f 100644
--- a/package/gtk2-engines/gtk2-engines.mk
+++ b/package/gtk2-engines/gtk2-engines.mk
@@ -3,6 +3,7 @@
 # gtk2-engines.0
 #
 #############################################################
+
 GTK2_ENGINES_VERSION = 2.20.2
 GTK2_ENGINES_SOURCE  = gtk-engines-$(GTK2_ENGINES_VERSION).tar.bz2
 GTK2_ENGINES_SITE    = http://ftp.gnome.org/pub/GNOME/sources/gtk-engines/2.20
diff --git a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
index 3a26cfc..fd55a37 100644
--- a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
+++ b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
@@ -3,6 +3,7 @@
 # GTK Theme - Hicolour
 #
 #############################################################
+
 GTK2_THEME_HICOLOR_VERSION = 0.10
 GTK2_THEME_HICOLOR_SOURCE = hicolor-icon-theme-$(GTK2_THEME_HICOLOR_VERSION).tar.gz
 GTK2_THEME_HICOLOR_SITE = http://icon-theme.freedesktop.org/releases/
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 1ae094f..14f3104 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -3,6 +3,7 @@
 # gvfs
 #
 #############################################################
+
 GVFS_VERSION_MAJOR = 1.8
 GVFS_VERSION_MINOR = 2
 GVFS_VERSION = $(GVFS_VERSION_MAJOR).$(GVFS_VERSION_MINOR)
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index c56dea4..517ca5f 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -3,6 +3,7 @@
 # hwdata
 #
 #############################################################
+
 HWDATA_VERSION = 0.230
 HWDATA_SOURCE = hwdata_$(HWDATA_VERSION).orig.tar.gz
 HWDATA_PATCH = hwdata_$(HWDATA_VERSION)-1.diff.gz
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index cec6706..c051925 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -3,6 +3,7 @@
 ## IMLIB2
 #
 ##############################################################
+
 IMLIB2_VERSION = 1.4.5
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)/
diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
index 84c4c80..2b8052e 100644
--- a/package/infozip/infozip.mk
+++ b/package/infozip/infozip.mk
@@ -3,6 +3,7 @@
 # infozip
 #
 #############################################################
+
 INFOZIP_VERSION = 30
 INFOZIP_SOURCE = zip$(INFOZIP_VERSION).tgz
 INFOZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index b1cb093..6f15da6 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -3,6 +3,7 @@
 # input-tools
 #
 #############################################################
+
 INPUT_TOOLS_VERSION = 20051019
 INPUT_TOOLS_SOURCE  = joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
 INPUT_TOOLS_PATCH   = joystick_$(INPUT_TOOLS_VERSION)-5.diff.gz
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index b20080f..7cd4c63 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -3,6 +3,7 @@
 # iperf
 #
 #############################################################
+
 IPERF_VERSION = 2.0.5
 IPERF_SOURCE = iperf-$(IPERF_VERSION).tar.gz
 IPERF_SITE = http://downloads.sourceforge.net/project/iperf
diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
index b024252..344225b 100644
--- a/package/lcdapi/lcdapi.mk
+++ b/package/lcdapi/lcdapi.mk
@@ -3,6 +3,7 @@
 # lcdapi
 #
 #############################################################
+
 LCDAPI_VERSION = v0.4
 LCDAPI_SITE = http://github.com/spdawson/lcdapi/tarball/$(LCDAPI_VERSION)
 LCDAPI_LICENSE = LGPLv2.1+
diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index fe88f46..95c6fe5 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -3,6 +3,7 @@
 # lcdproc
 #
 #############################################################
+
 LCDPROC_VERSION = 0.5.6
 LCDPROC_SOURCE = lcdproc-$(LCDPROC_VERSION).tar.gz
 LCDPROC_SITE = http://downloads.sourceforge.net/project/lcdproc/lcdproc/$(LCDPROC_VERSION)
diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index b06e655..e37f6c8 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -3,6 +3,7 @@
 # leafpad
 #
 #############################################################
+
 LEAFPAD_VERSION = 0.8.18
 LEAFPAD_SOURCE = leafpad-$(LEAFPAD_VERSION).tar.gz
 LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 7bcdfa2..243c975 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -3,6 +3,7 @@
 # libaio
 #
 #############################################################
+
 LIBAIO_VERSION = 0.3.109
 LIBAIO_SOURCE = libaio_$(LIBAIO_VERSION).orig.tar.gz
 LIBAIO_SITE = http://snapshot.debian.org/archive/debian/20110227T085214Z/pool/main/liba/libaio/
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index c00bc7b..4c5bd9e 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -3,6 +3,7 @@
 # libarchive (reusable C library for archive formats)
 #
 #############################################################
+
 LIBARCHIVE_VERSION = 3.0.4
 LIBARCHIVE_SITE = http://github.com/downloads/libarchive/libarchive
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.gz
diff --git a/package/libatasmart/libatasmart.mk b/package/libatasmart/libatasmart.mk
index 1d96ac7..a7c4e5d 100644
--- a/package/libatasmart/libatasmart.mk
+++ b/package/libatasmart/libatasmart.mk
@@ -3,6 +3,7 @@
 # libatasmart
 #
 #############################################################
+
 LIBATASMART_VERSION = 0.19
 LIBATASMART_SOURCE = libatasmart-$(LIBATASMART_VERSION).tar.xz
 LIBATASMART_SITE    = http://0pointer.de/public
diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index 4c5664f..ec8b6ee 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -3,6 +3,7 @@
 # libcgicc
 #
 #############################################################
+
 LIBCGICC_VERSION=3.2.9
 LIBCGICC_SITE=$(BR2_GNU_MIRROR)/cgicc
 LIBCGICC_SOURCE=cgicc-$(LIBCGICC_VERSION).tar.gz
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index d88a209..5b64eb1 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -3,6 +3,7 @@
 # libconfuse
 #
 #############################################################
+
 LIBCONFUSE_VERSION = 2.7
 LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.gz
 LIBCONFUSE_SITE = http://savannah.nongnu.org/download/confuse/
diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
index b77b7b2..c11045a 100644
--- a/package/libelf/libelf.mk
+++ b/package/libelf/libelf.mk
@@ -3,6 +3,7 @@
 # libelf
 #
 #############################################################
+
 LIBELF_VERSION=0.8.12
 LIBELF_SOURCE=libelf-$(LIBELF_VERSION).tar.gz
 LIBELF_SITE=http://www.mr511.de/software/
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index 363d327..5464b66 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -3,6 +3,7 @@
 # liberation
 #
 #############################################################
+
 LIBERATION_VERSION = 1.06.0.20100721
 LIBERATION_SITE = http://www.fedorahosted.org/releases/l/i/liberation-fonts
 LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index baa0d64..3e62e9e 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -3,6 +3,7 @@
 # libesmtp
 #
 #############################################################
+
 LIBESMTP_VERSION = 1.0.6
 LIBESMTP_SOURCE = libesmtp-$(LIBESMTP_VERSION).tar.bz2
 LIBESMTP_SITE = http://www.stafford.uklinux.net/libesmtp
diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 564db37..e1063bd 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -3,6 +3,7 @@
 # libev
 #
 #############################################################
+
 LIBEV_VERSION = 4.11
 LIBEV_SOURCE = libev-$(LIBEV_VERSION).tar.gz
 LIBEV_SITE = http://dist.schmorp.de/libev/
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 5ce511f..6b31b20 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -3,6 +3,7 @@
 # libevent
 #
 #############################################################
+
 LIBEVENT_VERSION = 2.0.14
 LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
 LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index a4d18a4..0568d45 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -3,6 +3,7 @@
 # libfcgi
 #
 ##############################################################################
+
 LIBFCGI_VERSION = 2.4.0
 LIBFCGI_SOURCE = fcgi-$(LIBFCGI_VERSION).tar.gz
 LIBFCGI_SITE = http://www.fastcgi.com/dist
diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 3c96839..4e0514b 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -3,6 +3,7 @@
 # libfreefare
 #
 #############################################################
+
 LIBFREEFARE_VERSION = 0.3.4
 LIBFREEFARE_SITE = http://nfc-tools.googlecode.com/files
 LIBFREEFARE_DEPENDENCIES = libnfc openssl
diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index 06316fe..3c4dcbc 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -3,6 +3,7 @@
 # libftdi
 #
 #############################################################
+
 LIBFTDI_VERSION = 0.19
 LIBFTDI_SOURCE = libftdi-$(LIBFTDI_VERSION).tar.gz
 LIBFTDI_SITE = http://www.intra2net.com/en/developer/libftdi/download/
diff --git a/package/libgail/libgail.mk b/package/libgail/libgail.mk
index e3ea9b9..8db2476 100644
--- a/package/libgail/libgail.mk
+++ b/package/libgail/libgail.mk
@@ -3,6 +3,7 @@
 # libgail
 #
 #############################################################
+
 LIBGAIL_VERSION_MAJOR = 1.22
 LIBGAIL_VERSION_MINOR = 3
 LIBGAIL_VERSION = $(LIBGAIL_VERSION_MAJOR).$(LIBGAIL_VERSION_MINOR)
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index 3bf4206..115256f 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -3,6 +3,7 @@
 # libgeotiff
 #
 #############################################################
+
 LIBGEOTIFF_VERSION = 1.3.0
 LIBGEOTIFF_SOURCE = libgeotiff-$(LIBGEOTIFF_VERSION).tar.gz
 LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 6a6641c..3197d44 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -3,6 +3,7 @@
 # libglade
 #
 #############################################################
+
 LIBGLADE_VERSION = 2.6.4
 LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
 LIBGLADE_SITE = http://ftp.gnome.org/pub/GNOME/sources/libglade/2.6/
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 194fa64..2c16f6a 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -3,6 +3,7 @@
 # libglib2
 #
 #############################################################
+
 LIBGLIB2_VERSION_MAJOR = 2.30
 LIBGLIB2_VERSION_MINOR = 3
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 5881ea7..ceafc50 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -3,6 +3,7 @@
 # libgtk2.0
 #
 #############################################################
+
 LIBGTK2_VERSION_MAJOR = 2.24
 LIBGTK2_VERSION_MINOR = 10
 LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).$(LIBGTK2_VERSION_MINOR)
diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index ce1d7e2..6f63469 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -3,6 +3,7 @@
 # libiconv
 #
 #############################################################
+
 LIBICONV_VERSION = 1.14
 LIBICONV_SOURCE = libiconv-$(LIBICONV_VERSION).tar.gz
 LIBICONV_SITE = $(BR2_GNU_MIRROR)/libiconv
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index 924c3a7..584867f 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -3,6 +3,7 @@
 # liblo
 #
 #############################################################
+
 LIBLO_VERSION = 0.26
 LIBLO_SOURCE = liblo-$(LIBLO_VERSION).tar.gz
 LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
index 3701cca..e879b4c 100644
--- a/package/liblog4c-localtime/liblog4c-localtime.mk
+++ b/package/liblog4c-localtime/liblog4c-localtime.mk
@@ -3,6 +3,7 @@
 # liblog4c
 #
 #############################################################
+
 LIBLOG4C_LOCALTIME_VERSION = 1.0
 LIBLOG4C_LOCALTIME_SITE    = https://github.com/rcmadruga/log4c-localtime/tarball/v$(LIBLOG4C_LOCALTIME_VERSION)
 LIBLOG4C_LOCALTIME_INSTALL_STAGING = YES
diff --git a/package/libmms/libmms.mk b/package/libmms/libmms.mk
index 5ab4f37..ffa695e 100644
--- a/package/libmms/libmms.mk
+++ b/package/libmms/libmms.mk
@@ -3,6 +3,7 @@
 # libmms
 #
 #############################################################
+
 LIBMMS_VERSION = 0.6.2
 LIBMMS_SOURCE = libmms-$(LIBMMS_VERSION).tar.gz
 LIBMMS_SITE = http://downloads.sourceforge.net/project/libmms/libmms/$(LIBMMS_VERSION)
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index a390655..a2d719a 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -3,6 +3,7 @@
 # libmodbus
 #
 #############################################################
+
 LIBMODBUS_VERSION = 3.0.3
 LIBMODBUS_SITE = http://github.com/downloads/stephane/libmodbus
 LIBMODBUS_INSTALL_STAGING = YES
diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
index f3cf245..32a3d06 100644
--- a/package/libmpeg2/libmpeg2.mk
+++ b/package/libmpeg2/libmpeg2.mk
@@ -3,6 +3,7 @@
 # libmpeg2
 #
 #############################################################
+
 LIBMPEG2_VERSION = 0.5.1
 LIBMPEG2_SOURCE = libmpeg2-$(LIBMPEG2_VERSION).tar.gz
 LIBMPEG2_SITE = http://libmpeg2.sourceforge.net/files
diff --git a/package/libnfc-llcp/libnfc-llcp.mk b/package/libnfc-llcp/libnfc-llcp.mk
index 0bff089..6975e78 100644
--- a/package/libnfc-llcp/libnfc-llcp.mk
+++ b/package/libnfc-llcp/libnfc-llcp.mk
@@ -3,6 +3,7 @@
 # libnfc-llcp
 #
 #############################################################
+
 LIBNFC_LLCP_VERSION = 1103
 LIBNFC_LLCP_SITE = http://nfc-tools.googlecode.com/svn/trunk/libnfc-llcp/
 LIBNFC_LLCP_SITE_METHOD = svn
diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index b9ff583..df52fa3 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -3,6 +3,7 @@
 # libnfc
 #
 #############################################################
+
 LIBNFC_VERSION = fda8d60ce062
 LIBNFC_SITE = http://libnfc.googlecode.com/git/
 LIBNFC_SITE_METHOD = git
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 71b64b9..d2db183 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -3,6 +3,7 @@
 # libnspr
 #
 #############################################################
+
 LIBNSPR_VERSION = 4.9.6
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src/
diff --git a/package/liboauth/liboauth.mk b/package/liboauth/liboauth.mk
index 9eb0e7d..b5fa68f 100644
--- a/package/liboauth/liboauth.mk
+++ b/package/liboauth/liboauth.mk
@@ -3,6 +3,7 @@
 # liboauth
 #
 #############################################################
+
 LIBOAUTH_VERSION = 0.9.6
 LIBOAUTH_SOURCE = liboauth-$(LIBOAUTH_VERSION).tar.gz
 LIBOAUTH_SITE = http://liboauth.sourceforge.net/pool
diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index 606c004..2d5f2c1 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -3,6 +3,7 @@
 # libogg
 #
 #############################################################
+
 LIBOGG_VERSION = 1.3.0
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
 LIBOGG_LICENSE = BSD-3c
diff --git a/package/libplayer/libplayer.mk b/package/libplayer/libplayer.mk
index 511c7f6..8e8e503 100644
--- a/package/libplayer/libplayer.mk
+++ b/package/libplayer/libplayer.mk
@@ -3,6 +3,7 @@
 # libplayer
 #
 #############################################################
+
 LIBPLAYER_VERSION = 2.0.1
 LIBPLAYER_SITE = http://libplayer.geexbox.org/releases/
 LIBPLAYER_SOURCE = libplayer-$(LIBPLAYER_VERSION).tar.bz2
diff --git a/package/libtheora/libtheora.mk b/package/libtheora/libtheora.mk
index 1a19bcd..37f839c 100644
--- a/package/libtheora/libtheora.mk
+++ b/package/libtheora/libtheora.mk
@@ -3,6 +3,7 @@
 # libtheora
 #
 #############################################################
+
 LIBTHEORA_VERSION = 1.1.1
 LIBTHEORA_SOURCE = libtheora-$(LIBTHEORA_VERSION).tar.bz2
 LIBTHEORA_SITE = http://downloads.xiph.org/releases/theora
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 25cd89d..1c31ee8 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -3,6 +3,7 @@
 # libtool
 #
 #############################################################
+
 LIBTOOL_VERSION = 2.4.2
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.gz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
index 3ef9cc3..c83286a 100644
--- a/package/libtpl/libtpl.mk
+++ b/package/libtpl/libtpl.mk
@@ -3,6 +3,7 @@
 # libtpl
 #
 #############################################################
+
 LIBTPL_VERSION = 1.5
 LIBTPL_SOURCE = libtpl-$(LIBTPL_VERSION).tar.bz2
 LIBTPL_SITE = http://downloads.sourceforge.net/project/tpl/tpl/libtpl-$(LIBTPL_VERSION)
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index b4a4424..32a7167 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -3,6 +3,7 @@
 # liburc: userspace RCU (read-copy-update) library
 #
 #############################################################
+
 LIBURCU_VERSION = 0.7.6
 LIBURCU_SITE    = http://lttng.org/files/urcu/
 LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 9551dfe..33f113e 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -3,6 +3,7 @@
 # libusb-compat
 #
 #############################################################
+
 LIBUSB_COMPAT_VERSION = 0.1.4
 LIBUSB_COMPAT_SOURCE = libusb-compat-$(LIBUSB_COMPAT_VERSION).tar.bz2
 LIBUSB_COMPAT_SITE = http://downloads.sourceforge.net/project/libusb/libusb-compat-0.1/libusb-compat-$(LIBUSB_COMPAT_VERSION)
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index fc2f10b..806f2d3 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -3,6 +3,7 @@
 # libusb
 #
 #############################################################
+
 LIBUSB_VERSION = 1.0.9
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = http://downloads.sourceforge.net/project/libusb/libusb-1.0/libusb-$(LIBUSB_VERSION)
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 0639505..8ab99f8 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -3,6 +3,7 @@
 # libv4l
 #
 #############################################################
+
 LIBV4L_VERSION = 0.8.9
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils/
diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
index f52a68f..c1b5bdd 100644
--- a/package/libyaml/libyaml.mk
+++ b/package/libyaml/libyaml.mk
@@ -3,6 +3,7 @@
 # libyaml
 #
 #############################################################
+
 LIBYAML_VERSION = 0.1.4
 LIBYAML_SOURCE = yaml-$(LIBYAML_VERSION).tar.gz
 LIBYAML_SITE = http://pyyaml.org/download/libyaml/
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index fb73960..293208a 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -3,6 +3,7 @@
 # linenoise
 #
 #############################################################
+
 LINENOISE_VERSION = g27a3b4d
 LINENOISE_SITE = http://github.com/antirez/linenoise/tarball/master
 LINENOISE_LICENSE = BSD-2c
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index a2340bd..80b14ca 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -3,6 +3,7 @@
 # linux-fusion
 #
 #############################################################
+
 LINUX_FUSION_VERSION = 9.0.0
 LINUX_FUSION_SOURCE = linux-fusion-$(LINUX_FUSION_VERSION).tar.gz
 LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index 1c3cb51..3d6e459 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -3,6 +3,7 @@
 # lockfile-progs
 #
 #############################################################
+
 LOCKFILE_PROGS_VERSION = 0.1.15
 LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
 LOCKFILE_PROGS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs/
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 82dde39..6d2d90a 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -3,6 +3,7 @@
 # logrotate
 #
 #############################################################
+
 LOGROTATE_VERSION = 3.8.4
 LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.gz
 LOGROTATE_SITE = https://www.fedorahosted.org/releases/l/o/logrotate/
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index e143118..aab2dd6 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -3,6 +3,7 @@
 # LTTng-UST: the userspace tracing library
 #
 #############################################################
+
 LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust/
 LTTNG_LIBUST_VERSION = 2.1.1
 LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 54ae864..80ac105 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -3,6 +3,7 @@
 # LTTng-modules: the kernel modules (requires at least Linux 2.6.38)
 #
 #############################################################
+
 LTTNG_MODULES_VERSION = 2.1.0
 LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules/
 LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 5be3abb..97df1cf 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -3,6 +3,7 @@
 # LTTng-Tools: the trace control client
 #
 #############################################################
+
 LTTNG_TOOLS_VERSION = 2.1.1
 LTTNG_TOOLS_SITE    = http://lttng.org/files/lttng-tools/
 LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
index 97ce83c..bde7708 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -3,6 +3,7 @@
 # lua-msgpack-native
 #
 #############################################################
+
 LUA_MSGPACK_NATIVE_VERSION = g41cce91
 LUA_MSGPACK_NATIVE_SITE = http://github.com/kengonakajima/lua-msgpack-native/tarball/master
 LUA_MSGPACK_NATIVE_DEPENDENCIES = lua
diff --git a/package/luacjson/luacjson.mk b/package/luacjson/luacjson.mk
index 1f79d5d..dc70cee 100644
--- a/package/luacjson/luacjson.mk
+++ b/package/luacjson/luacjson.mk
@@ -3,6 +3,7 @@
 # luacjson
 #
 #############################################################
+
 LUACJSON_VERSION       = 2.1.0
 LUACJSON_SOURCE        = lua-cjson-$(LUACJSON_VERSION).tar.gz
 LUACJSON_SITE          = http://www.kyne.com.au/~mark/software/download
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 49f135d..69df260 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -3,6 +3,7 @@
 # lvm2
 #
 #############################################################
+
 LVM2_VERSION = 2.02.79
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 132140f..6809f30 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -3,6 +3,7 @@
 # lzo
 #
 #############################################################
+
 LZO_VERSION = 2.06
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_LICENSE = GPLv2+
diff --git a/package/macchanger/macchanger.mk b/package/macchanger/macchanger.mk
index 66ebb80..93b5549 100644
--- a/package/macchanger/macchanger.mk
+++ b/package/macchanger/macchanger.mk
@@ -3,6 +3,7 @@
 # macchanger
 #
 #############################################################
+
 MACCHANGER_VERSION = 1.5.0
 MACCHANGER_SITE = $(BR2_GNU_MIRROR)/macchanger
 MACCHANGER_LICENSE = GPLv2
diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox/matchbox-common/matchbox-common.mk
index 89c00c2..61b9e95 100644
--- a/package/matchbox/matchbox-common/matchbox-common.mk
+++ b/package/matchbox/matchbox-common/matchbox-common.mk
@@ -3,6 +3,7 @@
 # MatchBox Common
 #
 #############################################################
+
 MATCHBOX_COMMON_VERSION_MAJOR = 0.9
 MATCHBOX_COMMON_VERSION = $(MATCHBOX_COMMON_VERSION_MAJOR).1
 MATCHBOX_COMMON_SOURCE = matchbox-common-$(MATCHBOX_COMMON_VERSION).tar.bz2
diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
index c9ef3f4..9b12c3d 100644
--- a/package/matchbox/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
@@ -3,6 +3,7 @@
 # MatchBox Panel
 #
 #############################################################
+
 MATCHBOX_PANEL_VERSION_MAJOR = 0.9
 MATCHBOX_PANEL_VERSION = $(MATCHBOX_PANEL_VERSION_MAJOR).3
 MATCHBOX_PANEL_SOURCE = matchbox-panel-$(MATCHBOX_PANEL_VERSION).tar.bz2
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 461a906..a343301 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -3,6 +3,7 @@
 # memtester
 #
 #############################################################
+
 MEMTESTER_VERSION = 4.3.0
 MEMTESTER_SOURCE = memtester-$(MEMTESTER_VERSION).tar.gz
 MEMTESTER_SITE = http://pyropus.ca/software/memtester/old-versions/
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index b9d763c..88187c6 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -3,6 +3,7 @@
 # mii-diag
 #
 #############################################################
+
 MII_DIAG_VERSION = 2.11
 MII_DIAG_SOURCE  = mii-diag_$(MII_DIAG_VERSION).orig.tar.gz
 MII_DIAG_PATCH   = mii-diag_$(MII_DIAG_VERSION)-3.diff.gz
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 06b023e..1dfbde7 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -3,6 +3,7 @@
 # minicom
 #
 #############################################################
+
 MINICOM_VERSION = 2.6.1
 MINICOM_SOURCE = minicom-$(MINICOM_VERSION).tar.gz
 MINICOM_SITE = http://alioth.debian.org/frs/download.php/3700/
diff --git a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
index e7c4510..5eff6d1 100644
--- a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
+++ b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
@@ -3,6 +3,7 @@
 # mobile broadband provider info
 #
 #############################################################
+
 MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20120614
 MOBILE_BROADBAND_PROVIDER_INFO_SITE = http://ftp.gnome.org/pub/GNOME/sources/mobile-broadband-provider-info/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
 MOBILE_BROADBAND_PROVIDER_INFO_SOURCE = mobile-broadband-provider-info-$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION).tar.xz
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index eafce45..5c5eadc 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -3,6 +3,7 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
+
 MTD_VERSION = 1.5.0
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
diff --git a/package/mtdev/mtdev.mk b/package/mtdev/mtdev.mk
index 09f76f2..d240b50 100644
--- a/package/mtdev/mtdev.mk
+++ b/package/mtdev/mtdev.mk
@@ -3,6 +3,7 @@
 # mtdev
 #
 #############################################################
+
 MTDEV_VERSION = 1.1.3
 MTDEV_SOURCE = mtdev-$(MTDEV_VERSION).tar.bz2
 MTDEV_SITE = http://bitmath.org/code/mtdev/
diff --git a/package/mtdev2tuio/mtdev2tuio.mk b/package/mtdev2tuio/mtdev2tuio.mk
index 9306946..fcbe5a6 100644
--- a/package/mtdev2tuio/mtdev2tuio.mk
+++ b/package/mtdev2tuio/mtdev2tuio.mk
@@ -3,6 +3,7 @@
 # mtdev2tuio
 #
 #############################################################
+
 MTDEV2TUIO_VERSION = e1e7378
 MTDEV2TUIO_SITE = http://github.com/olivopaolo/mtdev2tuio/tarball/master
 MTDEV2TUIO_DEPENDENCIES = mtdev liblo
diff --git a/package/multimedia/bellagio/bellagio.mk b/package/multimedia/bellagio/bellagio.mk
index c612b95..07004ce 100644
--- a/package/multimedia/bellagio/bellagio.mk
+++ b/package/multimedia/bellagio/bellagio.mk
@@ -3,6 +3,7 @@
 # bellagio
 #
 #############################################################
+
 BELLAGIO_VERSION = 0.9.3
 BELLAGIO_SOURCE = libomxil-bellagio-$(BELLAGIO_VERSION).tar.gz
 BELLAGIO_SITE = http://downloads.sourceforge.net/project/omxil/omxil/Bellagio%20$(BELLAGIO_VERSION)
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 183de7b..1e8f54e 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -3,6 +3,7 @@
 # gst-plugins-bad
 #
 #############################################################
+
 GST_PLUGINS_BAD_VERSION = 0.10.23
 GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.bz2
 GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 02e7ca4..713aaae 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -3,6 +3,7 @@
 # gst-plugins-base
 #
 #############################################################
+
 GST_PLUGINS_BASE_VERSION = 0.10.36
 GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.bz2
 GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index 2ba3e20..b61138d 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -3,6 +3,7 @@
 # gst-plugins-good
 #
 #############################################################
+
 GST_PLUGINS_GOOD_VERSION = 0.10.31
 GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.bz2
 GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index e23d774..752f8e8 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -3,6 +3,7 @@
 # gst-plugins-ugly
 #
 #############################################################
+
 GST_PLUGINS_UGLY_VERSION = 0.10.19
 GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.bz2
 GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index 5abce53..3639a55 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -4,6 +4,7 @@
 # gstreamer
 #
 #############################################################
+
 GSTREAMER_VERSION = 0.10.36
 GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.bz2
 GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 4a1abf4..6ddf002 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -3,6 +3,7 @@
 # mplayer
 #
 #############################################################
+
 MPLAYER_VERSION = 1.1
 MPLAYER_SOURCE = MPlayer-$(MPLAYER_VERSION).tar.xz
 MPLAYER_SITE = http://www.mplayerhq.hu/MPlayer/releases
diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index 529f5dd..c789fc8 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -3,6 +3,7 @@
 # pulseaudio
 #
 ################################################################################
+
 PULSEAUDIO_VERSION = 3.0
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases/
 PULSEAUDIO_INSTALL_STAGING = YES
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index 03850d0..5f03db8 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -3,6 +3,7 @@
 # mxml
 #
 #############################################################
+
 MXML_VERSION = 2.7
 MXML_SITE = http://ftp.easysw.com/pub/mxml/$(MXML_VERSION)
 MXML_LICENSE = LGPLv2+ with exceptions
diff --git a/package/nanocom/nanocom.mk b/package/nanocom/nanocom.mk
index de4cc5f..a6cd7e1 100644
--- a/package/nanocom/nanocom.mk
+++ b/package/nanocom/nanocom.mk
@@ -3,6 +3,7 @@
 # nanocom
 #
 #############################################################
+
 NANOCOM_VERSION = 2.6.1
 NANOCOM_SOURCE = nanocom.tar.gz
 NANOCOM_SITE = http://downloads.sourceforge.net/project/nanocom/nanocom/v1.0
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 3bff302..32d63ad 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -3,6 +3,7 @@
 # neon
 #
 #############################################################
+
 NEON_VERSION = 0.29.6
 NEON_SITE = http://www.webdav.org/neon/
 NEON_LICENSE = LGPLv2+ (library), GPLv2+ (manual and tests)
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index a366644..2e0f978 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -3,6 +3,7 @@
 # netatalk
 #
 #############################################################
+
 NETATALK_VERSION = 3.0
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
diff --git a/package/netkitbase/netkitbase.mk b/package/netkitbase/netkitbase.mk
index 3899b78..01f35be 100644
--- a/package/netkitbase/netkitbase.mk
+++ b/package/netkitbase/netkitbase.mk
@@ -3,6 +3,7 @@
 # netkitbase
 #
 #############################################################
+
 NETKITBASE_VERSION = 0.17
 NETKITBASE_SOURCE  = netkit-base-$(NETKITBASE_VERSION).tar.gz
 NETKITBASE_SITE    = ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
diff --git a/package/netkittelnet/netkittelnet.mk b/package/netkittelnet/netkittelnet.mk
index a0f2786..db6743e 100644
--- a/package/netkittelnet/netkittelnet.mk
+++ b/package/netkittelnet/netkittelnet.mk
@@ -3,6 +3,7 @@
 # netkittelnet
 #
 #############################################################
+
 NETKITTELNET_VERSION = 0.17
 NETKITTELNET_SOURCE  = netkit-telnet-$(NETKITTELNET_VERSION).tar.gz
 NETKITTELNET_SITE    = ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index e42894f..0c723bf 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -3,6 +3,7 @@
 # netplug
 #
 #############################################################
+
 NETPLUG_VERSION=1.2.9.2
 NETPLUG_SOURCE=netplug-$(NETPLUG_VERSION).tar.bz2
 NETPLUG_SITE=http://www.red-bean.com/~bos/netplug
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index 8a0c647..754636b 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -3,6 +3,7 @@
 # newt
 #
 #############################################################
+
 NEWT_VERSION         = 0.51.0
 NEWT_SITE            = http://www.uclibc.org/
 NEWT_SOURCE          = newt-$(NEWT_VERSION).tar.bz2
diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index 4cea4ec..250050e 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -3,6 +3,7 @@
 # nss_mdns
 #
 #############################################################
+
 NSS_MDNS_VERSION=0.10
 NSS_MDNS_SITE=http://0pointer.de/lennart/projects/nss-mdns
 
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index bc71ead..e42f654 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -3,6 +3,7 @@
 # OpenCV (Open Source Computer Vision)
 #
 #############################################################
+
 OPENCV_VERSION = 2.4.2
 OPENCV_SITE    = http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_VERSION)
 OPENCV_SOURCE  = OpenCV-$(OPENCV_VERSION).tar.bz2
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index fef1117..18ce0fd 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -3,6 +3,7 @@
 # orc
 #
 #############################################################
+
 ORC_VERSION = 0.4.16
 ORC_SITE = http://code.entropywave.com/download/orc/
 ORC_LICENSE = BSD-2c, BSD-3c
diff --git a/package/owl-linux/owl-linux.mk b/package/owl-linux/owl-linux.mk
index 832f6b1..a54cc5d 100644
--- a/package/owl-linux/owl-linux.mk
+++ b/package/owl-linux/owl-linux.mk
@@ -3,6 +3,7 @@
 # owl-linux
 #
 #############################################################
+
 OWL_LINUX_VERSION = 1.0.7
 OWL_LINUX_SITE = http://linux.hd-wireless.se/pub/Linux/DownloadDrivers
 OWL_LINUX_LICENSE = PROPRIETARY
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 8e0444e..75477d9 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -3,6 +3,7 @@
 # pango
 #
 #############################################################
+
 PANGO_VERSION_MAJOR = 1.28
 PANGO_VERSION_MINOR = 4
 PANGO_VERSION = $(PANGO_VERSION_MAJOR).$(PANGO_VERSION_MINOR)
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 392e3ad..4a2cdac 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -3,6 +3,7 @@
 # pcmanfm
 #
 #############################################################
+
 PCMANFM_VERSION = 0.3.5.9
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.gz
 PCMANFM_SITE = http://downloads.sourceforge.net/project/pcmanfm/pcmanfm-legacy%20%28Old%200.5%20series%29/PCManFM%20$(PCMANFM_VERSION)
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index a595681..4f70ce5 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -3,6 +3,7 @@
 # pixman
 #
 ################################################################################
+
 PIXMAN_VERSION = 0.30.0
 PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 32a026b..1aa9bb4 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -3,6 +3,7 @@
 # poco
 #
 #############################################################
+
 POCO_VERSION_MAJOR = 1.4.6
 POCO_VERSION = $(POCO_VERSION_MAJOR)p1
 POCO_SOURCE = poco-$(POCO_VERSION)-all.tar.gz
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index fb3a766..9193553 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -3,6 +3,7 @@
 # popt
 #
 #############################################################
+
 POPT_VERSION = 1.16
 # rpm5.org down
 POPT_SITE = http://anduin.linuxfromscratch.org/sources/BLFS/svn/p/
diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index 1f5c3dd..48fe018 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -3,6 +3,7 @@
 # PrBoom
 #
 #############################################################
+
 PRBOOM_VERSION = 2.5.0
 PRBOOM_SITE = http://downloads.sourceforge.net/project/prboom/prboom%20stable/$(PRBOOM_VERSION)
 PRBOOM_CONF_ENV = ac_cv_type_uid_t=yes
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 5032d70..519e568 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -3,6 +3,7 @@
 # protobuf
 #
 #############################################################
+
 PROTOBUF_VERSION = 2.4.1
 PROTOBUF_SOURCE = protobuf-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = http://protobuf.googlecode.com/files/
diff --git a/package/python-nfc/python-nfc.mk b/package/python-nfc/python-nfc.mk
index a053b2c..32c0a27 100644
--- a/package/python-nfc/python-nfc.mk
+++ b/package/python-nfc/python-nfc.mk
@@ -3,6 +3,7 @@
 # python-nfc
 #
 #############################################################
+
 PYTHON_NFC_VERSION = 142
 PYTHON_NFC_SITE = https://launchpad.net/nfcpy
 PYTHON_NFC_SITE_METHOD = bzr
diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
index f3426a4..06159cc 100644
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -3,6 +3,7 @@
 # Pygame
 #
 #############################################################
+
 # stable 1.9.1 release requires V4L which has been wiped out of recent Linux
 # kernels, so use latest mercurial revision until next stable release is out.
 PYTHON_PYGAME_VERSION = f0bb4a4b365d
diff --git a/package/python/python.mk b/package/python/python.mk
index 801c669..6e95451 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -3,6 +3,7 @@
 # python
 #
 #############################################################
+
 PYTHON_VERSION_MAJOR = 2.7
 PYTHON_VERSION       = $(PYTHON_VERSION_MAJOR).3
 PYTHON_SOURCE        = Python-$(PYTHON_VERSION).tar.bz2
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 239ac8f..f44ba13 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -3,6 +3,7 @@
 # python3
 #
 #############################################################
+
 PYTHON3_VERSION_MAJOR = 3.3
 PYTHON3_VERSION       = $(PYTHON3_VERSION_MAJOR).0
 PYTHON3_SOURCE        = Python-$(PYTHON3_VERSION).tar.bz2
diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
index 0ac8874..8a9c7cb 100644
--- a/package/qtuio/qtuio.mk
+++ b/package/qtuio/qtuio.mk
@@ -3,6 +3,7 @@
 # qTUIO
 #
 #############################################################
+
 QTUIO_VERSION = abe4973ff6
 QTUIO_SITE = git://github.com/x29a/qTUIO.git
 QTUIO_INSTALL_STAGING = YES
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 1a417eb..0c40800 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -3,6 +3,7 @@
 # rpm
 #
 #############################################################
+
 RPM_VERSION = 5.2.0
 RPM_SITE = http://rpm5.org/files/rpm/rpm-5.2/
 RPM_DEPENDENCIES = zlib beecrypt neon popt
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 2001752..2d3c27f 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -3,6 +3,7 @@
 # rsyslog
 #
 #############################################################
+
 RSYSLOG_VERSION = 5.8.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog/
 RSYSLOG_DEPENDENCIES = zlib
diff --git a/package/rubix/rubix.mk b/package/rubix/rubix.mk
index 9270367..773e0bc 100644
--- a/package/rubix/rubix.mk
+++ b/package/rubix/rubix.mk
@@ -3,6 +3,7 @@
 # rubix
 #
 #############################################################
+
 RUBIX_VERSION = 1.0.5
 RUBIX_SOURCE = rubix-$(RUBIX_VERSION).tar.bz2
 RUBIX_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/Rubix
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 9022845..334cf95 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -3,6 +3,7 @@
 # sane-backends
 #
 #############################################################
+
 SANE_BACKENDS_VERSION = 1.0.22
 SANE_BACKENDS_SOURCE = sane-backends-$(SANE_BACKENDS_VERSION).tar.gz
 SANE_BACKENDS_SITE = https://alioth.debian.org/frs/download.php/3503
diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index b8c1121..4bf3052 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -3,6 +3,7 @@
 # SAWMAN
 #
 #############################################################
+
 SAWMAN_VERSION = 1.6.3
 SAWMAN_SOURCE = SaWMan-$(SAWMAN_VERSION).tar.gz
 SAWMAN_SITE = http://www.directfb.org/downloads/Extras
diff --git a/package/schifra/schifra.mk b/package/schifra/schifra.mk
index 0285b62..7309b47 100644
--- a/package/schifra/schifra.mk
+++ b/package/schifra/schifra.mk
@@ -3,6 +3,7 @@
 # schifra
 #
 #############################################################
+
 SCHIFRA_VERSION = 0.0.1
 SCHIFRA_SITE = http://www.schifra.com/downloads
 SCHIFRA_SOURCE = schifra.tgz
diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
index bd511c6..85a5ccb 100644
--- a/package/sdl_net/sdl_net.mk
+++ b/package/sdl_net/sdl_net.mk
@@ -3,6 +3,7 @@
 # SDL_net: network addon for SDL
 #
 #############################################################
+
 SDL_NET_VERSION = 1.2.8
 SDL_NET_SITE = http://www.libsdl.org/projects/SDL_net/release
 SDL_NET_SOURCE = SDL_net-$(SDL_NET_VERSION).tar.gz
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 2f163a2..e20a888 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -3,6 +3,7 @@
 # sdl_sound addon for SDL
 #
 #############################################################
+
 SDL_SOUND_VERSION = 1.0.3
 SDL_SOUND_SOURCE = SDL_sound-$(SDL_SOUND_VERSION).tar.gz
 SDL_SOUND_SITE = http://icculus.org/SDL_sound/downloads/
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index fed52b2..ed52245 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -3,6 +3,7 @@
 # Setserial
 #
 #############################################################
+
 SETSERIAL_VERSION            = 2.17
 SETSERIAL_PATCH              = setserial_2.17-45.2.diff.gz
 SETSERIAL_SOURCE             = setserial_$(SETSERIAL_VERSION).orig.tar.gz
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index 49a8323..1f32e51 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -3,6 +3,7 @@
 # shared-mime-info
 #
 #############################################################
+
 SHARED_MIME_INFO_VERSION = 0.90
 SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.bz2
 SHARED_MIME_INFO_SITE = http://freedesktop.org/~hadess
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index a2382ce..bd4815a 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -3,6 +3,7 @@
 # slang
 #
 #############################################################
+
 SLANG_VERSION = 1.4.5
 SLANG_SOURCE = slang-$(SLANG_VERSION)-mini.tar.bz2
 SLANG_SITE = http://www.uclibc.org/
diff --git a/package/snowball-hdmiservice/snowball-hdmiservice.mk b/package/snowball-hdmiservice/snowball-hdmiservice.mk
index ebd65df..ceeecd6 100644
--- a/package/snowball-hdmiservice/snowball-hdmiservice.mk
+++ b/package/snowball-hdmiservice/snowball-hdmiservice.mk
@@ -3,6 +3,7 @@
 # snowball-hdmiservice
 #
 #############################################################
+
 SNOWBALL_HDMISERVICE_VERSION = f75c99d1c52707240a78b4ba78e41d20d3aa3b08
 SNOWBALL_HDMISERVICE_SITE = git://igloocommunity.org/git/bsp/hdmiservice.git
 SNOWBALL_HDMISERVICE_LICENSE = MIT
diff --git a/package/snowball-init/snowball-init.mk b/package/snowball-init/snowball-init.mk
index 278cacb..d664b06 100644
--- a/package/snowball-init/snowball-init.mk
+++ b/package/snowball-init/snowball-init.mk
@@ -3,6 +3,7 @@
 # snowball-init
 #
 #############################################################
+
 SNOWBALL_INIT_VERSION = b064be21de25729039e5e54037bbdd2e25cfd5b7
 SNOWBALL_INIT_SITE = git://igloocommunity.org/git/bsp/snowball-init.git
 SNOWBALL_INIT_LICENSE = BSD-4c
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index efade31..1771388 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -3,6 +3,7 @@
 # socketcand
 #
 #############################################################
+
 SOCKETCAND_VERSION = 7d06986
 SOCKETCAND_SITE = http://github.com/dschanoeh/socketcand/tarball/master
 SOCKETCAND_AUTORECONF = YES
diff --git a/package/sound-theme-borealis/sound-theme-borealis.mk b/package/sound-theme-borealis/sound-theme-borealis.mk
index afca72a..8983bdf 100644
--- a/package/sound-theme-borealis/sound-theme-borealis.mk
+++ b/package/sound-theme-borealis/sound-theme-borealis.mk
@@ -3,6 +3,7 @@
 # sound-theme-borealis
 #
 #############################################################
+
 SOUND_THEME_BOREALIS_VERSION = 0.9a
 SOUND_THEME_BOREALIS_SITE = http://ico.bukvic.net/Linux/Borealis_soundtheme
 SOUND_THEME_BOREALIS_SOURCE = \
diff --git a/package/sound-theme-freedesktop/sound-theme-freedesktop.mk b/package/sound-theme-freedesktop/sound-theme-freedesktop.mk
index b7cf4c2..ae30fe7 100644
--- a/package/sound-theme-freedesktop/sound-theme-freedesktop.mk
+++ b/package/sound-theme-freedesktop/sound-theme-freedesktop.mk
@@ -3,6 +3,7 @@
 # sound-theme-freedesktop
 #
 #############################################################
+
 SOUND_THEME_FREEDESKTOP_VERSION = 0.7
 SOUND_THEME_FREEDESKTOP_SITE = \
 	http://people.freedesktop.org/~mccann/dist
diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index 2fe179c..28f2797 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -3,6 +3,7 @@
 # speex
 #
 #############################################################
+
 SPEEX_VERSION = 1.2rc1
 SPEEX_SITE = http://downloads.us.xiph.org/releases/speex
 SPEEX_LICENSE = BSD-3c
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index ab78f45..f33528f 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -4,6 +4,7 @@
 # http://sqlcipher.net
 #
 #############################################################
+
 SQLCIPHER_VERSION = 1.1.9
 SQLCIPHER_SITE = http://github.com/sjlombardo/sqlcipher/tarball/v$(SQLCIPHER_VERSION)
 SQLCIPHER_DEPENDENCIES = openssl host-tcl
diff --git a/package/startup-notification/startup-notification.mk b/package/startup-notification/startup-notification.mk
index 54bfc2f..50a5dd6 100644
--- a/package/startup-notification/startup-notification.mk
+++ b/package/startup-notification/startup-notification.mk
@@ -3,6 +3,7 @@
 # startup-notification
 #
 #############################################################
+
 STARTUP_NOTIFICATION_VERSION = 0.9
 STARTUP_NOTIFICATION_SOURCE = startup-notification-$(STARTUP_NOTIFICATION_VERSION).tar.gz
 STARTUP_NOTIFICATION_SITE = http://freedesktop.org/software/startup-notification/releases
diff --git a/package/statserial/statserial.mk b/package/statserial/statserial.mk
index 159812d..bacd0f0 100644
--- a/package/statserial/statserial.mk
+++ b/package/statserial/statserial.mk
@@ -3,6 +3,7 @@
 # statserial
 #
 #############################################################
+
 STATSERIAL_VERSION = 1.1
 STATSERIAL_SOURCE = statserial-$(STATSERIAL_VERSION).tar.gz
 STATSERIAL_SITE = http://www.ibiblio.org/pub/Linux/system/serial/
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index a68adf2..b2497f5 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -3,6 +3,7 @@
 # sysklogd
 #
 #############################################################
+
 SYSKLOGD_VERSION = 1.5
 SYSKLOGD_SOURCE  = sysklogd_$(SYSKLOGD_VERSION).orig.tar.gz
 SYSKLOGD_PATCH   = sysklogd_$(SYSKLOGD_VERSION)-6.diff.gz
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e85355f..8152f68 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -3,6 +3,7 @@
 # systemd
 #
 #############################################################
+
 SYSTEMD_VERSION = 44
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 606c33e..ab42251 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -3,6 +3,7 @@
 # sysvinit
 #
 #############################################################
+
 SYSVINIT_VERSION = 2.88
 SYSVINIT_SOURCE  = sysvinit_$(SYSVINIT_VERSION)dsf.orig.tar.gz
 SYSVINIT_PATCH   = sysvinit_$(SYSVINIT_VERSION)dsf-13.1.diff.gz
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 144fefe..eb7c7f2 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -3,6 +3,7 @@
 # TCL8.4
 #
 #############################################################
+
 TCL_VERSION_MAJOR = 8.4
 TCL_VERSION_MINOR = 19
 TCL_VERSION = $(TCL_VERSION_MAJOR).$(TCL_VERSION_MINOR)
diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
index 09d617f..a91af27 100644
--- a/package/tcllib/tcllib.mk
+++ b/package/tcllib/tcllib.mk
@@ -3,6 +3,7 @@
 # tcllib
 #
 #############################################################
+
 TCLLIB_VERSION       = 1.13
 TCLLIB_SOURCE        = tcllib-$(TCLLIB_VERSION).tar.bz2
 TCLLIB_SITE          = http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index dc7c285..9bf68bd 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -3,6 +3,7 @@
 # thttpd
 #
 #############################################################
+
 THTTPD_VERSION = 2.25b
 THTTPD_SOURCE = thttpd_$(THTTPD_VERSION).orig.tar.gz
 THTTPD_PATCH = thttpd_$(THTTPD_VERSION)-11.diff.gz
diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index 3d1845d..ed4670d 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -3,6 +3,7 @@
 # tinyhttpd
 #
 #############################################################
+
 TINYHTTPD_VERSION = 0.1.0
 TINYHTTPD_SITE = http://downloads.sourceforge.net/project/tinyhttpd/tinyhttpd%20source/tinyhttpd%20$(TINYHTTPD_VERSION)
 
diff --git a/package/torsmo/torsmo.mk b/package/torsmo/torsmo.mk
index eedb6f7..c2388d4 100644
--- a/package/torsmo/torsmo.mk
+++ b/package/torsmo/torsmo.mk
@@ -3,6 +3,7 @@
 # torsmo
 #
 #############################################################
+
 TORSMO_VERSION = 0.18
 TORSMO_SOURCE = torsmo-$(TORSMO_VERSION).tar.gz
 TORSMO_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/Torsmo
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 10315dc..6187360 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -3,6 +3,7 @@
 # transmission
 #
 #############################################################
+
 TRANSMISSION_VERSION = 2.33
 TRANSMISSION_SITE = http://download.transmissionbt.com/files/
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.bz2
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 2c07272..6d1abcb 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -3,6 +3,7 @@
 # tslib
 #
 #############################################################
+
 TSLIB_VERSION = 158ee49b32f83cb7b02d5315f41c2e4cff38942d
 TSLIB_SITE = http://github.com/kergoth/tslib/tarball/master
 TSLIB_LICENSE = GPL, LGPL
diff --git a/package/ttcp/ttcp.mk b/package/ttcp/ttcp.mk
index d8d03ec..52e3fdf 100644
--- a/package/ttcp/ttcp.mk
+++ b/package/ttcp/ttcp.mk
@@ -3,6 +3,7 @@
 # ttcp
 #
 #############################################################
+
 #
 TTCP_VERSION =
 TTCP_SITE    = http://ftp.sunet.se/pub/network/monitoring/ttcp
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 410af1e..76e727c 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -3,6 +3,7 @@
 # uboot-tools
 #
 #############################################################
+
 UBOOT_TOOLS_VERSION = 2013.04
 UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
index 3596c9b..821b77e 100644
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -3,6 +3,7 @@
 # usbmount
 #
 #############################################################
+
 USBMOUNT_VERSION = 0.0.22
 USBMOUNT_SOURCE = usbmount_$(USBMOUNT_VERSION).tar.gz
 USBMOUNT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/u/usbmount
diff --git a/package/ux500-firmware/ux500-firmware.mk b/package/ux500-firmware/ux500-firmware.mk
index d354468..543698a 100644
--- a/package/ux500-firmware/ux500-firmware.mk
+++ b/package/ux500-firmware/ux500-firmware.mk
@@ -3,6 +3,7 @@
 # ux500-firmware
 #
 #############################################################
+
 UX500_FIRMWARE_VERSION = 1.1.3-6
 UX500_FIRMWARE_SOURCE = ux500-firmware_$(UX500_FIRMWARE_VERSION)linaro1.tar.gz
 UX500_FIRMWARE_SITE = https://launchpad.net/~igloocommunity-maintainers/+archive/snowball/+files/
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 97f6238..9495ef0 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -3,6 +3,7 @@
 # libxcb
 #
 #############################################################
+
 LIBXCB_VERSION = 1.8.1
 LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.bz2
 LIBXCB_SITE = http://xcb.freedesktop.org/dist/
diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index fef6a9f..634b9ea 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -3,6 +3,7 @@
 # xapp_xman - Manual page display program for the X Window System
 #
 #############################################################
+
 XAPP_XMAN_VERSION = 1.0.3
 XAPP_XMAN_SOURCE = xman-$(XAPP_XMAN_VERSION).tar.bz2
 XAPP_XMAN_SITE = http://xorg.freedesktop.org/releases/individual/app
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 730feb5..115d600 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -3,6 +3,7 @@
 # xcb-proto
 #
 #############################################################
+
 XCB_PROTO_VERSION = 1.7.1
 XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.bz2
 XCB_PROTO_SITE = http://xcb.freedesktop.org/dist/
diff --git a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
index 8960c77..72077a2 100644
--- a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
+++ b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
@@ -3,6 +3,7 @@
 # xcb-util-keysyms
 #
 #############################################################
+
 XCB_UTIL_KEYSYMS_VERSION = 0.3.9
 XCB_UTIL_KEYSYMS_SOURCE = xcb-util-keysyms-$(XCB_UTIL_KEYSYMS_VERSION).tar.bz2
 XCB_UTIL_KEYSYMS_SITE = http://xcb.freedesktop.org/dist/
diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index a16b150..fd55fc9 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -3,6 +3,7 @@
 # xcb-util
 #
 #############################################################
+
 XCB_UTIL_VERSION = 0.3.9
 XCB_UTIL_SOURCE = xcb-util-$(XCB_UTIL_VERSION).tar.bz2
 XCB_UTIL_SITE = http://xcb.freedesktop.org/dist/
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
index a42c234..cd04a40 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -3,6 +3,7 @@
 # openchrome
 #
 #############################################################
+
 XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 0.2.906
 XDRIVER_XF86_VIDEO_OPENCHROME_SOURCE = xf86-video-openchrome-$(XDRIVER_XF86_VIDEO_OPENCHROME_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_OPENCHROME_SITE = http://www.openchrome.org/releases
diff --git a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk b/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
index d48272a..7e441db 100644
--- a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
+++ b/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
@@ -3,6 +3,7 @@
 # xlib_libpthread-stubs
 #
 #############################################################
+
 XLIB_LIBPTHREAD_STUBS_VERSION = 0.3
 XLIB_LIBPTHREAD_STUBS_SOURCE = libpthread-stubs-$(XLIB_LIBPTHREAD_STUBS_VERSION).tar.bz2
 XLIB_LIBPTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist/
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 73da50e..d1ddf48 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -3,6 +3,7 @@
 # X11VNC
 #
 #############################################################
+
 X11VNC_VERSION = 0.9.13
 X11VNC_SOURCE = x11vnc-$(X11VNC_VERSION).tar.gz
 X11VNC_SITE = http://downloads.sourceforge.net/project/libvncserver/x11vnc/$(X11VNC_VERSION)
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index bf90fd5..71a24a6 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -3,6 +3,7 @@
 # xerces
 #
 #############################################################
+
 XERCES_VERSION = 3.1.1
 XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.gz
 XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources/
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 532e8c0..79ad602 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -3,6 +3,7 @@
 # xfsprogs
 #
 #############################################################
+
 XFSPROGS_VERSION = 3.1.8
 XFSPROGS_SITE=ftp://oss.sgi.com/projects/xfs/cmd_tars
 
diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index cb48145..510e7a5 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -3,6 +3,7 @@
 # xinetd
 #
 #############################################################
+
 XINETD_VERSION       = 2.3.15
 XINETD_SOURCE        = xinetd-$(XINETD_VERSION).tar.gz
 XINETD_SITE          = http://www.xinetd.org
diff --git a/package/xstroke/xstroke.mk b/package/xstroke/xstroke.mk
index 83f347d..730312e 100644
--- a/package/xstroke/xstroke.mk
+++ b/package/xstroke/xstroke.mk
@@ -3,6 +3,7 @@
 # xstroke
 #
 #############################################################
+
 XSTROKE_VERSION = 0.6
 XSTROKE_SOURCE = xstroke-$(XSTROKE_VERSION).tar.gz
 XSTROKE_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/XStroke
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index 59085bf..04ad2c9 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -3,6 +3,7 @@
 # xvkbd
 #
 #############################################################
+
 XVKBD_VERSION = 3.2
 XVKBD_SOURCE = xvkbd-$(XVKBD_VERSION).tar.gz
 XVKBD_SITE = http://homepage3.nifty.com/tsato/xvkbd
diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
index fafd1ec..b8ec9a5 100644
--- a/package/yasm/yasm.mk
+++ b/package/yasm/yasm.mk
@@ -3,6 +3,7 @@
 # yasm
 #
 #############################################################
+
 YASM_VERSION = 1.2.0
 YASM_SOURCE = yasm-$(YASM_VERSION).tar.gz
 YASM_SITE = http://www.tortall.net/projects/yasm/releases/
diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
index 851aef6..d35f933 100644
--- a/package/zxing/zxing.mk
+++ b/package/zxing/zxing.mk
@@ -3,6 +3,7 @@
 # zxing
 #
 #############################################################
+
 ZXING_VERSION = 2.0
 ZXING_SITE = http://zxing.googlecode.com/files
 ZXING_SOURCE = ZXing-$(ZXING_VERSION).zip
-- 
1.8.1.2
