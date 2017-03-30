From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Thu, 30 Mar 2017 19:13:34 +0530
Subject: [Buildroot] [PATCH 05/21] boot,
	package: use SPDX short identifier for LGPLv2.1/LGPLv2.1+
In-Reply-To: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1490881430-10434-6-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We want to use SPDX identifier for license string as much as possible.
SPDX short identifier for LGPLv2.1/LGPLv2.1+ is LGPL-2.1/LGPL-2.1+.

This change is done using following command.
find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/LGPLv2.1(\+)?/LGPL-2.1\1/g'

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 boot/gummiboot/gummiboot.mk                                           | 2 +-
 package/acl/acl.mk                                                    | 2 +-
 package/acsccid/acsccid.mk                                            | 2 +-
 package/alsa-lib/alsa-lib.mk                                          | 2 +-
 package/atkmm/atkmm.mk                                                | 2 +-
 package/attr/attr.mk                                                  | 2 +-
 package/audiofile/audiofile.mk                                        | 2 +-
 package/augeas/augeas.mk                                              | 2 +-
 package/avahi/avahi.mk                                                | 2 +-
 package/bc/bc.mk                                                      | 2 +-
 package/beecrypt/beecrypt.mk                                          | 2 +-
 package/bellagio/bellagio.mk                                          | 2 +-
 package/binutils/binutils.mk                                          | 2 +-
 package/bluez5_utils/bluez5_utils.mk                                  | 2 +-
 package/bluez_utils/bluez_utils.mk                                    | 2 +-
 package/bustle/bustle.mk                                              | 2 +-
 package/c-icap/c-icap.mk                                              | 2 +-
 package/cairo/cairo.mk                                                | 2 +-
 package/canfestival/canfestival.mk                                    | 2 +-
 package/ccid/ccid.mk                                                  | 2 +-
 package/check/check.mk                                                | 2 +-
 package/cloog/cloog.mk                                                | 2 +-
 package/collectd/collectd.mk                                          | 2 +-
 package/cppunit/cppunit.mk                                            | 2 +-
 package/cryptsetup/cryptsetup.mk                                      | 2 +-
 package/dbus-cpp/dbus-cpp.mk                                          | 2 +-
 package/dialog/dialog.mk                                              | 2 +-
 package/directfb/directfb.mk                                          | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk                      | 2 +-
 package/dovecot/dovecot.mk                                            | 2 +-
 package/dsp-tools/dsp-tools.mk                                        | 2 +-
 package/dtv-scan-tables/dtv-scan-tables.mk                            | 2 +-
 package/duma/duma.mk                                                  | 2 +-
 package/dvb-apps/dvb-apps.mk                                          | 2 +-
 package/efivar/efivar.mk                                              | 2 +-
 package/efl/efl.mk                                                    | 2 +-
 package/eigen/eigen.mk                                                | 2 +-
 package/enchant/enchant.mk                                            | 2 +-
 package/eudev/eudev.mk                                                | 2 +-
 package/ffmpeg/ffmpeg.mk                                              | 2 +-
 package/flac/flac.mk                                                  | 2 +-
 package/flickcurl/flickcurl.mk                                        | 2 +-
 package/freescale-imx/imx-lib/imx-lib.mk                              | 2 +-
 package/fwts/fwts.mk                                                  | 2 +-
 package/gcr/gcr.mk                                                    | 2 +-
 package/geoip/geoip.mk                                                | 2 +-
 package/getent/getent.mk                                              | 2 +-
 package/gettext/gettext.mk                                            | 2 +-
 package/git/git.mk                                                    | 2 +-
 package/glibc/glibc.mk                                                | 2 +-
 package/glibmm/glibmm.mk                                              | 2 +-
 package/gnutls/gnutls.mk                                              | 2 +-
 package/grantlee/grantlee.mk                                          | 2 +-
 package/graphite2/graphite2.mk                                        | 2 +-
 package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk        | 2 +-
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk                            | 2 +-
 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk                  | 2 +-
 package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk                  | 2 +-
 package/gstreamer/gst-plugins-good/gst-plugins-good.mk                | 2 +-
 package/gstreamer/gstreamer/gstreamer.mk                              | 2 +-
 package/gstreamer1/gst-omx/gst-omx.mk                                 | 2 +-
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk               | 2 +-
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk             | 2 +-
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk             | 2 +-
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk             | 2 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk                           | 2 +-
 package/gstreamer1/gst1-validate/gst1-validate.mk                     | 2 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk                           | 2 +-
 package/gtk2-engines/gtk2-engines.mk                                  | 2 +-
 package/gtkmm3/gtkmm3.mk                                              | 2 +-
 package/gtksourceview/gtksourceview.mk                                | 2 +-
 package/igh-ethercat/igh-ethercat.mk                                  | 2 +-
 package/imx-usb-loader/imx-usb-loader.mk                              | 2 +-
 package/jack2/jack2.mk                                                | 2 +-
 package/json-glib/json-glib.mk                                        | 2 +-
 package/keyutils/keyutils.mk                                          | 2 +-
 package/kmod/kmod.mk                                                  | 2 +-
 package/lcdapi/lcdapi.mk                                              | 2 +-
 package/leafnode2/leafnode2.mk                                        | 2 +-
 package/libaacs/libaacs.mk                                            | 2 +-
 package/libaio/libaio.mk                                              | 2 +-
 package/libassuan/libassuan.mk                                        | 2 +-
 package/libatasmart/libatasmart.mk                                    | 2 +-
 package/libbdplus/libbdplus.mk                                        | 2 +-
 package/libbluray/libbluray.mk                                        | 2 +-
 package/libbroadvoice/libbroadvoice.mk                                | 2 +-
 package/libcap-ng/libcap-ng.mk                                        | 2 +-
 package/libcgi/libcgi.mk                                              | 2 +-
 package/libcgroup/libcgroup.mk                                        | 2 +-
 package/libcli/libcli.mk                                              | 2 +-
 package/libcodec2/libcodec2.mk                                        | 2 +-
 package/libcofi/libcofi.mk                                            | 2 +-
 package/libconfig/libconfig.mk                                        | 2 +-
 package/libcroco/libcroco.mk                                          | 2 +-
 package/libdaemon/libdaemon.mk                                        | 2 +-
 package/libdcadec/libdcadec.mk                                        | 2 +-
 package/libdvbpsi/libdvbpsi.mk                                        | 2 +-
 package/libdvbsi/libdvbsi.mk                                          | 2 +-
 package/libebml/libebml.mk                                            | 2 +-
 package/libee/libee.mk                                                | 2 +-
 package/libesmtp/libesmtp.mk                                          | 2 +-
 package/libestr/libestr.mk                                            | 2 +-
 package/libexif/libexif.mk                                            | 2 +-
 package/libfm-extra/libfm-extra.mk                                    | 2 +-
 package/libfm/libfm.mk                                                | 2 +-
 package/libfribidi/libfribidi.mk                                      | 2 +-
 package/libfuse/libfuse.mk                                            | 2 +-
 package/libgcrypt/libgcrypt.mk                                        | 2 +-
 package/libgee/libgee.mk                                              | 2 +-
 package/libgpg-error/libgpg-error.mk                                  | 2 +-
 package/libgpgme/libgpgme.mk                                          | 2 +-
 package/libgsasl/libgsasl.mk                                          | 2 +-
 package/libgudev/libgudev.mk                                          | 2 +-
 package/libhdhomerun/libhdhomerun.mk                                  | 2 +-
 package/libical/libical.mk                                            | 2 +-
 package/libiio/libiio.mk                                              | 2 +-
 package/libimxvpuapi/libimxvpuapi.mk                                  | 2 +-
 package/libiqrf/libiqrf.mk                                            | 2 +-
 package/libiscsi/libiscsi.mk                                          | 2 +-
 package/liblo/liblo.mk                                                | 2 +-
 package/liblog4c-localtime/liblog4c-localtime.mk                      | 2 +-
 package/libmatroska/libmatroska.mk                                    | 2 +-
 package/libmcrypt/libmcrypt.mk                                        | 2 +-
 package/libmediaart/libmediaart.mk                                    | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk                                | 4 ++--
 package/libmms/libmms.mk                                              | 2 +-
 package/libmnl/libmnl.mk                                              | 2 +-
 package/libmodbus/libmodbus.mk                                        | 2 +-
 package/libndp/libndp.mk                                              | 2 +-
 package/libnetfilter_acct/libnetfilter_acct.mk                        | 2 +-
 package/libnfs/libnfs.mk                                              | 2 +-
 package/libnice/libnice.mk                                            | 2 +-
 package/libnl/libnl.mk                                                | 2 +-
 package/liboping/liboping.mk                                          | 2 +-
 package/libosip2/libosip2.mk                                          | 2 +-
 package/libplayer/libplayer.mk                                        | 2 +-
 package/libplist/libplist.mk                                          | 2 +-
 package/libpthsem/libpthsem.mk                                        | 2 +-
 package/libqrencode/libqrencode.mk                                    | 2 +-
 package/libraw/libraw.mk                                              | 2 +-
 package/libraw1394/libraw1394.mk                                      | 2 +-
 package/libreplaygain/libreplaygain.mk                                | 2 +-
 package/libroxml/libroxml.mk                                          | 2 +-
 package/librsync/librsync.mk                                          | 2 +-
 package/libseccomp/libseccomp.mk                                      | 2 +-
 package/libsecret/libsecret.mk                                        | 2 +-
 package/libsemanage/libsemanage.mk                                    | 2 +-
 package/libsepol/libsepol.mk                                          | 2 +-
 package/libsexy/libsexy.mk                                            | 2 +-
 package/libshairplay/libshairplay.mk                                  | 2 +-
 package/libsigc/libsigc.mk                                            | 2 +-
 package/libsndfile/libsndfile.mk                                      | 2 +-
 package/libsoc/libsoc.mk                                              | 2 +-
 package/libsocketcan/libsocketcan.mk                                  | 2 +-
 package/libsoundtouch/libsoundtouch.mk                                | 2 +-
 package/libsoxr/libsoxr.mk                                            | 2 +-
 package/libssh/libssh.mk                                              | 2 +-
 package/libsvg-cairo/libsvg-cairo.mk                                  | 2 +-
 package/libsysfs/libsysfs.mk                                          | 2 +-
 package/libtasn1/libtasn1.mk                                          | 2 +-
 package/libuci/libuci.mk                                              | 2 +-
 package/libuio/libuio.mk                                              | 2 +-
 package/liburcu/liburcu.mk                                            | 2 +-
 package/libusb-compat/libusb-compat.mk                                | 2 +-
 package/libusb/libusb.mk                                              | 2 +-
 package/libusbgx/libusbgx.mk                                          | 2 +-
 package/libv4l/libv4l.mk                                              | 2 +-
 package/libvips/libvips.mk                                            | 2 +-
 package/libwebsockets/libwebsockets.mk                                | 2 +-
 package/libxmlpp/libxmlpp.mk                                          | 2 +-
 package/lite/lite.mk                                                  | 2 +-
 package/live555/live555.mk                                            | 2 +-
 package/lksctp-tools/lksctp-tools.mk                                  | 2 +-
 package/lm-sensors/lm-sensors.mk                                      | 2 +-
 package/lockdev/lockdev.mk                                            | 2 +-
 package/log4cpp/log4cpp.mk                                            | 2 +-
 package/lttng-babeltrace/lttng-babeltrace.mk                          | 2 +-
 package/lttng-libust/lttng-libust.mk                                  | 2 +-
 package/lttng-modules/lttng-modules.mk                                | 2 +-
 package/lttng-tools/lttng-tools.mk                                    | 2 +-
 package/lvm2/lvm2.mk                                                  | 2 +-
 package/lxc/lxc.mk                                                    | 2 +-
 package/matchbox-lib/matchbox-lib.mk                                  | 2 +-
 package/menu-cache/menu-cache.mk                                      | 2 +-
 package/midori/midori.mk                                              | 2 +-
 package/miraclecast/miraclecast.mk                                    | 2 +-
 package/mpg123/mpg123.mk                                              | 2 +-
 package/musepack/musepack.mk                                          | 2 +-
 package/nss-mdns/nss-mdns.mk                                          | 2 +-
 package/nss-pam-ldapd/nss-pam-ldapd.mk                                | 2 +-
 package/numactl/numactl.mk                                            | 2 +-
 .../nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk | 2 +-
 package/ola/ola.mk                                                    | 2 +-
 package/olsr/olsr.mk                                                  | 2 +-
 package/omniorb/omniorb.mk                                            | 2 +-
 package/openobex/openobex.mk                                          | 2 +-
 package/openpgm/openpgm.mk                                            | 2 +-
 package/openvmtools/openvmtools.mk                                    | 2 +-
 package/ortp/ortp.mk                                                  | 2 +-
 package/p7zip/p7zip.mk                                                | 2 +-
 package/pangomm/pangomm.mk                                            | 2 +-
 package/pseudo/pseudo.mk                                              | 2 +-
 package/pulseaudio/pulseaudio.mk                                      | 2 +-
 package/python-chardet/python-chardet.mk                              | 2 +-
 package/python-dialog/python-dialog.mk                                | 2 +-
 package/python-dialog3/python-dialog3.mk                              | 2 +-
 package/python-gobject/python-gobject.mk                              | 2 +-
 package/python-pam/python-pam.mk                                      | 2 +-
 package/python-paramiko/python-paramiko.mk                            | 2 +-
 package/python-pygame/python-pygame.mk                                | 2 +-
 package/python-pyudev/python-pyudev.mk                                | 2 +-
 package/python-urwid/python-urwid.mk                                  | 2 +-
 package/qemu/qemu.mk                                                  | 2 +-
 package/qjson/qjson.mk                                                | 2 +-
 package/qt/qt.mk                                                      | 2 +-
 package/qt5/qt5base/qt5base.mk                                        | 2 +-
 package/qt5/qt5connectivity/qt5connectivity.mk                        | 2 +-
 package/qt5/qt5declarative/qt5declarative.mk                          | 2 +-
 package/qt5/qt5enginio/qt5enginio.mk                                  | 2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk                | 2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk                        | 2 +-
 package/qt5/qt5location/qt5location.mk                                | 2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk                            | 2 +-
 package/qt5/qt5script/qt5script.mk                                    | 2 +-
 package/qt5/qt5sensors/qt5sensors.mk                                  | 2 +-
 package/qt5/qt5serialport/qt5serialport.mk                            | 2 +-
 package/qt5/qt5svg/qt5svg.mk                                          | 2 +-
 package/qt5/qt5tools/qt5tools.mk                                      | 2 +-
 package/qt5/qt5webchannel/qt5webchannel.mk                            | 2 +-
 package/qt5/qt5webkit/qt5webkit.mk                                    | 4 ++--
 package/qt5/qt5websockets/qt5websockets.mk                            | 2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk                              | 2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk                          | 2 +-
 package/quazip/quazip.mk                                              | 2 +-
 package/qwt/qwt.mk                                                    | 2 +-
 package/raptor/raptor.mk                                              | 2 +-
 package/rtmpdump/rtmpdump.mk                                          | 2 +-
 package/sbc/sbc.mk                                                    | 2 +-
 package/sdl/sdl.mk                                                    | 2 +-
 package/sdl_sound/sdl_sound.mk                                        | 2 +-
 package/setools/setools.mk                                            | 2 +-
 package/smack/smack.mk                                                | 2 +-
 package/sofia-sip/sofia-sip.mk                                        | 2 +-
 package/sox/sox.mk                                                    | 2 +-
 package/spice/spice.mk                                                | 2 +-
 package/sylpheed/sylpheed.mk                                          | 2 +-
 package/syslog-ng/syslog-ng.mk                                        | 2 +-
 package/systemd-bootchart/systemd-bootchart.mk                        | 2 +-
 package/systemd/systemd.mk                                            | 2 +-
 package/taglib/taglib.mk                                              | 2 +-
 package/tn5250/tn5250.mk                                              | 2 +-
 package/trace-cmd/trace-cmd.mk                                        | 2 +-
 package/twolame/twolame.mk                                            | 2 +-
 package/ubus/ubus.mk                                                  | 2 +-
 package/uclibc-ng-test/uclibc-ng-test.mk                              | 2 +-
 package/uclibc/uclibc.mk                                              | 2 +-
 package/unixodbc/unixodbc.mk                                          | 2 +-
 package/usbredir/usbredir.mk                                          | 2 +-
 package/util-linux/util-linux.mk                                      | 2 +-
 package/vala/vala.mk                                                  | 2 +-
 package/vde2/vde2.mk                                                  | 2 +-
 package/vlc/vlc.mk                                                    | 2 +-
 package/webkitgtk/webkitgtk.mk                                        | 2 +-
 package/wine/wine.mk                                                  | 2 +-
 package/xenomai/xenomai.mk                                            | 2 +-
 package/xz/xz.mk                                                      | 2 +-
 package/zbar/zbar.mk                                                  | 2 +-
 package/zlog/zlog.mk                                                  | 2 +-
 268 files changed, 270 insertions(+), 270 deletions(-)

diff --git a/boot/gummiboot/gummiboot.mk b/boot/gummiboot/gummiboot.mk
index 02ad28b..85a5daa 100644
--- a/boot/gummiboot/gummiboot.mk
+++ b/boot/gummiboot/gummiboot.mk
@@ -7,7 +7,7 @@
 GUMMIBOOT_SITE = http://cgit.freedesktop.org/gummiboot
 GUMMIBOOT_SITE_METHOD = git
 GUMMIBOOT_VERSION = 43
-GUMMIBOOT_LICENSE = LGPLv2.1+
+GUMMIBOOT_LICENSE = LGPL-2.1+
 GUMMIBOOT_LICENSE_FILES = LICENSE
 
 # The git archive does not have the autoconf/automake stuff generated.
diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 93e20c3..edcf4fd 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -10,7 +10,7 @@ ACL_SITE = http://download.savannah.gnu.org/releases/acl
 ACL_INSTALL_STAGING = YES
 ACL_DEPENDENCIES = attr
 ACL_CONF_OPTS = --enable-gettext=no
-ACL_LICENSE = GPL-2.0+ (programs), LGPLv2.1+ (libraries)
+ACL_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ACL_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 
 # While the configuration system uses autoconf, the Makefiles are
diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
index c2e7d21..2fd2033 100644
--- a/package/acsccid/acsccid.mk
+++ b/package/acsccid/acsccid.mk
@@ -7,7 +7,7 @@
 ACSCCID_VERSION = 1.1.1
 ACSCCID_SOURCE = acsccid-$(ACSCCID_VERSION).tar.bz2
 ACSCCID_SITE = http://downloads.sourceforge.net/acsccid
-ACSCCID_LICENSE = LGPLv2.1+
+ACSCCID_LICENSE = LGPL-2.1+
 ACSCCID_LICENSE_FILES = COPYING
 ACSCCID_INSTALL_STAGING = YES
 ACSCCID_DEPENDENCIES = pcsc-lite host-flex host-pkgconf libusb
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 8f421a0..8651653 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -7,7 +7,7 @@
 ALSA_LIB_VERSION = 1.1.3
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
-ALSA_LIB_LICENSE = LGPLv2.1+ (library), GPL-2.0+ (aserver)
+ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
 ALSA_LIB_LICENSE_FILES = COPYING aserver/COPYING
 ALSA_LIB_INSTALL_STAGING = YES
 ALSA_LIB_CFLAGS = $(TARGET_CFLAGS)
diff --git a/package/atkmm/atkmm.mk b/package/atkmm/atkmm.mk
index 0f98ee0..234a937 100644
--- a/package/atkmm/atkmm.mk
+++ b/package/atkmm/atkmm.mk
@@ -8,7 +8,7 @@ ATKMM_VERSION_MAJOR = 2.24
 ATKMM_VERSION = $(ATKMM_VERSION_MAJOR).2
 ATKMM_SOURCE = atkmm-$(ATKMM_VERSION).tar.xz
 ATKMM_SITE = http://ftp.gnome.org/pub/gnome/sources/atkmm/$(ATKMM_VERSION_MAJOR)
-ATKMM_LICENSE = LGPLv2.1+ (library), GPL-2.0+ (tools)
+ATKMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 ATKMM_LICENSE_FILES = COPYING COPYING.tools
 ATKMM_INSTALL_STAGING = YES
 ATKMM_DEPENDENCIES = atk glibmm libsigc host-pkgconf
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 24222b5..0c85701 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -10,7 +10,7 @@ ATTR_SITE = http://download.savannah.gnu.org/releases/attr
 ATTR_INSTALL_STAGING = YES
 ATTR_CONF_OPTS = --enable-gettext=no
 HOST_ATTR_CONF_OPTS = --enable-gettext=no
-ATTR_LICENSE = GPL-2.0+ (programs), LGPLv2.1+ (libraries)
+ATTR_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 
 # While the configuration system uses autoconf, the Makefiles are
diff --git a/package/audiofile/audiofile.mk b/package/audiofile/audiofile.mk
index 74550a3..2f2e890 100644
--- a/package/audiofile/audiofile.mk
+++ b/package/audiofile/audiofile.mk
@@ -12,7 +12,7 @@ AUDIOFILE_CONF_OPTS = --disable-examples
 AUDIOFILE_DEPENDENCIES = host-pkgconf
 # configure is outdated and has old bugs because of it
 AUDIOFILE_AUTORECONF = YES
-AUDIOFILE_LICENSE = GPL-2.0+, LGPLv2.1+
+AUDIOFILE_LICENSE = GPL-2.0+, LGPL-2.1+
 AUDIOFILE_LICENSE_FILES = COPYING COPYING.GPL
 
 ifeq ($(BR2_PACKAGE_FLAC),y)
diff --git a/package/augeas/augeas.mk b/package/augeas/augeas.mk
index e52ef04..4c855a3 100644
--- a/package/augeas/augeas.mk
+++ b/package/augeas/augeas.mk
@@ -7,7 +7,7 @@
 AUGEAS_VERSION = 1.7.0
 AUGEAS_SITE = http://download.augeas.net
 AUGEAS_INSTALL_STAGING = YES
