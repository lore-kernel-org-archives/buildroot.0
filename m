From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 25 Sep 2013 10:56:36 +0200
Subject: [Buildroot] [PATCH 3 of 3 v2] Config.in files: unify comments of
 toolchain option dependencies
In-Reply-To: <patchbomb.1380099393@argentina>
References: <patchbomb.1380099393@argentina>
Message-ID: <f887ff597719501222ec.1380099396@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch lines up the comments in Config.in files that clarify which toolchain
options the package depends on.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: partial line-up with current master

Notes:
- This patch does not yet touch the C library dependencies, see notes in
previous patch.

- This patch needs to be updated with the last master. Because new comments are
constantly added, especially by Gustavo, I propose the following process:
1. Agreement is made on the patch principle
2. From this point onwards, no new patches are accepted upstream that violate
   the new rules for the comment strings.
3. I update the patch with the current master, and resend
4. Patch is merged upstream


 linux/Config.ext.in                            |   2 +-
 package/acl/Config.in                          |   2 +-
 package/aircrack-ng/Config.in                  |   2 +-
 package/alsa-lib/Config.in                     |   2 +-
 package/alsa-utils/Config.in                   |   4 ++--
 package/alsamixergui/Config.in                 |   2 +-
 package/atk/Config.in                          |   2 +-
 package/attr/Config.in                         |   2 +-
 package/audiofile/Config.in                    |   2 +-
 package/avahi/Config.in                        |   2 +-
 package/axel/Config.in                         |   2 +-
 package/bcusdk/Config.in                       |   2 +-
 package/beecrypt/Config.in                     |   4 ++--
 package/bellagio/Config.in                     |   2 +-
 package/bind/Config.in                         |   2 +-
 package/bison/Config.in                        |   2 +-
 package/blackbox/Config.in                     |   2 +-
 package/bluez_utils/Config.in                  |   4 ++--
 package/bmon/Config.in                         |   2 +-
 package/bonnie/Config.in                       |   2 +-
 package/boost/Config.in                        |   4 ++--
 package/bootutils/Config.in                    |   2 +-
 package/bustle/Config.in                       |   2 +-
 package/ccid/Config.in                         |   2 +-
 package/cdrkit/Config.in                       |   2 +-
 package/cegui06/Config.in                      |   2 +-
 package/classpath/Config.in                    |   2 +-
 package/collectd/Config.in                     |   4 ++--
 package/connman/Config.in                      |   2 +-
 package/conntrack-tools/Config.in              |   2 +-
 package/coreutils/Config.in                    |   2 +-
 package/cppcms/Config.in                       |   2 +-
 package/cppzmq/Config.in                       |   2 +-
 package/crda/Config.in                         |   2 +-
 package/cryptsetup/Config.in                   |   2 +-
 package/ctorrent/Config.in                     |   2 +-
 package/cups/Config.in                         |   2 +-
 package/curlftpfs/Config.in                    |   2 +-
 package/cvs/Config.in                          |   2 +-
 package/czmq/Config.in                         |   2 +-
 package/dbus-glib/Config.in                    |   2 +-
 package/dbus-python/Config.in                  |   2 +-
 package/dbus/Config.in                         |   2 +-
 package/dhcpcd/Config.in                       |   2 +-
 package/diffutils/Config.in                    |   2 +-
 package/directfb/Config.in                     |   2 +-
 package/dmraid/Config.in                       |   2 +-
 package/dnsmasq/Config.in                      |   2 +-
 package/docker/Config.in                       |   2 +-
 package/dosfstools/Config.in                   |   2 +-
 package/dropwatch/Config.in                    |   2 +-
 package/dstat/Config.in                        |   2 +-
 package/duma/Config.in                         |   2 +-
 package/dvb-apps/Config.in                     |   2 +-
 package/dvbsnoop/Config.in                     |   2 +-
 package/e2fsprogs/Config.in                    |   2 +-
 package/ebtables/Config.in                     |   2 +-
 package/efl/Config.in                          |   2 +-
 package/efl/expedite/Config.in                 |   2 +-
 package/efl/libedbus/Config.in                 |   4 ++--
 package/efl/libevas-generic-loaders/Config.in  |   2 +-
 package/elfutils/Config.in                     |   2 +-
 package/enchant/Config.in                      |   2 +-
 package/enlightenment/Config.in                |   2 +-
 package/exfat-utils/Config.in                  |   2 +-
 package/exfat/Config.in                        |   2 +-
 package/f2fs-tools/Config.in                   |   2 +-
 package/fbterm/Config.in                       |   2 +-
 package/fdk-aac/Config.in                      |   2 +-
 package/ffmpeg/Config.in                       |   2 +-
 package/filemq/Config.in                       |   2 +-
 package/findutils/Config.in                    |   2 +-
 package/flashbench/Config.in                   |   2 +-
 package/flex/Config.in                         |   2 +-
 package/fltk/Config.in                         |   2 +-
 package/fluxbox/Config.in                      |   2 +-
 package/foomatic-filters/Config.in             |   2 +-
 package/gadgetfs-test/Config.in                |   2 +-
 package/gamin/Config.in                        |   2 +-
 package/gawk/Config.in                         |   2 +-
 package/gdb/Config.in                          |   4 ++--
 package/gdk-pixbuf/Config.in                   |   2 +-
 package/genext2fs/Config.in                    |   2 +-
 package/gesftpserver/Config.in                 |   2 +-
 package/gettext/Config.in                      |   2 +-
 package/git/Config.in                          |   2 +-
 package/glib-networking/Config.in              |   2 +-
 package/glibmm/Config.in                       |   2 +-
 package/gmpc/Config.in                         |   2 +-
 package/gnuchess/Config.in                     |   2 +-
 package/gnutls/Config.in                       |   2 +-
 package/gob2/Config.in                         |   2 +-
 package/gperf/Config.in                        |   2 +-
 package/gpsd/Config.in                         |   2 +-
 package/gptfdisk/Config.in                     |   2 +-
 package/grep/Config.in                         |   2 +-
 package/gstreamer/gst-ffmpeg/Config.in         |   2 +-
 package/gstreamer/gst-plugins-bad/Config.in    |   8 ++++----
 package/gstreamer/gst-plugins-base/Config.in   |   2 +-
 package/gstreamer/gst-plugins-good/Config.in   |   6 +++---
 package/gstreamer/gstreamer/Config.in          |   2 +-
 package/gstreamer1/gst1-plugins-bad/Config.in  |  10 +++++-----
 package/gstreamer1/gst1-plugins-base/Config.in |   2 +-
 package/gstreamer1/gst1-plugins-good/Config.in |   6 +++---
 package/gstreamer1/gst1-plugins-ugly/Config.in |   2 +-
 package/gstreamer1/gstreamer1/Config.in        |   2 +-
 package/gtest/Config.in                        |   2 +-
 package/gutenprint/Config.in                   |   2 +-
 package/gvfs/Config.in                         |   2 +-
 package/gzip/Config.in                         |   2 +-
 package/harfbuzz/Config.in                     |   2 +-
 package/hdparm/Config.in                       |   2 +-
 package/hiawatha/Config.in                     |   2 +-
 package/hostapd/Config.in                      |   2 +-
 package/hplip/Config.in                        |   2 +-
 package/icu/Config.in                          |   2 +-
 package/iftop/Config.in                        |   2 +-
 package/inotify-tools/Config.in                |   2 +-
 package/iperf/Config.in                        |   2 +-
 package/ipset/Config.in                        |   2 +-
 package/iw/Config.in                           |   2 +-
 package/jamvm/Config.in                        |   2 +-
 package/jhead/Config.in                        |   2 +-
 package/json-glib/Config.in                    |   2 +-
 package/kismet/Config.in                       |   2 +-
 package/latencytop/Config.in                   |   2 +-
 package/lcdapi/Config.in                       |   2 +-
 package/libarchive/Config.in                   |   2 +-
 package/libbsd/Config.in                       |   2 +-
 package/libcec/Config.in                       |   2 +-
 package/libcgicc/Config.in                     |   2 +-
 package/libdrm/Config.in                       |   2 +-
 package/libdvbsi/Config.in                     |   2 +-
 package/libdvdnav/Config.in                    |   2 +-
 package/libdvdread/Config.in                   |   2 +-
 package/libebml/Config.in                      |   2 +-
 package/libedit/Config.in                      |   2 +-
 package/libfreefare/Config.in                  |   2 +-
 package/libftdi/Config.in                      |   2 +-
 package/libfuse/Config.in                      |   2 +-
 package/libgail/Config.in                      |   2 +-
 package/libglade/Config.in                     |   2 +-
 package/libglib2/Config.in                     |   2 +-
 package/libgtk2/Config.in                      |   2 +-
 package/libhid/Config.in                       |   2 +-
 package/libical/Config.in                      |   2 +-
 package/libiqrf/Config.in                      |   2 +-
 package/libjson/Config.in                      |   2 +-
 package/liblo/Config.in                        |   2 +-
 package/libmatroska/Config.in                  |   2 +-
 package/libmicrohttpd/Config.in                |   4 ++--
 package/libmms/Config.in                       |   2 +-
 package/libmnl/Config.in                       |   2 +-
 package/libmpd/Config.in                       |   2 +-
 package/libnetfilter_acct/Config.in            |   2 +-
 package/libnetfilter_conntrack/Config.in       |   2 +-
 package/libnetfilter_cthelper/Config.in        |   2 +-
 package/libnetfilter_cttimeout/Config.in       |   2 +-
 package/libnetfilter_queue/Config.in           |   2 +-
 package/libnfc/Config.in                       |   2 +-
 package/libnl/Config.in                        |   2 +-
 package/libnspr/Config.in                      |   2 +-
 package/libnss/Config.in                       |   2 +-
 package/liboping/Config.in                     |   2 +-
 package/libplayer/Config.in                    |   4 ++--
 package/libqmi/Config.in                       |   2 +-
 package/libraw/Config.in                       |   2 +-
 package/librsvg/Config.in                      |   2 +-
 package/libsecret/Config.in                    |   2 +-
 package/libserial/Config.in                    |   2 +-
 package/libsigc/Config.in                      |   2 +-
 package/libsndfile/Config.in                   |   2 +-
 package/libsoup/Config.in                      |   2 +-
 package/libtorrent/Config.in                   |   2 +-
 package/libupnp/Config.in                      |   2 +-
 package/liburcu/Config.in                      |   2 +-
 package/libusb/Config.in                       |   2 +-
 package/libv4l/Config.in                       |   8 ++++----
 package/libxmlpp/Config.in                     |   2 +-
 package/linknx/Config.in                       |   2 +-
 package/linphone/Config.in                     |   2 +-
 package/linux-pam/Config.in                    |   2 +-
 package/live555/Config.in                      |   2 +-
 package/log4cxx/Config.in                      |   2 +-
 package/logrotate/Config.in                    |   2 +-
 package/lshw/Config.in                         |   2 +-
 package/ltp-testsuite/Config.in                |   2 +-
 package/lttng-babeltrace/Config.in             |   2 +-
 package/lttng-libust/Config.in                 |   4 ++--
 package/lttng-tools/Config.in                  |   2 +-
 package/lvm2/Config.in                         |   2 +-
 package/lxc/Config.in                          |   2 +-
 package/lzma/Config.in                         |   2 +-
 package/m4/Config.in                           |   2 +-
 package/mediastreamer/Config.in                |   2 +-
 package/memtester/Config.in                    |   2 +-
 package/midori/Config.in                       |   2 +-
 package/minicom/Config.in                      |   2 +-
 package/minidlna/Config.in                     |   2 +-
 package/mongoose/Config.in                     |   2 +-
 package/monit/Config.in                        |   2 +-
 package/mpd/Config.in                          |   6 +++---
 package/mplayer/Config.in                      |   2 +-
 package/msgpack/Config.in                      |   2 +-
 package/mtd/Config.in                          |   4 ++--
 package/mtdev2tuio/Config.in                   |   2 +-
 package/mutt/Config.in                         |   2 +-
 package/mysql_client/Config.in                 |   2 +-
 package/nbd/Config.in                          |   2 +-
 package/ndisc6/Config.in                       |   2 +-
 package/neard/Config.in                        |   2 +-
 package/neardal/Config.in                      |   2 +-
 package/netatalk/Config.in                     |   2 +-
 package/netkitbase/Config.in                   |   2 +-
 package/netkittelnet/Config.in                 |   2 +-
 package/network-manager/Config.in              |   2 +-
 package/nfacct/Config.in                       |   2 +-
 package/nfs-utils/Config.in                    |   2 +-
 package/nmap/Config.in                         |   2 +-
 package/nodejs/Config.in                       |   2 +-
 package/ntfs-3g/Config.in                      |   2 +-
 package/numactl/Config.in                      |   2 +-
 package/ocrad/Config.in                        |   2 +-
 package/ofono/Config.in                        |   2 +-
 package/olsr/Config.in                         |   2 +-
 package/opencv/Config.in                       |   8 ++++----
 package/openobex/Config.in                     |   6 +++---
 package/openocd/Config.in                      |   2 +-
 package/openpgm/Config.in                      |   2 +-
 package/openvpn/Config.in                      |   2 +-
 package/oprofile/Config.in                     |   2 +-
 package/orc/Config.in                          |   2 +-
 package/ortp/Config.in                         |   2 +-
 package/p11-kit/Config.in                      |   2 +-
 package/pango/Config.in                        |   2 +-
 package/parted/Config.in                       |   2 +-
 package/patch/Config.in                        |   2 +-
 package/pcmanfm/Config.in                      |   2 +-
 package/pcsc-lite/Config.in                    |   2 +-
 package/perf/Config.in                         |   2 +-
 package/php/Config.ext                         |   6 +++---
 package/pkg-config/Config.in                   |   2 +-
 package/poco/Config.in                         |   2 +-
 package/polkit/Config.in                       |   2 +-
 package/poppler/Config.in                      |   2 +-
 package/portaudio/Config.in                    |   2 +-
 package/portmap/Config.in                      |   2 +-
 package/protobuf-c/Config.in                   |   2 +-
 package/protobuf/Config.in                     |   2 +-
 package/proxychains-ng/Config.in               |   2 +-
 package/pulseaudio/Config.in                   |   2 +-
 package/python-nfc/Config.in                   |   2 +-
 package/python/Config.in                       |   2 +-
 package/python3/Config.in                      |   2 +-
 package/qt/Config.in                           |   4 ++--
 package/qt5/Config.in                          |   2 +-
 package/quagga/Config.in                       |   2 +-
 package/quota/Config.in                        |   2 +-
 package/radvd/Config.in                        |   2 +-
 package/redis/Config.in                        |   2 +-
 package/rpi-userland/Config.in                 |   2 +-
 package/rpm/Config.in                          |   4 ++--
 package/rrdtool/Config.in                      |   2 +-
 package/rt-tests/Config.in                     |   2 +-
 package/rtorrent/Config.in                     |   2 +-
 package/ruby/Config.in                         |   2 +-
 package/samba/Config.in                        |   2 +-
 package/schifra/Config.in                      |   2 +-
 package/sconeserver/Config.in                  |   2 +-
 package/sed/Config.in                          |   2 +-
 package/ser2net/Config.in                      |   2 +-
 package/sg3_utils/Config.in                    |   2 +-
 package/shared-mime-info/Config.in             |   2 +-
 package/smartmontools/Config.in                |   2 +-
 package/snappy/Config.in                       |   2 +-
 package/snowball-init/Config.in                |   2 +-
 package/socat/Config.in                        |   2 +-
 package/socketcand/Config.in                   |   2 +-
 package/spice/Config.in                        |   2 +-
 package/squashfs/Config.in                     |   2 +-
 package/squashfs3/Config.in                    |   2 +-
 package/squid/Config.in                        |   2 +-
 package/sshfs/Config.in                        |   2 +-
 package/strongswan/Config.in                   |   2 +-
 package/synergy/Config.in                      |   2 +-
 package/sysklogd/Config.in                     |   2 +-
 package/sysprof/Config.in                      |   2 +-
 package/systemd/Config.in                      |   2 +-
 package/taglib/Config.in                       |   2 +-
 package/tar/Config.in                          |   2 +-
 package/ti-utils/Config.in                     |   2 +-
 package/trace-cmd/Config.in                    |   2 +-
 package/transmission/Config.in                 |   6 +++---
 package/tree/Config.in                         |   2 +-
 package/tstools/Config.in                      |   2 +-
 package/tvheadend/Config.in                    |   2 +-
 package/udev/Config.in                         |   2 +-
 package/udisks/Config.in                       |   2 +-
 package/udpcast/Config.in                      |   2 +-
 package/ulogd/Config.in                        |   2 +-
 package/unionfs/Config.in                      |   2 +-
 package/urg/Config.in                          |   2 +-
 package/usb_modeswitch/Config.in               |   2 +-
 package/usb_modeswitch_data/Config.in          |   2 +-
 package/usbredir/Config.in                     |   2 +-
 package/usbutils/Config.in                     |   2 +-
 package/ushare/Config.in                       |   2 +-
 package/ussp-push/Config.in                    |   2 +-
 package/util-linux/Config.in                   |   4 ++--
 package/vala/Config.in                         |   2 +-
 package/wayland/Config.in                      |   2 +-
 package/webkit/Config.in                       |   2 +-
 package/webrtc-audio-processing/Config.in      |   2 +-
 package/wget/Config.in                         |   2 +-
 package/wireshark/Config.in                    |   2 +-
 package/wvdial/Config.in                       |   2 +-
 package/wvstreams/Config.in                    |   2 +-
 package/x11r7/Config.in                        |   2 +-
 package/x11r7/xapp_xinput-calibrator/Config.in |   2 +-
 package/x11r7/xlib_libpciaccess/Config.in      |   2 +-
 package/x11r7/xserver_xorg-server/Config.in    |   2 +-
 package/xenomai/Config.in                      |   2 +-
 package/xerces/Config.in                       |   2 +-
 package/xfsprogs/Config.in                     |   2 +-
 package/zeromq/Config.in                       |   2 +-
 package/zmqpp/Config.in                        |   4 ++--
 package/zxing/Config.in                        |   2 +-
 package/zyre/Config.in                         |   2 +-
 system/Config.in                               |   4 ++--
 329 files changed, 370 insertions(+), 370 deletions(-)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -16,7 +16,7 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI
 	  ARM, 2.6.35.9, 2.6.37.6, 2.6.38.8, on NIOS2, 2.6.35, on
 	  PowerPC, 2.6.35.7, 2.6.36.4, 3.0.8.
 
