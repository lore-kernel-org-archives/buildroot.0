From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:19 -0000
Subject: [Buildroot] [git commit] packages: all salute the passing of avr32
Message-ID: <20150302222718.36C67807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9863553fe8fa16a4d19f652b409a44bb58ef5567
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aiccu/Config.in                            |    5 -
 package/alsa-lib/0001-avr32-bad-inline.patch       |   91 -
 package/alsa-lib/alsa-lib.mk                       |    4 -
 package/avrdude/Config.in                          |    2 -
 package/bdwgc/Config.in                            |    2 +-
 package/blktrace/Config.in                         |    2 +-
 package/bluez5_utils/Config.in                     |    1 -
 package/bluez_utils/Config.in                      |    3 +-
 package/btrfs-progs/Config.in                      |    2 -
 package/collectd/Config.in                         |    1 -
 package/connman/Config.in                          |    3 +-
 package/cwiid/Config.in                            |    2 -
 package/dovecot/Config.in                          |    2 -
 package/dropwatch/dropwatch.mk                     |    4 +-
 .../dvb-apps/0002-Fix-compiler-warning-flags.patch |   25 -
 package/e2fsprogs/Config.in                        |    2 +-
 package/ecryptfs-utils/Config.in                   |    4 +-
 package/efl/expedite/Config.in                     |    2 -
 package/efl/libecore/Config.in                     |    2 -
 package/efl/libedbus/Config.in                     |    2 -
 package/efl/libedje/Config.in                      |    2 -
 package/efl/libelementary/Config.in                |    2 -
 package/efl/libethumb/Config.in                    |    2 -
 package/efl/libevas/Config.in                      |    2 -
 package/elfutils/Config.in                         |    4 -
 package/enlightenment/Config.in                    |    2 -
 package/fbv/0001-arch.patch.avr32                  |   48 -
 package/gadgetfs-test/Config.in                    |    2 +-
 package/gpsd/Config.in                             |    3 -
 package/gstreamer/gstreamer/gstreamer.mk           |    2 +-
 package/gstreamer1/gst1-libav/Config.in            |    1 -
 package/gstreamer1/gst1-plugins-bad/Config.in      |    1 -
 package/gstreamer1/gstreamer1/gstreamer1.mk        |    2 +-
 package/iputils/Config.in                          |    1 -
 package/keyutils/Config.in                         |    2 +-
 package/libaio/0002-avr32-support.patch            |  122 -
 package/libaio/Config.in                           |    2 +-
 package/libcap-ng/Config.in                        |    1 -
 package/libcec/0001-no-psabi-warning.patch         |   22 -
 package/libev/Config.in                            |    2 +-
 package/libmad/0002-optimization.patch.avr32       | 2922 --------------------
 package/libmad/Config.in                           |    1 -
 package/libmicrohttpd/libmicrohttpd.mk             |    5 -
 package/libsecret/Config.in                        |    3 -
 ...tack-direction-for-the-AVR32-architecture.patch |   33 -
 package/libusb/libusb.mk                           |    4 -
 package/lua-ev/Config.in                           |    2 +-
 package/lxc/Config.in                              |    2 -
 package/mpd/Config.in                              |    6 +-
 package/mtr/Config.in                              |    1 -
 package/mysql/Config.in                            |    1 -
 package/network-manager/Config.in                  |    2 -
 package/ofono/Config.in                            |    2 -
 package/opencv/Config.in                           |    1 -
 package/openobex/Config.in                         |    3 +-
 package/openpgm/Config.in                          |    2 -
 package/oprofile/oprofile.mk                       |    5 -
 package/php/Config.ext                             |    4 -
 package/pinentry/Config.in                         |    2 -
 package/poco/Config.in                             |    5 +-
 .../012-support-library-path-old-compilers.patch   |   54 -
 .../011-support-library-path-old-compilers.patch   |   54 -
 package/qemu/qemu.mk                               |    1 -
 package/qt/Config.in                               |    2 -
 package/qt/qt.mk                                   |    2 -
 package/qt5/Config.in                              |    2 -
 package/qt5/qt5base/Config.in                      |    1 -
 package/qt5/qt5connectivity/Config.in              |    3 +-
 package/radvd/Config.in                            |    2 -
 package/samba/Config.in                            |    2 -
 package/samba4/Config.in                           |    1 -
 package/sconeserver/Config.in                      |    4 +-
 package/snowball-init/Config.in                    |    3 +-
 package/squid/Config.in                            |    1 -
 package/trace-cmd/Config.in                        |    1 -
 package/tvheadend/Config.in                        |    6 -
 package/uboot-tools/uboot-tools.mk                 |    4 +-
 package/udisks/Config.in                           |    3 -
 package/ussp-push/Config.in                        |    3 +-
 package/util-linux/Config.in                       |    2 -
 package/wayland/Config.in                          |    2 -
 package/weston/Config.in                           |    2 -
 package/wpa_supplicant/Config.in                   |    1 -
 package/x11r7/xserver_xorg-server/Config.in        |    4 -
 package/zeromq/Config.in                           |    1 -
 package/zmqpp/Config.in                            |    2 -
 86 files changed, 27 insertions(+), 3528 deletions(-)

Patch is too large, so refusing to show it