-AUGEAS_LICENSE = LGPLv2.1+
+AUGEAS_LICENSE = LGPL-2.1+
 AUGEAS_LICENSE_FILES = COPYING
 AUGEAS_DEPENDENCIES = host-pkgconf readline libxml2
 
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 069b45a..a356a08 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -13,7 +13,7 @@
 
 AVAHI_VERSION = 0.6.32
 AVAHI_SITE = https://github.com/lathiat/avahi/releases/download/v$(AVAHI_VERSION)
-AVAHI_LICENSE = LGPLv2.1+
+AVAHI_LICENSE = LGPL-2.1+
 AVAHI_LICENSE_FILES = LICENSE
 AVAHI_INSTALL_STAGING = YES
 
diff --git a/package/bc/bc.mk b/package/bc/bc.mk
index 3193ffa..a6446ce 100644
--- a/package/bc/bc.mk
+++ b/package/bc/bc.mk
@@ -8,7 +8,7 @@ BC_VERSION = 1.06.95
 BC_SOURCE = bc-$(BC_VERSION).tar.bz2
 BC_SITE = http://alpha.gnu.org/gnu/bc
 BC_DEPENDENCIES = host-flex
-BC_LICENSE = GPL-2.0+, LGPLv2.1+
+BC_LICENSE = GPL-2.0+, LGPL-2.1+
 BC_LICENSE_FILES = COPYING COPYING.LIB
 
 # Build after busybox so target ends up with bc's "dc" version
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index bd29b3b..10dd97c 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -8,7 +8,7 @@ BEECRYPT_VERSION = 4.2.1
 BEECRYPT_SITE = http://downloads.sourceforge.net/project/beecrypt/beecrypt/$(BEECRYPT_VERSION)
 BEECRYPT_AUTORECONF = YES
 BEECRYPT_INSTALL_STAGING = YES
-BEECRYPT_LICENSE = LGPLv2.1+
+BEECRYPT_LICENSE = LGPL-2.1+
 BEECRYPT_LICENSE_FILES = COPYING.LIB
 
 BEECRYPT_CONF_OPTS = \
diff --git a/package/bellagio/bellagio.mk b/package/bellagio/bellagio.mk
index 6db753d..4e5c691 100644
--- a/package/bellagio/bellagio.mk
+++ b/package/bellagio/bellagio.mk
@@ -9,7 +9,7 @@ BELLAGIO_SOURCE = libomxil-bellagio-$(BELLAGIO_VERSION).tar.gz
 BELLAGIO_SITE = http://downloads.sourceforge.net/project/omxil/omxil/Bellagio%20$(BELLAGIO_VERSION)
 BELLAGIO_AUTORECONF = YES
 BELLAGIO_INSTALL_STAGING = YES
-BELLAGIO_LICENSE = LGPLv2.1+
+BELLAGIO_LICENSE = LGPL-2.1+
 BELLAGIO_LICENSE_FILES = COPYING
 BELLAGIO_PROVIDES = libopenmax
 
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 467db6e..c4e696f 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -25,7 +25,7 @@ BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.bz2
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 BINUTILS_INSTALL_STAGING = YES
 BINUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-BINUTILS_LICENSE = GPL-3.0+, libiberty LGPLv2.1+
+BINUTILS_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
 BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
 
 ifeq ($(BINUTILS_FROM_GIT),y)
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index a72899a..d19afc3 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -9,7 +9,7 @@ BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
 BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2
-BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPLv2.1+
+BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 
 BLUEZ5_UTILS_CONF_OPTS =	\
diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index 2fa8f7f..8425921 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -11,7 +11,7 @@ BLUEZ_UTILS_INSTALL_STAGING = YES
 BLUEZ_UTILS_DEPENDENCIES = dbus libglib2
 BLUEZ_UTILS_CONF_OPTS = --enable-test --enable-tools
 BLUEZ_UTILS_AUTORECONF = YES
-BLUEZ_UTILS_LICENSE = GPL-2.0+, LGPLv2.1+
+BLUEZ_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 
 # BlueZ 3.x compatibility
diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index 0b85536..4cd4460 100644
--- a/package/bustle/bustle.mk
+++ b/package/bustle/bustle.mk
@@ -6,7 +6,7 @@
 
 BUSTLE_VERSION = 0.4.3
 BUSTLE_SITE = http://www.willthompson.co.uk/bustle/releases/$(BUSTLE_VERSION)
-BUSTLE_LICENSE = LGPLv2.1+
+BUSTLE_LICENSE = LGPL-2.1+
 BUSTLE_LICENSE_FILES = LICENSE
 BUSTLE_DEPENDENCIES = libglib2 libpcap host-pkgconf
 
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 3078721..17f3459 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -7,7 +7,7 @@
 C_ICAP_VERSION = 0.4.2
 C_ICAP_SOURCE = c_icap-$(C_ICAP_VERSION).tar.gz
 C_ICAP_SITE = http://downloads.sourceforge.net/c-icap
-C_ICAP_LICENSE = LGPLv2.1+
+C_ICAP_LICENSE = LGPL-2.1+
 C_ICAP_LICENSE_FILES = COPYING
 C_ICAP_INSTALL_STAGING = YES
 C_ICAP_CONFIG_SCRIPTS = c-icap-config c-icap-libicapapi-config
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index ac91a56..8660b5a 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -6,7 +6,7 @@
 
 CAIRO_VERSION = 1.14.8
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
-CAIRO_LICENSE = LGPLv2.1 or MPLv1.1 (library)
+CAIRO_LICENSE = LGPL-2.1 or MPLv1.1 (library)
 CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
 CAIRO_SITE = http://cairographics.org/releases
 CAIRO_INSTALL_STAGING = YES
diff --git a/package/canfestival/canfestival.mk b/package/canfestival/canfestival.mk
index 61578d3..4a44470 100644
--- a/package/canfestival/canfestival.mk
+++ b/package/canfestival/canfestival.mk
@@ -7,7 +7,7 @@
 CANFESTIVAL_VERSION = 7740ac6fdedc23e1ed6908d3d7db54833c88572b
 CANFESTIVAL_SITE = http://dev.automforge.net/CanFestival-3
 CANFESTIVAL_SITE_METHOD = hg
-CANFESTIVAL_LICENSE = LGPLv2.1+
+CANFESTIVAL_LICENSE = LGPL-2.1+
 CANFESTIVAL_LICENSE_FILES = COPYING LICENCE
 CANFESTIVAL_INSTALL_STAGING = YES
 CANFESTIVAL_INSTALLED-y = src drivers
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index 18653d3..cfe6d39 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -7,7 +7,7 @@
 CCID_VERSION = 1.4.18
 CCID_SOURCE = ccid_$(CCID_VERSION).orig.tar.bz2
 CCID_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/ccid
-CCID_LICENSE = LGPLv2.1+
+CCID_LICENSE = LGPL-2.1+
 CCID_LICENSE_FILES = COPYING
 CCID_INSTALL_STAGING = YES
 CCID_DEPENDENCIES = pcsc-lite host-pkgconf libusb
diff --git a/package/check/check.mk b/package/check/check.mk
index ccaefa7..047beba 100644
--- a/package/check/check.mk
+++ b/package/check/check.mk
@@ -8,7 +8,7 @@ CHECK_VERSION = 0.11.0
 CHECK_SITE = https://github.com/libcheck/check/releases/download/$(CHECK_VERSION)
 CHECK_INSTALL_STAGING = YES
 CHECK_DEPENDENCIES = host-pkgconf
-CHECK_LICENSE = LGPLv2.1+
+CHECK_LICENSE = LGPL-2.1+
 CHECK_LICENSE_FILES = COPYING.LESSER
 
 # Having checkmk in the target makes no sense
diff --git a/package/cloog/cloog.mk b/package/cloog/cloog.mk
index ef666d0..a2a1f6b 100644
--- a/package/cloog/cloog.mk
+++ b/package/cloog/cloog.mk
@@ -6,7 +6,7 @@
 
 CLOOG_VERSION = 0.18.4
 CLOOG_SITE = http://www.bastoul.net/cloog/pages/download
-CLOOG_LICENSE = LGPLv2.1+
+CLOOG_LICENSE = LGPL-2.1+
 HOST_CLOOG_DEPENDENCIES = host-gmp host-isl
 # Our libtool patch doesn't apply, and since this package is only
 # built for the host, we don't really care about it.
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index a3f3063..626fba8 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -9,7 +9,7 @@ COLLECTD_SITE = http://collectd.org/files
 COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.bz2
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
 COLLECTD_INSTALL_STAGING = YES
-COLLECTD_LICENSE = GPL-2.0, LGPLv2.1
+COLLECTD_LICENSE = GPL-2.0, LGPL-2.1
 COLLECTD_LICENSE_FILES = COPYING
 
 # These require unmet dependencies, are fringe, pointless or deprecated
diff --git a/package/cppunit/cppunit.mk b/package/cppunit/cppunit.mk
index b8251c2..db01b70 100644
--- a/package/cppunit/cppunit.mk
+++ b/package/cppunit/cppunit.mk
@@ -7,7 +7,7 @@
 CPPUNIT_VERSION = 1.13.2
 CPPUNIT_SITE = http://dev-www.libreoffice.org/src
 CPPUNIT_INSTALL_STAGING = YES
-CPPUNIT_LICENSE = LGPLv2.1
+CPPUNIT_LICENSE = LGPL-2.1
 CPPUNIT_LICENSE_FILES = COPYING
 CPPUNIT_CONF_OPTS = --disable-doxygen
 
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 6791f6f..a3358a9 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -10,7 +10,7 @@ CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPLv2.1+ (library)
+CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
 CRYPTSETUP_INSTALL_STAGING = YES
 
diff --git a/package/dbus-cpp/dbus-cpp.mk b/package/dbus-cpp/dbus-cpp.mk
index 0b51967..d8468ab 100644
--- a/package/dbus-cpp/dbus-cpp.mk
+++ b/package/dbus-cpp/dbus-cpp.mk
@@ -23,7 +23,7 @@ HOST_DBUS_CPP_CONF_OPTS = \
 	--disable-ecore \
 	--disable-glib
 DBUS_CPP_AUTORECONF = YES
-DBUS_CPP_LICENSE = LGPLv2.1+
+DBUS_CPP_LICENSE = LGPL-2.1+
 DBUS_CPP_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_EFL),y)
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index f207f75..f1c0e4c 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -10,7 +10,7 @@ DIALOG_SITE = ftp://invisible-island.net/dialog
 DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
 	--disable-rpath-hack
 DIALOG_DEPENDENCIES = host-pkgconf ncurses
-DIALOG_LICENSE = LGPLv2.1
+DIALOG_LICENSE = LGPL-2.1
 DIALOG_LICENSE_FILES = COPYING
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 595d590..a27d6a7 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -8,7 +8,7 @@ DIRECTFB_VERSION_MAJOR = 1.7
 DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).7
 DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
-DIRECTFB_LICENSE = LGPLv2.1+
+DIRECTFB_LICENSE = LGPL-2.1+
 DIRECTFB_LICENSE_FILES = COPYING
 DIRECTFB_INSTALL_STAGING = YES
 DIRECTFB_AUTORECONF = YES
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 1b5185f..50e148b 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -7,7 +7,7 @@
 DOVECOT_PIGEONHOLE_VERSION = 0.4.17
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
-DOVECOT_PIGEONHOLE_LICENSE = LGPLv2.1
+DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
 DOVECOT_PIGEONHOLE_LICENSE_FILES = COPYING
 DOVECOT_PIGEONHOLE_DEPENDENCIES = dovecot
 
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index caa6bba..a7f6de4 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -8,7 +8,7 @@ DOVECOT_VERSION_MAJOR = 2.2
 DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).28
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
-DOVECOT_LICENSE = LGPLv2.1
+DOVECOT_LICENSE = LGPL-2.1
 DOVECOT_LICENSE_FILES = COPYING COPYING.LGPL COPYING.MIT
 DOVECOT_DEPENDENCIES = \
 	host-pkgconf \
diff --git a/package/dsp-tools/dsp-tools.mk b/package/dsp-tools/dsp-tools.mk
index c91ed20..ec63bcd 100644
--- a/package/dsp-tools/dsp-tools.mk
+++ b/package/dsp-tools/dsp-tools.mk
@@ -7,7 +7,7 @@
 DSP_TOOLS_VERSION = v2.0
 DSP_TOOLS_SITE = $(call github,felipec,dsp-tools,$(DSP_TOOLS_VERSION))
 DSP_TOOLS_DEPENDENCIES = tidsp-binaries
-DSP_TOOLS_LICENSE = LGPLv2.1
+DSP_TOOLS_LICENSE = LGPL-2.1
 DSP_TOOLS_LICENSE_FILES = LICENSE
 
 define DSP_TOOLS_BUILD_CMDS
diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index 57fa1cd..8c1ae6d 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -14,7 +14,7 @@ DTV_SCAN_TABLES_SITE_METHOD = git
 # However, the package prominently contains the COPYING and COPYING.LIB
 # license files (respectively for the GPLv2 and the LGPLv2.1), so we use
 # that as the licensing information.
-DTV_SCAN_TABLES_LICENSE = GPL-2.0, LGPLv2.1
+DTV_SCAN_TABLES_LICENSE = GPL-2.0, LGPL-2.1
 DTV_SCAN_TABLES_LICENSE_FILES = COPYING COPYING.LGPL
 
 # In order to avoid issues with file name encodings, we rename the
diff --git a/package/duma/duma.mk b/package/duma/duma.mk
index 88d8b75..6299691 100644
--- a/package/duma/duma.mk
+++ b/package/duma/duma.mk
@@ -7,7 +7,7 @@
 DUMA_VERSION = 2.5.15
 DUMA_SOURCE = duma_$(subst .,_,$(DUMA_VERSION)).tar.gz
 DUMA_SITE = http://downloads.sourceforge.net/project/duma/duma/$(DUMA_VERSION)
-DUMA_LICENSE = GPL-2.0+, LGPLv2.1+
+DUMA_LICENSE = GPL-2.0+, LGPL-2.1+
 DUMA_LICENSE_FILES = COPYING-GPL COPYING-LGPL
 
 DUMA_INSTALL_STAGING = YES
diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index ad38bb6..8ba1501 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -7,7 +7,7 @@
 DVB_APPS_VERSION = 3d43b280298c39a67d1d889e01e173f52c12da35
 DVB_APPS_SITE = http://linuxtv.org/hg/dvb-apps
 DVB_APPS_SITE_METHOD = hg
-DVB_APPS_LICENSE = GPL-2.0, GPL-2.0+, LGPLv2.1+
+DVB_APPS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+
 DVB_APPS_LICENSE_FILES = COPYING COPYING.LGPL
 
 ifeq ($(BR2_ENABLE_LOCALE),)
diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
index c31d87b..d06192e 100644
--- a/package/efivar/efivar.mk
+++ b/package/efivar/efivar.mk
@@ -6,7 +6,7 @@
 
 EFIVAR_VERSION = 30
 EFIVAR_SITE = $(call github,rhinstaller,efivar,$(EFIVAR_VERSION))
-EFIVAR_LICENSE = LGPLv2.1
+EFIVAR_LICENSE = LGPL-2.1
 EFIVAR_LICENSE_FILES = COPYING
 EFIVAR_DEPENDENCIES = popt
 EFIVAR_INSTALL_STAGING = YES
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index ee6211d..a3443ad 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -7,7 +7,7 @@
 EFL_VERSION = 1.18.4
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
-EFL_LICENSE = BSD-2c, LGPLv2.1+, GPL-2.0+
+EFL_LICENSE = BSD-2c, LGPL-2.1+, GPL-2.0+
 EFL_LICENSE_FILES = \
 	COMPLIANCE \
 	COPYING \
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 730bb5f..03eabf6 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -7,7 +7,7 @@
 EIGEN_VERSION = 3.2.5
 EIGEN_SITE = https://bitbucket.org/eigen/eigen
 EIGEN_SITE_METHOD = hg
-EIGEN_LICENSE = MPL2, BSD-3c, LGPLv2.1
+EIGEN_LICENSE = MPL2, BSD-3c, LGPL-2.1
 EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.LGPL COPYING.README
 EIGEN_INSTALL_STAGING = YES
 EIGEN_INSTALL_TARGET = NO
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index 4a23293..69402c1 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -8,7 +8,7 @@ ENCHANT_VERSION = 1.6.0
 ENCHANT_SITE = http://www.abisource.com/downloads/enchant/$(ENCHANT_VERSION)
 ENCHANT_INSTALL_STAGING = YES
 ENCHANT_DEPENDENCIES = libglib2 host-pkgconf
-ENCHANT_LICENSE = LGPLv2.1+
+ENCHANT_LICENSE = LGPL-2.1+
 ENCHANT_LICENSE_FILES = COPYING.LIB
 
 $(eval $(autotools-package))
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 82c11d3..6a77881 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -6,7 +6,7 @@
 
 EUDEV_VERSION = 3.2.1
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
-EUDEV_LICENSE = GPL-2.0+ (programs), LGPLv2.1+ (libraries)
+EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
 EUDEV_INSTALL_STAGING = YES
 
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index c181dfa..f1a1e0d 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -9,7 +9,7 @@ FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
 
-FFMPEG_LICENSE = LGPLv2.1+, libjpeg license
+FFMPEG_LICENSE = LGPL-2.1+, libjpeg license
 FFMPEG_LICENSE_FILES = LICENSE.md COPYING.LGPLv2.1
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
 FFMPEG_LICENSE += and GPL-2.0+
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 639636e..3448213 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -9,7 +9,7 @@ FLAC_SITE = http://downloads.xiph.org/releases/flac
 FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
 FLAC_INSTALL_STAGING = YES
 FLAC_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-FLAC_LICENSE = Xiph BSD-like (libFLAC), GPL-2.0+ (tools), LGPLv2.1+ (other libraries)
+FLAC_LICENSE = Xiph BSD-like (libFLAC), GPL-2.0+ (tools), LGPL-2.1+ (other libraries)
 FLAC_LICENSE_FILES = COPYING.Xiph COPYING.GPL COPYING.LGPL
 # 0001-configure.ac-relax-linux-OS-detection.patch patches configure.ac
 FLAC_AUTORECONF = YES
diff --git a/package/flickcurl/flickcurl.mk b/package/flickcurl/flickcurl.mk
index 87af8f4..0e194e6 100644
--- a/package/flickcurl/flickcurl.mk
+++ b/package/flickcurl/flickcurl.mk
@@ -6,7 +6,7 @@
 
 FLICKCURL_VERSION = 1.26
 FLICKCURL_SITE = http://download.dajobe.org/flickcurl
-FLICKCURL_LICENSE = LGPLv2.1+ or GPL-2.0+ or Apache 2.0+
+FLICKCURL_LICENSE = LGPL-2.1+ or GPL-2.0+ or Apache 2.0+
 FLICKCURL_LICENSE_FILES = COPYING COPYING.LIB LICENSE-2.0.txt LICENSE.html
 FLICKCURL_INSTALL_STAGING = YES
 FLICKCURL_CONFIG_SCRIPTS = flickcurl-config
diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index d3603ca..3e0f7d8 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -6,7 +6,7 @@
 
 IMX_LIB_VERSION = 5.4
 IMX_LIB_SITE = $(FREESCALE_IMX_SITE)
-IMX_LIB_LICENSE = LGPLv2.1+
+IMX_LIB_LICENSE = LGPL-2.1+
 IMX_LIB_LICENSE_FILES = COPYING-LGPL-2.1
 
 IMX_LIB_INSTALL_STAGING = YES
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index 550536e..8b0c5b0 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -7,7 +7,7 @@
 FWTS_VERSION = V16.11.00
 FWTS_SITE = http://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0
-FWTS_LICENSE = GPL-2.0, LGPLv2.1, Custom
+FWTS_LICENSE = GPL-2.0, LGPL-2.1, Custom
 FWTS_LICENSE_FILES = debian/copyright
 FWTS_AUTORECONF = YES
 FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf json-c libglib2 \
diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index d8cb667..7cb35af 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -15,7 +15,7 @@ GCR_CONF_OPTS = \
 	--disable-gtk-doc \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 # Even though COPYING is v2 the code states v2.1+
-GCR_LICENSE = LGPLv2.1+
+GCR_LICENSE = LGPL-2.1+
 GCR_LICENSE_FILES = COPYING
 
 # Only the X11 backend is supported for the simple GUI
diff --git a/package/geoip/geoip.mk b/package/geoip/geoip.mk
index cf3bc1a..5ba4c1e 100644
--- a/package/geoip/geoip.mk
+++ b/package/geoip/geoip.mk
@@ -8,7 +8,7 @@ GEOIP_VERSION = 1.6.9
 GEOIP_SOURCE = GeoIP-$(GEOIP_VERSION).tar.gz
 GEOIP_SITE = https://github.com/maxmind/geoip-api-c/releases/download/v$(GEOIP_VERSION)
 GEOIP_INSTALL_STAGING = YES
-GEOIP_LICENSE = LGPLv2.1+
+GEOIP_LICENSE = LGPL-2.1+
 GEOIP_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/getent/getent.mk b/package/getent/getent.mk
index ed249e8..4e3eaea 100644
--- a/package/getent/getent.mk
+++ b/package/getent/getent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GETENT_LICENSE = LGPLv2.1+
+GETENT_LICENSE = LGPL-2.1+
 
 # For glibc toolchains, we use the getent program built/installed by
 # the C library. For other toolchains, we use the wrapper script
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 34d8928..b6663a6 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -8,7 +8,7 @@ GETTEXT_VERSION = 0.19.8.1
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_SOURCE = gettext-$(GETTEXT_VERSION).tar.xz
 GETTEXT_INSTALL_STAGING = YES