-comment "xenomai requires thread support in toolchain"
+comment "xenomai needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
diff --git a/package/acl/Config.in b/package/acl/Config.in
--- a/package/acl/Config.in
+++ b/package/acl/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_ACL
 
 	  http://savannah.nongnu.org/projects/acl
 
-comment "acl requires a toolchain with LARGEFILE support"
+comment "acl needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -10,6 +10,6 @@ config BR2_PACKAGE_AIRCRACK_NG
 
 	  http://www.aircrack-ng.org/
 
-comment "aircrack-ng needs a toolchain with largefile and threads support"
+comment "aircrack-ng needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_ALSA_LIB
 
 	  http://www.alsa-project.org/
 
-comment "alsa-lib needs threads support in toolchain"
+comment "alsa-lib needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 if BR2_PACKAGE_ALSA_LIB
diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_ALSA_UTILS
 
 	  http://www.alsa-project.org/
 
-comment "alsa-utils requires a toolchain with LARGEFILE and threads support"
+comment "alsa-utils needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
 if BR2_PACKAGE_ALSA_UTILS
@@ -32,7 +32,7 @@ config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
 	depends on BR2_USE_WCHAR
 	default y
 
-comment "alsamixer requires a toolchain with WCHAR support"
+comment "alsamixer needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_ALSA_UTILS_AMIDI
diff --git a/package/alsamixergui/Config.in b/package/alsamixergui/Config.in
--- a/package/alsamixergui/Config.in
+++ b/package/alsamixergui/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_ALSAMIXERGUI
 
 	  http://www.iua.upf.es/~mdeboer/projects/alsamixergui/
 
-comment "alsamixergui requires a toolchain with C++ and threads support enabled"
+comment "alsamixergui needs a toolchain w/ C++, threads"
 	depends on (!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS) && BR2_PACKAGE_XORG7
diff --git a/package/atk/Config.in b/package/atk/Config.in
--- a/package/atk/Config.in
+++ b/package/atk/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_ATK
 	help
 	  The ATK accessibility toolkit, needed to build GTK+-2.x.
 
-comment "atk requires a toolchain with WCHAR and threading support"
+comment "atk needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/attr/Config.in b/package/attr/Config.in
--- a/package/attr/Config.in
+++ b/package/attr/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_ATTR
 
 	  http://savannah.nongnu.org/projects/attr
 
-comment "attr requires a toolchain with LARGEFILE support"
+comment "attr needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/audiofile/Config.in b/package/audiofile/Config.in
--- a/package/audiofile/Config.in
+++ b/package/audiofile/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_AUDIOFILE
 
 	  http://www.68k.org/~michael/audiofile/
 
-comment "audiofile requires a toolchain with C++ support enabled"
+comment "audiofile needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/avahi/Config.in b/package/avahi/Config.in
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -36,5 +36,5 @@ config BR2_PACKAGE_AVAHI_DAEMON
 
 endif
 
-comment "avahi requires a toolchain with thread support"
+comment "avahi needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/axel/Config.in b/package/axel/Config.in
--- a/package/axel/Config.in
+++ b/package/axel/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_AXEL
 
 	  http://axel.alioth.debian.org/
 
-comment "axel needs a toolchain with thread support"
+comment "axel needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bcusdk/Config.in b/package/bcusdk/Config.in
--- a/package/bcusdk/Config.in
+++ b/package/bcusdk/Config.in
@@ -19,5 +19,5 @@ config BR2_PACKAGE_BCUSDK
 
 	  http://www.auto.tuwien.ac.at/~mkoegler/eib/
 
-comment "bcusdk requires a toolchain with C++ support"
+comment "bcusdk needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
--- a/package/beecrypt/Config.in
+++ b/package/beecrypt/Config.in
@@ -7,8 +7,8 @@ config BR2_PACKAGE_BEECRYPT
 
 	  http://beecrypt.sf.net
 
-comment "beecrypt needs a toolchain with thread support"
+comment "beecrypt needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-comment "beecrypt C++ support requires a toolchain with WCHAR enabled"
+comment "beecrypt C++ support needs a toolchain w/ wchar"
 	depends on BR2_INSTALL_LIBSTDCPP && !BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bellagio/Config.in b/package/bellagio/Config.in
--- a/package/bellagio/Config.in
+++ b/package/bellagio/Config.in
@@ -17,5 +17,5 @@ config BR2_PACKAGE_BELLAGIO
 
 	  http://omxil.sourceforge.net/
 
-comment "bellagio requires a toolchain with C++, threads and dynamic library support enabled"
+comment "bellagio needs a toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/bind/Config.in b/package/bind/Config.in
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -39,5 +39,5 @@ config BR2_PACKAGE_BIND_TOOLS
 
 endif
 
-comment "bind requires a toolchain with LARGEFILE and IPV6 support"
+comment "bind needs a toolchain w/ largefile, IPv6"
 	depends on !(BR2_LARGEFILE || BR2_INET_IPV6)
diff --git a/package/bison/Config.in b/package/bison/Config.in
--- a/package/bison/Config.in
+++ b/package/bison/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_BISON
 
 	  http://www.gnu.org/software/bison/
 
-comment "bison requires a toolchain with WCHAR support"
+comment "bison needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/blackbox/Config.in b/package/blackbox/Config.in
--- a/package/blackbox/Config.in
+++ b/package/blackbox/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_BLACKBOX
 
 	  http://blackboxwm.sourceforge.net/
 
-comment "blackbox requires a toolchain with C++ support enabled"
+comment "blackbox needs a toolchain w/ C++"
 	depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP
diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -26,7 +26,7 @@ config BR2_PACKAGE_BLUEZ_UTILS_AUDIO
 	help
 	  Audio support
 
-comment "bluez-utils audio requires a toolchain with LARGEFILE support"
+comment "bluez-utils audio needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
 
 config BR2_PACKAGE_BLUEZ_UTILS_USB
@@ -38,5 +38,5 @@ config BR2_PACKAGE_BLUEZ_UTILS_USB
 
 endif
 
-comment "bluez-utils require a toolchain with WCHAR and threading support"
+comment "bluez-utils needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bmon/Config.in b/package/bmon/Config.in
--- a/package/bmon/Config.in
+++ b/package/bmon/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_BMON
 	help
 	  Linux bandwidth monitor
 
-comment "bmon requires a toolchain with IPv6 support"
+comment "bmon needs a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
diff --git a/package/bonnie/Config.in b/package/bonnie/Config.in
--- a/package/bonnie/Config.in
+++ b/package/bonnie/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_BONNIE
 
 	  http://www.coker.com.au/bonnie++/
 
-comment "bonnie++ requires a toolchain with C++ support enabled"
+comment "bonnie++ needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/boost/Config.in b/package/boost/Config.in
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -1,4 +1,4 @@
-comment "boost requires a toolchain with C++, large file and thread support enabled"
+comment "boost needs a toolchain w/ C++, largefile, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_BOOST
@@ -48,7 +48,7 @@ config BR2_PACKAGE_BOOST_LOCALE
 	depends on BR2_USE_WCHAR
 	bool "boost-locale"
 
-comment "boost-locale requires a toolchain with wchar support"
+comment "boost-locale needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_BOOST_MATH
diff --git a/package/bootutils/Config.in b/package/bootutils/Config.in
--- a/package/bootutils/Config.in
+++ b/package/bootutils/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_BOOTUTILS
 
 	  http://bootutils.pr.linuxrulz.org/
 
-comment "bootutils requires a toolchain with LARGEFILE support"
+comment "bootutils needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/bustle/Config.in b/package/bustle/Config.in
--- a/package/bustle/Config.in
+++ b/package/bustle/Config.in
@@ -19,5 +19,5 @@ config BR2_PACKAGE_BUSTLE
 
 	  http://www.willthompson.co.uk/bustle/
 
-comment "bustle requires a toolchain with WCHAR support and threading support"
+comment "bustle needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ccid/Config.in b/package/ccid/Config.in
--- a/package/ccid/Config.in
+++ b/package/ccid/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_CCID
 
 	  http://pcsclite.alioth.debian.org/ccid.html
 
-comment "ccid needs a toolchain with thread support"
+comment "ccid needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
--- a/package/cdrkit/Config.in
+++ b/package/cdrkit/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_CDRKIT
 
 	  http://www.cdrkit.org/
 
-comment "cdrkit requires a toolchain with LARGEFILE support"
+comment "cdrkit needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/cegui06/Config.in b/package/cegui06/Config.in
--- a/package/cegui06/Config.in
+++ b/package/cegui06/Config.in
@@ -1,4 +1,4 @@
-comment "cegui06 needs a toolchain with C++ and threads"
+comment "cegui06 needs a toolchain w/ C++, threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_CEGUI06
diff --git a/package/classpath/Config.in b/package/classpath/Config.in
--- a/package/classpath/Config.in
+++ b/package/classpath/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_CLASSPATH
 
 	  http://classpath.org
 
-comment "classpath requires a toolchain with IPV6 support"
+comment "classpath needs a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -402,7 +402,7 @@ config BR2_PACKAGE_COLLECTD_RRDTOOL
 	help
 	  Writes values to RRD-files.
 
-comment "rrdtool support requires a toolchain with WCHAR support"
+comment "rrdtool support needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_COLLECTD_RIEMANN
@@ -428,6 +428,6 @@ endmenu
 
 endif
 
-comment "collectd needs a toolchain with IPv6 and thread support"
+comment "collectd needs a toolchain w/ IPv6, threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
 	depends on BR2_USE_MMU
diff --git a/package/connman/Config.in b/package/connman/Config.in
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -49,6 +49,6 @@ config BR2_PACKAGE_CONNMAN_CLIENT
 
 endif # BR2_PACKAGE_CONNMAN
 
-comment "connman needs a toolchain with IPv6, WCHAR, threading and resolver support"
+comment "connman needs a toolchain w/ IPv6, wchar, threads, resolver"
 	depends on BR2_UCLIBC_VERSION_0_9_32 || \
 		!BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
--- a/package/conntrack-tools/Config.in
+++ b/package/conntrack-tools/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
 
 	  http://www.netfilter.org/projects/conntrack-tools/
 
-comment "conntrack-tools requires a toolchain with IPV6, LARGEFILE and threading support"
+comment "conntrack-tools needs a toolchain w/ IPv6, largefile, threads"
 	depends on !BR2_INET_IPV6 || \
 		!BR2_LARGEFILE || \
 		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -14,5 +14,5 @@ config BR2_PACKAGE_COREUTILS
 
 	  http://www.gnu.org/software/coreutils/
 
-comment "coreutils requires a toolchain with WCHAR support"
+comment "coreutils needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -28,5 +28,5 @@ config BR2_PACKAGE_CPPCMS_ICU
 	  Using ICU allows advanced localization features into CppCMS,
 	  in another hand ICU is heavier than iconv.
 
-comment "cppcms requires a glibc toolchain with C++ support"
+comment "cppcms needs a glibc toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/cppzmq/Config.in b/package/cppzmq/Config.in
--- a/package/cppzmq/Config.in
+++ b/package/cppzmq/Config.in
@@ -11,6 +11,6 @@ config BR2_PACKAGE_CPPZMQ
 
 	  http://github.com/zeromq/cppzmq
 
-comment "cppzmq requires a toolchain with C++, IPV6, LARGEFILE and WCHAR support"
+comment "cppzmq needs a toolchain w/ C++, IPv6, largefile, wchar"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/crda/Config.in b/package/crda/Config.in
--- a/package/crda/Config.in
+++ b/package/crda/Config.in
@@ -15,5 +15,5 @@ config BR2_PACKAGE_CRDA
 
 	  http://linuxwireless.org/en/developers/Regulatory/CRDA
 
-comment "crda requires a toolchain with thread support"
+comment "crda needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -13,5 +13,5 @@ config BR2_PACKAGE_CRYPTSETUP
 
 	  https://code.google.com/p/cryptsetup/
 
-comment "cryptsetup needs largefile and wchar support in toolchain"
+comment "cryptsetup needs a toolchain w/ largefile, wchar"
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/ctorrent/Config.in b/package/ctorrent/Config.in
--- a/package/ctorrent/Config.in
+++ b/package/ctorrent/Config.in
@@ -1,4 +1,4 @@
-comment "ctorrent requires a toolchain with C++ support enabled"
+comment "ctorrent needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_CTORRENT
diff --git a/package/cups/Config.in b/package/cups/Config.in
--- a/package/cups/Config.in
+++ b/package/cups/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_CUPS_PDFTOPS
        help
          Enable pdftops support
 
-comment "pdftops support requires a toolchain with C++ support enabled"
+comment "pdftops support needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 endif
diff --git a/package/curlftpfs/Config.in b/package/curlftpfs/Config.in
--- a/package/curlftpfs/Config.in
+++ b/package/curlftpfs/Config.in
@@ -17,5 +17,5 @@ config BR2_PACKAGE_CURLFTPFS
 
 	  http://curlftpfs.sourceforge.net/
 
-comment "curlftpfs requires a toolchain with LARGEFILE, WCHAR, threading and dynamic library support"
+comment "curlftpfs needs a toolchain w/ largefile, wchar, threads, dynamic library"
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/cvs/Config.in b/package/cvs/Config.in
--- a/package/cvs/Config.in
+++ b/package/cvs/Config.in
@@ -15,5 +15,5 @@ config BR2_PACKAGE_CVS_SERVER
 	help
 	  Enable cvs server code
 
-comment "cvs requires a toolchain with WCHAR support"
+comment "cvs needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/czmq/Config.in b/package/czmq/Config.in
--- a/package/czmq/Config.in
+++ b/package/czmq/Config.in
@@ -15,6 +15,6 @@ config BR2_PACKAGE_CZMQ
 
 	  http://czmq.zeromq.org/
 
-comment "czmq requires a toolchain with C++, IPV6, LARGEFILE and WCHAR support"
+comment "czmq needs a toolchain w/ C++, IPv6, largefile, wchar"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/dbus-glib/Config.in b/package/dbus-glib/Config.in
--- a/package/dbus-glib/Config.in
+++ b/package/dbus-glib/Config.in
@@ -9,6 +9,6 @@ config BR2_PACKAGE_DBUS_GLIB
 
 	  http://www.freedesktop.org/software/dbus
 
-comment "dbus-glib requires a toolchain with WCHAR and threading support"
+comment "dbus-glib needs a toolchain w/ wchar, threads"
 	depends on BR2_PACKAGE_DBUS && \
 		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/dbus-python/Config.in b/package/dbus-python/Config.in
--- a/package/dbus-python/Config.in
+++ b/package/dbus-python/Config.in
@@ -10,6 +10,6 @@ config BR2_PACKAGE_DBUS_PYTHON
 
 	  http://dbus.freedesktop.org/doc/dbus-python/
 
-comment "dbus-python requires a toolchain with WCHAR and threading support"
+comment "dbus-python needs a toolchain w/ wchar, threads"
 	depends on BR2_PACKAGE_DBUS && BR2_PACKAGE_PYTHON && \
 		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/dbus/Config.in b/package/dbus/Config.in
