From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:10:39 -0300
Subject: [Buildroot] [PATCH 00/45] Comma separate licenses
Message-ID: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series sanitizes the PKG_LICENSE entries.
No attempt is made to interpret and/or improve upton the conditions of
each license, it's just a style fix.

Gustavo Zacarias (45):
  elfutils: comma separate licenses
  gstreamer1: comma separate licenses
  gst1-plugins-base: comma separate licenses
  dtv-scan-tables: comma separate licenses
  dbus-glib: comma separate licenses
  trace-cmd: comma separate licenses
  bluez5_utils: comma separate licenses
  qemu: comma separate licenses
  lvm2: comma separate licenses
  libbsd: comma separate licenses
  liboping: comma separate licenses
  gdb: comma separate licenses
  xz: comma separate licenses
  bc: comma separate licenses
  omniorb: comma separate licenses
  libfuse: comma separate licenses
  collectd: comma separate licenses
  libiscsi: comma separate licenses
  pppd: comma separate licenses
  minidlna: comma separate licenses
  ustr: comma separate licenses
  python-pyzmq: comma separate licenses
  ntfs-3g: comma separate licenses
  bluez_utils: comma separate licenses
  dvb_apps: comma separate licenses
  keyutils: comma separate licenses
  dbus: comma separate licenses
  rsyslog: comma separate licenses
  webkitgtk24: comma separate licenses
  iputils: comma separate licenses
  libidn: comma separate licenses
  olsr: comma separate licenses
  libtasn1: comma separate licenses
  gnutls: comma separate licenses
  fmlib: comma separate licenses
  vde2: comma separate licenses
  ltp-testsuite: comma separate licenses
  taglib: comma separate licenses
  setools: comma separate licenses
  swig: comma separate licenses
  audiofile: comma separate licenses
  lttng-babeltrace: comma separate licenses
  lttng-libust: comma separate licenses
  lttng-modules: comma separate licenses
  lttng-tools: comma separate licenses

 package/audiofile/audiofile.mk                            | 2 +-
 package/bc/bc.mk                                          | 2 +-
 package/bluez5_utils/bluez5_utils.mk                      | 2 +-
 package/bluez_utils/bluez_utils.mk                        | 2 +-
 package/collectd/collectd.mk                              | 2 +-
 package/dbus-glib/dbus-glib.mk                            | 2 +-
 package/dbus/dbus.mk                                      | 2 +-
 package/dtv-scan-tables/dtv-scan-tables.mk                | 2 +-
 package/dvb-apps/dvb-apps.mk                              | 2 +-
 package/elfutils/elfutils.mk                              | 2 +-
 package/fmlib/fmlib.mk                                    | 2 +-
 package/gdb/gdb.mk                                        | 2 +-
 package/gnutls/gnutls.mk                                  | 2 +-
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 2 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk               | 2 +-
 package/iputils/iputils.mk                                | 2 +-
 package/keyutils/keyutils.mk                              | 2 +-
 package/libbsd/libbsd.mk                                  | 2 +-
 package/libfuse/libfuse.mk                                | 2 +-
 package/libidn/libidn.mk                                  | 2 +-
 package/libiscsi/libiscsi.mk                              | 2 +-
 package/liboping/liboping.mk                              | 2 +-
 package/libtasn1/libtasn1.mk                              | 2 +-
 package/ltp-testsuite/ltp-testsuite.mk                    | 2 +-
 package/lttng-babeltrace/lttng-babeltrace.mk              | 2 +-
 package/lttng-libust/lttng-libust.mk                      | 2 +-
 package/lttng-modules/lttng-modules.mk                    | 2 +-
 package/lttng-tools/lttng-tools.mk                        | 2 +-
 package/lvm2/lvm2.mk                                      | 2 +-
 package/minidlna/minidlna.mk                              | 2 +-
 package/ntfs-3g/ntfs-3g.mk                                | 2 +-
 package/olsr/olsr.mk                                      | 2 +-
 package/omniorb/omniorb.mk                                | 2 +-
 package/pppd/pppd.mk                                      | 2 +-
 package/python-pyzmq/python-pyzmq.mk                      | 2 +-
 package/qemu/qemu.mk                                      | 2 +-
 package/rsyslog/rsyslog.mk                                | 2 +-
 package/setools/setools.mk                                | 2 +-
 package/swig/swig.mk                                      | 2 +-
 package/taglib/taglib.mk                                  | 2 +-
 package/trace-cmd/trace-cmd.mk                            | 2 +-
 package/ustr/ustr.mk                                      | 2 +-
 package/vde2/vde2.mk                                      | 2 +-
 package/webkitgtk24/webkitgtk24.mk                        | 2 +-
 package/xz/xz.mk                                          | 2 +-
 46 files changed, 46 insertions(+), 46 deletions(-)

-- 
2.4.10