-GETTEXT_LICENSE = LGPLv2.1+ (libintl), GPL-3.0+ (the rest)
+GETTEXT_LICENSE = LGPL-2.1+ (libintl), GPL-3.0+ (the rest)
 GETTEXT_LICENSE_FILES = COPYING gettext-runtime/intl/COPYING.LIB
 
 GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
diff --git a/package/git/git.mk b/package/git/git.mk
index 9a14fdc..d0e9f3b 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -7,7 +7,7 @@
 GIT_VERSION = 2.12.2
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
-GIT_LICENSE = GPL-2.0, LGPLv2.1+
+GIT_LICENSE = GPL-2.0, LGPL-2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_DEPENDENCIES = zlib host-gettext
 
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 44e7459..e904bf8 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -9,7 +9,7 @@ GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
 GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
 GLIBC_SRC_SUBDIR = .
 
-GLIBC_LICENSE = GPL-2.0+ (programs), LGPLv2.1+, BSD-3c, MIT (library)
+GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3c, MIT (library)
 GLIBC_LICENSE_FILES = $(addprefix $(GLIBC_SRC_SUBDIR)/,COPYING COPYING.LIB LICENSES)
 
 # glibc is part of the toolchain so disable the toolchain dependency
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index d579a0c..030ef1e 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -6,7 +6,7 @@
 
 GLIBMM_VERSION_MAJOR = 2.50
 GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
-GLIBMM_LICENSE = LGPLv2.1+ (library), GPL-2.0+ (tools)
+GLIBMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.xz
 GLIBMM_SITE = http://ftp.gnome.org/pub/gnome/sources/glibmm/$(GLIBMM_VERSION_MAJOR)
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 1d89b08..47da90f 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -8,7 +8,7 @@ GNUTLS_VERSION_MAJOR = 3.5
 GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).10
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
-GNUTLS_LICENSE = LGPLv2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
+GNUTLS_LICENSE = LGPL-2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
 GNUTLS_LICENSE_FILES = doc/COPYING doc/COPYING.LESSER
 GNUTLS_DEPENDENCIES = host-pkgconf libunistring libtasn1 nettle pcre
 GNUTLS_CONF_OPTS = \
diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
index f921d7b..812603b 100644
--- a/package/grantlee/grantlee.mk
+++ b/package/grantlee/grantlee.mk
@@ -6,7 +6,7 @@
 GRANTLEE_VERSION = 5.1.0
 GRANTLEE_SITE = http://downloads.grantlee.org
 GRANTLEE_INSTALL_STAGING = YES
-GRANTLEE_LICENSE = LGPLv2.1+
+GRANTLEE_LICENSE = LGPL-2.1+
 GRANTLEE_LICENSE_FILES = COPYING.LIB
 GRANTLEE_DEPENDENCIES = qt5base qt5script
 
diff --git a/package/graphite2/graphite2.mk b/package/graphite2/graphite2.mk
index 5f6848f..737e072 100644
--- a/package/graphite2/graphite2.mk
+++ b/package/graphite2/graphite2.mk
@@ -8,7 +8,7 @@ GRAPHITE2_VERSION = 1.3.9
 GRAPHITE2_SOURCE = graphite2-$(GRAPHITE2_VERSION).tgz
 GRAPHITE2_SITE = http://downloads.sourceforge.net/project/silgraphite/graphite2
 GRAPHITE2_INSTALL_STAGING = YES
-GRAPHITE2_LICENSE = LGPLv2.1+
+GRAPHITE2_LICENSE = LGPL-2.1+
 GRAPHITE2_LICENSE_FILES = LICENSE
 
 # Avoid building docs and tests to save time
diff --git a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
index 7fa6181..420ceda 100644
--- a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
+++ b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
@@ -10,7 +10,7 @@ GSETTINGS_DESKTOP_SCHEMAS_SOURCE = gsettings-desktop-schemas-$(GSETTINGS_DESKTOP
 GSETTINGS_DESKTOP_SCHEMAS_SITE = http://ftp.gnome.org/pub/gnome/sources/gsettings-desktop-schemas/$(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR)
 GSETTINGS_DESKTOP_SCHEMAS_INSTALL_STAGING = YES
 GSETTINGS_DESKTOP_SCHEMAS_DEPENDENCIES = host-intltool host-pkgconf libglib2
-GSETTINGS_DESKTOP_SCHEMAS_LICENSE = LGPLv2.1+
+GSETTINGS_DESKTOP_SCHEMAS_LICENSE = LGPL-2.1+
 GSETTINGS_DESKTOP_SCHEMAS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index 9757f16..6f0e38d 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -16,7 +16,7 @@ GST_FFMPEG_LICENSE = GPL-2.0+ (gst-ffmpeg), GPL-2.0+/GPL-3.0+ (libav)
 GST_FFMPEG_LICENSE_FILES = COPYING gst-libs/ext/libav/COPYING.GPLv2 gst-libs/ext/libav/COPYING.GPLv3
 else
 GST_FFMPEG_CONF_OPTS += --enable-lgpl
-GST_FFMPEG_LICENSE = LGPLv2+ (gst-ffmpeg), LGPLv2.1+/LGPLv3+ (libav)
+GST_FFMPEG_LICENSE = LGPLv2+ (gst-ffmpeg), LGPL-2.1+/LGPLv3+ (libav)
 GST_FFMPEG_LICENSE_FILES = COPYING.LIB gst-libs/ext/libav/COPYING.LGPLv2.1 gst-libs/ext/libav/COPYING.LGPLv3
 endif
 
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
index 65993a2..6940901 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -9,7 +9,7 @@ GST_FSL_PLUGINS_SITE = $(FREESCALE_IMX_SITE)
 
 # Most is LGPLv2+, but some sources are copied from upstream and are
 # LGPLv2.1+, which essentially makes it LGPLv2.1+
-GST_FSL_PLUGINS_LICENSE = LGPLv2+, LGPLv2.1+, PROPRIETARY (asf.h)
+GST_FSL_PLUGINS_LICENSE = LGPLv2+, LGPL-2.1+, PROPRIETARY (asf.h)
 GST_FSL_PLUGINS_LICENSE_FILES = COPYING-LGPL-2.1 COPYING-LGPL-2
 
 GST_FSL_PLUGINS_INSTALL_STAGING = YES
diff --git a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
index 9296dab..b9416db 100644
--- a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
@@ -8,7 +8,7 @@ GST_PLUGINS_BAD_VERSION = 0.10.23
 GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.xz
 GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 # COPYING.LIB is in fact v2, but most of the code is v2.1+
-GST_PLUGINS_BAD_LICENSE = LGPLv2.1+, GPL-2.0+
+GST_PLUGINS_BAD_LICENSE = LGPL-2.1+, GPL-2.0+
 GST_PLUGINS_BAD_LICENSE_FILES = COPYING.LIB COPYING
 
 GST_PLUGINS_BAD_CONF_OPTS = \
diff --git a/package/gstreamer/gst-plugins-good/gst-plugins-good.mk b/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
index a686caf..791b413 100644
--- a/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
+++ b/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
@@ -7,7 +7,7 @@
 GST_PLUGINS_GOOD_VERSION = 0.10.31
 GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.xz
 GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
-GST_PLUGINS_GOOD_LICENSE = LGPLv2.1+
+GST_PLUGINS_GOOD_LICENSE = LGPL-2.1+
 GST_PLUGINS_GOOD_LICENSE_FILES = COPYING
 
 GST_PLUGINS_GOOD_CONF_OPTS = \
diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index cde7f8f..91230aa 100644
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -9,7 +9,7 @@ GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.xz
 GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER_INSTALL_STAGING = YES
 # COPYING is in fact v2, but most of the code is v2.1+
-GSTREAMER_LICENSE = LGPLv2.1+
+GSTREAMER_LICENSE = LGPL-2.1+
 GSTREAMER_LICENSE_FILES = COPYING
 
 # Checking if unaligned memory access works correctly cannot be done when cross
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 6ce7baa..10dbe05 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -8,7 +8,7 @@ GST_OMX_VERSION = 1.10.4
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-GST_OMX_LICENSE = LGPLv2.1
+GST_OMX_LICENSE = LGPL-2.1
 GST_OMX_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index c6a151a..71ebd48 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -11,7 +11,7 @@ GST1_PLUGINS_BAD_INSTALL_STAGING = YES
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
 # Unknown and GPL licensed plugins will append to GST1_PLUGINS_BAD_LICENSE if
 # enabled.
-GST1_PLUGINS_BAD_LICENSE = LGPLv2+, LGPLv2.1+
+GST1_PLUGINS_BAD_LICENSE = LGPLv2+, LGPL-2.1+
 
 GST1_PLUGINS_BAD_CONF_OPTS = \
 	--disable-examples \
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 6ab63a3..acb475a 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -9,7 +9,7 @@ GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
 GST1_PLUGINS_BASE_LICENSE_FILES = COPYING.LIB
-GST1_PLUGINS_BASE_LICENSE = LGPLv2+, LGPLv2.1+
+GST1_PLUGINS_BASE_LICENSE = LGPLv2+, LGPL-2.1+
 
 # freetype is only used by examples, but if it is not found
 # and the host has a freetype-config script, then the host
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index e25149a..69bb716 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -8,7 +8,7 @@ GST1_PLUGINS_GOOD_VERSION = 1.10.4
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-GST1_PLUGINS_GOOD_LICENSE = LGPLv2.1+
+GST1_PLUGINS_GOOD_LICENSE = LGPL-2.1+
 
 GST1_PLUGINS_GOOD_CONF_OPTS = \
 	--disable-valgrind \
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 16ba229..b0d9a65 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -9,7 +9,7 @@ GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
 # GPL licensed plugins will append to GST1_PLUGINS_UGLY_LICENSE if enabled.
-GST1_PLUGINS_UGLY_LICENSE = LGPLv2.1+
+GST1_PLUGINS_UGLY_LICENSE = LGPL-2.1+
 
 GST1_PLUGINS_UGLY_CONF_OPTS = --disable-examples --disable-valgrind
 
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 89f063d..8cb51bf 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -7,7 +7,7 @@
 GST1_VAAPI_VERSION = 1.10.4
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
-GST1_VAAPI_LICENSE = LGPLv2.1+
+GST1_VAAPI_LICENSE = LGPL-2.1+
 GST1_VAAPI_LICENSE_FILES = COPYING.LIB
 
 GST1_VAAPI_DEPENDENCIES += \
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index cf7a8af..f108e5d 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -7,7 +7,7 @@
 GST1_VALIDATE_VERSION = 1.10.4
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
-GST1_VALIDATE_LICENSE = LGPLv2.1+
+GST1_VALIDATE_LICENSE = LGPL-2.1+
 GST1_VALIDATE_LICENSE_FILES = COPYING
 
 GST1_VALIDATE_CONF_OPTS = --disable-sphinx-doc
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 5a0a369..08a736d 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -9,7 +9,7 @@ GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
 GSTREAMER1_LICENSE_FILES = COPYING
-GSTREAMER1_LICENSE = LGPLv2+, LGPLv2.1+
+GSTREAMER1_LICENSE = LGPLv2+, LGPL-2.1+
 
 GSTREAMER1_CONF_OPTS = \
 	--disable-examples \
diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
index 9b285f6..5f14594 100644
--- a/package/gtk2-engines/gtk2-engines.mk
+++ b/package/gtk2-engines/gtk2-engines.mk
@@ -9,7 +9,7 @@ GTK2_ENGINES_VERSION = $(GTK2_ENGINES_VERSION_MAJOR).2
 GTK2_ENGINES_SOURCE = gtk-engines-$(GTK2_ENGINES_VERSION).tar.bz2
 GTK2_ENGINES_SITE = http://ftp.gnome.org/pub/GNOME/sources/gtk-engines/$(GTK2_ENGINES_VERSION_MAJOR)
 GTK2_ENGINES_DEPENDENCIES = libgtk2 host-intltool
-GTK2_ENGINES_LICENSE = LGPLv2.1+
+GTK2_ENGINES_LICENSE = LGPL-2.1+
 GTK2_ENGINES_LICENSE_FILES = COPYING
 
 GTK2_ENGINES_CONF_ENV = \
diff --git a/package/gtkmm3/gtkmm3.mk b/package/gtkmm3/gtkmm3.mk
index 81a933b..0098891 100644
--- a/package/gtkmm3/gtkmm3.mk
+++ b/package/gtkmm3/gtkmm3.mk
@@ -8,7 +8,7 @@ GTKMM3_VERSION_MAJOR = 3.22
 GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).0
 GTKMM3_SOURCE = gtkmm-$(GTKMM3_VERSION).tar.xz
 GTKMM3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
-GTKMM3_LICENSE = LGPLv2.1+ (library), GPL-2.0+ (tools)
+GTKMM3_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GTKMM3_LICENSE_FILES = COPYING COPYING.tools
 GTKMM3_INSTALL_STAGING = YES
 GTKMM3_DEPENDENCIES = atkmm cairomm glibmm libgtk3 libsigc pangomm host-pkgconf
diff --git a/package/gtksourceview/gtksourceview.mk b/package/gtksourceview/gtksourceview.mk
index 5e4ca0d..290effb 100644
--- a/package/gtksourceview/gtksourceview.mk
+++ b/package/gtksourceview/gtksourceview.mk
@@ -9,7 +9,7 @@ GTKSOURCEVIEW_VERSION = $(GTKSOURCEVIEW_VERSION_MAJOR).2
 GTKSOURCEVIEW_SOURCE = gtksourceview-$(GTKSOURCEVIEW_VERSION).tar.xz
 GTKSOURCEVIEW_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gtksourceview/$(GTKSOURCEVIEW_VERSION_MAJOR)
-GTKSOURCEVIEW_LICENSE = LGPLv2.1+
+GTKSOURCEVIEW_LICENSE = LGPL-2.1+
 GTKSOURCEVIEW_LICENSE_FILES = COPYING
 GTKSOURCEVIEW_INSTALL_STAGING = YES
 GTKSOURCEVIEW_DEPENDENCIES = host-pkgconf libglib2 libxml2 libgtk3
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 075ce97..b9771e8 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -7,7 +7,7 @@
 IGH_ETHERCAT_VERSION = 1.5.2
 IGH_ETHERCAT_SITE = http://etherlab.org/download/ethercat
 IGH_ETHERCAT_SOURCE = ethercat-$(IGH_ETHERCAT_VERSION).tar.bz2
-IGH_ETHERCAT_LICENSE = GPL-2.0 (IgH EtherCAT master), LGPLv2.1 (libraries)
+IGH_ETHERCAT_LICENSE = GPL-2.0 (IgH EtherCAT master), LGPL-2.1 (libraries)
 IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
 
 IGH_ETHERCAT_INSTALL_STAGING = YES
diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
index 0cd9637..1d2c23f 100644
--- a/package/imx-usb-loader/imx-usb-loader.mk
+++ b/package/imx-usb-loader/imx-usb-loader.mk
@@ -6,7 +6,7 @@
 
 IMX_USB_LOADER_VERSION = 9b0e81cf9511c3a27cf635407714caa2793b570c
 IMX_USB_LOADER_SITE = $(call github,boundarydevices,imx_usb_loader,$(IMX_USB_LOADER_VERSION))
-IMX_USB_LOADER_LICENSE = LGPLv2.1+
+IMX_USB_LOADER_LICENSE = LGPL-2.1+
 IMX_USB_LOADER_LICENSE_FILES = COPYING
 HOST_IMX_USB_LOADER_DEPENDENCIES = host-libusb host-pkgconf
 
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index c877528..c57ad0e 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -6,7 +6,7 @@
 
 JACK2_VERSION = v1.9.10
 JACK2_SITE = $(call github,jackaudio,jack2,$(JACK2_VERSION))
-JACK2_LICENSE = GPL-2.0+ (jack server), LGPLv2.1+ (jack library)
+JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
 JACK2_INSTALL_STAGING = YES
 JACK2_PATCH = https://github.com/jackaudio/jack2/commit/ff1ed2c4524095055140370c1008a2d9cccc5645.patch
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index c0db671..db22dc9 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -8,7 +8,7 @@ JSON_GLIB_VERSION_MAJOR = 1.2
 JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).8
 JSON_GLIB_SITE = http://ftp.gnome.org/pub/GNOME/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
-JSON_GLIB_LICENSE = LGPLv2.1+
+JSON_GLIB_LICENSE = LGPL-2.1+
 JSON_GLIB_LICENSE_FILES = COPYING
 JSON_GLIB_INSTALL_STAGING = YES
 
diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index b7f08ce..81006ac 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -7,7 +7,7 @@
 KEYUTILS_VERSION = 1.5.9
 KEYUTILS_SOURCE = keyutils-$(KEYUTILS_VERSION).tar.bz2
 KEYUTILS_SITE = http://people.redhat.com/~dhowells/keyutils
-KEYUTILS_LICENSE = GPL-2.0+, LGPLv2.1+
+KEYUTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 KEYUTILS_LICENSE_FILES = LICENCE.GPL LICENCE.LGPL
 KEYUTILS_INSTALL_STAGING = YES
 
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index e2fbfa8..bd67610 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -12,7 +12,7 @@ KMOD_DEPENDENCIES = host-pkgconf
 HOST_KMOD_DEPENDENCIES = host-pkgconf
 
 # license info for libkmod only, conditionally add more below
-KMOD_LICENSE = LGPLv2.1+ (library)
+KMOD_LICENSE = LGPL-2.1+ (library)
 KMOD_LICENSE_FILES = libkmod/COPYING
 
 # --gc-sections triggers binutils ld segfault
diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
index 7539042..453f4b9 100644
--- a/package/lcdapi/lcdapi.mk
+++ b/package/lcdapi/lcdapi.mk
@@ -6,7 +6,7 @@
 
 LCDAPI_VERSION = v0.10
 LCDAPI_SITE = $(call github,spdawson,lcdapi,$(LCDAPI_VERSION))
-LCDAPI_LICENSE = LGPLv2.1+
+LCDAPI_LICENSE = LGPL-2.1+
 LCDAPI_LICENSE_FILES = COPYING
 LCDAPI_AUTORECONF = YES
 LCDAPI_INSTALL_STAGING = YES
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 0c20fd0..92039c1 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -7,7 +7,7 @@
 LEAFNODE2_VERSION = 2.0.0.alpha20140727b
 LEAFNODE2_SOURCE = leafnode-$(LEAFNODE2_VERSION).tar.bz2
 LEAFNODE2_SITE = http://krusty.dt.e-technik.tu-dortmund.de/~ma/leafnode/beta
-LEAFNODE2_LICENSE = LGPLv2.1
+LEAFNODE2_LICENSE = LGPL-2.1
 LEAFNODE2_LICENSE_FILES = COPYING COPYING.LGPL
 LEAFNODE2_DEPENDENCIES = host-pcre pcre
 
diff --git a/package/libaacs/libaacs.mk b/package/libaacs/libaacs.mk
index df61154..a73dac6 100644
--- a/package/libaacs/libaacs.mk
+++ b/package/libaacs/libaacs.mk
@@ -7,7 +7,7 @@
 LIBAACS_VERSION = 0.8.1
 LIBAACS_SITE = http://download.videolan.org/pub/videolan/libaacs/$(LIBAACS_VERSION)
 LIBAACS_SOURCE = libaacs-$(LIBAACS_VERSION).tar.bz2
-LIBAACS_LICENSE = LGPLv2.1+
+LIBAACS_LICENSE = LGPL-2.1+
 LIBAACS_LICENSE_FILES = COPYING
 LIBAACS_INSTALL_STAGING = YES
 LIBAACS_DEPENDENCIES = host-bison host-flex libgcrypt
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 5ebe1b7..03029d8 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -8,7 +8,7 @@ LIBAIO_VERSION = 0.3.110
 LIBAIO_SOURCE = libaio_$(LIBAIO_VERSION).orig.tar.gz
 LIBAIO_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/liba/libaio
 LIBAIO_INSTALL_STAGING = YES
-LIBAIO_LICENSE = LGPLv2.1+
+LIBAIO_LICENSE = LGPL-2.1+
 LIBAIO_LICENSE_FILES = COPYING
 
 LIBAIO_CONFIGURE_OPTS = $(TARGET_CONFIGURE_OPTS)
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index 8c74e2b..0e3aca3 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -7,7 +7,7 @@
 LIBASSUAN_VERSION = 2.4.3
 LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
-LIBASSUAN_LICENSE = LGPLv2.1+ (library), GPL-3.0 (tests, doc)
+LIBASSUAN_LICENSE = LGPL-2.1+ (library), GPL-3.0 (tests, doc)
 LIBASSUAN_LICENSE_FILES = COPYING.LIB COPYING
 LIBASSUAN_INSTALL_STAGING = YES
 LIBASSUAN_DEPENDENCIES = libgpg-error
diff --git a/package/libatasmart/libatasmart.mk b/package/libatasmart/libatasmart.mk
index 9e5de97..1d4eeaa 100644
--- a/package/libatasmart/libatasmart.mk
+++ b/package/libatasmart/libatasmart.mk
@@ -7,7 +7,7 @@
 LIBATASMART_VERSION = 0.19
 LIBATASMART_SOURCE = libatasmart-$(LIBATASMART_VERSION).tar.xz
 LIBATASMART_SITE = http://0pointer.de/public
-LIBATASMART_LICENSE = LGPLv2.1
+LIBATASMART_LICENSE = LGPL-2.1
 LIBATASMART_LICENSE_FILES = LGPL
 LIBATASMART_INSTALL_STAGING = YES
 