--- a/package/dbus/Config.in
+++ b/package/dbus/Config.in
@@ -27,5 +27,5 @@ choice
 
 endchoice
 
-comment "dbus requires a toolchain with thread support"
+comment "dbus needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_DHCPCD
 
 	  http://roy.marples.name/downloads/dhcpcd
 
-comment "dhcpcd requires a toolchain with IPV6 support"
+comment "dhcpcd needs a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
diff --git a/package/diffutils/Config.in b/package/diffutils/Config.in
--- a/package/diffutils/Config.in
+++ b/package/diffutils/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_DIFFUTILS
 
 	  http://www.gnu.org/software/diffutils/diffutils.html
 
-comment "diffutils requires a toolchain with WCHAR support"
+comment "diffutils needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/directfb/Config.in b/package/directfb/Config.in
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -125,5 +125,5 @@ config BR2_PACKAGE_DIRECTFB_TESTS
 
 endif # BR2_PACKAGE_DIRECTFB
 
-comment "directfb needs a toolchain with C++ and thread support"
+comment "directfb needs a toolchain w/ C++, threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_DMRAID
 	  dmraid uses the Linux device-mapper to create devices with
 	  respective mappings for the ATARAID sets discovered.
 
-comment "dmraid requires a toolchain with LARGEFILE support"
+comment "dmraid needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -42,7 +42,7 @@ config BR2_PACKAGE_DNSMASQ_CONNTRACK
 	help
 	  Enable DNS query connection marking in netfilter.
 
-comment "conntrack marking support requires a toolchain with LARGEFILE support"
+comment "conntrack marking support needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
 
 endif
diff --git a/package/docker/Config.in b/package/docker/Config.in
--- a/package/docker/Config.in
+++ b/package/docker/Config.in
@@ -10,6 +10,6 @@ config BR2_PACKAGE_DOCKER
 
 	  http://icculus.org/openbox/2/docker
 
-comment "docker requires a toolchain with WCHAR and threading support"
+comment "docker needs a toolchain w/ wchar, threads"
 	depends on BR2_PACKAGE_XORG7 && \
 		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/dosfstools/Config.in b/package/dosfstools/Config.in
--- a/package/dosfstools/Config.in
+++ b/package/dosfstools/Config.in
@@ -27,5 +27,5 @@ config BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT
 
 endif
 
-comment "dosfstools requires a toolchain with LARGEFILE and WCHAR support"
+comment "dosfstools needs a toolchain w/ largefile, wchar"
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/dropwatch/Config.in b/package/dropwatch/Config.in
--- a/package/dropwatch/Config.in
+++ b/package/dropwatch/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_DROPWATCH
 
 	  https://fedorahosted.org/dropwatch/
 
-comment "dropwatch requires threading support in toolchain"
+comment "dropwatch needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dstat/Config.in b/package/dstat/Config.in
--- a/package/dstat/Config.in
+++ b/package/dstat/Config.in
@@ -20,5 +20,5 @@ config BR2_PACKAGE_DSTAT
 
 	  http://dag.wieers.com/home-made/dstat/
 
-comment "dstat requires a toolchain with WCHAR support"
+comment "dstat needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/duma/Config.in b/package/duma/Config.in
--- a/package/duma/Config.in
+++ b/package/duma/Config.in
@@ -16,5 +16,5 @@ config BR2_PACKAGE_DUMA_NO_LEAKDETECTION
 
 endif # BR2_PACKAGE_DUMA
 
-comment "duma requires C++ and thread support in toolchain"
+comment "duma needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dvb-apps/Config.in b/package/dvb-apps/Config.in
--- a/package/dvb-apps/Config.in
+++ b/package/dvb-apps/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_DVB_APPS
 
 if BR2_PACKAGE_DVB_APPS
 
-comment "dvb-apps utils needs a toolchain with LARGEFILE and THREADS support"
+comment "dvb-apps utils needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_DVB_APPS_UTILS
diff --git a/package/dvbsnoop/Config.in b/package/dvbsnoop/Config.in
--- a/package/dvbsnoop/Config.in
+++ b/package/dvbsnoop/Config.in
@@ -21,5 +21,5 @@ config BR2_PACKAGE_DVBSNOOP
 	  http://dvbsnoop.sourceforge.net
 	  http://en.wikipedia.org/wiki/DBox2
 
-comment "dvbsnoop requires a toolchain with LARGEFILE support"
+comment "dvbsnoop needs a toolchain w/ largefile"
         depends on !BR2_LARGEFILE
diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -94,5 +94,5 @@ config BR2_PACKAGE_E2FSPROGS_UUIDGEN
 
 endif
 
-comment "e2fsprogs requires a toolchain with LARGEFILE + WCHAR support"
+comment "e2fsprogs needs a toolchain w/ largefile, wchar"
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
--- a/package/ebtables/Config.in
+++ b/package/ebtables/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_EBTABLES
 
 	  http://ebtables.sourceforge.net
 
-comment "ebtables requires a toolchain with IPv6 support"
+comment "ebtables needs a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
diff --git a/package/efl/Config.in b/package/efl/Config.in
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -24,5 +24,5 @@ source "package/efl/libedbus/Config.in"
 
 endif # BR2_PACKAGE_EFL
 
-comment "EFL requires WCHAR support in toolchain"
+comment "EFL needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/efl/expedite/Config.in b/package/efl/expedite/Config.in
--- a/package/efl/expedite/Config.in
+++ b/package/efl/expedite/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_EXPEDITE
 	  DirectFB and so on. Its tests are quite extensive, trying to
 	  reproduce real world usage cases.
 
-comment "expedite requires C++ support in toolchain"
+comment "expedite needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
--- a/package/efl/libedbus/Config.in
+++ b/package/efl/libedbus/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_LIBEDBUS_BLUEZ
 	help
 	  Bluetooth support.
 
-comment "bluez support requires a toolchain with WCHAR and threading support"
+comment "bluez support needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_LIBEDBUS_CONNMAN
@@ -39,5 +39,5 @@ config BR2_PACKAGE_LIBEDBUS_NOTIFY
 
 endif
 
-comment "libedbus requires a toolchain with thread support"
+comment "libedbus needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/efl/libevas-generic-loaders/Config.in b/package/efl/libevas-generic-loaders/Config.in
--- a/package/efl/libevas-generic-loaders/Config.in
+++ b/package/efl/libevas-generic-loaders/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADE
 	help
 	  This option enables the Evas generic SVG loader
 
-comment "SVG loader requires a toolchain with WCHAR, threading and C++ support"
+comment "SVG loader needs a toolchain w/ wchar, threads, C++"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 
 endif
diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -1,4 +1,4 @@
-comment "elfutils requires a toolchain with LARGEFILE and WCHAR support"
+comment "elfutils needs a toolchain w/ largefile, wchar"
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_ELFUTILS
diff --git a/package/enchant/Config.in b/package/enchant/Config.in
--- a/package/enchant/Config.in
+++ b/package/enchant/Config.in
@@ -10,6 +10,6 @@ config BR2_PACKAGE_ENCHANT
 
 	  http://www.abisource.com/projects/enchant/
 
-comment "enchant requires a toolchain with C++, threading and WCHAR support enabled"
+comment "enchant needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -35,6 +35,6 @@ config BR2_PACKAGE_ENLIGHTENMENT
 
 	  http://www.enlightenment.org/
 
-comment "enlightenment requires WCHAR, C++ and thread support in toolchain"
+comment "enlightenment needs a toolchain w/ wchar, C++, threads"
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/exfat-utils/Config.in b/package/exfat-utils/Config.in
--- a/package/exfat-utils/Config.in
+++ b/package/exfat-utils/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_EXFAT_UTILS
 
 	  http://code.google.com/p/exfat/
 
-comment "exfat-utils requires a toolchain with LARGEFILE and WCHAR support"
+comment "exfat-utils needs a toolchain w/ largefile, wchar"
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/exfat/Config.in b/package/exfat/Config.in
--- a/package/exfat/Config.in
+++ b/package/exfat/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_EXFAT
 
 	  http://code.google.com/p/exfat/
 
-comment "exfat requires a toolchain with LARGEFILE, WCHAR, threads and dynamic library support"
+comment "exfat needs a toolchain w/ largefile, wchar, threads, dynamic library"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
diff --git a/package/f2fs-tools/Config.in b/package/f2fs-tools/Config.in
--- a/package/f2fs-tools/Config.in
+++ b/package/f2fs-tools/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_F2FS_TOOLS
 
 	  http://sourceforge.net/projects/f2fs-tools/
 
-comment "f2fs-tools requires a toolchain with LARGEFILE and WCHAR support"
+comment "f2fs-tools needs a toolchain w/ largefile, wchar"
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/fbterm/Config.in b/package/fbterm/Config.in
--- a/package/fbterm/Config.in
+++ b/package/fbterm/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_FBTERM
 
 	  http://code.google.com/p/fbterm/
 
-comment "fbterm requires a toolchain with C++, WCHAR and locale support"
+comment "fbterm needs a toolchain w/ C++, wchar, locale"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
diff --git a/package/fdk-aac/Config.in b/package/fdk-aac/Config.in
--- a/package/fdk-aac/Config.in
+++ b/package/fdk-aac/Config.in
@@ -13,5 +13,5 @@ config BR2_PACKAGE_FDK_AAC
 
 	  http://sourceforge.net/projects/opencore-amr/files/fdk-aac/
 
-comment "fdk-aac requires a toolchain with C++ support"
+comment "fdk-aac needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -1,4 +1,4 @@
-comment "ffmpeg requires a toolchain with LARGEFILE and IPV6 support"
+comment "ffmpeg needs a toolchain w/ largefile, IPv6"
 	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
 
 menuconfig BR2_PACKAGE_FFMPEG
diff --git a/package/filemq/Config.in b/package/filemq/Config.in
--- a/package/filemq/Config.in
+++ b/package/filemq/Config.in
@@ -17,6 +17,6 @@ config BR2_PACKAGE_FILEMQ
 
 	  http://github.com/zeromq/filemq
 
-comment "filemq requires a toolchain with C++, IPv6, LARGEFILE, WCHAR & thread support"
+comment "filemq needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/findutils/Config.in b/package/findutils/Config.in
--- a/package/findutils/Config.in
+++ b/package/findutils/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_FINDUTILS
 
 	  http://www.gnu.org/software/findutils/findutils.html
 
-comment "findutils requires a toolchain with WCHAR support"
+comment "findutils needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/flashbench/Config.in b/package/flashbench/Config.in
--- a/package/flashbench/Config.in
+++ b/package/flashbench/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_FLASHBENCH
 
 	  https://wiki.linaro.org/WorkingGroups/KernelConsolidation/Projects/FlashCardSurvey
 
-comment "flashbench requires a toolchain with LARGEFILE support"
+comment "flashbench needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/flex/Config.in b/package/flex/Config.in
--- a/package/flex/Config.in
+++ b/package/flex/Config.in
@@ -18,5 +18,5 @@ config BR2_PACKAGE_FLEX_BINARY
 	help
 	  Install the flex binary tool in the target filesystem.
 
-comment "flex binary requires a toolchain with WCHAR support"
+comment "flex binary needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/fltk/Config.in b/package/fltk/Config.in
--- a/package/fltk/Config.in
+++ b/package/fltk/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_FLTK
 
 	  http://www.fltk.org/
 
-comment "fltk requires a toolchain with C++ support enabled"
+comment "fltk needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP && BR2_PACKAGE_XORG7
diff --git a/package/fluxbox/Config.in b/package/fluxbox/Config.in
--- a/package/fluxbox/Config.in
+++ b/package/fluxbox/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_FLUXBOX
 
 	  http://fluxbox.org
 
-comment "fluxbox requires a toolchain with C++ support enabled"
+comment "fluxbox needs a toolchain w/ C++"
 	depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP
diff --git a/package/foomatic-filters/Config.in b/package/foomatic-filters/Config.in
--- a/package/foomatic-filters/Config.in
+++ b/package/foomatic-filters/Config.in
@@ -1,4 +1,4 @@
-comment "foomatic-filters requires a toolchain with support for THREADS"
+comment "foomatic-filters needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_FOOMATIC_FILTERS
diff --git a/package/gadgetfs-test/Config.in b/package/gadgetfs-test/Config.in
--- a/package/gadgetfs-test/Config.in
+++ b/package/gadgetfs-test/Config.in
@@ -17,5 +17,5 @@ config BR2_PACKAGE_GADGETFS_TEST_USE_AIO
 	  Select this to have gadgetfs-test do asynchronous I/O using
 	  the libaio library.
 
-comment "gadgetfs-test requires thread support in toolchain"
+comment "gadgetfs-test needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gamin/Config.in b/package/gamin/Config.in
--- a/package/gamin/Config.in
+++ b/package/gamin/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_GAMIN
 
 	  http://www.gnome.org/~veillard/gamin/sources
 
-comment "gamin requires a toolchain with WCHAR and threading support"
+comment "gamin needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gawk/Config.in b/package/gawk/Config.in
--- a/package/gawk/Config.in
+++ b/package/gawk/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_GAWK
 
 	  http://www.gnu.org/software/gawk/
 
-comment "gawk requires a toolchain with WCHAR support"
+comment "gawk needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -1,4 +1,4 @@
-comment "gdb/gdbserver require a toolchain with thread and thread debug support"
+comment "gdb/gdbserver needs a toolchain w/ threads, threads debug"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 
 config BR2_PACKAGE_GDB
@@ -41,7 +41,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	depends on BR2_USE_WCHAR
 	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin
 
-comment "full gdb on target needs WCHAR support in toolchain"
+comment "full gdb on target needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 endif
diff --git a/package/gdk-pixbuf/Config.in b/package/gdk-pixbuf/Config.in
--- a/package/gdk-pixbuf/Config.in
+++ b/package/gdk-pixbuf/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_GDK_PIXBUF
 
 	  http://www.gtk.org/
 
-comment "gdk-pixbuf depends on toolchain with WCHAR and threading support"
+comment "gdk-pixbuf needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/genext2fs/Config.in b/package/genext2fs/Config.in
--- a/package/genext2fs/Config.in
+++ b/package/genext2fs/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_GENEXT2FS
 
 	  http://genext2fs.sourceforge.net/
 
-comment "genext2fs requires a toolchain with LARGEFILE support"
+comment "genext2fs needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/gesftpserver/Config.in b/package/gesftpserver/Config.in
--- a/package/gesftpserver/Config.in
+++ b/package/gesftpserver/Config.in
@@ -13,5 +13,5 @@ config BR2_PACKAGE_GESFTPSERVER
 
 	  http://www.greenend.org.uk/rjk/sftpserver/
 
-comment "gesftpserver requires a toolchain with WCHAR and threads support"
+comment "gesftpserver needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gettext/Config.in b/package/gettext/Config.in
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -24,5 +24,5 @@ config BR2_PACKAGE_GETTEXT_TOOLS
 	  the target filesystem. This is typically not useful for
 	  correct operation of programs.
 
-comment "gettext requires a toolchain with WCHAR support"
+comment "gettext needs a toolchain w/ wchar"
 	depends on BR2_NEEDS_GETTEXT && !BR2_USE_WCHAR
diff --git a/package/git/Config.in b/package/git/Config.in
--- a/package/git/Config.in
+++ b/package/git/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_GIT
 
 	  http://git-scm.com
 
-comment "git requires a toolchain with LARGEFILE support"
+comment "git needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_GLIB_NETWORKING
 	help
 	  Network-related GIO modules for glib.
 
-comment "glib-networking requires a toolchain with WCHAR and threading support"
+comment "glib-networking needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/glibmm/Config.in b/package/glibmm/Config.in
--- a/package/glibmm/Config.in
+++ b/package/glibmm/Config.in
@@ -10,6 +10,6 @@ config BR2_PACKAGE_GLIBMM
 
 	  http://www.gtkmm.org/
 
-comment "glibmm requires a toolchain with C++, WCHAR, and threading support"
+comment "glibmm needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
--- a/package/gmpc/Config.in
+++ b/package/gmpc/Config.in
@@ -20,6 +20,6 @@ config BR2_PACKAGE_GMPC
 
 	  http://gmpcwiki.sarine.nl/index.php?title=GMPC
 
-comment "gmpc requires a toolchain with WCHAR and threading support"
+comment "gmpc needs a toolchain w/ wchar, threads"
 	depends on BR2_PACKAGE_LIBGTK2 && !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gnuchess/Config.in b/package/gnuchess/Config.in
--- a/package/gnuchess/Config.in
+++ b/package/gnuchess/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_GNUCHESS
 
 	  http://ftp.gnu.org/pub/gnu/chess
 
