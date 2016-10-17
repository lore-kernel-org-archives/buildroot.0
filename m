From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:05:47 -0300
Subject: [Buildroot] [PATCH 00/93] TLP/PPS: package cleanup part 2
Message-ID: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

This patchset takes over from the first round of cleanup.

It takes into account feedback on the patches that weren't applied for
the previous set and addressed them, like setting the proper host env
for host packages and other steps like configure and install for target
packages.

Gustavo Zacarias (93):
  pppd: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  poco: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  ocrad: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  moarvm: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  librtas: use $(TARGET_CONFIGURE_OPTS) when calling $(MAKE)
  ed: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  botan: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  zip: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  zip: use $(HOST_MAKE_ENV) when calling $(MAKE)
  ncurses: use $(HOST_MAKE_ENV) when calling $(MAKE)
  lz4: use $(HOST_MAKE_ENV) when calling $(MAKE)
  openssl: use $(HOST_MAKE_ENV) when calling $(MAKE)
  jimtcl: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  mysql: use $(HOST_MAKE_ENV) when calling $(MAKE)
  dvb-apps: use $(TARGET_CONFIGURE_OPTS) when calling $(MAKE)
  mrouted: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  nanocom: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  cryptopp: use $(HOST_CONFIGURE_OPTS) when calling $(MAKE)
  libpfm4: use $(MAKE) rather than make directly
  libpfm4: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  libpfm4: use $(TARGET_CONFIGURE_OPTS) when calling $(MAKE)
  tekui: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  vim: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  tvheadend: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  snowball-hdmiservice: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  input-event-daemon: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  am335x-pru-package: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  proxychains-ng: use $(TARGET_CONFIGURE_OPTS) when calling $(MAKE)
  ux500-firmware: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  lua: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  lua: use $(HOST_MAKE_ENV) when calling $(MAKE)
  tidsp-binaries: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  lrzsz: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  ca-certificates: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  softether: use $(HOST_MAKE_ENV) when calling $(MAKE)
  4th: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  4th: use $(HOST_MAKE_ENV) when calling $(MAKE)
  latencytop: use $(TARGET_CONFIGURE_OPTS) when calling $(MAKE)
  libsemanage: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  libsemanage: use $(HOST_MAKE_ENV) when calling $(MAKE)
  memstat: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  am33x-cm3: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  fio: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  lm-sensors: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  shapelib: use $(TARGET_CONFIGURE_OPTS) when calling $(MAKE)
  rt-tests: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  dmalloc: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  checkpolicy: use $(HOST_MAKE_ENV) when calling $(MAKE)
  lzip: use $(HOST_MAKE_ENV) when calling $(MAKE)
  lzip: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  rs485conf: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  netplug: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  axel: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  libtomcrypt: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  xtables-addons: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  binutils: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  directfb: use $(HOST_MAKE_ENV) when calling $(MAKE)
  p7zip: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  lshw: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  ti-gfx: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  memtester: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  libselinux: use $(TARGET_CONFIGURE_OPTS) when calling $(MAKE)
  libselinux: use $(HOST_CONFIGURE_OPTS) when calling $(MAKE)
  linux-backports: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  keyutils: use $(TARGET_CONFIGURE_OPTS) when calling $(MAKE)
  libsepol: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  libsepol: use $(HOST_MAKE_ENV) when calling $(MAKE)
  luajit: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  luajit: use $(HOST_MAKE_ENV) when calling $(MAKE)
  collectd: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  dstat: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  mii-diag: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  ti-sgx-um: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  perl: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  perl: use $(HOST_MAKE_ENV) when calling $(MAKE)
  dtc: use $(TARGET_CONFIGURE_OPTS) when calling $(MAKE)
  dtc: use $(HOST_CONFIGURE_OPTS) when calling $(MAKE)
  omap-u-boot-utils: use $(HOST_MAKE_ENV) when calling $(MAKE)
  iodine: use $(TARGET_CONFIGURE_OPTS) when calling $(MAKE)
  bitstream: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  vsftpd: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  liblockfile: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  ezxml: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  qwt: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  sepolgen: use $(HOST_MAKE_ENV) when calling $(MAKE)
  qtuio: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  fmlib: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  wiringpi: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  tinyhttpd: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  turbolua: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  qt: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  aufs-util: use $(HOST_MAKE_ENV) when calling $(MAKE)
  cryptodev-linux: use $(TARGET_MAKE_ENV) when calling $(MAKE)

 package/4th/4th.mk                                   |  8 ++++----
 package/am335x-pru-package/am335x-pru-package.mk     |  6 +++---
 package/am33x-cm3/am33x-cm3.mk                       |  2 +-
 package/aufs-util/aufs-util.mk                       |  2 +-
 package/axel/axel.mk                                 |  4 ++--
 package/binutils/binutils.mk                         |  8 ++++----
 package/bitstream/bitstream.mk                       |  2 +-
 package/botan/botan.mk                               |  8 ++++----
 package/ca-certificates/ca-certificates.mk           |  2 +-
 package/checkpolicy/checkpolicy.mk                   |  4 ++--
 package/collectd/collectd.mk                         |  2 +-
 package/cryptodev-linux/cryptodev-linux.mk           |  2 +-
 package/cryptopp/cryptopp.mk                         |  4 ++--
 package/directfb/directfb.mk                         |  2 +-
 package/dmalloc/dmalloc.mk                           |  2 +-
 package/dstat/dstat.mk                               |  2 +-
 package/dtc/dtc.mk                                   |  6 +++---
 package/dvb-apps/dvb-apps.mk                         |  6 ++++--
 package/ed/ed.mk                                     |  6 +++---
 package/ezxml/ezxml.mk                               |  2 +-
 package/fio/fio.mk                                   |  4 ++--
 package/fmlib/fmlib.mk                               |  2 +-
 package/input-event-daemon/input-event-daemon.mk     |  2 +-
 package/iodine/iodine.mk                             |  2 +-
 package/jimtcl/jimtcl.mk                             |  2 +-
 package/keyutils/keyutils.mk                         |  4 ++--
 package/latencytop/latencytop.mk                     |  2 +-
 package/liblockfile/liblockfile.mk                   |  2 +-
 package/libpfm4/libpfm4.mk                           |  6 +++---
 package/librtas/librtas.mk                           |  4 ++--
 package/libselinux/libselinux.mk                     | 14 +++++++-------
 package/libsemanage/libsemanage.mk                   | 14 +++++++-------
 package/libsepol/libsepol.mk                         | 10 +++++-----
 package/libtomcrypt/libtomcrypt.mk                   |  4 ++--
 package/linux-backports/linux-backports.mk           |  2 +-
 package/lm-sensors/lm-sensors.mk                     |  6 +++---
 package/lrzsz/lrzsz.mk                               |  2 +-
 package/lshw/lshw.mk                                 |  4 +++-
 package/lua/lua.mk                                   | 10 +++++-----
 package/luajit/luajit.mk                             | 10 +++++-----
 package/lz4/lz4.mk                                   |  4 ++--
 package/lzip/lzip.mk                                 |  8 ++++----
 package/memstat/memstat.mk                           |  2 +-
 package/memtester/memtester.mk                       |  4 ++--
 package/mii-diag/mii-diag.mk                         |  4 ++--
 package/moarvm/moarvm.mk                             |  8 ++++----
 package/mrouted/mrouted.mk                           |  4 ++--
 package/mysql/mysql.mk                               | 14 +++++++-------
 package/nanocom/nanocom.mk                           |  2 +-
 package/ncurses/ncurses.mk                           |  4 ++--
 package/netplug/netplug.mk                           |  4 ++--
 package/ocrad/ocrad.mk                               |  8 ++++----
 package/omap-u-boot-utils/omap-u-boot-utils.mk       |  2 +-
 package/openssl/openssl.mk                           |  4 ++--
 package/p7zip/p7zip.mk                               |  2 +-
 package/perl/perl.mk                                 | 10 +++++-----
 package/poco/poco.mk                                 |  8 ++++----
 package/pppd/pppd.mk                                 |  6 +++---
 package/proxychains-ng/proxychains-ng.mk             |  2 +-
 package/qt/qt.mk                                     |  4 ++--
 package/qtuio/qtuio.mk                               |  2 +-
 package/qwt/qwt.mk                                   |  4 ++--
 package/rs485conf/rs485conf.mk                       |  4 ++--
 package/rt-tests/rt-tests.mk                         |  4 ++--
 package/sepolgen/sepolgen.mk                         |  4 ++--
 package/shapelib/shapelib.mk                         |  4 ++--
 package/snowball-hdmiservice/snowball-hdmiservice.mk |  6 +++---
 package/softether/softether.mk                       |  6 +++---
 package/tekui/tekui.mk                               |  4 ++--
 package/ti-gfx/ti-gfx.mk                             |  4 ++--
 package/ti-sgx-um/ti-sgx-um.mk                       |  4 ++--
 package/tidsp-binaries/tidsp-binaries.mk             |  2 +-
 package/tinyhttpd/tinyhttpd.mk                       |  2 +-
 package/turbolua/turbolua.mk                         |  4 ++--
 package/tvheadend/tvheadend.mk                       |  4 ++--
 package/ux500-firmware/ux500-firmware.mk             |  4 ++--
 package/vim/vim.mk                                   | 10 +++++-----
 package/vsftpd/vsftpd.mk                             |  2 +-
 package/wiringpi/wiringpi.mk                         |  8 ++++----
 package/xl2tp/xl2tp.mk                               |  2 +-
 package/xtables-addons/xtables-addons.mk             |  4 ++--
 package/zip/zip.mk                                   |  8 ++++----
 82 files changed, 195 insertions(+), 191 deletions(-)

-- 
2.7.3