diff --git a/package/libbdplus/libbdplus.mk b/package/libbdplus/libbdplus.mk
index 45913ed..b0e8b14 100644
--- a/package/libbdplus/libbdplus.mk
+++ b/package/libbdplus/libbdplus.mk
@@ -7,7 +7,7 @@
 LIBBDPLUS_VERSION = 0.1.2
 LIBBDPLUS_SITE = http://download.videolan.org/pub/videolan/libbdplus/$(LIBBDPLUS_VERSION)
 LIBBDPLUS_SOURCE = libbdplus-$(LIBBDPLUS_VERSION).tar.bz2
-LIBBDPLUS_LICENSE = LGPLv2.1+
+LIBBDPLUS_LICENSE = LGPL-2.1+
 LIBBDPLUS_LICENSE_FILES = COPYING
 LIBBDPLUS_INSTALL_STAGING = YES
 LIBBDPLUS_DEPENDENCIES = libgcrypt
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index adce8c4..8268281 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -8,7 +8,7 @@ LIBBLURAY_VERSION = 1.0.0
 LIBBLURAY_SITE = http://get.videolan.org/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 LIBBLURAY_INSTALL_STAGING = YES
-LIBBLURAY_LICENSE = LGPLv2.1+
+LIBBLURAY_LICENSE = LGPL-2.1+
 LIBBLURAY_LICENSE_FILES = COPYING
 LIBBLURAY_DEPENDENCIES = host-pkgconf
 
diff --git a/package/libbroadvoice/libbroadvoice.mk b/package/libbroadvoice/libbroadvoice.mk
index c18d3d2..9c6b4e2 100644
--- a/package/libbroadvoice/libbroadvoice.mk
+++ b/package/libbroadvoice/libbroadvoice.mk
@@ -11,7 +11,7 @@ LIBBROADVOICE_VERSION = f65b0f50c8c767229fbf1758370880abc0d78564
 # usable interface, on a range of platforms."
 LIBBROADVOICE_SITE = https://freeswitch.org/stash/scm/sd/libbroadvoice.git
 LIBBROADVOICE_SITE_METHOD = git
-LIBBROADVOICE_LICENSE = LGPLv2.1
+LIBBROADVOICE_LICENSE = LGPL-2.1
 LIBBROADVOICE_LICENSE_FILES = COPYING
 LIBBROADVOICE_AUTORECONF = YES
 LIBBROADVOICE_INSTALL_STAGING = YES
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 372dc92..568f167 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -6,7 +6,7 @@
 
 LIBCAP_NG_VERSION = 0.7.8
 LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
-LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPLv2.1+ (library)
+LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
 LIBCAP_NG_INSTALL_STAGING = YES
 
diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
index 7cb3417..de2a1e4 100644
--- a/package/libcgi/libcgi.mk
+++ b/package/libcgi/libcgi.mk
@@ -10,6 +10,6 @@ LIBCGI_INSTALL_STAGING = YES
 # use cross CC/AR rather than host
 LIBCGI_MAKE_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS)" AR="$(TARGET_AR)" \
 	$(if $(BR2_STATIC_LIBS),STATIC=1)
-LIBCGI_LICENSE = LGPLv2.1+
+LIBCGI_LICENSE = LGPL-2.1+
 
 $(eval $(autotools-package))
diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index a4c3084..3845627 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -7,7 +7,7 @@
 LIBCGROUP_VERSION = 0.41
 LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
 LIBCGROUP_SITE = http://downloads.sourceforge.net/project/libcg/libcgroup/v$(LIBCGROUP_VERSION)
-LIBCGROUP_LICENSE = LGPLv2.1
+LIBCGROUP_LICENSE = LGPL-2.1
 LIBCGROUP_LICENSE_FILES = COPYING
 LIBCGROUP_DEPENDENCIES = host-bison host-flex
 LIBCGROUP_INSTALL_STAGING = YES
diff --git a/package/libcli/libcli.mk b/package/libcli/libcli.mk
index 17eed79..0fef008 100644
--- a/package/libcli/libcli.mk
+++ b/package/libcli/libcli.mk
@@ -6,7 +6,7 @@
 
 LIBCLI_VERSION = c63c9d35144939c8b4fa3c5394aed2e29ff517b0
 LIBCLI_SITE = $(call github,dparrish,libcli,$(LIBCLI_VERSION))
-LIBCLI_LICENSE = LGPLv2.1
+LIBCLI_LICENSE = LGPL-2.1
 LIBCLI_LICENSE_FILES = COPYING
 LIBCLI_INSTALL_STAGING = YES
 
diff --git a/package/libcodec2/libcodec2.mk b/package/libcodec2/libcodec2.mk
index 73f98ca..7329b99 100644
--- a/package/libcodec2/libcodec2.mk
+++ b/package/libcodec2/libcodec2.mk
@@ -7,7 +7,7 @@
 LIBCODEC2_VERSION = 392a55b4f3f8ad30d845ac6ae35e8b27343bb944
 LIBCODEC2_SITE = https://freeswitch.org/stash/scm/sd/libcodec2.git
 LIBCODEC2_SITE_METHOD = git
-LIBCODEC2_LICENSE = LGPLv2.1
+LIBCODEC2_LICENSE = LGPL-2.1
 LIBCODEC2_LICENSE_FILES = COPYING
 LIBCODEC2_AUTORECONF = YES
 LIBCODEC2_INSTALL_STAGING = YES
diff --git a/package/libcofi/libcofi.mk b/package/libcofi/libcofi.mk
index 90daff2..e611db6 100644
--- a/package/libcofi/libcofi.mk
+++ b/package/libcofi/libcofi.mk
@@ -6,7 +6,7 @@
 
 LIBCOFI_VERSION = 7313fbe12b0593034d0a1b606bf33c7cf4ababce
 LIBCOFI_SITE = $(call github,simonjhall,copies-and-fills,$(LIBCOFI_VERSION))
-LIBCOFI_LICENSE = LGPLv2.1
+LIBCOFI_LICENSE = LGPL-2.1
 LIBCOFI_LICENSE_FILES = README.md
 
 define LIBCOFI_BUILD_CMDS
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index f11937c..ed7e40f 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -6,7 +6,7 @@
 
 LIBCONFIG_VERSION = 1.5
 LIBCONFIG_SITE = http://www.hyperrealm.com/libconfig
-LIBCONFIG_LICENSE = LGPLv2.1+
+LIBCONFIG_LICENSE = LGPL-2.1+
 LIBCONFIG_LICENSE_FILES = COPYING.LIB
 LIBCONFIG_INSTALL_STAGING = YES
 LIBCONFIG_CONF_OPTS = --disable-examples
diff --git a/package/libcroco/libcroco.mk b/package/libcroco/libcroco.mk
index 39dd527..5ea0b77 100644
--- a/package/libcroco/libcroco.mk
+++ b/package/libcroco/libcroco.mk
@@ -14,7 +14,7 @@ HOST_LIBCROCO_DEPENDENCIES = host-pkgconf host-libglib2 host-libxml2
 LIBCROCO_CONFIG_SCRIPTS = croco-$(LIBCROCO_VERSION_MAJOR)-config
 # NEWS states that it's only LGPL
 # Source code says v2.1+ even though COPYING.LIB is v2
-LIBCROCO_LICENSE = LGPLv2.1+
+LIBCROCO_LICENSE = LGPL-2.1+
 LIBCROCO_LICENSE_FILES = COPYING.LIB
 
 $(eval $(autotools-package))
diff --git a/package/libdaemon/libdaemon.mk b/package/libdaemon/libdaemon.mk
index 69dc0b7..a8f7510 100644
--- a/package/libdaemon/libdaemon.mk
+++ b/package/libdaemon/libdaemon.mk
@@ -6,7 +6,7 @@
 
 LIBDAEMON_VERSION = 0.14
 LIBDAEMON_SITE = http://0pointer.de/lennart/projects/libdaemon
-LIBDAEMON_LICENSE = LGPLv2.1+
+LIBDAEMON_LICENSE = LGPL-2.1+
 LIBDAEMON_LICENSE_FILES = LICENSE
 LIBDAEMON_INSTALL_STAGING = YES
 LIBDAEMON_CONF_ENV = ac_cv_func_setpgrp_void=no
diff --git a/package/libdcadec/libdcadec.mk b/package/libdcadec/libdcadec.mk
index 48e4a12..a5a98be 100644
--- a/package/libdcadec/libdcadec.mk
+++ b/package/libdcadec/libdcadec.mk
@@ -6,7 +6,7 @@
 
 LIBDCADEC_VERSION = v0.2.0
 LIBDCADEC_SITE = $(call github,foo86,dcadec,$(LIBDCADEC_VERSION))
-LIBDCADEC_LICENSE = LGPLv2.1+
+LIBDCADEC_LICENSE = LGPL-2.1+
 LIBDCADEC_LICENSE_FILES = COPYING.LGPLv2.1
 LIBDCADEC_INSTALL_STAGING = YES
 
diff --git a/package/libdvbpsi/libdvbpsi.mk b/package/libdvbpsi/libdvbpsi.mk
index 218c19e..9a0a4ac 100644
--- a/package/libdvbpsi/libdvbpsi.mk
+++ b/package/libdvbpsi/libdvbpsi.mk
@@ -7,7 +7,7 @@
 LIBDVBPSI_VERSION = 1.3.0
 LIBDVBPSI_SITE = http://download.videolan.org/pub/libdvbpsi/$(LIBDVBPSI_VERSION)
 LIBDVBPSI_SOURCE = libdvbpsi-$(LIBDVBPSI_VERSION).tar.bz2
-LIBDVBPSI_LICENSE = LGPLv2.1+
+LIBDVBPSI_LICENSE = LGPL-2.1+
 LIBDVBPSI_LICENSE_FILES = COPYING
 LIBDVBPSI_INSTALL_STAGING = YES
 
diff --git a/package/libdvbsi/libdvbsi.mk b/package/libdvbsi/libdvbsi.mk
index f6469f9..bfddd64 100644
--- a/package/libdvbsi/libdvbsi.mk
+++ b/package/libdvbsi/libdvbsi.mk
@@ -8,7 +8,7 @@ LIBDVBSI_VERSION = 0.3.7
 LIBDVBSI_SOURCE = libdvbsi++-$(LIBDVBSI_VERSION).tar.bz2
 LIBDVBSI_SITE = http://www.saftware.de/libdvbsi++
 LIBDVBSI_INSTALL_STAGING = YES
-LIBDVBSI_LICENSE = LGPLv2.1
+LIBDVBSI_LICENSE = LGPL-2.1
 LIBDVBSI_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
index 36c8a5c..8c5dee3 100644
--- a/package/libebml/libebml.mk
+++ b/package/libebml/libebml.mk
@@ -8,7 +8,7 @@ LIBEBML_VERSION = 1.3.3
 LIBEBML_SOURCE = libebml-$(LIBEBML_VERSION).tar.bz2
 LIBEBML_SITE = http://dl.matroska.org/downloads/libebml
 LIBEBML_INSTALL_STAGING = YES
-LIBEBML_LICENSE = LGPLv2.1+
+LIBEBML_LICENSE = LGPL-2.1+
 LIBEBML_LICENSE_FILES = LICENSE.LGPL
 
 $(eval $(autotools-package))
diff --git a/package/libee/libee.mk b/package/libee/libee.mk
index 23441bc..9879eff 100644
--- a/package/libee/libee.mk
+++ b/package/libee/libee.mk
@@ -6,7 +6,7 @@
 
 LIBEE_VERSION = 0.4.1
 LIBEE_SITE = http://www.libee.org/download/files/download
-LIBEE_LICENSE = LGPLv2.1+
+LIBEE_LICENSE = LGPL-2.1+
 LIBEE_LICENSE_FILES = COPYING
 LIBEE_DEPENDENCIES = libestr host-pkgconf
 LIBEE_INSTALL_STAGING = YES
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index a00d371..b0f88c7 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -10,7 +10,7 @@ LIBESMTP_SITE = http://www.stafford.uklinux.net/libesmtp
 LIBESMTP_INSTALL_STAGING = YES
 LIBESMTP_CONFIG_SCRIPTS = libesmtp-config
 LIBESMTP_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
-LIBESMTP_LICENSE = GPL-2.0+ (examples), LGPLv2.1+ (library)
+LIBESMTP_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
 LIBESMTP_LICENSE_FILES = COPYING COPYING.LIB
 
 $(eval $(autotools-package))
diff --git a/package/libestr/libestr.mk b/package/libestr/libestr.mk
index e9783d3..dcd2094 100644
--- a/package/libestr/libestr.mk
+++ b/package/libestr/libestr.mk
@@ -6,7 +6,7 @@
 
 LIBESTR_VERSION = 0.1.10
 LIBESTR_SITE = http://libestr.adiscon.com/files/download
-LIBESTR_LICENSE = LGPLv2.1+
+LIBESTR_LICENSE = LGPL-2.1+
 LIBESTR_LICENSE_FILES = COPYING
 LIBESTR_INSTALL_STAGING = YES
 
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index a71c117..a4ec5ed 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -9,7 +9,7 @@ LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.bz2
 LIBEXIF_SITE = http://downloads.sourceforge.net/project/libexif/libexif/$(LIBEXIF_VERSION)
 LIBEXIF_INSTALL_STAGING = YES
 LIBEXIF_DEPENDENCIES = host-pkgconf
-LIBEXIF_LICENSE = LGPLv2.1+
+LIBEXIF_LICENSE = LGPL-2.1+
 LIBEXIF_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libfm-extra/libfm-extra.mk b/package/libfm-extra/libfm-extra.mk
index e5ef2f7..67d6dc1 100644
--- a/package/libfm-extra/libfm-extra.mk
+++ b/package/libfm-extra/libfm-extra.mk
@@ -8,7 +8,7 @@ LIBFM_EXTRA_VERSION = 1.2.4
 LIBFM_EXTRA_SOURCE = libfm-$(LIBFM_EXTRA_VERSION).tar.xz
 LIBFM_EXTRA_SITE = http://sourceforge.net/projects/pcmanfm/files
 LIBFM_EXTRA_DEPENDENCIES = libglib2 host-intltool
-LIBFM_EXTRA_LICENSE = GPL-2.0+, LGPLv2.1+
+LIBFM_EXTRA_LICENSE = GPL-2.0+, LGPL-2.1+
 LIBFM_EXTRA_LICENSE_FILES = COPYING src/extra/fm-xml-file.c
 LIBFM_EXTRA_INSTALL_STAGING = YES
 LIBFM_EXTRA_CONF_OPTS = --with-extra-only --with-gtk=no
diff --git a/package/libfm/libfm.mk b/package/libfm/libfm.mk
index a6c0e74..36d8b57 100644
--- a/package/libfm/libfm.mk
+++ b/package/libfm/libfm.mk
@@ -8,7 +8,7 @@ LIBFM_VERSION = 1.2.4
 LIBFM_SOURCE = libfm-$(LIBFM_VERSION).tar.xz
 LIBFM_SITE = http://sourceforge.net/projects/pcmanfm/files
 LIBFM_DEPENDENCIES = menu-cache libglib2 cairo
-LIBFM_LICENSE = GPL-2.0+, LGPLv2.1+
+LIBFM_LICENSE = GPL-2.0+, LGPL-2.1+
 LIBFM_LICENSE_FILES = COPYING src/extra/fm-xml-file.c
 LIBFM_INSTALL_STAGING = YES
 
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 751a1b6..a7a8519 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -7,7 +7,7 @@
 LIBFRIBIDI_VERSION = 0.19.7
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.bz2
 LIBFRIBIDI_SITE = http://www.fribidi.org/download
-LIBFRIBIDI_LICENSE = LGPLv2.1+
+LIBFRIBIDI_LICENSE = LGPL-2.1+
 LIBFRIBIDI_LICENSE_FILES = COPYING
 LIBFRIBIDI_INSTALL_STAGING = YES
 # Ships a beta libtool version hence our patch doesn't apply.
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index cf6912c..dc177d0 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -7,7 +7,7 @@
 LIBFUSE_VERSION = 2.9.7
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse-$(LIBFUSE_VERSION)
-LIBFUSE_LICENSE = GPL-2.0, LGPLv2.1
+LIBFUSE_LICENSE = GPL-2.0, LGPL-2.1
 LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
 LIBFUSE_INSTALL_STAGING = YES
 LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index a034358..0ae4c6f 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -6,7 +6,7 @@
 
 LIBGCRYPT_VERSION = 1.7.6
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
-LIBGCRYPT_LICENSE = LGPLv2.1+
+LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
 LIBGCRYPT_SITE = ftp://ftp.gnupg.org/gcrypt/libgcrypt
 LIBGCRYPT_INSTALL_STAGING = YES
diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index 1df54d2..9d87169 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -10,7 +10,7 @@ LIBGEE_SITE = http://ftp.gnome.org/pub/gnome/sources/libgee/$(LIBGEE_VERSION_MAJ
 LIBGEE_SOURCE = libgee-$(LIBGEE_VERSION).tar.xz
 LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
 LIBGEE_INSTALL_STAGING = YES
-LIBGEE_LICENSE = LGPLv2.1+
+LIBGEE_LICENSE = LGPL-2.1+
 LIBGEE_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 8f25491..183654b 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -6,7 +6,7 @@
 
 LIBGPG_ERROR_VERSION = 1.27
 LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
-LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPLv2.1+
+LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
 LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
 LIBGPG_ERROR_INSTALL_STAGING = YES
 LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 84f4d22..09b6fbe 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -7,7 +7,7 @@
 LIBGPGME_VERSION = 1.7.1
 LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
-LIBGPGME_LICENSE = LGPLv2.1+
+LIBGPGME_LICENSE = LGPL-2.1+
 LIBGPGME_LICENSE_FILES = COPYING.LESSER
 LIBGPGME_INSTALL_STAGING = YES
 LIBGPGME_DEPENDENCIES = libassuan libgpg-error
diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
index 057138d..9a62543 100644
--- a/package/libgsasl/libgsasl.mk
+++ b/package/libgsasl/libgsasl.mk
@@ -6,7 +6,7 @@
 
 LIBGSASL_VERSION = 1.8.0
 LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
-LIBGSASL_LICENSE = LGPLv2.1+ (library), GPL-3.0+ (programs)
+LIBGSASL_LICENSE = LGPL-2.1+ (library), GPL-3.0+ (programs)
 LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING
 LIBGSASL_INSTALL_STAGING = YES
 # It doesn't seem to build with our libgcrypt so better be safe
diff --git a/package/libgudev/libgudev.mk b/package/libgudev/libgudev.mk
index dce9cd8..fce710a 100644
--- a/package/libgudev/libgudev.mk
+++ b/package/libgudev/libgudev.mk
@@ -9,7 +9,7 @@ LIBGUDEV_SOURCE = libgudev-$(LIBGUDEV_VERSION).tar.xz
 LIBGUDEV_SITE = http://ftp.gnome.org/pub/GNOME/sources/libgudev/$(LIBGUDEV_VERSION)
 LIBGUDEV_INSTALL_STAGING = YES
 LIBGUDEV_DEPENDENCIES = host-pkgconf udev libglib2
-LIBGUDEV_LICENSE = LGPLv2.1+
+LIBGUDEV_LICENSE = LGPL-2.1+
 LIBGUDEV_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libhdhomerun/libhdhomerun.mk b/package/libhdhomerun/libhdhomerun.mk
index 16e34c2..a68d928 100644
--- a/package/libhdhomerun/libhdhomerun.mk
+++ b/package/libhdhomerun/libhdhomerun.mk
@@ -7,7 +7,7 @@
 LIBHDHOMERUN_VERSION = 20150826
 LIBHDHOMERUN_SOURCE = libhdhomerun_$(LIBHDHOMERUN_VERSION).tgz
 LIBHDHOMERUN_SITE = http://download.silicondust.com/hdhomerun
-LIBHDHOMERUN_LICENSE = LGPLv2.1+
+LIBHDHOMERUN_LICENSE = LGPL-2.1+
 LIBHDHOMERUN_LICENSE_FILES = lgpl.txt
 LIBHDHOMERUN_INSTALL_STAGING = YES
 
diff --git a/package/libical/libical.mk b/package/libical/libical.mk
index a511039..3793429 100644
--- a/package/libical/libical.mk
+++ b/package/libical/libical.mk
@@ -7,7 +7,7 @@
 LIBICAL_VERSION = 1.0.1
 LIBICAL_SITE = https://github.com/libical/libical/releases/download/v$(LIBICAL_VERSION)
 LIBICAL_INSTALL_STAGING = YES
-LIBICAL_LICENSE = MPLv1.0 or LGPLv2.1
+LIBICAL_LICENSE = MPLv1.0 or LGPL-2.1
 LIBICAL_LICENSE_FILES = LICENSE
 
 # building without this option is broken, it is used by
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index aaa6c70..35eb23d 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -7,7 +7,7 @@
 LIBIIO_VERSION = 0.9
 LIBIIO_SITE = $(call github,analogdevicesinc,libiio,v$(LIBIIO_VERSION))
 LIBIIO_INSTALL_STAGING = YES
-LIBIIO_LICENSE = LGPLv2.1+
+LIBIIO_LICENSE = LGPL-2.1+
 LIBIIO_LICENSE_FILES = COPYING.txt
 
 LIBIIO_CONF_OPTS = -DENABLE_IPV6=ON \
diff --git a/package/libimxvpuapi/libimxvpuapi.mk b/package/libimxvpuapi/libimxvpuapi.mk
index d368d3d..bcabbf3 100644
--- a/package/libimxvpuapi/libimxvpuapi.mk
+++ b/package/libimxvpuapi/libimxvpuapi.mk
@@ -6,7 +6,7 @@
 
 LIBIMXVPUAPI_VERSION = 0.10.3
 LIBIMXVPUAPI_SITE = $(call github,Freescale,libimxvpuapi,$(LIBIMXVPUAPI_VERSION))