-comment "gnuchess requires a toolchain with thread support"
+comment "gnuchess needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -15,5 +15,5 @@ config BR2_PACKAGE_GNUTLS_TOOLS
 	help
 	  Install GnuTLS command line tools for various cryptographic tasks.
 
-comment "gnutls requires a toolchain with WCHAR support"
+comment "gnutls needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/gob2/Config.in b/package/gob2/Config.in
--- a/package/gob2/Config.in
+++ b/package/gob2/Config.in
@@ -13,5 +13,5 @@ config BR2_PACKAGE_GOB2
 
 	  http://www.jirka.org/gob.html
 
-comment "gob2 requires a toolchain with WCHAR support"
+comment "gob2 needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gperf/Config.in b/package/gperf/Config.in
--- a/package/gperf/Config.in
+++ b/package/gperf/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_GPERF
 
 	  http://www.gnu.org/software/gperf/
 
-comment "gperf requires a toolchain with C++ support enabled"
+comment "gperf needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -1,4 +1,4 @@
-comment "gpsd needs a toolchain with thread support"
+comment "gpsd needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GPSD
diff --git a/package/gptfdisk/Config.in b/package/gptfdisk/Config.in
--- a/package/gptfdisk/Config.in
+++ b/package/gptfdisk/Config.in
@@ -1,4 +1,4 @@
-comment "gptfdisk requires a toolchain with LARGEFILE/WCHAR/C++ support enabled"
+comment "gptfdisk needs a toolchain w/ largefile, wchar, C++"
 	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
 
 config BR2_PACKAGE_GPTFDISK
diff --git a/package/grep/Config.in b/package/grep/Config.in
--- a/package/grep/Config.in
+++ b/package/grep/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_GREP
 
 	  http://www.gnu.org/software/grep/grep.html
 
-comment "grep needs a toolchain with WCHAR support"
+comment "grep needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ b/package/gstreamer/gst-ffmpeg/Config.in
@@ -13,5 +13,5 @@ config BR2_PACKAGE_GST_FFMPEG
 
 	  http://gstreamer.freedesktop.org/
 
-comment "gst-ffmpeg requires a toolchain with LARGEFILE and IPV6 support"
+comment "gst-ffmpeg needs a toolchain w/ largefile, IPv6"
 	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -61,7 +61,7 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGI
 	depends on BR2_INSTALL_LIBSTDCPP
 	bool "decklink"
 
-comment "decklink requires a toolchain with C++ support enabled"
+comment "decklink needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DTMF
@@ -281,7 +281,7 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGI
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libmms -> libglib2
 	select BR2_PACKAGE_LIBMMS
 
-comment "libmms requires a toolchain with WCHAR and threading support"
+comment "libmms needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MUSEPACK
@@ -303,7 +303,7 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGI
 	depends on BR2_TOOLCHAIN_HAS_THREADS # librsvg -> libglib2
 	select BR2_PACKAGE_LIBRSVG
 
-comment "rsvg plugin requires a toolchain with C++, WCHAR, and threading support"
+comment "rsvg plugin needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
@@ -316,7 +316,7 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGI
 	select BR2_PACKAGE_LIBSNDFILE
 	depends on BR2_LARGEFILE
 
-comment "gst-plugins-bad-plugin-sndfile requires a toolchain with LARGEFILE support"
+comment "gst-plugins-bad-plugin-sndfile needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD
diff --git a/package/gstreamer/gst-plugins-base/Config.in b/package/gstreamer/gst-plugins-base/Config.in
--- a/package/gstreamer/gst-plugins-base/Config.in
+++ b/package/gstreamer/gst-plugins-base/Config.in
@@ -90,7 +90,7 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUG
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> libglib2
 	select BR2_PACKAGE_PANGO
 
-comment "pango plugin requires a toolchain with C++, WCHAR and threading support "
+comment "pango plugin needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -143,7 +143,7 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUG
 	depends on BR2_INET_IPV6
 	bool "udp"
 
-comment "udp requires a toolchain with IPv6 support"
+comment "udp needs a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOBOX
@@ -192,7 +192,7 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUG
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gdk-pixbuf -> libglib2
 	select BR2_PACKAGE_GDK_PIXBUF
 
-comment "gdkpixbuf requires a toolchain with WCHAR and threading support"
+comment "gdkpixbuf needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS
@@ -213,7 +213,7 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUG
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libsoup -> glib2
 	select BR2_PACKAGE_LIBSOUP
 
-comment "souphttpsrc requires a toolchain with WCHAR and threading support"
+comment "souphttpsrc needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREAD
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPEEX
diff --git a/package/gstreamer/gstreamer/Config.in b/package/gstreamer/gstreamer/Config.in
--- a/package/gstreamer/gstreamer/Config.in
+++ b/package/gstreamer/gstreamer/Config.in
@@ -28,5 +28,5 @@ config BR2_PACKAGE_GSTREAMER_PLUGIN_REGI
 	  Enable support for the GStreamer plugin registry. This may increase
 	  the launch-time for a GStreamer application.
 
-comment "gstreamer requires a toolchain with WCHAR and threads support"
+comment "gstreamer needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -345,7 +345,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUG
 	help
 	  Blackmagic Decklink plugin
 
-comment "decklink requires a toolchain with C++ support enabled"
+comment "decklink needs a toolchain w/ C++"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
 	bool "directfb"
@@ -379,7 +379,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUG
 	help
 	  Microsoft Multi Media Server streaming protocol support
 
-comment "libmms requires a toolchain with WCHAR and threading support"
+comment "libmms needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREAD
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC
@@ -411,7 +411,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUG
 	help
 	  GStreamer OpenCV Plugins
 
-comment "opencv plugin requires a toolchain with C++ support"
+comment "opencv plugin needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPUS
@@ -429,7 +429,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUG
 	help
 	  RSVG plugin library
 
-comment "rsvg plugin requires a toolchain with C++, WCHAR and threading support"
+comment "rsvg plugin needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
@@ -448,7 +448,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUG
 	select BR2_PACKAGE_LIBSNDFILE
 	depends on BR2_LARGEFILE
 
-comment "gst-plugins-bad-plugin-sndfile requires a toolchain with LARGEFILE support"
+comment "gst-plugins-bad-plugin-sndfile needs a toolchain w/ largefile"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB
 	bool "dvb"
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -136,7 +136,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLU
 	help
 	  Pango-based text rendering and overlay
 
-comment "pango plugin requires a toolchain with C++, WCHAR and threading support"
+comment "pango plugin needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -216,7 +216,7 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLU
 	help
 	  transfer data via UDP
 
-comment "udp requires a toolchain with IPv6 support"
+comment "udp needs a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VIDEOBOX
@@ -293,7 +293,7 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLU
 	help
 	  GdkPixbuf-based image decoder, overlay and sink
 
-comment "gdkpixbuf requires a toolchain with WCHAR and threading support"
+comment "gdkpixbuf needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
@@ -312,7 +312,7 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLU
 	help
 	  libsoup HTTP client src/sink
 
-comment "souphttpsrc requires a toolchain with WCHAR and threading support"
+comment "souphttpsrc needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SPEEX
diff --git a/package/gstreamer1/gst1-plugins-ugly/Config.in b/package/gstreamer1/gst1-plugins-ugly/Config.in
--- a/package/gstreamer1/gst1-plugins-ugly/Config.in
+++ b/package/gstreamer1/gst1-plugins-ugly/Config.in
@@ -46,7 +46,7 @@ config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLU
 	help
 	  Access a DVD with dvdread
 
-comment "dvdread requires a toolchain with largefile support"
+comment "dvdread needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
 
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME
diff --git a/package/gstreamer1/gstreamer1/Config.in b/package/gstreamer1/gstreamer1/Config.in
--- a/package/gstreamer1/gstreamer1/Config.in
+++ b/package/gstreamer1/gstreamer1/Config.in
@@ -49,5 +49,5 @@ config BR2_PACKAGE_GSTREAMER1_INSTALL_TO
 
 endif
 
-comment "gstreamer1 requires a toolchain with WCHAR and threading support"
+comment "gstreamer1 needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gtest/Config.in b/package/gtest/Config.in
--- a/package/gtest/Config.in
+++ b/package/gtest/Config.in
@@ -21,5 +21,5 @@ config BR2_PACKAGE_GTEST
 
 	  http://code.google.com/p/googletest/
 
-comment "gtest requires a toolchain with c++, WCHAR and THREADS support"
+comment "gtest needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gutenprint/Config.in b/package/gutenprint/Config.in
--- a/package/gutenprint/Config.in
+++ b/package/gutenprint/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_GUTENPRINT
 
 	  http://gimp-print.sourceforge.net/
 
-comment "gutenprint requires a toolchain with C++ support enabled"
+comment "gutenprint needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -16,5 +16,5 @@ config BR2_PACKAGE_GVFS
 
 	  http://en.wikipedia.org/wiki/GVFS
 
-comment "gvfs requires a toolchain with LARGEFILE, WCHAR and threading support"
+comment "gvfs needs a toolchain w/ largefile, wchar, threads"
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gzip/Config.in b/package/gzip/Config.in
--- a/package/gzip/Config.in
+++ b/package/gzip/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_GZIP
 
 	  http://www.gnu.org/software/gzip/gzip.html
 
-comment "gzip requires a toolchain with WCHAR support"
+comment "gzip needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
--- a/package/harfbuzz/Config.in
+++ b/package/harfbuzz/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_HARFBUZZ
 	  Harfbuzz can make optional use of cairo, freetype,
 	  glib2 and icu packages if they are selected.
 
-comment "harfbuzz requires a toolchain with C++ support"
+comment "harfbuzz needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/hdparm/Config.in b/package/hdparm/Config.in
--- a/package/hdparm/Config.in
+++ b/package/hdparm/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_HDPARM
 
 	  http://www.ibiblio.org/pub/Linux/system/hardware/
 
-comment "hdparm requires a toolchain with LARGEFILE support"
+comment "hdparm needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
--- a/package/hiawatha/Config.in
+++ b/package/hiawatha/Config.in
@@ -1,4 +1,4 @@
-comment "hiawatha requires a toolchain with thread support"
+comment "hiawatha needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_HIAWATHA
diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -25,5 +25,5 @@ config BR2_PACKAGE_HOSTAPD_WPS
 
 endif
 
-comment "hostapd requires a toolchain with thread support"
+comment "hostapd needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/hplip/Config.in b/package/hplip/Config.in
--- a/package/hplip/Config.in
+++ b/package/hplip/Config.in
@@ -15,5 +15,5 @@ config BR2_PACKAGE_HPLIP
 
 	  http://hplipopensource.com/
 
-comment "hplip requires a toolchain with C++ and thread support enabled"
+comment "hplip needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/icu/Config.in b/package/icu/Config.in
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_ICU
 
 	  http://site.icu-project.org/
 
-comment "icu requires a toolchain with C++ support and WCHAR enabled"
+comment "icu needs a toolchain w/ C++, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/iftop/Config.in b/package/iftop/Config.in
--- a/package/iftop/Config.in
+++ b/package/iftop/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_IFTOP
 
 	  http://www.ex-parrot.com/pdw/iftop/
 
-comment "iftop requires IPv6 and threads support in toolchain"
+comment "iftop needs a toolchain w/ IPv6, threads"
 	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/inotify-tools/Config.in b/package/inotify-tools/Config.in
--- a/package/inotify-tools/Config.in
+++ b/package/inotify-tools/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_INOTIFY_TOOLS
 
 	  https://github.com/rvoicilas/inotify-tools
 
-comment "inotify-tools requires a toolchain with LARGEFILE support"
+comment "inotify-tools needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/iperf/Config.in b/package/iperf/Config.in
--- a/package/iperf/Config.in
+++ b/package/iperf/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_IPERF
 
 	  http://dast.nlanr.net/projects/iperf/
 
-comment "iperf requires a toolchain with C++ support enabled"
+comment "iperf needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/ipset/Config.in b/package/ipset/Config.in
--- a/package/ipset/Config.in
+++ b/package/ipset/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_IPSET
 
 	  http://ipset.netfilter.org/
 
-comment "ipset requires a toolchain with LARGEFILE support"
+comment "ipset needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/iw/Config.in b/package/iw/Config.in
--- a/package/iw/Config.in
+++ b/package/iw/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_IW
 
 	  http://wireless.kernel.org/en/users/Documentation/iw
 
-comment "iw requires a toolchain with thread support"
+comment "iw needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
--- a/package/jamvm/Config.in
+++ b/package/jamvm/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_JAMVM
 
 	  http://jamvm.sf.net
 
-comment "jamvm requires a toolchain with IPV6 support"
+comment "jamvm needs a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
diff --git a/package/jhead/Config.in b/package/jhead/Config.in
--- a/package/jhead/Config.in
+++ b/package/jhead/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_JHEAD
 
 	  http://www.sentex.net/~mwandel/jhead/
 
-comment "jhead requires a toolchain with WCHAR support"
+comment "jhead needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/json-glib/Config.in b/package/json-glib/Config.in
--- a/package/json-glib/Config.in
+++ b/package/json-glib/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_JSON_GLIB
 
 	  https://live.gnome.org/JsonGlib/
 
-comment "json-glib requires a toolchain with WCHAR and threading support"
+comment "json-glib needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -1,4 +1,4 @@
-comment "Kismet requires a toolchain with thread and C++ support enabled"
+comment "kismet needs a toolchain w/ threads, C++"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_KISMET
diff --git a/package/latencytop/Config.in b/package/latencytop/Config.in
--- a/package/latencytop/Config.in
+++ b/package/latencytop/Config.in
@@ -20,5 +20,5 @@ config BR2_PACKAGE_LATENCYTOP
 
 	  http://www.latencytop.org
 
-comment "latencytop requires a toolchain with WCHAR and threading support"
+comment "latencytop needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lcdapi/Config.in b/package/lcdapi/Config.in
--- a/package/lcdapi/Config.in
+++ b/package/lcdapi/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_LCDAPI
 
 	  https://github.com/spdawson/lcdapi
 
-comment "lcdapi requires a toolchain with C++ and thread support enabled"
+comment "lcdapi needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libarchive/Config.in b/package/libarchive/Config.in
--- a/package/libarchive/Config.in
+++ b/package/libarchive/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBARCHIVE
 
 	  http://www.libarchive.org/
 
-comment "libarchive requires a toolchain with WCHAR support"
+comment "libarchive needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_LIBARCHIVE_BSDTAR
diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -13,6 +13,6 @@ config BR2_PACKAGE_LIBBSD
 
 	  http://libbsd.freedesktop.org/
 
-comment "libbsd requires a toolchain with thread support"
+comment "libbsd needs a toolchain w/ threads"
 	depends on ( BR2_i386 || BR2_x86_64 )
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libcec/Config.in b/package/libcec/Config.in
--- a/package/libcec/Config.in
+++ b/package/libcec/Config.in
@@ -10,6 +10,6 @@ config BR2_PACKAGE_LIBCEC
 
 	  http://libcec.pulse-eight.com
 
-comment "libcec requires C++, WCHAR and threading support in toolchain"
+comment "libcec needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR
diff --git a/package/libcgicc/Config.in b/package/libcgicc/Config.in
--- a/package/libcgicc/Config.in
+++ b/package/libcgicc/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_LIBCGICC
 
 	  http://www.cgicc.com
 
-comment "libcgicc requires a toolchain with C++ support enabled"
+comment "libcgicc needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -64,5 +64,5 @@ endmenu
 
 endif
 
-comment "libdrm requires a toolchain with LARGEFILE support"
+comment "libdrm needs a toolchain w/ largefile"
 	depends on BR2_PACKAGE_XORG7 && !BR2_LARGEFILE
diff --git a/package/libdvbsi/Config.in b/package/libdvbsi/Config.in
--- a/package/libdvbsi/Config.in
+++ b/package/libdvbsi/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_LIBDVBSI
 
 	  http://www.saftware.de/
 
-comment "libdvbsi++ requires a toolchain with C++, WCHAR and threads support"
+comment "libdvbsi++ needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libdvdnav/Config.in b/package/libdvdnav/Config.in
--- a/package/libdvdnav/Config.in
+++ b/package/libdvdnav/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_LIBDVDNAV
 
 	  http://www.mplayerhq.hu
 
-comment "libdvdnav requires a toolchain with LARGEFILE and thread support"
+comment "libdvdnav needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libdvdread/Config.in b/package/libdvdread/Config.in
--- a/package/libdvdread/Config.in
+++ b/package/libdvdread/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_LIBDVDREAD
 
 	  http://www.mplayerhq.hu/MPlayer/releases/dvdnav/
 
-comment "libdvdread requires a toolchain with LARGEFILE support"
+comment "libdvdread needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/libebml/Config.in b/package/libebml/Config.in
--- a/package/libebml/Config.in
+++ b/package/libebml/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_LIBEBML
 
 	  http://matroska.org
 
