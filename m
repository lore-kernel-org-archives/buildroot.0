From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:26:57 +0200
Subject: [Buildroot] [git commit] boot,
	package: use SPDX short identifier for BSD-3c
Message-ID: <20170401134425.7054E80119@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f59b378a36ae81db2672b417a68c7358b41ccc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want to use SPDX identifier for license string as much as possible.
SPDX short identifier for BSD-3c is BSD-3-Clause.

This change is done using following command.
find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/BSD-3c/BSD-3-Clause/g'

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk          | 2 +-
 package/acpica/acpica.mk                                   | 2 +-
 package/am335x-pru-package/am335x-pru-package.mk           | 2 +-
 package/assimp/assimp.mk                                   | 2 +-
 package/atf/atf.mk                                         | 2 +-
 package/clapack/clapack.mk                                 | 2 +-
 package/cmake/cmake.mk                                     | 2 +-
 package/dante/dante.mk                                     | 2 +-
 package/dash/dash.mk                                       | 2 +-
 package/dawgdic/dawgdic.mk                                 | 2 +-
 package/e2fsprogs/e2fsprogs.mk                             | 2 +-
 package/eigen/eigen.mk                                     | 2 +-
 package/elftosb/elftosb.mk                                 | 2 +-
 package/empty/empty.mk                                     | 2 +-
 package/eventlog/eventlog.mk                               | 2 +-
 package/faifa/faifa.mk                                     | 2 +-
 package/file/file.mk                                       | 2 +-
 package/flann/flann.mk                                     | 2 +-
 package/fmlib/fmlib.mk                                     | 2 +-
 package/freescale-imx/imx-codec/imx-codec.mk               | 2 +-
 package/freeswitch/freeswitch.mk                           | 4 ++--
 package/gauche/gauche.mk                                   | 2 +-
 package/gflags/gflags.mk                                   | 2 +-
 package/glibc/glibc.mk                                     | 2 +-
 package/glog/glog.mk                                       | 2 +-
 package/gnu-efi/gnu-efi.mk                                 | 2 +-
 package/go-bootstrap/go-bootstrap.mk                       | 2 +-
 package/go/go.mk                                           | 2 +-
 package/google-breakpad/google-breakpad.mk                 | 2 +-
 package/gpsd/gpsd.mk                                       | 2 +-
 package/gtest/gtest.mk                                     | 2 +-
 package/heimdal/heimdal.mk                                 | 2 +-
 package/hidapi/hidapi.mk                                   | 2 +-
 package/hiredis/hiredis.mk                                 | 2 +-
 package/hostapd/hostapd.mk                                 | 2 +-
 package/hplip/hplip.mk                                     | 2 +-
 package/hwloc/hwloc.mk                                     | 2 +-
 package/iperf3/iperf3.mk                                   | 2 +-
 package/ipmitool/ipmitool.mk                               | 2 +-
 package/ipmiutil/ipmiutil.mk                               | 2 +-
 package/iputils/iputils.mk                                 | 2 +-
 package/iqvlinux/iqvlinux.mk                               | 2 +-
 package/jpeg-turbo/jpeg-turbo.mk                           | 2 +-
 package/jquery-sparkline/jquery-sparkline.mk               | 2 +-
 package/kyua/kyua.mk                                       | 2 +-
 package/lapack/lapack.mk                                   | 2 +-
 package/leveldb/leveldb.mk                                 | 2 +-
 package/libarchive/libarchive.mk                           | 2 +-
 package/libbsd/libbsd.mk                                   | 2 +-
 package/libcap/libcap.mk                                   | 2 +-
 package/libdnet/libdnet.mk                                 | 2 +-
 package/libedit/libedit.mk                                 | 2 +-
 package/libevent/libevent.mk                               | 2 +-
 package/libglew/libglew.mk                                 | 2 +-
 package/libglob/libglob.mk                                 | 2 +-
 package/libjpeg/libjpeg.mk                                 | 2 +-
 package/libkcapi/libkcapi.mk                               | 2 +-
 package/libldns/libldns.mk                                 | 2 +-
 package/liblinear/liblinear.mk                             | 2 +-
 package/libmbus/libmbus.mk                                 | 2 +-
 package/libmemcached/libmemcached.mk                       | 2 +-
 package/libminiupnpc/libminiupnpc.mk                       | 2 +-
 package/libmpdclient/libmpdclient.mk                       | 2 +-
 package/libnatpmp/libnatpmp.mk                             | 2 +-
 package/libnet/libnet.mk                                   | 2 +-
 package/libogg/libogg.mk                                   | 2 +-
 package/libpcap/libpcap.mk                                 | 2 +-
 package/libpqxx/libpqxx.mk                                 | 2 +-
 package/libsha1/libsha1.mk                                 | 2 +-
 package/libshairplay/libshairplay.mk                       | 2 +-
 package/libsilk/libsilk.mk                                 | 2 +-
 package/libsrtp/libsrtp.mk                                 | 2 +-
 package/libtheora/libtheora.mk                             | 2 +-
 package/libtirpc/libtirpc.mk                               | 2 +-
 package/libubox/libubox.mk                                 | 2 +-
 package/libupnp/libupnp.mk                                 | 2 +-
 package/liburiparser/liburiparser.mk                       | 2 +-
 package/libuv/libuv.mk                                     | 2 +-
 package/libvorbis/libvorbis.mk                             | 2 +-
 package/libvpx/libvpx.mk                                   | 2 +-
 package/libxmlrpc/libxmlrpc.mk                             | 2 +-
 package/libyuv/libyuv.mk                                   | 2 +-
 package/libzip/libzip.mk                                   | 2 +-
 package/lighttpd/lighttpd.mk                               | 2 +-
 package/linux-pam/linux-pam.mk                             | 2 +-
 package/linux-syscall-support/linux-syscall-support.mk     | 2 +-
 package/lua-csnappy/lua-csnappy.mk                         | 2 +-
 package/lutok/lutok.mk                                     | 2 +-
 package/memcached/memcached.mk                             | 2 +-
 package/mfgtools/mfgtools.mk                               | 2 +-
 package/minidlna/minidlna.mk                               | 2 +-
 package/minissdpd/minissdpd.mk                             | 2 +-
 package/mongrel2/mongrel2.mk                               | 2 +-
 package/mrouted/mrouted.mk                                 | 2 +-
 package/musepack/musepack.mk                               | 2 +-
 package/musl-compat-headers/musl-compat-headers.mk         | 2 +-
 package/ne10/ne10.mk                                       | 2 +-
 package/netcat-openbsd/netcat-openbsd.mk                   | 2 +-
 package/netsurf-buildsystem/netsurf-buildsystem.mk         | 2 +-
 package/nginx-upload/nginx-upload.mk                       | 2 +-
 package/olsr/olsr.mk                                       | 2 +-
 package/open-plc-utils/open-plc-utils.mk                   | 2 +-
 package/openblas/openblas.mk                               | 2 +-
 package/opencv/opencv.mk                                   | 2 +-
 package/opencv3/opencv3.mk                                 | 2 +-
 package/openipmi/openipmi.mk                               | 2 +-
 package/openmpi/openmpi.mk                                 | 2 +-
 package/openntpd/openntpd.mk                               | 2 +-
 package/openssh/openssh.mk                                 | 2 +-
 package/openswan/openswan.mk                               | 2 +-
 package/opus/opus.mk                                       | 2 +-
 package/opusfile/opusfile.mk                               | 2 +-
 package/orc/orc.mk                                         | 2 +-
 package/p11-kit/p11-kit.mk                                 | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk                         | 2 +-
 package/pcre/pcre.mk                                       | 2 +-
 package/pcsc-lite/pcsc-lite.mk                             | 2 +-
 package/php-zmq/php-zmq.mk                                 | 2 +-
 package/pppd/pppd.mk                                       | 2 +-
 package/protobuf/protobuf.mk                               | 2 +-
 package/pru-software-support/pru-software-support.mk       | 2 +-
 package/python-babel/python-babel.mk                       | 2 +-
 package/python-cherrypy/python-cherrypy.mk                 | 2 +-
 package/python-click/python-click.mk                       | 2 +-
 package/python-configobj/python-configobj.mk               | 2 +-
 package/python-couchdb/python-couchdb.mk                   | 2 +-
 package/python-cryptography/python-cryptography.mk         | 2 +-
 package/python-cssselect/python-cssselect.mk               | 2 +-
 package/python-dateutil/python-dateutil.mk                 | 2 +-
 package/python-django/python-django.mk                     | 2 +-
 package/python-dpkt/python-dpkt.mk                         | 2 +-
 package/python-enum34/python-enum34.mk                     | 2 +-
 package/python-flask-babel/python-flask-babel.mk           | 2 +-
 package/python-flask-jsonrpc/python-flask-jsonrpc.mk       | 2 +-
 package/python-flask/python-flask.mk                       | 2 +-
 package/python-idna/python-idna.mk                         | 2 +-
 package/python-ipy/python-ipy.mk                           | 2 +-
 package/python-ipython/python-ipython.mk                   | 2 +-
 package/python-itsdangerous/python-itsdangerous.mk         | 2 +-
 package/python-jinja2/python-jinja2.mk                     | 2 +-
 package/python-logbook/python-logbook.mk                   | 2 +-
 package/python-lxml/python-lxml.mk                         | 2 +-
 package/python-markdown/python-markdown.mk                 | 2 +-
 package/python-markupsafe/python-markupsafe.mk             | 2 +-
 package/python-mistune/python-mistune.mk                   | 2 +-
 package/python-netaddr/python-netaddr.mk                   | 2 +-
 package/python-numpy/python-numpy.mk                       | 2 +-
 package/python-posix-ipc/python-posix-ipc.mk               | 2 +-
 package/python-prompt-toolkit/python-prompt-toolkit.mk     | 2 +-
 package/python-protobuf/python-protobuf.mk                 | 2 +-
 package/python-psutil/python-psutil.mk                     | 2 +-
 package/python-pycparser/python-pycparser.mk               | 2 +-
 package/python-pydal/python-pydal.mk                       | 2 +-
 package/python-pypcap/python-pypcap.mk                     | 2 +-
 package/python-pyqrcode/python-pyqrcode.mk                 | 2 +-
 package/python-pysnmp-apps/python-pysnmp-apps.mk           | 2 +-
 package/python-pysnmp-mibs/python-pysnmp-mibs.mk           | 2 +-
 package/python-pysnmp/python-pysnmp.mk                     | 2 +-
 package/python-pysocks/python-pysocks.mk                   | 2 +-
 package/python-pytrie/python-pytrie.mk                     | 2 +-
 package/python-pyusb/python-pyusb.mk                       | 2 +-
 package/python-pyzmq/python-pyzmq.mk                       | 2 +-
 package/python-setproctitle/python-setproctitle.mk         | 2 +-
 package/python-ujson/python-ujson.mk                       | 2 +-
 package/python-werkzeug/python-werkzeug.mk                 | 2 +-
 package/python-whoosh/python-whoosh.mk                     | 2 +-
 package/python-ws4py/python-ws4py.mk                       | 2 +-
 package/python-xlrd/python-xlrd.mk                         | 2 +-
 package/python-xlwt/python-xlwt.mk                         | 2 +-
 package/qemu/qemu.mk                                       | 2 +-
 package/qt5/qt5base/qt5base.mk                             | 2 +-
 package/qt5/qt5connectivity/qt5connectivity.mk             | 2 +-
 package/qt5/qt5enginio/qt5enginio.mk                       | 2 +-
 package/qt5/qt5webchannel/qt5webchannel.mk                 | 2 +-
 package/qt5/qt5webkit/qt5webkit.mk                         | 2 +-
 package/qt5/qt5websockets/qt5websockets.mk                 | 2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk               | 2 +-
 package/redis/redis.mk                                     | 2 +-
 package/rpcbind/rpcbind.mk                                 | 2 +-
 package/rpi-firmware/rpi-firmware.mk                       | 2 +-
 package/rpi-userland/rpi-userland.mk                       | 2 +-
 package/rs485conf/rs485conf.mk                             | 2 +-
 package/ruby/ruby.mk                                       | 2 +-
 package/sdparm/sdparm.mk                                   | 2 +-
 package/sg3_utils/sg3_utils.mk                             | 2 +-
 package/shairport-sync/shairport-sync.mk                   | 2 +-
 package/snappy/snappy.mk                                   | 2 +-
 package/socketcand/socketcand.mk                           | 2 +-
 package/spawn-fcgi/spawn-fcgi.mk                           | 2 +-
 package/speex/speex.mk                                     | 2 +-
 package/spice-protocol/spice-protocol.mk                   | 2 +-
 package/strace/strace.mk                                   | 2 +-
 package/sudo/sudo.mk                                       | 2 +-
 package/swig/swig.mk                                       | 2 +-
 package/tcpdump/tcpdump.mk                                 | 2 +-
 package/tegrarcm/tegrarcm.mk                               | 2 +-
 package/ti-utils/ti-utils.mk                               | 2 +-
 package/tinyalsa/tinyalsa.mk                               | 2 +-
 package/tor/tor.mk                                         | 2 +-
 package/tremor/tremor.mk                                   | 2 +-
 package/trousers/trousers.mk                               | 2 +-
 package/unionfs/unionfs.mk                                 | 2 +-
 package/util-linux/util-linux.mk                           | 2 +-
 package/vboot-utils/vboot-utils.mk                         | 2 +-
 package/vde2/vde2.mk                                       | 2 +-
 package/wavpack/wavpack.mk                                 | 2 +-
 package/webp/webp.mk                                       | 2 +-
 package/webrtc-audio-processing/webrtc-audio-processing.mk | 2 +-
 package/wpa_supplicant/wpa_supplicant.mk                   | 2 +-
 package/xdotool/xdotool.mk                                 | 2 +-
 package/yasm/yasm.mk                                       | 2 +-
 211 files changed, 212 insertions(+), 212 deletions(-)

Patch is too large, so refusing to show it