-LIBIMXVPUAPI_LICENSE = LGPLv2.1+
+LIBIMXVPUAPI_LICENSE = LGPL-2.1+
 LIBIMXVPUAPI_LICENSE_FILES = LICENSE
 LIBIMXVPUAPI_DEPENDENCIES = host-pkgconf host-python imx-vpu
 LIBIMXVPUAPI_INSTALL_STAGING = YES
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
index 0531602..f403a5e 100644
--- a/package/libiqrf/libiqrf.mk
+++ b/package/libiqrf/libiqrf.mk
@@ -8,6 +8,6 @@ LIBIQRF_VERSION = v0.1.2
 LIBIQRF_SITE = $(call github,nandra,libiqrf,$(LIBIQRF_VERSION))
 LIBIQRF_INSTALL_STAGING = YES
 LIBIQRF_DEPENDENCIES = libusb
-LIBIQRF_LICENSE = LGPLv2.1+
+LIBIQRF_LICENSE = LGPL-2.1+
 
 $(eval $(cmake-package))
diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index 7ce6a47..6c86008 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -6,7 +6,7 @@
 
 LIBISCSI_VERSION = 1.18.0
 LIBISCSI_SITE = $(call github,sahlberg,libiscsi,$(LIBISCSI_VERSION))
-LIBISCSI_LICENSE = GPL-2.0+, LGPLv2.1+
+LIBISCSI_LICENSE = GPL-2.0+, LGPL-2.1+
 LIBISCSI_LICENSE_FILES = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
 LIBISCSI_INSTALL_STAGING = YES
 LIBISCSI_AUTORECONF = YES
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index a6b9075..3c852be 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -7,7 +7,7 @@
 LIBLO_VERSION = 0.26
 LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
 
-LIBLO_LICENSE = LGPLv2.1+
+LIBLO_LICENSE = LGPL-2.1+
 LIBLO_LICENSE_FILES = COPYING
 LIBLO_INSTALL_STAGING = YES
 
diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
index bc6d1ab..fba0d4f 100644
--- a/package/liblog4c-localtime/liblog4c-localtime.mk
+++ b/package/liblog4c-localtime/liblog4c-localtime.mk
@@ -10,7 +10,7 @@ LIBLOG4C_LOCALTIME_INSTALL_STAGING = YES
 LIBLOG4C_LOCALTIME_CONF_OPTS = --disable-expattest
 LIBLOG4C_LOCALTIME_DEPENDENCIES = expat
 LIBLOG4C_LOCALTIME_CONFIG_SCRIPTS = log4c-config
-LIBLOG4C_LOCALTIME_LICENSE = LGPLv2.1
+LIBLOG4C_LOCALTIME_LICENSE = LGPL-2.1
 LIBLOG4C_LOCALTIME_LICENSE_FILES = COPYING
 LIBLOG4C_LOCALTIME_AUTORECONF = YES
 
diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
index 083cced..18ea505 100644
--- a/package/libmatroska/libmatroska.mk
+++ b/package/libmatroska/libmatroska.mk
@@ -8,7 +8,7 @@ LIBMATROSKA_VERSION = 1.4.4
 LIBMATROSKA_SOURCE = libmatroska-$(LIBMATROSKA_VERSION).tar.bz2
 LIBMATROSKA_SITE = http://dl.matroska.org/downloads/libmatroska
 LIBMATROSKA_INSTALL_STAGING = YES
-LIBMATROSKA_LICENSE = LGPLv2.1+
+LIBMATROSKA_LICENSE = LGPL-2.1+
 LIBMATROSKA_LICENSE_FILES = LICENSE.LGPL
 LIBMATROSKA_DEPENDENCIES = libebml host-pkgconf
 
diff --git a/package/libmcrypt/libmcrypt.mk b/package/libmcrypt/libmcrypt.mk
index 1a2645b..e93f013 100644
--- a/package/libmcrypt/libmcrypt.mk
+++ b/package/libmcrypt/libmcrypt.mk
@@ -8,7 +8,7 @@ LIBMCRYPT_VERSION = 2.5.8
 LIBMCRYPT_SITE = http://downloads.sourceforge.net/project/mcrypt/Libmcrypt/$(LIBMCRYPT_VERSION)
 LIBMCRYPT_AUTORECONF = YES
 LIBMCRYPT_INSTALL_STAGING = YES
-LIBMCRYPT_LICENSE = LGPLv2.1
+LIBMCRYPT_LICENSE = LGPL-2.1
 LIBMCRYPT_LICENSE_FILES = COPYING.LIB
 LIBMCRYPT_CONFIG_SCRIPTS = libmcrypt-config
 
diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index 31f5675..e98ec3a 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -9,7 +9,7 @@ LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).1
 LIBMEDIAART_SOURCE = libmediaart-$(LIBMEDIAART_VERSION).tar.xz
 LIBMEDIAART_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/libmediaart/$(LIBMEDIAART_VERSION_MAJOR)
-LIBMEDIAART_LICENSE = LGPLv2.1+
+LIBMEDIAART_LICENSE = LGPL-2.1+
 LIBMEDIAART_LICENSE_FILES = COPYING.LESSER
 LIBMEDIAART_INSTALL_STAGING = YES
 LIBMEDIAART_DEPENDENCIES = libglib2
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 83791b3..785e886 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -22,13 +22,13 @@ endif
 LIBMICROHTTPD_CONF_ENV += CFLAGS="$(LIBMICROHTTPD_CFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