-comment "libebml requires a toolchain with C++ support"
+comment "libebml needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libedit/Config.in b/package/libedit/Config.in
--- a/package/libedit/Config.in
+++ b/package/libedit/Config.in
@@ -14,5 +14,5 @@ config BR2_PACKAGE_LIBEDIT
 	  sources which require pmake:
 	  http://www.thrysoee.dk/editline/
 
-comment "libedit requires a toolchain with WCHAR support"
+comment "libedit needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/libfreefare/Config.in b/package/libfreefare/Config.in
--- a/package/libfreefare/Config.in
+++ b/package/libfreefare/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_LIBFREEFARE
 
 	  http://code.google.com/p/nfc-tools/wiki/libfreefare
 
-comment "libfreefare needs a toolchain with thread support"
+comment "libfreefare needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libftdi/Config.in b/package/libftdi/Config.in
--- a/package/libftdi/Config.in
+++ b/package/libftdi/Config.in
@@ -18,5 +18,5 @@ config BR2_PACKAGE_LIBTFDI_CPP
 
 endif # BR2_PACKAGE_LIBFTDI
 
-comment "libftdi needs a toolchain with thread support"
+comment "libftdi needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libfuse/Config.in b/package/libfuse/Config.in
--- a/package/libfuse/Config.in
+++ b/package/libfuse/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_LIBFUSE
 
 	  http://fuse.sourceforge.net/
 
-comment "libfuse requires a toolchain with LARGEFILE, threads and dyanmic library support"
+comment "libfuse needs a toolchain w/ largefile, threads, dynamic library"
         depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/libgail/Config.in b/package/libgail/Config.in
--- a/package/libgail/Config.in
+++ b/package/libgail/Config.in
@@ -19,6 +19,6 @@ config BR2_PACKAGE_LIBGAIL
 
 	  http://developer.gnome.org/projects/gap
 
-comment "libgail requires a toolchain with WCHAR and threading support"
+comment "libgail needs a toolchain w/ wchar, threads"
 	depends on BR2_PACKAGE_LIBGTK2 && \
 		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/libglade/Config.in b/package/libglade/Config.in
--- a/package/libglade/Config.in
+++ b/package/libglade/Config.in
@@ -13,6 +13,6 @@ config BR2_PACKAGE_LIBGLADE
 
 	  http://ftp.gnome.org/pub/GNOME/sources/libglade/
 
-comment "libglade requires a toolchain with WCHAR and threading support"
+comment "libglade needs a toolchain w/ wchar, threads"
 	depends on BR2_PACKAGE_LIBGTK2 && \
 		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_LIBGLIB2
 
 	  http://www.gtk.org/
 
-comment "libglib2 requires a toolchain with WCHAR support and threading support"
+comment "libglib2 needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -31,6 +31,6 @@ config BR2_PACKAGE_LIBGTK2_DEMO
 
 endif
 
-comment "libgtk2 requires a toolchain with WCHAR, threading and C++ support"
+comment "libgtk2 needs a toolchain w/ wchar, threads, C++"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libhid/Config.in b/package/libhid/Config.in
--- a/package/libhid/Config.in
+++ b/package/libhid/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_LIBHID
 
 	  http://libhid.alioth.debian.org
 
-comment "libhid needs a toolchain with thread support"
+comment "libhid needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libical/Config.in b/package/libical/Config.in
--- a/package/libical/Config.in
+++ b/package/libical/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_LIBICAL
 
 	  http://www.citadel.org/doku.php/documentation:featured_projects:libical
 
-comment "libical requires a toolchain with WCHAR support"
+comment "libical needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/libiqrf/Config.in b/package/libiqrf/Config.in
--- a/package/libiqrf/Config.in
+++ b/package/libiqrf/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_LIBIQRF
 
 	  https://github.com/nandra/libiqrf
 
-comment "libiqrf needs a toolchain with thread support"
+comment "libiqrf needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libjson/Config.in b/package/libjson/Config.in
--- a/package/libjson/Config.in
+++ b/package/libjson/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_LIBJSON
 
 	  http://sourceforge.net/projects/libjson/
 
-comment "libjson requires a toolchain with C++ support"
+comment "libjson needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/liblo/Config.in b/package/liblo/Config.in
--- a/package/liblo/Config.in
+++ b/package/liblo/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_LIBLO
 
 	  http://liblo.sourceforge.net/
 
-comment "liblo requires thread support in toolchain"
+comment "liblo needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmatroska/Config.in b/package/libmatroska/Config.in
--- a/package/libmatroska/Config.in
+++ b/package/libmatroska/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_LIBMATROSKA
 
 	  http://matroska.org
 
-comment "libmatroska requires a toolchain with C++ support"
+comment "libmatroska needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -16,8 +16,8 @@ config BR2_PACKAGE_LIBMICROHTTPD_SSL
 	help
 	  Enable HTTPS (SSL) support.
 
-comment "libmicrohttpd needs a toolchain with thread support"
+comment "libmicrohttpd needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-comment "libmicrohttpd https support needs a toolchain with wchar support"
+comment "libmicrohttpd https support needs a toolchain w/ wchar"
 	depends on BR2_PACKAGE_LIBMICROHTTPD && !BR2_USE_WCHAR
diff --git a/package/libmms/Config.in b/package/libmms/Config.in
--- a/package/libmms/Config.in
+++ b/package/libmms/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_LIBMMS
 
 	  http://launchpad.net/libmms
 
-comment "libmms requires a toolchain with WCHAR and threading support"
+comment "libmms needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmnl/Config.in b/package/libmnl/Config.in
--- a/package/libmnl/Config.in
+++ b/package/libmnl/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_LIBMNL
 
 	  http://netfilter.org/projects/libmnl/
 
-comment "libmnl requires a toolchain with LARGEFILE support"
+comment "libmnl needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/libmpd/Config.in b/package/libmpd/Config.in
--- a/package/libmpd/Config.in
+++ b/package/libmpd/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_LIBMPD
 
 	  http://gmpcwiki.sarine.nl/index.php?title=Libmpd
 
-comment "libmpd requires a toolchain with WCHAR and threading support"
+comment "libmpd needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libnetfilter_acct/Config.in b/package/libnetfilter_acct/Config.in
--- a/package/libnetfilter_acct/Config.in
+++ b/package/libnetfilter_acct/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_LIBNETFILTER_ACCT
 
 	  http://www.netfilter.org/projects/libnetfilter_acct/
 
-comment "libnetfilter_acct requires a toolchain with LARGEFILE support"
+comment "libnetfilter_acct needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/libnetfilter_conntrack/Config.in b/package/libnetfilter_conntrack/Config.in
--- a/package/libnetfilter_conntrack/Config.in
+++ b/package/libnetfilter_conntrack/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_LIBNETFILTER_CONNTRAC
 
 	  http://www.netfilter.org/projects/libnetfilter_conntrack/
 
-comment "libnetfilter_conntrack requires a toolchain with LARGEFILE support"
+comment "libnetfilter_conntrack needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/libnetfilter_cthelper/Config.in b/package/libnetfilter_cthelper/Config.in
--- a/package/libnetfilter_cthelper/Config.in
+++ b/package/libnetfilter_cthelper/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_LIBNETFILTER_CTHELPER
 
 	  http://www.netfilter.org/projects/libnetfilter_cthelper/
 
-comment "libnetfilter_cthelper requires a toolchain with LARGEFILE support"
+comment "libnetfilter_cthelper needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/libnetfilter_cttimeout/Config.in b/package/libnetfilter_cttimeout/Config.in
--- a/package/libnetfilter_cttimeout/Config.in
+++ b/package/libnetfilter_cttimeout/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_LIBNETFILTER_CTTIMEOU
 
 	  http://www.netfilter.org/projects/libnetfilter_cttimeout/
 
-comment "libnetfilter_cttimout requires a toolchain with LARGEFILE support"
+comment "libnetfilter_cttimout needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/libnetfilter_queue/Config.in b/package/libnetfilter_queue/Config.in
--- a/package/libnetfilter_queue/Config.in
+++ b/package/libnetfilter_queue/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_LIBNETFILTER_QUEUE
 
 	  http://www.netfilter.org/projects/libnetfilter_queue/
 
-comment "libnetfilter_queue requires a toolchain with LARGEFILE and IPv6 support"
+comment "libnetfilter_queue needs a toolchain w/ largefile, IPv6"
 	depends on !BR2_LARGEFILE && !BR2_INET_IPV6
diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
--- a/package/libnfc/Config.in
+++ b/package/libnfc/Config.in
@@ -13,5 +13,5 @@ config BR2_PACKAGE_LIBNFC_EXAMPLES
 	depends on BR2_PACKAGE_LIBNFC
 	select BR2_PACKAGE_READLINE
 
-comment "libnfc needs a toolchain with thread support"
+comment "libnfc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libnl/Config.in b/package/libnl/Config.in
--- a/package/libnl/Config.in
+++ b/package/libnl/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_LIBNL_TOOLS
 	help
 	  Install binary tools.
 
-comment "libnl requires a toolchain with thread support"
+comment "libnl needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_LIBNSPR
 
 	  http://www.mozilla.org/projects/nspr/
 
-comment "libnspr requires a toolchain with LARGEFILE and threads support"
+comment "libnspr needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -15,6 +15,6 @@ config BR2_PACKAGE_LIBNSS
 
 	  http://www.mozilla.org/projects/security/pki/nss/
 
-comment "libnss requires a toolchain with LARGEFILE and thread support"
+comment "libnss needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/liboping/Config.in b/package/liboping/Config.in
--- a/package/liboping/Config.in
+++ b/package/liboping/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_LIBOPING
 
 	  http://verplant.org/liboping/
 
-comment "liboping requires a toolchain with IPv6 support enabled"
+comment "liboping needs a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_LIBPLAYER_GSTREAMER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_GSTREAMER
 
-comment "gstreamer backend requires a toolchain with WCHAR and threading support"
+comment "gstreamer backend needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_LIBPLAYER_PYTHON
@@ -33,5 +33,5 @@ config BR2_PACKAGE_LIBPLAYER_PYTHON
 	bool "Libplayer python bindings"
 endif
 
-comment "libplayer requires a toolchain with LARGEFILE and threads support"
+comment "libplayer needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libqmi/Config.in b/package/libqmi/Config.in
--- a/package/libqmi/Config.in
+++ b/package/libqmi/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_LIBQMI
 
 	  http://www.freedesktop.org/wiki/Software/libqmi/
 
-comment "libqmi requires a toolchain with WCHAR and threading support"
+comment "libqmi needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libraw/Config.in b/package/libraw/Config.in
--- a/package/libraw/Config.in
+++ b/package/libraw/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_LIBRAW
 
 	  http://www.libraw.org/
 
-comment "libraw requires a toolchain with C++ support enabled"
+comment "libraw needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -15,5 +15,5 @@ config BR2_PACKAGE_LIBRSVG
 
 	  http://librsvg.sourceforge.net/
 
-comment "librsvg requires a toolchain with WCHAR, threading and C++ support"
+comment "librsvg needs a toolchain w/ wchar, threads, C++"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libsecret/Config.in b/package/libsecret/Config.in
--- a/package/libsecret/Config.in
+++ b/package/libsecret/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_LIBSECRET
 
 	  https://wiki.gnome.org/Libsecret
 
-comment "libsecret requires a toolchain with WCHAR and threading support."
+comment "libsecret needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libserial/Config.in b/package/libserial/Config.in
--- a/package/libserial/Config.in
+++ b/package/libserial/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_LIBSERIAL
 
 	  http://libserial.sourceforge.net/
 
-comment "libserial requires a toolchain with C++ support enabled"
+comment "libserial needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libsigc/Config.in b/package/libsigc/Config.in
--- a/package/libsigc/Config.in
+++ b/package/libsigc/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_LIBSIGC
 
 	  http://libsigc.sourceforge.net/
 
-comment "libsigc++ requires a toolchain with C++ support enabled"
+comment "libsigc++ needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libsndfile/Config.in b/package/libsndfile/Config.in
--- a/package/libsndfile/Config.in
+++ b/package/libsndfile/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_LIBSNDFILE
 
 	  http://www.mega-nerd.com/libsndfile/
 
-comment "libsndfile requires a toolchain with LARGEFILE support"
+comment "libsndfile needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -23,5 +23,5 @@ config BR2_PACKAGE_LIBSOUP_SSL
 
 endif
 
-comment "libsoup requires a toolchain with WCHAR and threading support"
+comment "libsoup needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
--- a/package/libtorrent/Config.in
+++ b/package/libtorrent/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_LIBTORRENT
 
 	  http://libtorrent.rakshasa.no/
 
-comment "libtorrent requires a toolchain with C++ and threads support enabled"
+comment "libtorrent needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libupnp/Config.in b/package/libupnp/Config.in
--- a/package/libupnp/Config.in
+++ b/package/libupnp/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_LIBUPNP
 
 	  http://pupnp.sourceforge.net/
 
-comment "libupnp requires a toolchain with LARGEFILE and thread support"
+comment "libupnp needs a toolchain w/ largefile, threads"
 	depends on !(BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -10,6 +10,6 @@ config BR2_PACKAGE_LIBURCU
 
 	  http://lttng.org/urcu
 
-comment "liburcu needs threads support in toolchain"
+comment "liburcu needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/libusb/Config.in b/package/libusb/Config.in
--- a/package/libusb/Config.in
+++ b/package/libusb/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_LIBUSB
 
 	  http://libusb.sourceforge.net/
 
-comment "libusb needs a toolchain with thread support"
+comment "libusb needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -35,7 +35,7 @@ config BR2_PACKAGE_LIBV4L_V4L2_COMPLIANC
 	help
 	  Tool to test v4l2 API compliance of drivers
 
-comment "v4l2-compliance requires a toolchain with C++ support enabled"
+comment "v4l2-compliance needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_LIBV4L_V4L2_CTL
@@ -45,7 +45,7 @@ config BR2_PACKAGE_LIBV4L_V4L2_CTL
 	help
 	  Tool to configure v4l2 controls from the cmdline
 
-comment "v4l2-ctl requires a toolchain with C++ support enabled"
+comment "v4l2-ctl needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_LIBV4L_V4L2_DBG
@@ -54,10 +54,10 @@ config BR2_PACKAGE_LIBV4L_V4L2_DBG
 	help
 	  Tool to directly get and set registers of v4l2 devices
 
-comment "v4l2-dbg requires a toolchain with C++ support enabled"
+comment "v4l2-dbg needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 endif
 
-comment "libv4l requires a toolchain with LARGEFILE and thread support"
+comment "libv4l needs a toolchain w/ largefile, threads"
         depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libxmlpp/Config.in b/package/libxmlpp/Config.in
--- a/package/libxmlpp/Config.in
+++ b/package/libxmlpp/Config.in
@@ -10,6 +10,6 @@ config BR2_PACKAGE_LIBXMLPP
 
 	  http://libxmlplusplus.sourceforge.net/
 
-comment "libxml++ requires a toolchain with C++, WCHAR and threading support"
+comment "libxml++ needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 	!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/linknx/Config.in b/package/linknx/Config.in
--- a/package/linknx/Config.in
+++ b/package/linknx/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_LINKNX
 
 	  http://linknx.sourceforge.net/
 
-comment "linknx requires a toolchain with C++ support"
+comment "linknx needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/linphone/Config.in b/package/linphone/Config.in
--- a/package/linphone/Config.in
+++ b/package/linphone/Config.in
@@ -25,5 +25,5 @@ config BR2_PACKAGE_LINPHONE
 
 	  http://www.linphone.org/
 
-comment "linphone requires a toolchain with threads and C++ support enabled"
+comment "linphone needs a toolchain w/ threads, C++"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -8,6 +8,6 @@ config BR2_PACKAGE_LINUX_PAM
 
 	  http://linux-pam.org
 
-comment "linux-pam requires a toolchain with WCHAR and locale support"
+comment "linux-pam needs a toolchain w/ wchar, locale"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
 
diff --git a/package/live555/Config.in b/package/live555/Config.in
--- a/package/live555/Config.in
+++ b/package/live555/Config.in
@@ -29,5 +29,5 @@ config BR2_PACKAGE_LIVE555_MPEG2_INDEXER
 	  MPEG2 Transport Stream Indexer. Provides indexes allowing 'trick play'
 	  operation in the Live555MediaServer.
 
-comment "Live555 needs C++ compiler"
+comment "live555 needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_LOG4CXX
 
 	  http://apache.linux-mirror.org/logging/log4cxx/0.10.0
 
-comment "log4cxx requires C++ support in toolchain"
+comment "log4cxx needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/logrotate/Config.in b/package/logrotate/Config.in
--- a/package/logrotate/Config.in
+++ b/package/logrotate/Config.in
@@ -7,6 +7,6 @@ config BR2_PACKAGE_LOGROTATE
 
 	  https://fedorahosted.org/logrotate/
 
-comment "logrotate requires a toolchain with WCHAR support"
+comment "logrotate needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
diff --git a/package/lshw/Config.in b/package/lshw/Config.in
--- a/package/lshw/Config.in
+++ b/package/lshw/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_LSHW
 
 	  http://ezix.org/project/wiki/HardwareLiSter
 
-comment "lshw requires a toolchain with C++, LARGEFILE & WCHAR support enabled"
+comment "lshw needs a toolchain w/ C++, largefile, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -19,6 +19,6 @@ config BR2_PACKAGE_LTP_TESTSUITE
 
 	  http://ltp.sourceforge.net/
 
-comment "ltp-testsuite requires a toolchain with IPV6, RPC and thread support"
+comment "ltp-testsuite needs a toolchain w/ IPv6, RPC, threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || \
 		!BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -27,6 +27,6 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 
 	  http://lttng.org
 
-comment "lttng-babeltrace needs WCHAR, threading and LARGEFILE support"
+comment "lttng-babeltrace needs a toolchain w/ wchar, threads, largefile"
 	depends on BR2_PACKAGE_LTTNG_TOOLS && \
 		(!BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	# util-linux needs wchar and largefile
 	depends on BR2_USE_WCHAR
 	depends on BR2_LARGEFILE
-	# liburcu only works on some architectures and requires threads support
+	# liburcu only works on some architectures and requires threads support"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
@@ -17,6 +17,6 @@ config BR2_PACKAGE_LTTNG_LIBUST
 
 	  http://lttng.org
 
-comment "lttng-libust needs WCHAR, LARGEFILE and threads support"
+comment "lttng-libust needs a toolchain w/ wchar, largefile, threads"
 	depends on !(BR2_USE_WCHAR || BR2_LARGEFILE)
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -27,6 +27,6 @@ config BR2_PACKAGE_LTTNG_TOOLS
 
 	  http://lttng.org
 
-comment "lttng-tools needs LARGEFILE, threads and wchar support"
+comment "lttng-tools needs a toolchain w/ largefile, threads, wchar"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -29,5 +29,5 @@ config BR2_PACKAGE_LVM2_APP_LIBRARY
 	help
 	  Install application library (liblvm2app).
 
-comment "lvm2 requires a toolchain with LARGEFILE support"
+comment "lvm2 needs a toolchain w/ largefile"
         depends on !BR2_LARGEFILE
diff --git a/package/lxc/Config.in b/package/lxc/Config.in
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_LXC
 
 	  http://lxc.sourceforge.net/
 
-comment "lxc requires a toolchain with IPv6 and thread support"
+comment "lxc needs a toolchain w/ IPv6, threads"
 	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lzma/Config.in b/package/lzma/Config.in
--- a/package/lzma/Config.in
+++ b/package/lzma/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_LZMA
 
 	  http://tukaani.org/lzma/
 
-comment "lzma requires a toolchain with C++ support"
+comment "lzma needs a toolchain w/ C++"
         depends on !BR2_INSTALL_LIBSTDCPP && BR2_DEPRECATED
diff --git a/package/m4/Config.in b/package/m4/Config.in
--- a/package/m4/Config.in
+++ b/package/m4/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_M4
 
 	  http://www.gnu.org/software/m4/m4.html
 
-comment "m4 requires a toolchain with WCHAR support"
+comment "m4 needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
--- a/package/mediastreamer/Config.in
+++ b/package/mediastreamer/Config.in
@@ -13,5 +13,5 @@ config BR2_PACKAGE_MEDIASTREAMER
 
 	  http://www.linphone.org/eng/documentation/dev/mediastreamer2.html
 
-comment "mediastreamer requires a toolchain with threads and C++ support"
+comment "mediastreamer needs a toolchain w/ threads, C++"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/memtester/Config.in b/package/memtester/Config.in
--- a/package/memtester/Config.in
+++ b/package/memtester/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_MEMTESTER
 
 	  http://pyropus.ca/software/memtester/
 
-comment "memtester requires a toolchain with LARGEFILE support"
+comment "memtester needs a toolchain w/ largefile"
        depends on !BR2_LARGEFILE
diff --git a/package/midori/Config.in b/package/midori/Config.in
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -15,6 +15,6 @@ config BR2_PACKAGE_MIDORI
 
 	  http://software.twotoasts.de/?page=midori
 
-comment "midori requires C++, WCHAR, threading in toolchain and libgtk2"
+comment "midori needs libgtk2 and a toolchain w/ C++, wchar, threads"
         depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_LIBGTK2
diff --git a/package/minicom/Config.in b/package/minicom/Config.in
--- a/package/minicom/Config.in
+++ b/package/minicom/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_MINICOM
 
 	  http://alioth.debian.org/projects/minicom
 
-comment "minicom requires a toolchain with WCHAR support"
+comment "minicom needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
--- a/package/minidlna/Config.in
+++ b/package/minidlna/Config.in
@@ -17,5 +17,5 @@ config BR2_PACKAGE_MINIDLNA
 
 	  http://minidlna.sourceforge.net/
 
-comment "minidlna requires a toolchain with LARGEFILE and IPV6 support"
+comment "minidlna needs a toolchain w/ largefile, IPv6"
 	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
diff --git a/package/mongoose/Config.in b/package/mongoose/Config.in
--- a/package/mongoose/Config.in
+++ b/package/mongoose/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_MONGOOSE
 
 	  https://github.com/valenok/mongoose
 
-comment "mongoose needs a toolchain with thread support"
+comment "mongoose needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/monit/Config.in b/package/monit/Config.in
--- a/package/monit/Config.in
+++ b/package/monit/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_MONIT
 
 	  http://mmonit.com/monit/
 
-comment "monit requires a toolchain with threads support"
+comment "monit needs a toolchain w/ threads"
        depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -82,7 +82,7 @@ config BR2_PACKAGE_MPD_FFMPEG
 	  Enable ffmpeg input support.
 	  Select this if you want to play back files supported by ffmpeg.
 
-comment "ffmpeg support requires a toolchain with LARGEFILE and IPV6 support"
+comment "ffmpeg support needs a toolchain w/ largefile, IPv6"
 	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
 
 config BR2_PACKAGE_MPD_LAME
@@ -112,7 +112,7 @@ config BR2_PACKAGE_MPD_LIBSNDFILE
 	  Enable libsndfile input/streaming support.
 	  Select this if you want to play back WAV files.
 
-comment "mpd-libsndfile requires a toolchain with LARGEFILE support"
+comment "mpd-libsndfile needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
 
 config BR2_PACKAGE_MPD_MAD
@@ -182,6 +182,6 @@ config BR2_PACKAGE_MPD_WAVPACK
 
 endif
 
-comment "mpd requires a toolchain with C++, threading and WCHAR support"
+comment "mpd needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -25,5 +25,5 @@ config BR2_PACKAGE_MPLAYER_MENCODER
 
 endif
 
-comment "mplayer requires a toolchain with LARGEFILE support"
+comment "mplayer needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/msgpack/Config.in b/package/msgpack/Config.in
--- a/package/msgpack/Config.in
+++ b/package/msgpack/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_MSGPACK
 
 	  http://msgpack.org/
 
-comment "msgpack requires a toolchain with C++ support enabled"
+comment "msgpack needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/mtd/Config.in b/package/mtd/Config.in
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -63,7 +63,7 @@ config BR2_PACKAGE_MTD_MKFSUBIFS
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 
-comment "mkfs.ubifs requires largefile and wchar support in toolchain"
+comment "mkfs.ubifs needs a toolchain w/ largefile, wchar"
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_MTD_MTD_DEBUG
@@ -92,7 +92,7 @@ config BR2_PACKAGE_MTD_RECV_IMAGE
 	depends on BR2_INET_IPV6
 	bool "recv_image"
 
-comment "recv_image requires a toolchain with IPv6 support"
+comment "recv_image needs a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
 
 config BR2_PACKAGE_MTD_RFDDUMP
diff --git a/package/mtdev2tuio/Config.in b/package/mtdev2tuio/Config.in
--- a/package/mtdev2tuio/Config.in
+++ b/package/mtdev2tuio/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_MTDEV2TUIO
 
 	  https://github.com/olivopaolo/mtdev2tuio
 
-comment "mtdev2tuio requires thread support in toolchain"
+comment "mtdev2tuio needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mutt/Config.in b/package/mutt/Config.in
--- a/package/mutt/Config.in
+++ b/package/mutt/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_MUTT
 
 	  http://www.mutt.org/
 
-comment "mutt requires a toolchain with WCHAR support"
+comment "mutt needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/mysql_client/Config.in b/package/mysql_client/Config.in
--- a/package/mysql_client/Config.in
+++ b/package/mysql_client/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_MYSQL_CLIENT
 	help
 	  MySQL client
 
-comment "Mysql client requires a toolchain with C++ support enabled"
+comment "MySQL client needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/nbd/Config.in b/package/nbd/Config.in
--- a/package/nbd/Config.in
+++ b/package/nbd/Config.in
@@ -24,5 +24,5 @@ config BR2_NBD_SERVER
 
 endif
 
-comment "nbd requires a toolchain with WCHAR and threading support"
+comment "nbd needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ndisc6/Config.in b/package/ndisc6/Config.in
--- a/package/ndisc6/Config.in
+++ b/package/ndisc6/Config.in
@@ -1,4 +1,4 @@
-comment "ndisc6 requires a toolchain with IPv6 support"
+comment "ndisc6 needs a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
 
 config BR2_PACKAGE_NDISC6
diff --git a/package/neard/Config.in b/package/neard/Config.in
--- a/package/neard/Config.in
+++ b/package/neard/Config.in
@@ -23,5 +23,5 @@ config BR2_PACKAGE_NEARD_TOOLS
 
 endif
 
-comment "neard requires a toolchain with WCHAR and threads support"
+comment "neard needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/neardal/Config.in b/package/neardal/Config.in
--- a/package/neardal/Config.in
+++ b/package/neardal/Config.in
@@ -20,5 +20,5 @@ config BR2_PACKAGE_NEARDAL_NCL
 
 endif
 
-comment "neardal requires a toolchain with WCHAR and threading support"
+comment "neardal needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_NETATALK
 
 	  http://netatalk.sourceforge.net/
 
-comment "netatalk requires a toolchain with thread support"
+comment "netatalk needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/netkitbase/Config.in b/package/netkitbase/Config.in
--- a/package/netkitbase/Config.in
+++ b/package/netkitbase/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_NETKITBASE
 
 	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
 
-comment "netkitbase requires a toolchain with RPC support"
+comment "netkitbase needs a toolchain w/ RPC"
         depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/netkittelnet/Config.in b/package/netkittelnet/Config.in
--- a/package/netkittelnet/Config.in
+++ b/package/netkittelnet/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_NETKITTELNET
 
 	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
 
-comment "netkittelnet requires a toolchain with RPC support"
+comment "netkittelnet needs a toolchain w/ RPC"
 	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -27,6 +27,6 @@ config BR2_PACKAGE_NETWORK_MANAGER
 
 	  http://projects.gnome.org/NetworkManager/
 
-comment "NetworkManager requires a toolchain with IPV6, LARGEFILE, WCHAR and thread support"
+comment "NetworkManager needs a toolchain w/ IPv6, largefile, wchar, threads"
 	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/nfacct/Config.in b/package/nfacct/Config.in
--- a/package/nfacct/Config.in
+++ b/package/nfacct/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_NFACCT
 
 	  http://www.netfilter.org/projects/nfacct/
 
-comment "nfacct requires a toolchain with LARGEFILE support"
+comment "nfacct needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_NFS_UTILS
 
 	  http://sourceforge.net/projects/nfs
 
-comment "nfs-utils requires a toolchain with LARGEFILE and threading support"
+comment "nfs-utils needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || \
 		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
 
diff --git a/package/nmap/Config.in b/package/nmap/Config.in
--- a/package/nmap/Config.in
+++ b/package/nmap/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_NMAP
 
 	  http://nmap.org
 
-comment "nmap requires a toolchain with C++, IPV6 and thread support"
+comment "nmap needs a toolchain w/ C++, IPv6, threads"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_NODEJS
 
 	  http://nodejs.org/
 
-comment "nodejs requires a toolchain with C++, IPv6, large files, and threading"
+comment "nodejs needs a toolchain w/ C++, IPv6, largefile, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
 
diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
--- a/package/ntfs-3g/Config.in
+++ b/package/ntfs-3g/Config.in
@@ -30,5 +30,5 @@ config BR2_PACKAGE_NTFS_3G_NTFSPROGS
 
 endif
 
-comment "ntfs-3g requires a toolchain with LARGEFILE, WCHAR and threads support"
+comment "ntfs-3g needs a toolchain w/ largefile, wchar, threads"
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/numactl/Config.in b/package/numactl/Config.in
--- a/package/numactl/Config.in
+++ b/package/numactl/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_NUMACTL
 
 	  http://oss.sgi.com/projects/libnuma/
 
-comment "numactl requires a toolchain with LARGEFILE support"
+comment "numactl needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/ocrad/Config.in b/package/ocrad/Config.in
--- a/package/ocrad/Config.in
+++ b/package/ocrad/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_OCRAD
 
 	  http://www.gnu.org/software/ocrad/
 
-comment "ocrad needs a toolchain with C++ support"
+comment "ocrad needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -14,5 +14,5 @@ config BR2_PACKAGE_OFONO
 
 	  http://ofono.org/
 
-comment "ofono requires a toolchain with WCHAR and thread support"
+comment "ofono needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/olsr/Config.in b/package/olsr/Config.in
--- a/package/olsr/Config.in
+++ b/package/olsr/Config.in
@@ -13,5 +13,5 @@ config BR2_PACKAGE_OLSR
 
 	  http://www.olsr.org/
 
-comment "olsr requires a toolchain with IPv6 and threads support"
+comment "olsr needs a toolchain w/ IPv6, threads"
 	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -134,7 +134,7 @@ config BR2_PACKAGE_OPENCV_WITH_FFMPEG
 	help
 	  Use ffmpeg from the target system.
 
-comment "ffmpeg support requires a toolchain with LARGEFILE and IPV6 support"
+comment "ffmpeg support needs a toolchain w/ largefile, IPv6"
 	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
 
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
@@ -145,7 +145,7 @@ config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
 
-comment "gstreamer support requires a toolchain with WCHAR and threading support"
+comment "gstreamer support needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_OPENCV_WITH_GTK
@@ -192,7 +192,7 @@ config BR2_PACKAGE_OPENCV_WITH_V4L
 	help
 	  Enable Video 4 Linux support.
 
-comment "v4l support requires a toolchain with LARGEFILE and thread support"
+comment "v4l support needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "Install options"
@@ -208,5 +208,5 @@ config BR2_PACKAGE_OPENCV_INSTALL_DATA
 
 endif # BR2_PACKAGE_OPENCV
 
-comment "opencv requires a toolchain with C++ and WCHAR support"
+comment "opencv needs a toolchain w/ C++, wchar"
 	depends on !(BR2_INSTALL_LIBSTDCPP  && BR2_USE_WCHAR)
diff --git a/package/openobex/Config.in b/package/openobex/Config.in
--- a/package/openobex/Config.in
+++ b/package/openobex/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_OPENOBEX_BLUEZ
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_BLUEZ_UTILS
 
-comment "bluez support require a toolchain with WCHAR and thread support"
+comment "bluez support needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_OPENOBEX_LIBUSB
@@ -25,7 +25,7 @@ config BR2_PACKAGE_OPENOBEX_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBUSB
 
-comment "libusb support require a toolchain with thread support"
+comment "libusb support needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_OPENOBEX_APPS
@@ -41,5 +41,5 @@ config BR2_PACKAGE_OPENOBEX_DUMP
 
 endif
 
-comment "openobex requires a toolchain with IPV6 support"
+comment "openobex needs a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
diff --git a/package/openocd/Config.in b/package/openocd/Config.in
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -29,5 +29,5 @@ config BR2_PACKAGE_OPENOCD_VSLLINK
 
 endif # BR2_PACKAGE_OPENOCD
 
-comment "openocd needs a toolchain with thread support"
+comment "openocd needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/openpgm/Config.in b/package/openpgm/Config.in
--- a/package/openpgm/Config.in
+++ b/package/openpgm/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_OPENPGM
 
 	  http://code.google.com/p/openpgm/
 
-comment "openpgm needs a toolchain with WCHAR, threads and IPv6 support"
+comment "openpgm needs a toolchain w/ wchar, threads, IPv6"
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_INET_IPV6 && BR2_USE_WCHAR)
diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -1,4 +1,4 @@
-comment "openvpn requires a toolchain with IPV6 support"
+comment "openvpn needs a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
 
 config BR2_PACKAGE_OPENVPN
diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -21,5 +21,5 @@ config BR2_PACKAGE_OPROFILE
 	  interrupt handlers, kernel modules, the kernel, shared
 	  libraries, and applications.
 
-comment "oprofile requires a toolchain with C++ support enabled"
+comment "oprofile needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/orc/Config.in b/package/orc/Config.in
--- a/package/orc/Config.in
+++ b/package/orc/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_ORC
 
 	  http://code.entropywave.com/projects/orc/
 
-comment "orc requires a toolchain with thread support"
+comment "orc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ortp/Config.in b/package/ortp/Config.in
--- a/package/ortp/Config.in
+++ b/package/ortp/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_ORTP
 
 	  http://www.linphone.org/eng/documentation/dev/ortp.html
 
-comment "ortp requires a toolchain with threads support"
+comment "ortp needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/p11-kit/Config.in b/package/p11-kit/Config.in
--- a/package/p11-kit/Config.in
+++ b/package/p11-kit/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_P11_KIT
 
 	  http://p11-glue.freedesktop.org/p11-kit.html
 
-comment "p11-kit requires a toolchain with thread support"
+comment "p11-kit needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pango/Config.in b/package/pango/Config.in
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -19,6 +19,6 @@ config BR2_PACKAGE_PANGO
 
 	  http://www.pango.org/
 
-comment "pango requires a toolchain with WCHAR, threading and C++ support"
+comment "pango needs a toolchain w/ wchar, threads, C++"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/parted/Config.in b/package/parted/Config.in
--- a/package/parted/Config.in
+++ b/package/parted/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_PARTED
 
 	  http://www.gnu.org/software/parted/
 
-comment "parted requires a toolchain with LARGEFILE+WCHAR support"
+comment "parted needs a toolchain w/ largefile, wchar"
         depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/patch/Config.in b/package/patch/Config.in
--- a/package/patch/Config.in
+++ b/package/patch/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_PATCH
 
 	  http://www.gnu.org/software/patch/
 
-comment "patch needs a toolchain with WCHAR support"
+comment "patch needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -13,6 +13,6 @@ config BR2_PACKAGE_PCMANFM
 
 	  http://internap.dl.sourceforge.net/sourceforge/pcmanfm
 
-comment "pcmanfm requires a toolchain with WCHAR and threading support"
+comment "pcmanfm needs a toolchain w/ wchar, threads"
 	depends on BR2_PACKAGE_XORG7 && \
 	(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
--- a/package/pcsc-lite/Config.in
+++ b/package/pcsc-lite/Config.in
@@ -28,5 +28,5 @@ config BR2_PACKAGE_PCSC_LITE_EMBEDDED
 
 endif
 
-comment "pcsc-lite needs a toolchain with thread support"
+comment "pcsc-lite needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/perf/Config.in b/package/perf/Config.in
--- a/package/perf/Config.in
+++ b/package/perf/Config.in
@@ -18,5 +18,5 @@ config BR2_PACKAGE_PERF
 
 	  https://perf.wiki.kernel.org/
 
-comment "perf only available if Linux kernel is enabled, and requires largefile support"
+comment "perf only available if Linux kernel is enabled, and needs a toolchain w/ largefile"
 	depends on !BR2_LINUX_KERNEL || !BR2_LARGEFILE
diff --git a/package/php/Config.ext b/package/php/Config.ext
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -134,7 +134,7 @@ config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
 	help
 	  PDO driver for MySQL
 
-comment "MySQL drivers require a toolchain with C++ support"
+comment "MySQL drivers need a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
@@ -154,7 +154,7 @@ config BR2_PACKAGE_PHP_EXT_GETTEXT
 	help
 	  Gettext support
 
-comment "Gettext support requires a toolchain with WCHAR support"
+comment "Gettext support needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_PHP_EXT_ICONV
@@ -171,7 +171,7 @@ config BR2_PACKAGE_PHP_EXT_INTL
 	help
 	  Internationalization support
 
-comment "intl support requires a toolchain with C++ and WCHAR support"
+comment "intl support needs a toolchain w/ C++, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
 comment "Image processing"
diff --git a/package/pkg-config/Config.in b/package/pkg-config/Config.in
--- a/package/pkg-config/Config.in
+++ b/package/pkg-config/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_PKG_CONFIG
 
 	  http://www.freedesktop.org/software/pkgconfig/
 
-comment "pkg-config requires a toolchain with WCHAR and threading support"
+comment "pkg-config needs a toolchain w/ wchar, threads"
 	depends on BR2_DEPRECATED && (!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/poco/Config.in b/package/poco/Config.in
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -59,7 +59,7 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
 
 endif # BR2_PACKAGE_POCO
 
-comment "poco requires a toolchain with WCHAR, threads, and C++ support"
+comment "poco needs a toolchain w/ wchar, threads, C++"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
 	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel || BR2_xtensa)
diff --git a/package/polkit/Config.in b/package/polkit/Config.in
--- a/package/polkit/Config.in
+++ b/package/polkit/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_POLKIT
 
 	  http://www.freedesktop.org/wiki/Software/polkit
 
-comment "polkit requires a toolchain with WCHAR and threading support"
+comment "polkit needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/poppler/Config.in b/package/poppler/Config.in
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_POPPLER
 
 	   http://poppler.freedesktop.org/
 
-comment "poppler requires a toolchain with C++ support enabled"
+comment "poppler needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/portaudio/Config.in b/package/portaudio/Config.in
--- a/package/portaudio/Config.in
+++ b/package/portaudio/Config.in
@@ -1,4 +1,4 @@
-comment "portaudio needs a toolchain threads support"
+comment "portaudio needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_PORTAUDIO
diff --git a/package/portmap/Config.in b/package/portmap/Config.in
--- a/package/portmap/Config.in
+++ b/package/portmap/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_PORTMAP
 
 	  http://neil.brown.name/portmap/
 
-comment "portmap requires a toolchain with RPC support"
+comment "portmap needs a toolchain w/ RPC"
 	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
--- a/package/protobuf-c/Config.in
+++ b/package/protobuf-c/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_PROTOBUF_C
 
 	  http://code.google.com/p/protobuf-c/
 
-comment "protobuf-c requires a toolchain with C++ support enabled"
+comment "protobuf-c needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_PROTOBUF
 
 	  http://code.google.com/p/protobuf/
 
-comment "protobuf requires a toolchain with C++ support enabled"
+comment "protobuf needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/proxychains-ng/Config.in b/package/proxychains-ng/Config.in
--- a/package/proxychains-ng/Config.in
+++ b/package/proxychains-ng/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_PROXYCHAINS_NG
 
 	  https://github.com/rofl0r/proxychains
 
-comment "proxychains-ng needs a toolchain with thread support"
+comment "proxychains-ng needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -26,5 +26,5 @@ config BR2_PACKAGE_PULSEAUDIO_DAEMON
 	  recommended way of using PulseAudio unless you are building a
 	  headless system.
 
-comment "pulseaudio requires a toolchain with WCHAR, LARGEFILE and threads support"
+comment "pulseaudio needs a toolchain w/ wchar, largefile, threads"
 	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-nfc/Config.in b/package/python-nfc/Config.in
--- a/package/python-nfc/Config.in
+++ b/package/python-nfc/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_PYTHON_NFC
 
 	  https://launchpad.net/nfcpy
 
-comment "python-nfc requires a toolchain with threads support"
+comment "python-nfc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python/Config.in b/package/python/Config.in
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_PYTHON
 
 	  http://www.python.org/
 
-comment "python requires a toolchain with WCHAR support"
+comment "python needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 if BR2_PACKAGE_PYTHON
diff --git a/package/python3/Config.in b/package/python3/Config.in
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_PYTHON3
 
 	  http://www.python.org/
 
-comment "python3 requires a toolchain with WCHAR support"
+comment "python3 needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 if BR2_PACKAGE_PYTHON3
diff --git a/package/qt/Config.in b/package/qt/Config.in
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -1,4 +1,4 @@
-comment "qt requires a toolchain with C++ and threads support enabled"
+comment "qt needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 menuconfig BR2_PACKAGE_QT
@@ -300,7 +300,7 @@ config BR2_PACKAGE_QT_DBUS
 	help
 	  Build the Qt DBus module.
 
-comment "DBus Module requires a toolchain with thread support"
+comment "DBus Module needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_QT_XML
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -1,4 +1,4 @@
-comment "Qt5 needs a toolchain with WCHAR, IPv6, thread and C++ support"
+comment "Qt5 needs a toolchain w/ wchar, IPv6, threads, C++"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
 
 menuconfig BR2_PACKAGE_QT5
diff --git a/package/quagga/Config.in b/package/quagga/Config.in
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_QUAGGA_ZEBRA
 	help
 	  Build zebra daemon.
 
-comment "Zebra daemon requires a toolchain with IPV6 support"
+comment "zebra daemon needs a toolchain w/ IPv6"
 	depends on BR2_PACKAGE_QUAGGA && !BR2_INET_IPV6
 
 config BR2_PACKAGE_QUAGGA_TCP_ZEBRA
diff --git a/package/quota/Config.in b/package/quota/Config.in
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_QUOTA
 
 	  http://sourceforge.net/projects/linuxquota/
 
-comment "quota requires a toolchain with LARGEFILE, WCHAR and threading support"
+comment "quota needs a toolchain w/ largefile, wchar, threads"
 	depends on !BR2_LARGEFILE || \
 		!BR2_USE_WCHAR || \
 		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
diff --git a/package/radvd/Config.in b/package/radvd/Config.in
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_RADVD
 
 	  http://www.litech.org/radvd/
 
-comment "radvd requires a toolchain with IPV6 support"
+comment "radvd needs a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
diff --git a/package/redis/Config.in b/package/redis/Config.in
--- a/package/redis/Config.in
+++ b/package/redis/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_REDIS
 
 	  http://www.redis.io
 
-comment "redis needs a toolchain with LARGEFILE and thread support"
+comment "redis needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -16,5 +16,5 @@ config BR2_PACKAGE_RPI_USERLAND
 
 	  https://github.com/raspberrypi/userland/
 
-comment "rpi-userland requires a toolchain with C++ and LARGEFILE support"
+comment "rpi-userland needs a toolchain w/ C++, largefile"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
diff --git a/package/rpm/Config.in b/package/rpm/Config.in
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -1,4 +1,4 @@
-comment "rpm requires a toolchain with thread support"
+comment "rpm needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_RPM
@@ -30,7 +30,7 @@ config BR2_PACKAGE_RPM_XZ_PAYLOADS
 	help
 	  Support for xz payloads in RPM.
 
-comment "xz payload support requires a toolchain with c++ support"
+comment "xz payload support needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 endif
diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
--- a/package/rrdtool/Config.in
+++ b/package/rrdtool/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_RRDTOOL
 
 	  http://oss.oetiker.ch/rrdtool/
 
-comment "rrdtool requires a toolchain with WCHAR support"
+comment "rrdtool needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -22,5 +22,5 @@ config BR2_PACKAGE_RT_TESTS
 
 	  http://rt.wiki.kernel.org
 
-comment "rt-tests requires a toolchain with threads support"
+comment "rt-tests needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -13,5 +13,5 @@ config BR2_PACKAGE_RTORRENT
 
 	  http://libtorrent.rakshasa.no/
 
-comment "rtorrent requires a toolchain with C++, threads and WCHAR support"
+comment "rtorrent needs a toolchain w/ C++, threads, wchar"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/ruby/Config.in b/package/ruby/Config.in
--- a/package/ruby/Config.in
+++ b/package/ruby/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_RUBY
 
 	  http://www.ruby-lang.org/
 
-comment "ruby requires a toolchain with WCHAR support"
+comment "ruby needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/samba/Config.in b/package/samba/Config.in
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_SAMBA
 	  NOTE: A complete Samba install takes over 50MB of space,
 		so choose only the components you need.
 
-comment "samba needs a toolchain with thread support"
+comment "samba needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 if BR2_PACKAGE_SAMBA
diff --git a/package/schifra/Config.in b/package/schifra/Config.in
--- a/package/schifra/Config.in
+++ b/package/schifra/Config.in
@@ -14,5 +14,5 @@ config BR2_PACKAGE_SCHIFRA_EXAMPLES
 	help
 	  Build and install the schifra example applications.
 
-comment "schifra requires a toolchain with C++ support enabled"
+comment "schifra needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -92,5 +92,5 @@ comment "ui module requires X.org"
 
 endif # BR2_PACKAGE_SCONESERVER
 
-comment "sconeserver requires a toolchain with C++ and thread support enabled"
+comment "sconeserver needs a toolchain w/ C++, threads"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/sed/Config.in b/package/sed/Config.in
--- a/package/sed/Config.in
+++ b/package/sed/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_SED
 
 	  http://sed.sourceforge.net/
 
-comment "sed requires a toolchain with WCHAR support"
+comment "sed needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
--- a/package/ser2net/Config.in
+++ b/package/ser2net/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_SER2NET
 
 	  http://ser2net.sourceforge.net
 
-comment "ser2net requires a toolchain with IPV6 support"
+comment "ser2net needs a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
diff --git a/package/sg3_utils/Config.in b/package/sg3_utils/Config.in
--- a/package/sg3_utils/Config.in
+++ b/package/sg3_utils/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_SG3_UTILS_PROGS
 	bool "install programs"
 	depends on BR2_PACKAGE_SG3_UTILS
 
-comment "sg3-utils requires a toolchain with LARGEFILE and threads support"
+comment "sg3-utils needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/shared-mime-info/Config.in b/package/shared-mime-info/Config.in
--- a/package/shared-mime-info/Config.in
+++ b/package/shared-mime-info/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_SHARED_MIME_INFO
 
 	  http://freedesktop.org/wiki/Software/shared-mime-info
 
-comment "shared-mime-info requires a toolchain with WCHAR and threading support"
+comment "shared-mime-info needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/smartmontools/Config.in b/package/smartmontools/Config.in
--- a/package/smartmontools/Config.in
+++ b/package/smartmontools/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_SMARTMONTOOLS
 
 	  http://smartmontools.sourceforge.net/
 
-comment "smartmontools requires a toolchain with C++ support enabled"
+comment "smartmontools needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/snappy/Config.in b/package/snappy/Config.in
--- a/package/snappy/Config.in
+++ b/package/snappy/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_SNAPPY
 
 	  http://code.google.com/p/snappy/
 
-comment "snappy requires a toolchain with C++ support"
+comment "snappy needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/snowball-init/Config.in b/package/snowball-init/Config.in
--- a/package/snowball-init/Config.in
+++ b/package/snowball-init/Config.in
@@ -12,6 +12,6 @@ config BR2_PACKAGE_SNOWBALL_INIT
 
 	  http://www.igloocommunity.org
 
-comment "snowball-init requires a toolchain with WCHAR and threading support"
+comment "snowball-init needs a toolchain w/ wchar, threads"
 	depends on !BR2_avr32 && \
 		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/socat/Config.in b/package/socat/Config.in
--- a/package/socat/Config.in
+++ b/package/socat/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_SOCAT
 
 	  http://www.dest-unreach.org/socat/
 
-comment "socat requires a toolchain with thread support"
+comment "socat needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/socketcand/Config.in b/package/socketcand/Config.in
--- a/package/socketcand/Config.in
+++ b/package/socketcand/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_SOCKETCAND
 
 	  https://github.com/dschanoeh/socketcand
 
-comment "socketcand requires a toolchain with threads support"
+comment "socketcand needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/spice/Config.in b/package/spice/Config.in
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -37,7 +37,7 @@ config BR2_PACKAGE_SPICE_CLIENT
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 
-comment "client requires a toolchain with threads and C++"
+comment "client needs a toolchain w/ threads, C++"
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 
diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -37,5 +37,5 @@ config BR2_PACKAGE_SQUASHFS_XZ
 
 endif
 
-comment "squashfs requires a toolchain with LARGEFILE and threads support"
+comment "squashfs needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/squashfs3/Config.in b/package/squashfs3/Config.in
--- a/package/squashfs3/Config.in
+++ b/package/squashfs3/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_SQUASHFS3
 
 	  http://squashfs.sourceforge.net/
 
-comment "squashfs3 requires a toolchain with LARGEFILE support"
+comment "squashfs3 needs a toolchain w/ largefile"
 	depends on BR2_DEPRECATED && !BR2_LARGEFILE
diff --git a/package/squid/Config.in b/package/squid/Config.in
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,4 +1,4 @@
-comment "Squid requires a toolchain with C++ and IPv6 support enabled"
+comment "Squid needs a toolchain w/ C++, IPv6"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6
 
 config BR2_PACKAGE_SQUID
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -15,5 +15,5 @@ config BR2_PACKAGE_SSHFS
 
 	  http://fuse.sourceforge.net/sshfs.html
 
-comment "sshfs requires a toolchain with LARGEFILE, WCHAR, threads and dynamic library support"
+comment "sshfs needs a toolchain w/ largefile, wchar, threads, dynamic library"
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -17,7 +17,7 @@ menuconfig BR2_PACKAGE_STRONGSWAN
 
 if BR2_PACKAGE_STRONGSWAN
 
-comment "kernel-netlink and socket-default options require a toolchain with IPV6 support"
+comment "kernel-netlink and socket-default options need a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
 
 choice
diff --git a/package/synergy/Config.in b/package/synergy/Config.in
--- a/package/synergy/Config.in
+++ b/package/synergy/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_SYNERGY
 
 	  http://synergy2.sourceforge.net/
 
-comment "synergy requires a toolchain with C++ and WCHAR support enabled"
+comment "synergy needs a toolchain w/ C++, wchar"
 	depends on BR2_PACKAGE_XORG7 && !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_SYSKLOGD
 
 	  http://www.infodrom.org/products/sysklogd/
 
-comment "syslogd requires a toolchain with LARGEFILE support"
+comment "syslogd needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -24,5 +24,5 @@ config BR2_PACKAGE_SYSPROF_GUI
 
 endif
 
-comment "sysprof requires a toolchain with WCHAR and threading support"
+comment "sysprof needs a toolchain w/ wchar, threads"
         depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -18,6 +18,6 @@ config BR2_PACKAGE_SYSTEMD
 
 	  http://freedesktop.org/wiki/Software/systemd
 
-comment "systemd not available (depends on /dev management with udev and ipv6 support, and thread support in toolchain)"
+comment "systemd needs udev /dev management and a toolchain w/ IPv6, threads"
 	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || !BR2_INET_IPV6 || \\
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/taglib/Config.in b/package/taglib/Config.in
--- a/package/taglib/Config.in
+++ b/package/taglib/Config.in
@@ -18,5 +18,5 @@ config BR2_PACKAGE_TAGLIB_ASF
 	depends on BR2_PACKAGE_TAGLIB
 	bool "taglib wma support"
 
-comment "taglib requires a toolchain with C++ support enabled"
+comment "taglib needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/tar/Config.in b/package/tar/Config.in
--- a/package/tar/Config.in
+++ b/package/tar/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_TAR
 
 	  http://www.gnu.org/software/tar/
 
-comment "tar requires a toolchain with WCHAR support"
+comment "tar needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/ti-utils/Config.in b/package/ti-utils/Config.in
--- a/package/ti-utils/Config.in
+++ b/package/ti-utils/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_TI_UTILS
 
 	  http://linuxwireless.org/en/users/Drivers/wl12xx/calibrator
 
-comment "ti-utils requires a toolchain with thread support"
+comment "ti-utils needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/trace-cmd/Config.in b/package/trace-cmd/Config.in
--- a/package/trace-cmd/Config.in
+++ b/package/trace-cmd/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_TRACE_CMD
 
 	  http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git
 
-comment "trace-cmd needs a toolchain with largefile and threads support"
+comment "trace-cmd needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/transmission/Config.in b/package/transmission/Config.in
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_TRANSMISSION_UTP
 	help
 	  Install support for uTorrent Transport Protocol
 
-comment "uTP requires a toolchain with C++ support"
+comment "uTP needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_TRANSMISSION_CLI
@@ -41,9 +41,9 @@ config BR2_PACKAGE_TRANSMISSION_GTK
 	help
 	  Install transmission GTK-based GUI interface.
 
-comment "transmission-gtk requires a toolchain with locale support"
+comment "transmission-gtk needs a toolchain w/ locale"
 	depends on BR2_PACKAGE_LIBGTK2 && !BR2_ENABLE_LOCALE
 endif
 
-comment "Transmission requires a toolchain with IPv6 and threads support"
+comment "transmission needs a toolchain w/ IPv6, threads"
 	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/tree/Config.in b/package/tree/Config.in
--- a/package/tree/Config.in
+++ b/package/tree/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_TREE
 
 	  http://mama.indstate.edu/users/ice/tree/
 
-comment "tree requires a toolchain with WCHAR support"
+comment "tree needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/tstools/Config.in b/package/tstools/Config.in
--- a/package/tstools/Config.in
+++ b/package/tstools/Config.in
@@ -16,5 +16,5 @@ config BR2_PACKAGE_TSTOOLS
 
 	  http://tstools.berlios.de/
 
-comment "tstools needs largefile support in toolchain"
+comment "tstools needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,4 +1,4 @@
-comment "tvheadend needs a toolchain with LARGEFILE, IPv6 and THREADS support"
+comment "tvheadend needs a toolchain w/ largefile, IPv6, threads"
     depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_TVHEADEND
diff --git a/package/udev/Config.in b/package/udev/Config.in
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -32,7 +32,7 @@ config BR2_PACKAGE_UDEV_ALL_EXTRAS
 	  Enable all extras with external dependencies like
 	  libacl, hwdata and libglib2
 
-comment "enabling all extras requires a toolchain with WCHAR and threading support"
+comment "enabling all extras needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 endif
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -35,6 +35,6 @@ config BR2_PACKAGE_UDISKS_LVM2
 
 endif
 
-comment "udisks requires /dev mgmnt set to udev under System configuration and a toolchain with WCHAR and threading support"
+comment "udisks needs udev /dev management and a toolchain w/ wchar, threads"
 	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
--- a/package/udpcast/Config.in
+++ b/package/udpcast/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_UDPCAST
 
 	  http://www.udpcast.linux.lu/
 
-comment "udpcast requires a toolchain with LARGEFILE and threads support"
+comment "udpcast needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
 menu "udpcast tools selection"
diff --git a/package/ulogd/Config.in b/package/ulogd/Config.in
--- a/package/ulogd/Config.in
+++ b/package/ulogd/Config.in
@@ -14,6 +14,6 @@ config BR2_PACKAGE_ULOGD
 
 	  http://www.netfilter.org/projects/ulogd/
 
-comment "ulogd requires a toolchain with IPV6, LARGEFILE and dynamic library support"
+comment "ulogd needs a toolchain w/ IPv6, largefile, dynamic library"
 	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB
 	depends on BR2_USE_MMU
diff --git a/package/unionfs/Config.in b/package/unionfs/Config.in
--- a/package/unionfs/Config.in
+++ b/package/unionfs/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_UNIONFS
 
 	  http://podgorny.cz/moin/UnionFsFuse
 
-comment "unionfs requires a toolchain with LARGEFILE, threads and dynamic library support"
+comment "unionfs needs a toolchain w/ largefile, threads, dynamic library"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/urg/Config.in b/package/urg/Config.in
--- a/package/urg/Config.in
+++ b/package/urg/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_URG
 
 	  http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en/
 
-comment "urg requires a toolchain with C++ support"
+comment "urg needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/usb_modeswitch/Config.in b/package/usb_modeswitch/Config.in
--- a/package/usb_modeswitch/Config.in
+++ b/package/usb_modeswitch/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_USB_MODESWITCH
 
 	  http://www.draisberghof.de/usb_modeswitch/
 
-comment "usb_modeswitch needs a toolchain with thread support"
+comment "usb_modeswitch needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/usb_modeswitch_data/Config.in b/package/usb_modeswitch_data/Config.in
--- a/package/usb_modeswitch_data/Config.in
+++ b/package/usb_modeswitch_data/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_USB_MODESWITCH_DATA
 
 	  http://www.draisberghof.de/usb_modeswitch/
 
-comment "usb_modeswitch_data needs a toolchain with thread support"
+comment "usb_modeswitch_data needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/usbredir/Config.in b/package/usbredir/Config.in
--- a/package/usbredir/Config.in
+++ b/package/usbredir/Config.in
@@ -1,4 +1,4 @@
-comment "usbredir needs a toolchain with threads"
+comment "usbredir needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_USBREDIR
diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -17,5 +17,5 @@ config BR2_PACKAGE_USBUTILS_ZLIB
 	  filesystem, but it also makes lsusb slower since it has
 	  to decompress the file every time it's run.
 
-comment "usbutils needs a toolchain with thread support"
+comment "usbutils needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ushare/Config.in b/package/ushare/Config.in
--- a/package/ushare/Config.in
+++ b/package/ushare/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_USHARE
 
 	  http://ushare.geexbox.org/
 
-comment "ushare requires a toolchain with LARGEFILE and thread support"
+comment "ushare needs a toolchain w/ largefile, threads"
 	depends on !(BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/ussp-push/Config.in b/package/ussp-push/Config.in
--- a/package/ussp-push/Config.in
+++ b/package/ussp-push/Config.in
@@ -14,5 +14,5 @@ config BR2_PACKAGE_USSP_PUSH
 
 	  http://www.xmailserver.org/ussp-push.html
 
-comment "ussp-push require a toolchain with WCHAR, IPV6 and thread support"
+comment "ussp-push needs a toolchain w/ wchar, IPv6, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -92,7 +92,7 @@ config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTIL
 	help
 	  Build login utilities (last, login, su, sulogin)
 
-comment "login utilities require a toolchain with locale support"
+comment "login utilities needs a toolchain w/ locale"
 	depends on !BR2_ENABLE_LOCALE
 
 config BR2_PACKAGE_UTIL_LINUX_MESG
@@ -174,5 +174,5 @@ endif
 
 endif
 
-comment "util-linux requires a toolchain with LARGEFILE + WCHAR support"
+comment "util-linux needs a toolchain w/ largefile, wchar"
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/vala/Config.in b/package/vala/Config.in
--- a/package/vala/Config.in
+++ b/package/vala/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_VALA
 
 	  http://live.gnome.org/Vala
 
-comment "vala requires a toolchain with WCHAR and threading support"
+comment "vala needs a toolchain w/ wchar, threads"
 	depends on BR2_DEPRECATED && (!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/wayland/Config.in b/package/wayland/Config.in
--- a/package/wayland/Config.in
+++ b/package/wayland/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_WAYLAND
 
 	  http://wayland.freedesktop.org/
 
-comment "wayland requires a toolchain with thread support"
+comment "wayland needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -28,6 +28,6 @@ config BR2_PACKAGE_WEBKIT
 
 	  http://webkit.org/
 
-comment "webkit requires libgtk2 and a toolchain with C++, WCHAR, threading support"
+comment "webkit needs libgtk2 and a toolchain w/ C++, wchar, threads"
 	depends on !BR2_PACKAGE_LIBGTK2 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/webrtc-audio-processing/Config.in b/package/webrtc-audio-processing/Config.in
--- a/package/webrtc-audio-processing/Config.in
+++ b/package/webrtc-audio-processing/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSI
 
 	  http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/
 
-comment "webrtc-audio-processing requires a toolchain with C++ and thread support enabled"
+comment "webrtc-audio-processing needs a toolchain w/ C++, threads"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/wget/Config.in b/package/wget/Config.in
--- a/package/wget/Config.in
+++ b/package/wget/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_WGET
 
 	  http://www.gnu.org/software/wget/
 
-comment "wget requires a toolchain with WCHAR support"
+comment "wget needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_WIRESHARK
 
 	  http://www.wireshark.org
 
-comment "wireshark requires a toolchain with WCHAR and threading support"
+comment "wireshark needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/wvdial/Config.in b/package/wvdial/Config.in
--- a/package/wvdial/Config.in
+++ b/package/wvdial/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_WVDIAL
 
 	  http://wvdial.googlecode.com/
 
-comment "wvdial requires a toolchain with C++ and largefile support enabled"
+comment "wvdial needs a toolchain w/ C++, largefile"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
diff --git a/package/wvstreams/Config.in b/package/wvstreams/Config.in
--- a/package/wvstreams/Config.in
+++ b/package/wvstreams/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_WVSTREAMS
 
 	  http://wvstreams.googlecode.com/
 
-comment "wvstreams requires a toolchain with C++ and largefile support enabled"
+comment "wvstreams needs a toolchain w/ C++, largefile"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -261,5 +261,5 @@ if BR2_PACKAGE_XORG7
 	endmenu
 endif
 
-comment "X.org requires a toolchain with WCHAR support"
+comment "X.org needs a toolchain w/ wchar"
         depends on !BR2_USE_WCHAR
diff --git a/package/x11r7/xapp_xinput-calibrator/Config.in b/package/x11r7/xapp_xinput-calibrator/Config.in
--- a/package/x11r7/xapp_xinput-calibrator/Config.in
+++ b/package/x11r7/xapp_xinput-calibrator/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_XAPP_XINPUT_CALIBRATO
 
 	  http://www.freedesktop.org/wiki/Software/xinput_calibrator
 
-comment "xinput-calibrator requires a toolchain with C++ support"
+comment "xinput-calibrator needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/x11r7/xlib_libpciaccess/Config.in b/package/x11r7/xlib_libpciaccess/Config.in
--- a/package/x11r7/xlib_libpciaccess/Config.in
+++ b/package/x11r7/xlib_libpciaccess/Config.in
@@ -4,5 +4,5 @@ config BR2_PACKAGE_XLIB_LIBPCIACCESS
 	help
 	  X.Org libpciaccess
 
-comment "libpciaccess requires a toolchain with LARGEFILE support"
+comment "libpciaccess needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -75,7 +75,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_M
 	  input and graphics) are built separately from the X.org
 	  server (see the xdriver* packages).
 
-comment "Modular X.org requires largefile and C++ support"
+comment "Modular X.org needs a toolchain w/ largefile, C++"
 	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP)
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -1,4 +1,4 @@
-comment "xenomai requires thread support in toolchain"
+comment "xenomai needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_XENOMAI
diff --git a/package/xerces/Config.in b/package/xerces/Config.in
--- a/package/xerces/Config.in
+++ b/package/xerces/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_XERCES
 
 	  http://xml.apache.org/xerces-c/
 
-comment "xerces-c++ requires a toolchain with C++ and WCHAR support enabled"
+comment "xerces-c++ needs a toolchain w/ C++, wchar"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -2,7 +2,7 @@
 comment "Note that xfsprogs needs a toolchain with UCLIBC_SV4_DEPRECATED and UCLIBC_HAS_OBSOLETE_BSD_SIGNAL enabled"
 	depends on BR2_PACKAGE_XFSPROGS
 
-comment "xfsprogs requires a toolchain with LARGEFILE + WCHAR support"
+comment "xfsprogs needs a toolchain w/ largefile, wchar"
         depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
 
 config BR2_PACKAGE_XFSPROGS
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -1,4 +1,4 @@
-comment "zeromq requires a toolchain with C++, IPV6, LARGEFILE, WCHAR & thread support"
+comment "zeromq needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
 
diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_ZMQPP
 
 	  http://github.com/benjamg/zmqpp
 
-comment "zmqpp requires a toolchain with C++, IPV6, LARGEFILE, WCHAR & thread support"
+comment "zmqpp needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
 
@@ -29,5 +29,5 @@ config BR2_PACKAGE_ZMQPP_CLIENT
 	  Build and install the zmqpp client, a command line tool that can be
 	  used to listen or send to zeromq sockets.
 
-comment "zmqpp client requires a toolchain with thread support"
+comment "zmqpp client needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_ZMQPP && !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/zxing/Config.in b/package/zxing/Config.in
--- a/package/zxing/Config.in
+++ b/package/zxing/Config.in
@@ -1,4 +1,4 @@
-comment "zxing requires a toolchain with C++ support"
+comment "zxing needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_ZXING
diff --git a/package/zyre/Config.in b/package/zyre/Config.in
--- a/package/zyre/Config.in
+++ b/package/zyre/Config.in
@@ -16,6 +16,6 @@ config BR2_PACKAGE_ZYRE
 
 	  http://zyre.org
 
-comment "zyre requires a toolchain with C++, IPv6, LARGEFILE, WCHAR & thread support"
+comment "zyre needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/system/Config.in b/system/Config.in
--- a/system/Config.in
+++ b/system/Config.in
@@ -87,7 +87,7 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMI
 	depends on !BR2_PREFER_STATIC_LIB # udev -> kmod
 	select BR2_PACKAGE_UDEV
 
-comment "udev requires a toolchain with LARGEFILE + WCHAR support"
+comment "udev needs a toolchain w/ largefile, wchar"
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
 
 comment "udev doesn't work with 'prefer static libraries'"
@@ -118,7 +118,7 @@ config BR2_INIT_SYSTEMD
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_SYSTEMD
 
-comment 'systemd requires largefile, wchar, IPv6, threads and udev support'
+comment 'systemd needs udev /dev management and a toolchain w/ largefile, wchar, IPv6, threads'
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && \
 		     BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS && \
 		     BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV)