-LIBMICROHTTPD_LICENSE = LGPLv2.1+
+LIBMICROHTTPD_LICENSE = LGPL-2.1+
 LIBMICROHTTPD_DEPENDENCIES += host-pkgconf gnutls libgcrypt
 LIBMICROHTTPD_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs gnutls`"
 LIBMICROHTTPD_CONF_OPTS += --enable-https --with-gnutls=$(STAGING_DIR)/usr \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
-LIBMICROHTTPD_LICENSE = LGPLv2.1+ or eCos
+LIBMICROHTTPD_LICENSE = LGPL-2.1+ or eCos
 LIBMICROHTTPD_CONF_OPTS += --disable-https
 endif
 
diff --git a/package/libmms/libmms.mk b/package/libmms/libmms.mk
index 01c8d67..dd0b1df 100644
--- a/package/libmms/libmms.mk
+++ b/package/libmms/libmms.mk
@@ -8,7 +8,7 @@ LIBMMS_VERSION = 0.6.2
 LIBMMS_SITE = http://downloads.sourceforge.net/project/libmms/libmms/$(LIBMMS_VERSION)
 LIBMMS_INSTALL_STAGING = YES
 LIBMMS_DEPENDENCIES = host-pkgconf libglib2
-LIBMMS_LICENSE = LGPLv2.1+
+LIBMMS_LICENSE = LGPL-2.1+
 LIBMMS_LICENSE_FILES = COPYING.LIB
 
 $(eval $(autotools-package))
diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index 407c4f1..7fcce4c 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -8,7 +8,7 @@ LIBMNL_VERSION = 1.0.4
 LIBMNL_SOURCE = libmnl-$(LIBMNL_VERSION).tar.bz2
 LIBMNL_SITE = http://netfilter.org/projects/libmnl/files
 LIBMNL_INSTALL_STAGING = YES
-LIBMNL_LICENSE = LGPLv2.1+
+LIBMNL_LICENSE = LGPL-2.1+
 LIBMNL_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 1f8c730..6f0f342 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -6,7 +6,7 @@
 
 LIBMODBUS_VERSION = 3.0.6
 LIBMODBUS_SITE = http://libmodbus.org/releases
-LIBMODBUS_LICENSE = LGPLv2.1+
+LIBMODBUS_LICENSE = LGPL-2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
 LIBMODBUS_INSTALL_STAGING = YES
 
diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
index c880b7e..4fa1d33 100644
--- a/package/libndp/libndp.mk
+++ b/package/libndp/libndp.mk
@@ -6,7 +6,7 @@
 
 LIBNDP_VERSION = v1.5
 LIBNDP_SITE = $(call github,jpirko,libndp,$(LIBNDP_VERSION))
-LIBNDP_LICENSE = LGPLv2.1+
+LIBNDP_LICENSE = LGPL-2.1+
 LIBNDP_LICENSE_FILES = COPYING
 LIBNDP_AUTORECONF = YES
 LIBNDP_INSTALL_STAGING = YES
diff --git a/package/libnetfilter_acct/libnetfilter_acct.mk b/package/libnetfilter_acct/libnetfilter_acct.mk
index c2fa234..e791f6f 100644
--- a/package/libnetfilter_acct/libnetfilter_acct.mk
+++ b/package/libnetfilter_acct/libnetfilter_acct.mk
@@ -9,7 +9,7 @@ LIBNETFILTER_ACCT_SOURCE = libnetfilter_acct-$(LIBNETFILTER_ACCT_VERSION).tar.bz
 LIBNETFILTER_ACCT_SITE = http://www.netfilter.org/projects/libnetfilter_acct/files
 LIBNETFILTER_ACCT_INSTALL_STAGING = YES
 LIBNETFILTER_ACCT_DEPENDENCIES = host-pkgconf libmnl
-LIBNETFILTER_ACCT_LICENSE = LGPLv2.1+
+LIBNETFILTER_ACCT_LICENSE = LGPL-2.1+
 LIBNETFILTER_ACCT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index e49656b..b66a9be 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -9,7 +9,7 @@ LIBNFS_SITE = $(call github,sahlberg,libnfs,$(LIBNFS_VERSION))
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
 LIBNFS_MAKE = $(MAKE1)
-LIBNFS_LICENSE = LGPLv2.1+
+LIBNFS_LICENSE = LGPL-2.1+
 LIBNFS_LICENSE_FILES = LICENCE-LGPL-2.1.txt
 LIBNFS_DEPENDENCIES = host-pkgconf
 
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index 3df596a..61cfb24 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -6,7 +6,7 @@
 
 LIBNICE_VERSION = 0.1.13
 LIBNICE_SITE = http://nice.freedesktop.org/releases
-LIBNICE_LICENSE = MPLv1.1 or LGPLv2.1
+LIBNICE_LICENSE = MPLv1.1 or LGPL-2.1
 LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
 LIBNICE_DEPENDENCIES = libglib2 host-pkgconf
 LIBNICE_INSTALL_STAGING = YES
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index f31a92c..6de6825 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -6,7 +6,7 @@
 
 LIBNL_VERSION = 3.2.29
 LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
-LIBNL_LICENSE = LGPLv2.1+
+LIBNL_LICENSE = LGPL-2.1+
 LIBNL_LICENSE_FILES = COPYING
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf
diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
index aa478a4..895d530 100644
--- a/package/liboping/liboping.mk
+++ b/package/liboping/liboping.mk
@@ -10,7 +10,7 @@ LIBOPING_SOURCE = liboping-$(LIBOPING_VERSION).tar.bz2
 LIBOPING_INSTALL_STAGING = YES
 LIBOPING_DEPENDENCIES = $(if $(BR2_PACKAGE_NCURSES),ncurses)
 LIBOPING_CONF_OPTS = --without-perl-bindings
-LIBOPING_LICENSE = LGPLv2.1+, GPL-2.0
+LIBOPING_LICENSE = LGPL-2.1+, GPL-2.0
 LIBOPING_LICENSE_FILES = COPYING
 
 LIBOPING_AUTORECONF = YES
diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index f22dcc3..9302b99 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -7,7 +7,7 @@
 LIBOSIP2_VERSION = 3.6.0
 LIBOSIP2_SITE = $(BR2_GNU_MIRROR)/osip
 LIBOSIP2_INSTALL_STAGING = YES
-LIBOSIP2_LICENSE = LGPLv2.1+
+LIBOSIP2_LICENSE = LGPL-2.1+
 LIBOSIP2_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_arc),y)
diff --git a/package/libplayer/libplayer.mk b/package/libplayer/libplayer.mk
index ace1891..f4ecced 100644
--- a/package/libplayer/libplayer.mk
+++ b/package/libplayer/libplayer.mk
@@ -7,7 +7,7 @@
 LIBPLAYER_VERSION = 2.0.1
 LIBPLAYER_SITE = http://libplayer.geexbox.org/releases
 LIBPLAYER_SOURCE = libplayer-$(LIBPLAYER_VERSION).tar.bz2
-LIBPLAYER_LICENSE = LGPLv2.1+
+LIBPLAYER_LICENSE = LGPL-2.1+
 LIBPLAYER_LICENSE_FILES = COPYING
 
 # When passing the standard buildroot configure arguments, the configure script
diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
index 7f60b5e..0d3e417 100644
--- a/package/libplist/libplist.mk
+++ b/package/libplist/libplist.mk
@@ -9,7 +9,7 @@ LIBPLIST_SOURCE = libplist-$(LIBPLIST_VERSION).tar.bz2
 LIBPLIST_SITE = http://www.libimobiledevice.org/downloads
 LIBPLIST_DEPENDENCIES = libxml2 host-pkgconf
 LIBPLIST_INSTALL_STAGING = YES
-LIBPLIST_LICENSE = LGPLv2.1+
+LIBPLIST_LICENSE = LGPL-2.1+
 LIBPLIST_LICENSE_FILES = COPYING
 
 # Straight out of the git tree:
diff --git a/package/libpthsem/libpthsem.mk b/package/libpthsem/libpthsem.mk
index b8a3d7d..dfe25af 100644
--- a/package/libpthsem/libpthsem.mk
+++ b/package/libpthsem/libpthsem.mk
@@ -7,7 +7,7 @@
 LIBPTHSEM_VERSION = 2.0.8
 LIBPTHSEM_SOURCE = pthsem_$(LIBPTHSEM_VERSION).tar.gz
 LIBPTHSEM_SITE = http://www.auto.tuwien.ac.at/~mkoegler/pth
-LIBPTHSEM_LICENSE = LGPLv2.1+
+LIBPTHSEM_LICENSE = LGPL-2.1+
 LIBPTHSEM_LICENSE_FILES = COPYING
 LIBPTHSEM_AUTORECONF = YES
 LIBPTHSEM_INSTALL_STAGING = YES
diff --git a/package/libqrencode/libqrencode.mk b/package/libqrencode/libqrencode.mk
index 5f30e77..8f17b89 100644
--- a/package/libqrencode/libqrencode.mk
+++ b/package/libqrencode/libqrencode.mk
@@ -9,7 +9,7 @@ LIBQRENCODE_SOURCE = qrencode-$(LIBQRENCODE_VERSION).tar.gz
 LIBQRENCODE_SITE = http://fukuchi.org/works/qrencode
 LIBQRENCODE_DEPENDENCIES = host-pkgconf
 LIBQRENCODE_INSTALL_STAGING = YES
-LIBQRENCODE_LICENSE = LGPLv2.1+
+LIBQRENCODE_LICENSE = LGPL-2.1+
 LIBQRENCODE_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index f78ce1e..bb8edf7 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -18,7 +18,7 @@ LIBRAW_CONF_OPTS += \
 	--disable-openmp \
 	--disable-demosaic-pack-gpl2 \
 	--disable-demosaic-pack-gpl3
-LIBRAW_LICENSE = LGPLv2.1 or CDDL 1.0 or LibRaw Software License 27032010
+LIBRAW_LICENSE = LGPL-2.1 or CDDL 1.0 or LibRaw Software License 27032010
 LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL LICENSE.LibRaw.pdf README
 LIBRAW_DEPENDENCIES = host-pkgconf
 LIBRAW_CXXFLAGS = $(TARGET_CXXFLAGS)
diff --git a/package/libraw1394/libraw1394.mk b/package/libraw1394/libraw1394.mk
index 7123ac7..73517ed 100644
--- a/package/libraw1394/libraw1394.mk
+++ b/package/libraw1394/libraw1394.mk
@@ -9,7 +9,7 @@ LIBRAW1394_SOURCE = libraw1394-$(LIBRAW1394_VERSION).tar.xz
 LIBRAW1394_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ieee1394
 LIBRAW1394_PATCH = http://git.alpinelinux.org/cgit/aports/plain/main/libraw1394/fix-types.patch
 LIBRAW1394_INSTALL_STAGING = YES
-LIBRAW1394_LICENSE = LGPLv2.1+
+LIBRAW1394_LICENSE = LGPL-2.1+
 LIBRAW1394_LICENSE_FILES = COPYING.LIB
 
 $(eval $(autotools-package))
diff --git a/package/libreplaygain/libreplaygain.mk b/package/libreplaygain/libreplaygain.mk
index 4775999..ff0950c 100644
--- a/package/libreplaygain/libreplaygain.mk
+++ b/package/libreplaygain/libreplaygain.mk
@@ -10,7 +10,7 @@ LIBREPLAYGAIN_SOURCE = libreplaygain_$(LIBREPLAYGAIN_VERSION).tar.gz
 # upstream doesn't ship configure
 LIBREPLAYGAIN_AUTORECONF = YES
 LIBREPLAYGAIN_INSTALL_STAGING = YES
-LIBREPLAYGAIN_LICENSE = LGPLv2.1+
+LIBREPLAYGAIN_LICENSE = LGPL-2.1+
 LIBREPLAYGAIN_LICENSE_FILES = src/gain_analysis.c
 
 $(eval $(autotools-package))
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index 43d1d91..5582b38 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -7,7 +7,7 @@
 LIBROXML_VERSION = 2.3.0
 LIBROXML_SITE = http://download.libroxml.net/pool/v2.x
 LIBROXML_INSTALL_STAGING = YES
-LIBROXML_LICENSE = LGPLv2.1+ with static link exception
+LIBROXML_LICENSE = LGPL-2.1+ with static link exception
 LIBROXML_LICENSE_FILES = License.txt
 
 LIBROXML_CONF_OPTS = --disable-silent-rules
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index d475c73..517f871 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -6,7 +6,7 @@
 
 LIBRSYNC_VERSION = 0.9.7
 LIBRSYNC_SITE = http://downloads.sourceforge.net/project/librsync/librsync/$(LIBRSYNC_VERSION)
-LIBRSYNC_LICENSE = LGPLv2.1+
+LIBRSYNC_LICENSE = LGPL-2.1+
 LIBRSYNC_LICENSE_FILES = COPYING
 LIBRSYNC_INSTALL_STAGING = YES
 LIBRSYNC_DEPENDENCIES = zlib bzip2 popt
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index 03fc6cf..9a241a5 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -6,7 +6,7 @@
 
 LIBSECCOMP_VERSION = v2.3.1
 LIBSECCOMP_SITE = $(call github,seccomp,libseccomp,$(LIBSECCOMP_VERSION))
-LIBSECCOMP_LICENSE = LGPLv2.1
+LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
 LIBSECCOMP_INSTALL_STAGING = YES
 LIBSECCOMP_AUTORECONF = YES
diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
index 20a217f..111b553 100644
--- a/package/libsecret/libsecret.mk
+++ b/package/libsecret/libsecret.mk
@@ -16,7 +16,7 @@ LIBSECRET_CONF_OPTS = \
 	--disable-coverage \
 	--enable-introspection=no \
 	--enable-vala=no
-LIBSECRET_LICENSE = LGPLv2.1+
+LIBSECRET_LICENSE = LGPL-2.1+
 LIBSECRET_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 7545594..c9f0f57 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -6,7 +6,7 @@
 
 LIBSEMANAGE_VERSION = 2.6
 LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
-LIBSEMANAGE_LICENSE = LGPLv2.1+
+LIBSEMANAGE_LICENSE = LGPL-2.1+
 LIBSEMANAGE_LICENSE_FILES = COPYING
 LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux ustr bzip2
 LIBSEMANAGE_INSTALL_STAGING = YES
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 61d1e61..9bdac1e 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -6,7 +6,7 @@
 
 LIBSEPOL_VERSION = 2.6
 LIBSEPOL_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
-LIBSEPOL_LICENSE = LGPLv2.1+
+LIBSEPOL_LICENSE = LGPL-2.1+
 LIBSEPOL_LICENSE_FILES = COPYING
 
 LIBSEPOL_INSTALL_STAGING = YES
diff --git a/package/libsexy/libsexy.mk b/package/libsexy/libsexy.mk
index c291d7d..b079264 100644
--- a/package/libsexy/libsexy.mk
+++ b/package/libsexy/libsexy.mk
@@ -8,7 +8,7 @@ LIBSEXY_VERSION = 0.1.11
 LIBSEXY_SITE = http://releases.chipx86.com/libsexy/libsexy
 LIBSEXY_DEPENDENCIES = libgtk2 libxml2
 LIBSEXY_INSTALL_STAGING = YES
-LIBSEXY_LICENSE = LGPLv2.1+
+LIBSEXY_LICENSE = LGPL-2.1+
 LIBSEXY_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libshairplay/libshairplay.mk b/package/libshairplay/libshairplay.mk
index 4bdd1a0..8360d79 100644
--- a/package/libshairplay/libshairplay.mk
+++ b/package/libshairplay/libshairplay.mk
@@ -8,7 +8,7 @@ LIBSHAIRPLAY_VERSION = ce80e005908f41d0e6fde1c4a21e9cb8ee54007b
 LIBSHAIRPLAY_SITE = $(call github,juhovh,shairplay,$(LIBSHAIRPLAY_VERSION))
 LIBSHAIRPLAY_INSTALL_STAGING = YES
 LIBSHAIRPLAY_AUTORECONF = YES
-LIBSHAIRPLAY_LICENSE = MIT, BSD-3c, LGPLv2.1+
+LIBSHAIRPLAY_LICENSE = MIT, BSD-3c, LGPL-2.1+
 LIBSHAIRPLAY_LICENSE_FILES = LICENSE
 LIBSHAIRPLAY_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_LIBAO),libao)
 
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index 590cbaa..d7cbd36 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -10,7 +10,7 @@ LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.xz
 LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/$(LIBSIGC_VERSION_MAJOR)
 LIBSIGC_DEPENDENCIES = host-m4
 LIBSIGC_INSTALL_STAGING = YES
-LIBSIGC_LICENSE = LGPLv2.1+
+LIBSIGC_LICENSE = LGPL-2.1+
 LIBSIGC_LICENSE_FILES = COPYING
 
 define LIBSIGC_INSTALL_TARGET_FIXUP
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index c5cd1de..936f4be 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -7,7 +7,7 @@
 LIBSNDFILE_VERSION = 1.0.27
 LIBSNDFILE_SITE = http://www.mega-nerd.com/libsndfile/files
 LIBSNDFILE_INSTALL_STAGING = YES
-LIBSNDFILE_LICENSE = LGPLv2.1+
+LIBSNDFILE_LICENSE = LGPL-2.1+
 LIBSNDFILE_LICENSE_FILES = COPYING
 
 LIBSNDFILE_CONF_OPTS = \
diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
index 03bef04..19a8c42 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -6,7 +6,7 @@
 
 LIBSOC_VERSION = 0.8.2
 LIBSOC_SITE = $(call github,jackmitch,libsoc,$(LIBSOC_VERSION))
-LIBSOC_LICENSE = LGPLv2.1
+LIBSOC_LICENSE = LGPL-2.1
 LIBSOC_LICENSE_FILES = LICENCE
 LIBSOC_AUTORECONF = YES
 LIBSOC_INSTALL_STAGING = YES
diff --git a/package/libsocketcan/libsocketcan.mk b/package/libsocketcan/libsocketcan.mk
index 65f3cb5..31ed0d3 100644
--- a/package/libsocketcan/libsocketcan.mk
+++ b/package/libsocketcan/libsocketcan.mk
@@ -8,6 +8,6 @@ LIBSOCKETCAN_VERSION = 0.0.10
 LIBSOCKETCAN_SITE = http://www.pengutronix.de/software/libsocketcan/download
 LIBSOCKETCAN_SOURCE = libsocketcan-$(LIBSOCKETCAN_VERSION).tar.bz2
 LIBSOCKETCAN_INSTALL_STAGING = YES
-LIBSOCKETCAN_LICENSE = LGPLv2.1+
+LIBSOCKETCAN_LICENSE = LGPL-2.1+
 
 $(eval $(autotools-package))
diff --git a/package/libsoundtouch/libsoundtouch.mk b/package/libsoundtouch/libsoundtouch.mk
index cdfec20..c4ac930 100644
--- a/package/libsoundtouch/libsoundtouch.mk
+++ b/package/libsoundtouch/libsoundtouch.mk
@@ -7,7 +7,7 @@
 LIBSOUNDTOUCH_VERSION = 010a91a59071c7fefd316fca62c0d980ec85b4b1
 LIBSOUNDTOUCH_SITE = https://freeswitch.org/stash/scm/sd/libsoundtouch.git
 LIBSOUNDTOUCH_SITE_METHOD = git
-LIBSOUNDTOUCH_LICENSE = LGPLv2.1+
+LIBSOUNDTOUCH_LICENSE = LGPL-2.1+
 LIBSOUNDTOUCH_LICENSE_FILES = COPYING.TXT
 LIBSOUNDTOUCH_AUTORECONF = YES
 LIBSOUNDTOUCH_INSTALL_STAGING = YES
diff --git a/package/libsoxr/libsoxr.mk b/package/libsoxr/libsoxr.mk
index 0fdc570..c1dc4b0 100644
--- a/package/libsoxr/libsoxr.mk
+++ b/package/libsoxr/libsoxr.mk
@@ -7,7 +7,7 @@
 LIBSOXR_VERSION = 0.1.2
 LIBSOXR_SOURCE = soxr-$(LIBSOXR_VERSION)-Source.tar.xz
 LIBSOXR_SITE = http://downloads.sourceforge.net/project/soxr
-LIBSOXR_LICENSE = LGPLv2.1+
+LIBSOXR_LICENSE = LGPL-2.1+
 LIBSOXR_LICENSE_FILES = LICENCE COPYING.LGPL
 LIBSOXR_INSTALL_STAGING = YES
 LIBSOXR_CONF_OPTS = -DWITH_OPENMP=OFF
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 429e3c1..b6b6dbb 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -7,7 +7,7 @@
 LIBSSH_VERSION = 0.7.3
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://red.libssh.org/attachments/download/195
-LIBSSH_LICENSE = LGPLv2.1
+LIBSSH_LICENSE = LGPL-2.1
 LIBSSH_LICENSE_FILES = COPYING
 LIBSSH_INSTALL_STAGING = YES
 LIBSSH_SUPPORTS_IN_SOURCE_BUILD = NO
diff --git a/package/libsvg-cairo/libsvg-cairo.mk b/package/libsvg-cairo/libsvg-cairo.mk
index 28c9141..f7a105e 100644
--- a/package/libsvg-cairo/libsvg-cairo.mk
+++ b/package/libsvg-cairo/libsvg-cairo.mk
@@ -8,7 +8,7 @@ LIBSVG_CAIRO_VERSION = 0.1.6
 LIBSVG_CAIRO_SITE = http://cairographics.org/snapshots
 LIBSVG_CAIRO_DEPENDENCIES = cairo libsvg
 LIBSVG_CAIRO_INSTALL_STAGING = YES
-LIBSVG_CAIRO_LICENSE = LGPLv2.1+
+LIBSVG_CAIRO_LICENSE = LGPL-2.1+
 LIBSVG_CAIRO_LICENSE_FILES = COPYING
 
 LIBSVG_CAIRO_CONF_OPTS = --without-x
diff --git a/package/libsysfs/libsysfs.mk b/package/libsysfs/libsysfs.mk
index e019583..13edc9a 100644
--- a/package/libsysfs/libsysfs.mk
+++ b/package/libsysfs/libsysfs.mk
@@ -8,7 +8,7 @@ LIBSYSFS_VERSION = 2.1.0
 LIBSYSFS_SITE = http://downloads.sourceforge.net/project/linux-diag/sysfsutils/$(LIBSYSFS_VERSION)
 LIBSYSFS_SOURCE = sysfsutils-$(LIBSYSFS_VERSION).tar.gz
 LIBSYSFS_INSTALL_STAGING = YES
-LIBSYSFS_LICENSE = GPL-2.0 (utilities), LGPLv2.1+ (library)
+LIBSYSFS_LICENSE = GPL-2.0 (utilities), LGPL-2.1+ (library)
 LIBSYSFS_LICENSE_FILES = cmd/GPL lib/LGPL
 
 $(eval $(autotools-package))
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index f471a51..714c4f8 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -7,7 +7,7 @@
 LIBTASN1_VERSION = 4.9
 LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison
-LIBTASN1_LICENSE = GPL-3.0+ (tests, tools), LGPLv2.1+ (library)
+LIBTASN1_LICENSE = GPL-3.0+ (tests, tools), LGPL-2.1+ (library)
 LIBTASN1_LICENSE_FILES = COPYING COPYING.LIB
 LIBTASN1_INSTALL_STAGING = YES
 # 'missing' fallback logic botched so disable it completely
diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index f1a359b..642238c 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -6,7 +6,7 @@
 
 LIBUCI_VERSION = 49ec6efbdac4819033d34f08927d795f83a3932d
 LIBUCI_SITE = git://git.openwrt.org/project/uci.git
-LIBUCI_LICENSE = LGPLv2.1, GPL-2.0 (tools)
+LIBUCI_LICENSE = LGPL-2.1, GPL-2.0 (tools)
 LIBUCI_INSTALL_STAGING = YES
 LIBUCI_DEPENDENCIES = libubox
 
diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
index 9e7ad6f..bdd29e3 100644
--- a/package/libuio/libuio.mk
+++ b/package/libuio/libuio.mk
@@ -7,7 +7,7 @@
 # v0.2.7
 LIBUIO_VERSION = 940861de278cb794bf9d775b76a4d1d4f9108607
 LIBUIO_SITE = $(call github,Linutronix,libuio,$(LIBUIO_VERSION))
-LIBUIO_LICENSE = LGPLv2.1 (library), GPL-2.0 (programs)
+LIBUIO_LICENSE = LGPL-2.1 (library), GPL-2.0 (programs)
 LIBUIO_LICENSE_FILES = COPYING
 LIBUIO_CONF_OPTS = --with-glib=no --without-werror
 LIBUIO_INSTALL_STAGING = YES
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index da2ba35..d8579f6 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -7,7 +7,7 @@
 LIBURCU_VERSION = 0.9.2
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
-LIBURCU_LICENSE = LGPLv2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPL-3.0 (few *.m4 files)
+LIBURCU_LICENSE = LGPL-2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPL-3.0 (few *.m4 files)
 LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt gpl-2.0.txt LICENSE
 
 LIBURCU_INSTALL_STAGING = YES
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 26107be..61d4c20 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -12,7 +12,7 @@ LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf libusb
 HOST_LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf host-libusb
 LIBUSB_COMPAT_INSTALL_STAGING = YES
 LIBUSB_COMPAT_CONFIG_SCRIPTS = libusb-config
-LIBUSB_COMPAT_LICENSE = LGPLv2.1+
+LIBUSB_COMPAT_LICENSE = LGPL-2.1+
 LIBUSB_COMPAT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 26ace1b..f0bb9e3 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -8,7 +8,7 @@ LIBUSB_VERSION_MAJOR = 1.0
 LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).21
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
-LIBUSB_LICENSE = LGPLv2.1+
+LIBUSB_LICENSE = LGPL-2.1+
 LIBUSB_LICENSE_FILES = COPYING
 LIBUSB_DEPENDENCIES = host-pkgconf
 LIBUSB_INSTALL_STAGING = YES
diff --git a/package/libusbgx/libusbgx.mk b/package/libusbgx/libusbgx.mk
index 721245f..1964b47 100644
--- a/package/libusbgx/libusbgx.mk
+++ b/package/libusbgx/libusbgx.mk
@@ -6,7 +6,7 @@
 
 LIBUSBGX_VERSION = 2e3d43ee098ed928d1baa61ce791ce9ff4788c5a
 LIBUSBGX_SITE = $(call github,libusbgx,libusbgx,$(LIBUSBGX_VERSION))
-LIBUSBGX_LICENSE = GPL-2.0+ (examples), LGPLv2.1+ (library)
+LIBUSBGX_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
 LIBUSBGX_LICENSE_FILES = COPYING COPYING.LGPL
 LIBUSBGX_DEPENDENCIES = host-pkgconf libconfig
 LIBUSBGX_AUTORECONF = YES
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 4fe7048..465f6cc 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -15,7 +15,7 @@ LIBV4L_CONF_OPTS = --disable-doxygen-doc
 LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
 # v4l-utils components have different licences, see v4l-utils.spec for details
-LIBV4L_LICENSE = GPL-2.0+ (utilities), LGPLv2.1+ (libraries)
+LIBV4L_LICENSE = GPL-2.0+ (utilities), LGPL-2.1+ (libraries)
 LIBV4L_LICENSE_FILES = COPYING COPYING.libv4l lib/libv4l1/libv4l1-kernelcode-license.txt
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 5f80b2d..974a4be 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -8,7 +8,7 @@ LIBVIPS_VERSION_MAJOR = 7.42
 LIBVIPS_VERSION = $(LIBVIPS_VERSION_MAJOR).2
 LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.gz
 LIBVIPS_SITE = http://www.vips.ecs.soton.ac.uk/supported/$(LIBVIPS_VERSION_MAJOR)
-LIBVIPS_LICENSE = LGPLv2.1+
+LIBVIPS_LICENSE = LGPL-2.1+
 LIBVIPS_LICENSE_FILES = COPYING
 # We're patching gtk-doc.make, so need to autoreconf
 LIBVIPS_AUTORECONF = YES
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 74b6b2b..511359c 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -6,7 +6,7 @@
 
 LIBWEBSOCKETS_VERSION = v2.1.1
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,$(LIBWEBSOCKETS_VERSION))
-LIBWEBSOCKETS_LICENSE = LGPLv2.1 with exceptions
+LIBWEBSOCKETS_LICENSE = LGPL-2.1 with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
 LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_INSTALL_STAGING = YES
diff --git a/package/libxmlpp/libxmlpp.mk b/package/libxmlpp/libxmlpp.mk
index d428199..cbedf61 100644
--- a/package/libxmlpp/libxmlpp.mk
+++ b/package/libxmlpp/libxmlpp.mk
@@ -6,7 +6,7 @@
 
 LIBXMLPP_VERSION_MAJOR = 2.40
 LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).1
-LIBXMLPP_LICENSE = LGPLv2.1 (library), LGPLv2+ (examples)
+LIBXMLPP_LICENSE = LGPL-2.1 (library), LGPLv2+ (examples)
 LIBXMLPP_LICENSE_FILES = COPYING
 LIBXMLPP_SOURCE = libxml++-$(LIBXMLPP_VERSION).tar.xz
 LIBXMLPP_SITE = http://ftp.gnome.org/pub/GNOME/sources/libxml++/$(LIBXMLPP_VERSION_MAJOR)
diff --git a/package/lite/lite.mk b/package/lite/lite.mk
index 9a1c917..ddb55d4 100644
--- a/package/lite/lite.mk
+++ b/package/lite/lite.mk
@@ -11,7 +11,7 @@ LITE_INSTALL_STAGING = YES
 LITE_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 LITE_CONF_ENV = DFB_CFLAGS=-I$(STAGING_DIR)/usr/include/directfb
 LITE_DEPENDENCIES = directfb
-LITE_LICENSE = LGPLv2.1+
+LITE_LICENSE = LGPL-2.1+
 LITE_LICENSE_FILES = COPYING
 
 define LITE_FINALIZE_INSTALL
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index f36cce3..a6dd13c 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -7,7 +7,7 @@
 LIVE555_VERSION = 2016.03.16
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
-LIVE555_LICENSE = LGPLv2.1+
+LIVE555_LICENSE = LGPL-2.1+
 LIVE555_LICENSE_FILES = COPYING
 LIVE555_INSTALL_STAGING = YES
 
diff --git a/package/lksctp-tools/lksctp-tools.mk b/package/lksctp-tools/lksctp-tools.mk
index 20776a7..5ac794e 100644
--- a/package/lksctp-tools/lksctp-tools.mk
+++ b/package/lksctp-tools/lksctp-tools.mk
@@ -9,7 +9,7 @@ LKSCTP_TOOLS_SITE = http://downloads.sourceforge.net/project/lksctp/lksctp-tools
 LKSCTP_TOOLS_INSTALL_STAGING = YES
 # configure not shipped
 LKSCTP_TOOLS_AUTORECONF = YES
-LKSCTP_TOOLS_LICENSE = LGPLv2.1 (library), GPL-2.0+ (programs)
+LKSCTP_TOOLS_LICENSE = LGPL-2.1 (library), GPL-2.0+ (programs)
 LKSCTP_TOOLS_LICENSE_FILES = COPYING.lib COPYING
 LKSCTP_TOOLS_CONF_OPTS = --disable-tests
 
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 89419bc..f581b5c 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -9,7 +9,7 @@ LM_SENSORS_SOURCE = lm-sensors_$(LM_SENSORS_VERSION).orig.tar.bz2
 LM_SENSORS_SITE = http://snapshot.debian.org/archive/debian/20170208T211941Z/pool/main/l/lm-sensors
 LM_SENSORS_INSTALL_STAGING = YES
 LM_SENSORS_DEPENDENCIES = host-bison host-flex
-LM_SENSORS_LICENSE = LGPLv2.1+ (libsensors), GPL-2.0+ (programs)
+LM_SENSORS_LICENSE = LGPL-2.1+ (libsensors), GPL-2.0+ (programs)
 LM_SENSORS_LICENSE_FILES = COPYING.LGPL COPYING
 
 LM_SENSORS_BINS_ = bin/sensors-conf-convert
diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
index a45e22e..e491b13 100644
--- a/package/lockdev/lockdev.mk
+++ b/package/lockdev/lockdev.mk
@@ -9,7 +9,7 @@ LOCKDEV_VERSION = $(LOCKDEV_VERSION_MAJOR).0.3
 LOCKDEV_SOURCE = lockdev_$(LOCKDEV_VERSION).orig.tar.gz
 LOCKDEV_PATCH = lockdev_$(LOCKDEV_VERSION)-1.6.diff.gz
 LOCKDEV_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockdev
-LOCKDEV_LICENSE = LGPLv2.1
+LOCKDEV_LICENSE = LGPL-2.1
 LOCKDEV_LICENSE_FILES = LICENSE
 LOCKDEV_INSTALL_STAGING = YES
 
diff --git a/package/log4cpp/log4cpp.mk b/package/log4cpp/log4cpp.mk
index df7109b..1801cff 100644
--- a/package/log4cpp/log4cpp.mk
+++ b/package/log4cpp/log4cpp.mk
@@ -9,7 +9,7 @@ LOG4CPP_VERSION = $(LOG4CPP_VERSION_MAJOR).1
 LOG4CPP_SITE = http://downloads.sourceforge.net/project/log4cpp/log4cpp-1.1.x%20%28new%29/log4cpp-$(LOG4CPP_VERSION_MAJOR)
 LOG4CPP_SUBDIR = log4cpp
 # The "or later" is indicated in the HTML documentation
-LOG4CPP_LICENSE = LGPLv2.1+
+LOG4CPP_LICENSE = LGPL-2.1+
 LOG4CPP_LICENSE_FILES = log4cpp/COPYING
 LOG4CPP_INSTALL_STAGING = YES
 LOG4CPP_CONF_OPTS = --enable-doxygen=no --enable-dot=no
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 1b2c654..cfd67de 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -7,7 +7,7 @@
 LTTNG_BABELTRACE_SITE = http://www.efficios.com/files/babeltrace
 LTTNG_BABELTRACE_VERSION = 1.5.2
 LTTNG_BABELTRACE_SOURCE = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
-LTTNG_BABELTRACE_LICENSE = MIT, LGPLv2.1 (include/babeltrace/list.h), GPL-2.0 (test code)
+LTTNG_BABELTRACE_LICENSE = MIT, LGPL-2.1 (include/babeltrace/list.h), GPL-2.0 (test code)
 LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2 host-pkgconf
 # The host-elfutils dependency is optional, but since we don't have
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index a195e2f..82923de 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -7,7 +7,7 @@
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
 LTTNG_LIBUST_VERSION = 2.9.0
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
-LTTNG_LIBUST_LICENSE = LGPLv2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
+LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
 LTTNG_LIBUST_INSTALL_STAGING = YES
 LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index ecc8992..9f624e5 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -7,7 +7,7 @@
 LTTNG_MODULES_VERSION = 2.9.1
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
-LTTNG_MODULES_LICENSE = LGPLv2.1/GPL-2.0 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
+LTTNG_MODULES_LICENSE = LGPL-2.1/GPL-2.0 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
 LTTNG_MODULES_LICENSE_FILES = lgpl-2.1.txt gpl-2.0.txt mit-license.txt LICENSE
 LTTNG_MODULES_MODULE_MAKE_OPTS = CONFIG_LTTNG=m CONFIG_LTTNG_CLOCK_PLUGIN_TEST=m
 
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 808e256..1714a42 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -7,7 +7,7 @@
 LTTNG_TOOLS_VERSION = 2.9.4
 LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
-LTTNG_TOOLS_LICENSE = GPL-2.0+, LGPLv2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
+LTTNG_TOOLS_LICENSE = GPL-2.0+, LGPL-2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
 LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
 LTTNG_TOOLS_CONF_OPTS += --disable-man-pages
 
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 068a400..ffc1043 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -8,7 +8,7 @@ LVM2_VERSION = 2.02.169
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
-LVM2_LICENSE = GPL-2.0, LGPLv2.1
+LVM2_LICENSE = GPL-2.0, LGPL-2.1
 LVM2_LICENSE_FILES = COPYING COPYING.LIB
 
 # Make sure that binaries and libraries are installed with write
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index b79197f..9412df5 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -6,7 +6,7 @@
 
 LXC_VERSION = 2.0.7
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
-LXC_LICENSE = LGPLv2.1+
+LXC_LICENSE = LGPL-2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = libcap host-pkgconf
 LXC_INSTALL_STAGING = YES
diff --git a/package/matchbox-lib/matchbox-lib.mk b/package/matchbox-lib/matchbox-lib.mk
index 451279e..ee206b6 100644
--- a/package/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox-lib/matchbox-lib.mk
@@ -7,7 +7,7 @@
 MATCHBOX_LIB_VERSION = 1.9
 MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.bz2
 MATCHBOX_LIB_SITE = http://downloads.yoctoproject.org/releases/matchbox/libmatchbox/$(MATCHBOX_LIB_VERSION)
-MATCHBOX_LIB_LICENSE = LGPLv2.1+
+MATCHBOX_LIB_LICENSE = LGPL-2.1+
 MATCHBOX_LIB_LICENSE_FILES = COPYING
 MATCHBOX_LIB_INSTALL_STAGING = YES
 MATCHBOX_LIB_DEPENDENCIES = host-pkgconf expat xlib_libXext
diff --git a/package/menu-cache/menu-cache.mk b/package/menu-cache/menu-cache.mk
index 1687825..b5fde99 100644
--- a/package/menu-cache/menu-cache.mk
+++ b/package/menu-cache/menu-cache.mk
@@ -9,7 +9,7 @@ MENU_CACHE_VERSION = $(MENU_CACHE_VERSION_MAJOR).1
 MENU_CACHE_SOURCE = menu-cache-$(MENU_CACHE_VERSION).tar.xz
 MENU_CACHE_SITE = http://sourceforge.net/projects/lxde/files/menu-cache/$(MENU_CACHE_VERSION_MAJOR)
 MENU_CACHE_DEPENDENCIES = libfm-extra libglib2
-MENU_CACHE_LICENSE = LGPLv2.1
+MENU_CACHE_LICENSE = LGPL-2.1
 MENU_CACHE_LICENSE_FILES = COPYING
 MENU_CACHE_INSTALL_STAGING = YES
 
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 5aa83c6..395e72e 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -7,7 +7,7 @@
 MIDORI_VERSION = 0.5.11
 MIDORI_SOURCE = midori_$(MIDORI_VERSION)_all_.tar.bz2
 MIDORI_SITE = http://midori-browser.org/downloads
-MIDORI_LICENSE = LGPLv2.1+
+MIDORI_LICENSE = LGPL-2.1+
 MIDORI_LICENSE_FILES = COPYING
 MIDORI_DEPENDENCIES = \
 	host-intltool \
diff --git a/package/miraclecast/miraclecast.mk b/package/miraclecast/miraclecast.mk
index f037a2e..f75191b 100644
--- a/package/miraclecast/miraclecast.mk
+++ b/package/miraclecast/miraclecast.mk
@@ -6,7 +6,7 @@
 
 MIRACLECAST_VERSION = c94be167c85c6ec8badd7ac79e3dea2e0b73225c
 MIRACLECAST_SITE = $(call github,albfan,miraclecast,$(MIRACLECAST_VERSION))
-MIRACLECAST_LICENSE = LGPLv2.1+, GPL-2.0 (gdhcp)
+MIRACLECAST_LICENSE = LGPL-2.1+, GPL-2.0 (gdhcp)
 MIRACLECAST_LICENSE_FILES = COPYING LICENSE_gdhcp LICENSE_htable LICENSE_lgpl
 MIRACLECAST_DEPENDENCIES = host-pkgconf systemd gstreamer1 \
 	readline libglib2
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 27c46dc..2431df1 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -9,7 +9,7 @@ MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
 MPG123_INSTALL_STAGING = YES
-MPG123_LICENSE = LGPLv2.1
+MPG123_LICENSE = LGPL-2.1
 MPG123_LICENSE_FILES = COPYING
 MPG123_DEPENDENCIES = host-pkgconf
 
diff --git a/package/musepack/musepack.mk b/package/musepack/musepack.mk
index db613a0..14f4921 100644
--- a/package/musepack/musepack.mk
+++ b/package/musepack/musepack.mk
@@ -10,7 +10,7 @@ MUSEPACK_SOURCE = musepack_src_$(MUSEPACK_VERSION).tar.gz
 MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
 MUSEPACK_INSTALL_STAGING = YES
 MUSEPACK_MAKE = $(MAKE1)
-MUSEPACK_LICENSE = BSD-3c (*mpcdec), LGPLv2.1+ (*mpcenc)
+MUSEPACK_LICENSE = BSD-3c (*mpcdec), LGPL-2.1+ (*mpcenc)
 MUSEPACK_LICENSE_FILES = libmpcdec/COPYING libmpcenc/quant.c
 
 $(eval $(cmake-package))
diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index 9ec9c1a..407b942 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -6,7 +6,7 @@
 
 NSS_MDNS_VERSION = 0.10
 NSS_MDNS_SITE = http://0pointer.de/lennart/projects/nss-mdns
-NSS_MDNS_LICENSE = LGPLv2.1+
+NSS_MDNS_LICENSE = LGPL-2.1+
 NSS_MDNS_LICENSE_FILES = LICENSE
 
 define NSS_MDNS_INSTALL_CONFIG
diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.mk b/package/nss-pam-ldapd/nss-pam-ldapd.mk
index ba25082..1c4f735 100644
--- a/package/nss-pam-ldapd/nss-pam-ldapd.mk
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.mk
@@ -6,7 +6,7 @@
 
 NSS_PAM_LDAPD_VERSION = 0.9.6
 NSS_PAM_LDAPD_SITE = http://arthurdejong.org/nss-pam-ldapd
-NSS_PAM_LDAPD_LICENSE = LGPLv2.1+
+NSS_PAM_LDAPD_LICENSE = LGPL-2.1+
 NSS_PAM_LDAPD_LICENSE_FILES = COPYING
 NSS_PAM_LDAPD_INSTALL_STAGING = YES
 
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index 83fdae7..b43bc89 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -9,7 +9,7 @@ NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download
 NUMACTL_PATCH = \
 	https://github.com/numactl/numactl/commit/3770bdc4fa7b9059db5cd2aa8bb09b50fa15e456.patch \
 	https://github.com/numactl/numactl/commit/31dc2951c758698bff060aeae8ffd8854616183b.patch
-NUMACTL_LICENSE = LGPLv2.1 (libnuma), GPL-2.0 (programs)
+NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
 NUMACTL_LICENSE_FILES = README
 NUMACTL_INSTALL_STAGING = YES
 
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
index 4f7cdcf..9b153b0 100644
--- a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
@@ -11,7 +11,7 @@ NVIDIA_TEGRA23_BINARIES_SOURCE = $(NVIDIA_TEGRA23_BASE)_R$(NVIDIA_TEGRA23_BINARI
 NVIDIA_TEGRA23_BINARIES_LICENSE = License For Customer Use of NVIDIA Software
 NVIDIA_TEGRA23_BINARIES_LICENSE_FILES = nv_tegra/LICENSE
 ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS),y)
-NVIDIA_TEGRA23_BINARIES_LICENSE += LGPLv2.1
+NVIDIA_TEGRA23_BINARIES_LICENSE += LGPL-2.1
 NVIDIA_TEGRA23_BINARIES_LICENSE_FILES += nv_tegra/nv_sample_apps/LICENSE.gst-openmax
 endif
 
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index a4f3501..251dda3 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -6,7 +6,7 @@
 
 OLA_VERSION = 0.10.2
 OLA_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLA_VERSION)
-OLA_LICENSE = LGPLv2.1+ (libola, libolacommon, Python bindings), GPL-2.0+ (libolaserver, olad, Python examples and tests)
+OLA_LICENSE = LGPL-2.1+ (libola, libolacommon, Python bindings), GPL-2.0+ (libolaserver, olad, Python examples and tests)
 OLA_LICENSE_FILES = LICENCE GPL LGPL
 OLA_INSTALL_STAGING = YES
 OLA_AUTORECONF = YES
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 5a456a9..e7c3057 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -12,7 +12,7 @@ OLSR_PLUGINS = arprefresh bmf dot_draw dyn_gw dyn_gw_plain httpinfo jsoninfo \
 	mdns nameservice p2pd pgraph secure txtinfo watchdog
 # Doesn't really need quagga but not very useful without it
 OLSR_PLUGINS += $(if $(BR2_PACKAGE_QUAGGA),quagga)
-OLSR_LICENSE = BSD-3c, LGPLv2.1+
+OLSR_LICENSE = BSD-3c, LGPL-2.1+
 OLSR_LICENSE_FILES = license.txt lib/pud/nmealib/LICENSE
 OLSR_DEPENDENCIES = host-flex host-bison
 
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index 98bae20..103930f 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -8,7 +8,7 @@ OMNIORB_VERSION = 4.2.1
 OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-$(OMNIORB_VERSION)
 OMNIORB_SOURCE = omniORB-$(OMNIORB_VERSION).tar.bz2
 OMNIORB_INSTALL_STAGING = YES
-OMNIORB_LICENSE = GPL2+, LGPLv2.1+
+OMNIORB_LICENSE = GPL2+, LGPL-2.1+
 OMNIORB_LICENSE_FILES = COPYING COPYING.LIB
 OMNIORB_DEPENDENCIES = host-omniorb
 HOST_OMNIORB_DEPENDENCIES = host-python
diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
index b6b2bf0..94ad26a 100644
--- a/package/openobex/openobex.mk
+++ b/package/openobex/openobex.mk
@@ -10,7 +10,7 @@ OPENOBEX_SITE = http://downloads.sourceforge.net/project/openobex/openobex/$(OPE
 OPENOBEX_SOURCE = openobex-$(OPENOBEX_VERSION)-Source.zip
 # Libraries seems to be released under LGPLv2.1+,
 # while other material is under GPLv2+.
-OPENOBEX_LICENSE = GPL-2.0+/LGPLv2.1+
+OPENOBEX_LICENSE = GPL-2.0+/LGPL-2.1+
 OPENOBEX_LICENSE_FILES = COPYING COPYING.LIB
 
 OPENOBEX_DEPENDENCIES = host-pkgconf
diff --git a/package/openpgm/openpgm.mk b/package/openpgm/openpgm.mk
index 42b0a5d..8c85344 100644
--- a/package/openpgm/openpgm.mk
+++ b/package/openpgm/openpgm.mk
@@ -6,7 +6,7 @@
 
 OPENPGM_VERSION = release-5-2-122
 OPENPGM_SITE = $(call github,steve-o,openpgm,$(OPENPGM_VERSION))
-OPENPGM_LICENSE = LGPLv2.1+
+OPENPGM_LICENSE = LGPL-2.1+
 OPENPGM_LICENSE_FILES = openpgm/pgm/LICENSE
 OPENPGM_INSTALL_STAGING = YES
 OPENPGM_SUBDIR = openpgm/pgm
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index d3eda5c..cc71324 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -7,7 +7,7 @@
 OPENVMTOOLS_VERSION = 5a9033ddfa95786d867e4d02bbb9a29bac8fb64f
 OPENVMTOOLS_SITE = $(call github,vmware,open-vm-tools,$(OPENVMTOOLS_VERSION))
 OPENVMTOOLS_SUBDIR = open-vm-tools
-OPENVMTOOLS_LICENSE = LGPLv2.1
+OPENVMTOOLS_LICENSE = LGPL-2.1
 OPENVMTOOLS_LICENSE_FILES = $(OPENVMTOOLS_SUBDIR)/COPYING
 
 # Autoreconf needed or config/missing will run configure again at buildtime
diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
index da17231..0bd61e8 100644
--- a/package/ortp/ortp.mk
+++ b/package/ortp/ortp.mk
@@ -9,7 +9,7 @@ ORTP_SITE = http://download.savannah.nongnu.org/releases/linphone/ortp/sources
 
 ORTP_CONF_OPTS = --disable-strict
 ORTP_INSTALL_STAGING = YES
-ORTP_LICENSE = LGPLv2.1+
+ORTP_LICENSE = LGPL-2.1+
 ORTP_LICENSE_FILES = COPYING
 ORTP_DEPENDENCIES = bctoolbox
 
diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
index 15d5138..1035a0d 100644
--- a/package/p7zip/p7zip.mk
+++ b/package/p7zip/p7zip.mk
@@ -7,7 +7,7 @@
 P7ZIP_VERSION = 15.14.1
 P7ZIP_SOURCE = p7zip_$(P7ZIP_VERSION)_src_all.tar.bz2
 P7ZIP_SITE = http://downloads.sourceforge.net/project/p7zip/p7zip/$(P7ZIP_VERSION)
-P7ZIP_LICENSE = LGPLv2.1+ with unRAR restriction
+P7ZIP_LICENSE = LGPL-2.1+ with unRAR restriction
 P7ZIP_LICENSE_FILES = DOC/License.txt
 
 # p7zip buildsystem is a mess: it plays dirty tricks with CFLAGS and
diff --git a/package/pangomm/pangomm.mk b/package/pangomm/pangomm.mk
index 7146532..9edcb16 100644
--- a/package/pangomm/pangomm.mk
+++ b/package/pangomm/pangomm.mk
@@ -8,7 +8,7 @@ PANGOMM_VERSION_MAJOR = 2.40
 PANGOMM_VERSION = $(PANGOMM_VERSION_MAJOR).1
 PANGOMM_SOURCE = pangomm-$(PANGOMM_VERSION).tar.xz
 PANGOMM_SITE = http://ftp.gnome.org/pub/gnome/sources/pangomm/$(PANGOMM_VERSION_MAJOR)
-PANGOMM_LICENSE = LGPLv2.1+ (library), GPL-2.0+ (tools)
+PANGOMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 PANGOMM_LICENSE_FILES = COPYING COPYING.tools
 PANGOMM_INSTALL_STAGING = YES
 PANGOMM_DEPENDENCIES = glibmm cairomm libsigc pango host-pkgconf
diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
index 8144cca..7a48cec 100644
--- a/package/pseudo/pseudo.mk
+++ b/package/pseudo/pseudo.mk
@@ -9,7 +9,7 @@ PSEUDO_SITE = https://git.yoctoproject.org/git/pseudo
 PSEUDO_SITE_METHOD = git
 
 # No "or later" clause.
-PSEUDO_LICENSE = LGPLv2.1
+PSEUDO_LICENSE = LGPL-2.1
 PSEUDO_LICENSE_FILES = COPYING
 
 HOST_PSEUDO_DEPENDENCIES = host-attr host-sqlite
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 74a028b..0c409a7 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -8,7 +8,7 @@ PULSEAUDIO_VERSION = 9.0
 PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases
 PULSEAUDIO_INSTALL_STAGING = YES
-PULSEAUDIO_LICENSE = LGPLv2.1+ (specific license for modules, see LICENSE file)
+PULSEAUDIO_LICENSE = LGPL-2.1+ (specific license for modules, see LICENSE file)
 PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
 PULSEAUDIO_CONF_OPTS = \
 	--disable-default-build-tests \
diff --git a/package/python-chardet/python-chardet.mk b/package/python-chardet/python-chardet.mk
index 1962954..0a4788b 100644
--- a/package/python-chardet/python-chardet.mk
+++ b/package/python-chardet/python-chardet.mk
@@ -8,7 +8,7 @@ PYTHON_CHARDET_VERSION = 2.3.0
 PYTHON_CHARDET_SOURCE = chardet-$(PYTHON_CHARDET_VERSION).tar.gz
 PYTHON_CHARDET_SITE = https://pypi.python.org/packages/7d/87/4e3a3f38b2f5c578ce44f8dc2aa053217de9f0b6d737739b0ddac38ed237
 PYTHON_CHARDET_SETUP_TYPE = setuptools
-PYTHON_CHARDET_LICENSE = LGPLv2.1+
+PYTHON_CHARDET_LICENSE = LGPL-2.1+
 PYTHON_CHARDET_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
diff --git a/package/python-dialog/python-dialog.mk b/package/python-dialog/python-dialog.mk
index b75d19f..01bcb76 100644
--- a/package/python-dialog/python-dialog.mk
+++ b/package/python-dialog/python-dialog.mk
@@ -7,7 +7,7 @@
 PYTHON_DIALOG_VERSION = 3.0.1
 PYTHON_DIALOG_SOURCE = python2-pythondialog-$(PYTHON_DIALOG_VERSION).tar.bz2
 PYTHON_DIALOG_SITE = http://downloads.sourceforge.net/project/pythondialog/pythondialog/$(PYTHON_DIALOG_VERSION)
-PYTHON_DIALOG_LICENSE = LGPLv2.1+
+PYTHON_DIALOG_LICENSE = LGPL-2.1+
 PYTHON_DIALOG_LICENSE_FILES = COPYING
 PYTHON_DIALOG_SETUP_TYPE = distutils
 PYTHON_DIALOG_DEPENDENCIES = dialog
diff --git a/package/python-dialog3/python-dialog3.mk b/package/python-dialog3/python-dialog3.mk
index abc4a39..4048447 100644
--- a/package/python-dialog3/python-dialog3.mk
+++ b/package/python-dialog3/python-dialog3.mk
@@ -7,7 +7,7 @@
 PYTHON_DIALOG3_VERSION = 3.4.0
 PYTHON_DIALOG3_SOURCE = pythondialog-$(PYTHON_DIALOG3_VERSION).tar.bz2
 PYTHON_DIALOG3_SITE = https://pypi.python.org/packages/fa/f4/686742f01ebb5863d4c5e1acab620acfed0fe97280a26b4ed25917f4f333
-PYTHON_DIALOG3_LICENSE = LGPLv2.1+
+PYTHON_DIALOG3_LICENSE = LGPL-2.1+
 PYTHON_DIALOG3_LICENSE_FILES = COPYING
 PYTHON_DIALOG3_SETUP_TYPE = distutils
 PYTHON_DIALOG3_DEPENDENCIES = dialog
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 74cb054..a52eebf 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -8,7 +8,7 @@ PYTHON_GOBJECT_VERSION_MAJOR = 2.28
 PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).6
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
 PYTHON_GOBJECT_SITE = http://ftp.gnome.org/pub/gnome/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
-PYTHON_GOBJECT_LICENSE = LGPLv2.1+
+PYTHON_GOBJECT_LICENSE = LGPL-2.1+
 PYTHON_GOBJECT_LICENSE_FILES = COPYING
 PYTHON_GOBJECT_DEPENDENCIES = host-pkgconf libglib2
 PYTHON_GOBJECT_CONF_OPTS = --disable-introspection
diff --git a/package/python-pam/python-pam.mk b/package/python-pam/python-pam.mk
index d737291..943e01d 100644
--- a/package/python-pam/python-pam.mk
+++ b/package/python-pam/python-pam.mk
@@ -9,7 +9,7 @@ PYTHON_PAM_SOURCE = PyPAM-$(PYTHON_PAM_VERSION).tar.gz
 # pangalactic.org gone
 PYTHON_PAM_SITE = http://pkgs.fedoraproject.org/repo/pkgs/PyPAM/PyPAM-0.5.0.tar.gz/f1e7c2c56421dda28a75ace59a3c8871
 PYTHON_PAM_SETUP_TYPE = distutils
-PYTHON_PAM_LICENSE = LGPLv2.1
+PYTHON_PAM_LICENSE = LGPL-2.1
 PYTHON_PAM_LICENSE_FILES = COPYING
 PYTHON_PAM_DEPENDENCIES = linux-pam
 
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 6c0df4d..755a7db 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -8,7 +8,7 @@ PYTHON_PARAMIKO_VERSION = 2.1.1
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
 PYTHON_PARAMIKO_SITE = https://pypi.python.org/packages/d1/5a/ebd00d884f30baf208359a027eb7b38372d81d0c004724bb1aa71ae43b37
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
-PYTHON_PARAMIKO_LICENSE = LGPLv2.1+
+PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
index 1ef2bdf..8deb42a 100644
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -11,7 +11,7 @@ PYTHON_PYGAME_SOURCE = pygame-$(PYTHON_PYGAME_VERSION).tar.gz
 PYTHON_PYGAME_SITE = https://bitbucket.org/pygame/pygame
 PYTHON_PYGAME_SITE_METHOD = hg
 PYTHON_PYGAME_SETUP_TYPE = distutils
-PYTHON_PYGAME_LICENSE = LGPLv2.1+
+PYTHON_PYGAME_LICENSE = LGPL-2.1+
 PYTHON_PYGAME_LICENSE_FILES = LGPL
 
 ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_IMAGE),y)
diff --git a/package/python-pyudev/python-pyudev.mk b/package/python-pyudev/python-pyudev.mk
index 70c4faf..db941ea 100644
--- a/package/python-pyudev/python-pyudev.mk
+++ b/package/python-pyudev/python-pyudev.mk
@@ -7,7 +7,7 @@
 PYTHON_PYUDEV_VERSION = 0.18
 PYTHON_PYUDEV_SOURCE = pyudev-$(PYTHON_PYUDEV_VERSION).tar.gz
 PYTHON_PYUDEV_SITE = https://pypi.python.org/packages/source/p/pyudev
-PYTHON_PYUDEV_LICENSE = LGPLv2.1+
+PYTHON_PYUDEV_LICENSE = LGPL-2.1+
 PYTHON_PYUDEV_LICENSE_FILES = COPYING
 PYTHON_PYUDEV_SETUP_TYPE = setuptools
 
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index e52a155..4cfee47 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -7,7 +7,7 @@
 PYTHON_URWID_VERSION = 1.3.1
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
 PYTHON_URWID_SITE = https://pypi.python.org/packages/source/u/urwid
-PYTHON_URWID_LICENSE = LGPLv2.1+
+PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
 
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 6c42490..4dffaed 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -7,7 +7,7 @@
 QEMU_VERSION = 2.8.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
-QEMU_LICENSE = GPL-2.0, LGPLv2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
+QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
 QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #?NOTE: there is no top-level license file for non-(L)GPL licenses;
 #       the non-(L)GPL license texts are specified in the affected
diff --git a/package/qjson/qjson.mk b/package/qjson/qjson.mk
index dab2381..1777b94 100644
--- a/package/qjson/qjson.mk
+++ b/package/qjson/qjson.mk
@@ -10,7 +10,7 @@ QJSON_INSTALL_STAGING = YES
 QJSON_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_QT),qt) \
 	$(if $(BR2_PACKAGE_QT5),qt5base)
-QJSON_LICENSE = LGPLv2.1
+QJSON_LICENSE = LGPL-2.1
 QJSON_LICENSE_FILES = COPYING.lib
 
 $(eval $(cmake-package))
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 68d407e..1fdb1bf 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -21,7 +21,7 @@ QT_PATCH = https://github.com/qtproject/qtbase/commit/b8f98d956501dfa4ce03a137f1
 QT_DEPENDENCIES = host-pkgconf
 QT_INSTALL_STAGING = YES
 
-QT_LICENSE := LGPLv2.1 with exceptions or GPL-3.0
+QT_LICENSE := LGPL-2.1 with exceptions or GPL-3.0
 ifneq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
 QT_LICENSE := $(QT_LICENSE) or Digia Qt Commercial license
 endif
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index a8e044a..706a7dc 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -53,7 +53,7 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5BASE_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5BASE_LICENSE = GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5BASE_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5BASE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 08eda9f..11a16e7 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5CONNECTIVITY_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5CONNECTIVITY_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5CONNECTIVITY_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 63a5a63..546f13d 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5DECLARATIVE_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5DECLARATIVE_LICENSE = GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5DECLARATIVE_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index c39b953..8d0f385 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -13,7 +13,7 @@ QT5ENGINIO_DEPENDENCIES = openssl qt5base
 QT5ENGINIO_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5ENGINIO_LICENSE = GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5ENGINIO_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5ENGINIO_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5ENGINIO_LICENSE := $(QT5ENGINIO_LICENSE), BSD-3c (examples)
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 78aa570..281c766 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5GRAPHICALEFFECTS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5GRAPHICALEFFECTS_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5GRAPHICALEFFECTS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index afc7a45..658ab68 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5IMAGEFORMATS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5IMAGEFORMATS_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5IMAGEFORMATS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index da55f64..3b9b5d0 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5LOCATION_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5LOCATION_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5LOCATION_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5LOCATION_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5LOCATION_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 012ce1f..93b14d3 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5MULTIMEDIA_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5MULTIMEDIA_LICENSE = GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5MULTIMEDIA_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index 43971c7..ec9b750 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -11,7 +11,7 @@ QT5SCRIPT_DEPENDENCIES = qt5base
 QT5SCRIPT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5SCRIPT_LICENSE = GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5SCRIPT_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5SCRIPT_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5SCRIPT_LICENSE = Commercial license
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index b89149c..bf3ab1c 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5SENSORS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5SENSORS_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5SENSORS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index d81af17..d6a0bfb 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5SERIALPORT_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5SERIALPORT_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5SERIALPORT_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index 787c4aa..ec82334 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5SVG_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5SVG_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5SVG_LICENSE = GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5SVG_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5SVG_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index 6a843fa..d531ecf 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -24,7 +24,7 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5TOOLS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5TOOLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5TOOLS_LICENSE = GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5TOOLS_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5TOOLS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index 93d3ed6..18544b8 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBCHANNEL_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5WEBCHANNEL_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5WEBCHANNEL_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 980d2af..09d09fd 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -15,12 +15,12 @@ QT5WEBKIT_INSTALL_STAGING = YES
 QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5WEBKIT_LICENSE = LGPLv2.1+, BSD-3c, BSD-2c
+QT5WEBKIT_LICENSE = LGPL-2.1+, BSD-3c, BSD-2c
 # Source files contain references to LGPL_EXCEPTION.txt but it is not included
 # in the archive.
 QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21
 else
-QT5WEBKIT_LICENSE = LGPLv2.1+ (WebCore), Commercial license
+QT5WEBKIT_LICENSE = LGPL-2.1+ (WebCore), Commercial license
 QT5WEBKIT_REDISTRIBUTE = NO
 endif
 
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index be0fc87..cbe06d8 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBSOCKETS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools)
 QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3
 else
-QT5WEBSOCKETS_LICENSE = GPL-3.0 or LGPLv2.1 with exception or LGPLv3
+QT5WEBSOCKETS_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPLv3
 QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 119d15e..78f8aee 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5X11EXTRAS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5X11EXTRAS_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5X11EXTRAS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index bb2f4ed..fa2bfa8 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5XMLPATTERNS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5XMLPATTERNS_LICENSE = GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5XMLPATTERNS_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index caf112e..09037a5 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -11,7 +11,7 @@ QUAZIP_DEPENDENCIES = \
 	zlib \
 	$(if $(BR2_PACKAGE_QT),qt) \
 	$(if $(BR2_PACKAGE_QT5),qt5base)
-QUAZIP_LICENSE = LGPLv2.1
+QUAZIP_LICENSE = LGPL-2.1
 QUAZIP_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_QT5),y)
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index d1bb524..d4e6d52 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -16,7 +16,7 @@ QWT_DEPENDENCIES += qt5base
 QWT_QMAKE = $(QT5_QMAKE)
 endif
 
-QWT_LICENSE = LGPLv2.1 with exceptions
+QWT_LICENSE = LGPL-2.1 with exceptions
 QWT_LICENSE_FILES = COPYING
 
 QWT_CONFIG = 's%QWT_INSTALL_PREFIX.*/usr/local/.*%QWT_INSTALL_PREFIX = /usr%'
diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
index 445d2be..4c7135f 100644
--- a/package/raptor/raptor.mk
+++ b/package/raptor/raptor.mk
@@ -8,7 +8,7 @@ RAPTOR_VERSION = 2.0.15
 RAPTOR_SOURCE = raptor2-$(RAPTOR_VERSION).tar.gz
 RAPTOR_SITE = http://download.librdf.org/source
 RAPTOR_DEPENDENCIES = libxml2 libxslt
-RAPTOR_LICENSE = GPL-2.0+ or LGPLv2.1+ or Apache-2.0+
+RAPTOR_LICENSE = GPL-2.0+ or LGPL-2.1+ or Apache-2.0+
 RAPTOR_LICENSE_FILES = LICENSE.txt
 RAPTOR_INSTALL_STAGING = YES
 
diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 2e3428f..2472b52 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -9,7 +9,7 @@ RTMPDUMP_SITE = git://git.ffmpeg.org/rtmpdump
 RTMPDUMP_INSTALL_STAGING = YES
 # Note that rtmpdump is GPLv2 but librtmp has its own license and since we only
 # care about librtmp, it's LGPLv2.1+
-RTMPDUMP_LICENSE = LGPLv2.1+
+RTMPDUMP_LICENSE = LGPL-2.1+
 RTMPDUMP_LICENSE_FILES = librtmp/COPYING
 RTMPDUMP_DEPENDENCIES = zlib
 
diff --git a/package/sbc/sbc.mk b/package/sbc/sbc.mk
index 6bafe03..77661c1 100644
--- a/package/sbc/sbc.mk
+++ b/package/sbc/sbc.mk
@@ -9,7 +9,7 @@ SBC_SOURCE = sbc-$(SBC_VERSION).tar.xz
 SBC_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 SBC_INSTALL_STAGING = YES
 SBC_DEPENDENCIES = libsndfile host-pkgconf
-SBC_LICENSE = GPL-2.0+ (programs), LGPLv2.1+ (library)
+SBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 SBC_LICENSE_FILES = COPYING COPYING.LIB
 
 $(eval $(autotools-package))
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 38b4b97..0a6a7de 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -7,7 +7,7 @@
 SDL_VERSION = 1.2.15
 SDL_SOURCE = SDL-$(SDL_VERSION).tar.gz
 SDL_SITE = http://www.libsdl.org/release
-SDL_LICENSE = LGPLv2.1+
+SDL_LICENSE = LGPL-2.1+
 SDL_LICENSE_FILES = COPYING
 SDL_INSTALL_STAGING = YES
 
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 4fa7d9b..6c4f959 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -7,7 +7,7 @@
 SDL_SOUND_VERSION = 1.0.3
 SDL_SOUND_SOURCE = SDL_sound-$(SDL_SOUND_VERSION).tar.gz
 SDL_SOUND_SITE = http://icculus.org/SDL_sound/downloads
-SDL_SOUND_LICENSE = LGPLv2.1+
+SDL_SOUND_LICENSE = LGPL-2.1+
 SDL_SOUND_LICENSE_FILES = COPYING
 SDL_SOUND_INSTALL_STAGING = YES
 SDL_SOUND_DEPENDENCIES = sdl
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 7ff14ac..532e3d0 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -9,7 +9,7 @@ SETOOLS_SOURCE = setools-$(SETOOLS_VERSION).tar.bz2
 SETOOLS_SITE = https://raw.githubusercontent.com/wiki/TresysTechnology/setools3/files/dists/setools-$(SETOOLS_VERSION)
 SETOOLS_DEPENDENCIES = libselinux libsepol sqlite libxml2 bzip2 host-bison host-flex
 SETOOLS_INSTALL_STAGING = YES
-SETOOLS_LICENSE = GPL-2.0+, LGPLv2.1+
+SETOOLS_LICENSE = GPL-2.0+, LGPL-2.1+
 SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 
 # configure.ac is patched by the cross compile patch,
diff --git a/package/smack/smack.mk b/package/smack/smack.mk
index 3ef4d47..7a4c722 100644
--- a/package/smack/smack.mk
+++ b/package/smack/smack.mk
@@ -6,7 +6,7 @@
 
 SMACK_VERSION = v1.1.0
 SMACK_SITE = $(call github,smack-team,smack,$(SMACK_VERSION))
-SMACK_LICENSE = LGPLv2.1
+SMACK_LICENSE = LGPL-2.1
 SMACK_LICENSE_FILES = COPYING
 SMACK_INSTALL_STAGING = YES
 SMACK_DEPENDENCIES = host-pkgconf
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 5ece448..831b9ea 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -8,7 +8,7 @@ SOFIA_SIP_VERSION = 1.12.11
 SOFIA_SIP_SITE = http://downloads.sourceforge.net/project/sofia-sip/sofia-sip/$(SOFIA_SIP_VERSION)
 SOFIA_SIP_INSTALL_STAGING = YES
 SOFIA_SIP_DEPENDENCIES = host-pkgconf
-SOFIA_SIP_LICENSE = LGPLv2.1+
+SOFIA_SIP_LICENSE = LGPL-2.1+
 SOFIA_SIP_LICENSE_FILES = COPYING COPYRIGHTS
 SOFIA_SIP_CONF_OPTS = --with-doxygen=no
 
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 186f37d..0b3dc13 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -10,7 +10,7 @@ SOX_SOURCE = sox-$(SOX_VERSION).tar.bz2
 SOX_DEPENDENCIES = host-pkgconf
 SOX_CONF_OPTS = --with-distro="Buildroot" --without-ffmpeg --disable-gomp \
 	$(if $(BR2_TOOLCHAIN_HAS_SSP),,--disable-stack-protector)
-SOX_LICENSE = GPL-2.0+ (sox binary), LGPLv2.1+ (libraries)
+SOX_LICENSE = GPL-2.0+ (sox binary), LGPL-2.1+ (libraries)
 SOX_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
 
 # MIPS Codescape toolchains don't support stack-smashing protection
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 61a9772..0474538 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -7,7 +7,7 @@
 SPICE_VERSION = 0.12.4
 SPICE_SOURCE = spice-$(SPICE_VERSION).tar.bz2
 SPICE_SITE = http://www.spice-space.org/download/releases
-SPICE_LICENSE = LGPLv2.1+
+SPICE_LICENSE = LGPL-2.1+
 SPICE_LICENSE_FILES = COPYING
 SPICE_INSTALL_STAGING = YES
 SPICE_DEPENDENCIES =        \
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index ea5c42e..14107f0 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -8,7 +8,7 @@ SYLPHEED_VERSION_MAJOR = 3.2
 SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).0
 SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
 SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
-SYLPHEED_LICENSE = GPL-2.0+ (executables), LGPLv2.1+ (library, attachment plugin)
+SYLPHEED_LICENSE = GPL-2.0+ (executables), LGPL-2.1+ (library, attachment plugin)
 SYLPHEED_LICENSE_FILES = COPYING COPYING.LIB
 SYLPHEED_CONF_OPTS = --disable-gtkspell --disable-gpgme
 SYLPHEED_DEPENDENCIES = host-pkgconf libgtk2
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 8f56f5c..192a52b 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 SYSLOG_NG_VERSION = 3.9.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
-SYSLOG_NG_LICENSE = LGPLv2.1+ (syslog-ng core), GPL-2.0+ (modules)
+SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING
 SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 	eventlog libglib2 openssl pcre
diff --git a/package/systemd-bootchart/systemd-bootchart.mk b/package/systemd-bootchart/systemd-bootchart.mk
index 31b9413..3be3918 100644
--- a/package/systemd-bootchart/systemd-bootchart.mk
+++ b/package/systemd-bootchart/systemd-bootchart.mk
@@ -10,7 +10,7 @@ SYSTEMD_BOOTCHART_SOURCE = systemd-bootchart-$(SYSTEMD_BOOTCHART_VERSION).tar.xz
 # contains the generated autotools scripts. It also slightly differs with
 # two missing source files... :-/
 SYSTEMD_BOOTCHART_SITE = https://github.com/systemd/systemd-bootchart/releases/download/v$(SYSTEMD_BOOTCHART_VERSION)
-SYSTEMD_BOOTCHART_LICENSE = LGPLv2.1+
+SYSTEMD_BOOTCHART_LICENSE = LGPL-2.1+
 SYSTEMD_BOOTCHART_LICENSE_FILES = LICENSE.LGPL2.1
 SYSTEMD_BOOTCHART_DEPENDENCIES = systemd
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index d8ebec8..d8872c4 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -6,7 +6,7 @@
 
 SYSTEMD_VERSION = 233
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
-SYSTEMD_LICENSE = LGPLv2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
+SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 58bb889..6f36347 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -7,7 +7,7 @@
 TAGLIB_VERSION = 1.11.1
 TAGLIB_SITE = http://taglib.github.io/releases
 TAGLIB_INSTALL_STAGING = YES
-TAGLIB_LICENSE = LGPLv2.1 or MPL-1.1
+TAGLIB_LICENSE = LGPL-2.1 or MPL-1.1
 TAGLIB_LICENSE_FILES = COPYING.LGPL COPYING.MPL
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
index bbaa686..4c457a5 100644
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -8,7 +8,7 @@ TN5250_VERSION = 0.17.4
 TN5250_SITE = http://downloads.sourceforge.net/project/tn5250/tn5250/$(TN5250_VERSION)
 TN5250_MAKE_OPTS = CPPFLAGS=""
 TN5250_DEPENDENCIES = ncurses
-TN5250_LICENSE = LGPLv2.1+
+TN5250_LICENSE = LGPL-2.1+
 TN5250_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index a4f2255..9d2154d 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -8,7 +8,7 @@ TRACE_CMD_VERSION = trace-cmd-v2.6
 TRACE_CMD_SITE = $(BR2_KERNEL_MIRROR)/scm/linux/kernel/git/rostedt/trace-cmd.git
 TRACE_CMD_SITE_METHOD = git
 TRACE_CMD_INSTALL_STAGING = YES
-TRACE_CMD_LICENSE = GPL-2.0, LGPLv2.1
+TRACE_CMD_LICENSE = GPL-2.0, LGPL-2.1
 TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB
 
 TRACE_CMD_DEPENDENCIES = host-pkgconf
diff --git a/package/twolame/twolame.mk b/package/twolame/twolame.mk
index a26491f..d5628d1 100644
--- a/package/twolame/twolame.mk
+++ b/package/twolame/twolame.mk
@@ -8,7 +8,7 @@ TWOLAME_VERSION = 0.3.13
 TWOLAME_SITE = http://downloads.sourceforge.net/project/twolame/twolame/$(TWOLAME_VERSION)
 TWOLAME_DEPENDENCIES = host-pkgconf libsndfile
 TWOLAME_INSTALL_STAGING = YES
-TWOLAME_LICENSE = LGPLv2.1+
+TWOLAME_LICENSE = LGPL-2.1+
 TWOLAME_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
index 08c9ce2..5fb57ea 100644
--- a/package/ubus/ubus.mk
+++ b/package/ubus/ubus.mk
@@ -7,7 +7,7 @@
 UBUS_VERSION = 34c6e818e431cc53478a0f7c7c1eca07d194d692
 UBUS_SITE = git://git.openwrt.org/project/ubus.git
 
-UBUS_LICENSE = LGPLv2.1
+UBUS_LICENSE = LGPL-2.1
 UBUS_LICENSE_FILES = ubusd_acl.h
 
 UBUS_INSTALL_STAGING = YES
diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
index 0e2b584..93736ed 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.mk
+++ b/package/uclibc-ng-test/uclibc-ng-test.mk
@@ -6,7 +6,7 @@
 
 UCLIBC_NG_TEST_VERSION = c9b9876cefc142a23aa622b821290ed16af80058
 UCLIBC_NG_TEST_SITE = git://uclibc-ng.org/git/uclibc-ng-test
-UCLIBC_NG_TEST_LICENSE = LGPLv2.1+
+UCLIBC_NG_TEST_LICENSE = LGPL-2.1+
 UCLIBC_NG_TEST_LICENSE_FILES = COPYING.LIB
 
 # the math tests are recently synced from glibc and need more adaption before
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 8f6035e..91baf73 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -7,7 +7,7 @@
 UCLIBC_VERSION = 1.0.22
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
-UCLIBC_LICENSE = LGPLv2.1+
+UCLIBC_LICENSE = LGPL-2.1+
 UCLIBC_LICENSE_FILES = COPYING.LIB
 UCLIBC_INSTALL_STAGING = YES
 
diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
index 387f804..d4aa02e 100644
--- a/package/unixodbc/unixodbc.mk
+++ b/package/unixodbc/unixodbc.mk
@@ -8,7 +8,7 @@ UNIXODBC_VERSION = 2.3.4
 UNIXODBC_SOURCE = unixODBC-$(UNIXODBC_VERSION).tar.gz
 UNIXODBC_SITE = ftp://ftp.unixodbc.org/pub/unixODBC
 UNIXODBC_INSTALL_STAGING = YES
-UNIXODBC_LICENSE = LGPLv2.1+ (library), GPL-2.0+ (programs)
+UNIXODBC_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (programs)
 UNIXODBC_LICENSE_FILES = COPYING exe/COPYING
 
 UNIXODBC_CONF_OPTS = --enable-drivers --enable-driver-conf
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index ae251d6..02cd47c 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -7,7 +7,7 @@
 USBREDIR_VERSION = 0.7.1
 USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.bz2
 USBREDIR_SITE = http://spice-space.org/download/usbredir
-USBREDIR_LICENSE = LGPLv2.1+ (libraries)
+USBREDIR_LICENSE = LGPL-2.1+ (libraries)
 USBREDIR_LICENSE_FILES = COPYING.LIB
 USBREDIR_INSTALL_STAGING = YES
 USBREDIR_DEPENDENCIES = host-pkgconf libusb
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 42a4a43..6989749 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -14,7 +14,7 @@ UTIL_LINUX_AUTORECONF = YES
 
 # README.licensing claims that some files are GPLv2-only, but this is not true.
 # Some files are GPLv3+ but only in tests.
-UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4c, LGPLv2.1+ (libblkid, libfdisk, libmount), BSD-3c (libuuid)
+UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4c, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3c (libuuid)
 UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 70dc4b9..0ef3000 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -8,7 +8,7 @@ VALA_VERSION_MAJOR = 0.34
 VALA_VERSION = $(VALA_VERSION_MAJOR).7
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
-VALA_LICENSE = LGPLv2.1+
+VALA_LICENSE = LGPL-2.1+
 VALA_LICENSE_FILES = COPYING
 
 HOST_VALA_DEPENDENCIES = host-bison host-flex host-libglib2
diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index 6e0a074..ed59b6d 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -7,7 +7,7 @@
 VDE2_VERSION = 2.3.2
 VDE2_SOURCE = vde2-$(VDE2_VERSION).tar.bz2
 VDE2_SITE = http://downloads.sourceforge.net/project/vde/vde2/$(VDE2_VERSION)
-VDE2_LICENSE = GPL-2.0+, LGPLv2.1+, BSD-3c
+VDE2_LICENSE = GPL-2.0+, LGPL-2.1+, BSD-3c
 VDE2_LICENSE_FILES = COPYING COPYING.libvdeplug COPYING.slirpvde
 VDE2_INSTALL_STAGING = YES
 
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 86418c3..6fc7734 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -7,7 +7,7 @@
 VLC_VERSION = 2.2.4
 VLC_SITE = http://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
-VLC_LICENSE = GPL-2.0+, LGPLv2.1+
+VLC_LICENSE = GPL-2.0+, LGPL-2.1+
 VLC_LICENSE_FILES = COPYING COPYING.LIB
 VLC_DEPENDENCIES = host-pkgconf
 VLC_AUTORECONF = YES
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 7843373..8e253b5 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -8,7 +8,7 @@ WEBKITGTK_VERSION = 2.12.5
 WEBKITGTK_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-WEBKITGTK_LICENSE = LGPLv2.1+, BSD-2c
+WEBKITGTK_LICENSE = LGPL-2.1+, BSD-2c
 WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2.1
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index f9b2e1a..5c47186 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -7,7 +7,7 @@
 WINE_VERSION = 2.0
 WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
 WINE_SITE = https://dl.winehq.org/wine/source/2.0
-WINE_LICENSE = LGPLv2.1+
+WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_DEPENDENCIES = host-bison host-flex host-wine
 
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 5125473..1b0b16c 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -13,7 +13,7 @@ endif
 
 XENOMAI_SITE = https://xenomai.org/downloads/xenomai/stable
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
-XENOMAI_LICENSE = GPL-2.0+ with exception (headers), LGPLv2.1+ (libraries), GPL-2.0+ (kernel), GFDLv1.2+ (docs), GPL-2.0 (ipipe patch, can driver)
+XENOMAI_LICENSE = GPL-2.0+ with exception (headers), LGPL-2.1+ (libraries), GPL-2.0+ (kernel), GFDLv1.2+ (docs), GPL-2.0 (ipipe patch, can driver)
 # GFDL is not included but refers to gnu.org
 XENOMAI_LICENSE_FILES = debian/copyright include/COPYING lib/trank/COPYING kernel/cobalt/COPYING
 
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 83e834c..e8116f2 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -9,7 +9,7 @@ XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-XZ_LICENSE = GPL-2.0+, GPL-3.0+, LGPLv2.1+
+XZ_LICENSE = GPL-2.0+, GPL-3.0+, LGPL-2.1+
 XZ_LICENSE_FILES = COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index aba78d1..c8fc899 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -7,7 +7,7 @@
 # github have some additional commits for compiling with recent kernel
 ZBAR_VERSION = 854a5d97059e395807091ac4d80c53f7968abb8f
 ZBAR_SITE = $(call github,ZBar,Zbar,$(ZBAR_VERSION))
-ZBAR_LICENSE = LGPLv2.1+
+ZBAR_LICENSE = LGPL-2.1+
 ZBAR_LICENSE_FILES = LICENSE
 ZBAR_INSTALL_STAGING = YES
 ZBAR_AUTORECONF = YES
diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index 4f7f469..8e005e4 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -6,7 +6,7 @@
 
 ZLOG_VERSION = 6ddb9bbf3ff0123e701bf60996f351576ebe9c00
 ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
-ZLOG_LICENSE = LGPLv2.1
+ZLOG_LICENSE = LGPL-2.1
 ZLOG_LICENSE_FILES = COPYING
 ZLOG_INSTALL_STAGING = YES
 
-- 
2.6.2
