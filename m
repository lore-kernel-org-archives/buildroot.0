From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Thu, 30 Mar 2017 19:13:38 +0530
Subject: [Buildroot] [PATCH 09/21] boot,
	package: use SPDX short identifier for BSD-3c
In-Reply-To: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1490881430-10434-10-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We want to use SPDX identifier for license string as much as possible.
SPDX short identifier for BSD-3c is BSD-3-Clause.

This change is done using following command.
find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/BSD-3c/BSD-3-Clause/g'

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
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

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 5acfab3..aa19686 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION))
-ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3c
+ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
 ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.md
 
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index 18870c2..ebfa4b6 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -7,7 +7,7 @@
 ACPICA_VERSION = 20161117
 ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz
 ACPICA_SITE = https://acpica.org/sites/acpica/files
-ACPICA_LICENSE = BSD-3c or GPL-2.0
+ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
 ACPICA_LICENSE_FILES = source/include/acpi.h
 ACPICA_DEPENDENCIES = host-bison host-flex
 
diff --git a/package/am335x-pru-package/am335x-pru-package.mk b/package/am335x-pru-package/am335x-pru-package.mk
index d6bffb4..a2465b1 100644
--- a/package/am335x-pru-package/am335x-pru-package.mk
+++ b/package/am335x-pru-package/am335x-pru-package.mk
@@ -6,7 +6,7 @@
 
 AM335X_PRU_PACKAGE_VERSION = 5f374ad57cc195f28bf5e585c3d446aba6ee7096
 AM335X_PRU_PACKAGE_SITE = $(call github,beagleboard,am335x_pru_package,$(AM335X_PRU_PACKAGE_VERSION))
-AM335X_PRU_PACKAGE_LICENSE = BSD-3c
+AM335X_PRU_PACKAGE_LICENSE = BSD-3-Clause
 AM335X_PRU_PACKAGE_LICENSE_FILES = pru_sw/utils/LICENCE.txt
 AM335X_PRU_PACKAGE_DEPENDENCIES = host-am335x-pru-package
 AM335X_PRU_PACKAGE_INSTALL_STAGING = YES
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index acd3701..4d44748 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -6,7 +6,7 @@
 
 ASSIMP_VERSION = v3.2
 ASSIMP_SITE = $(call github,assimp,assimp,$(ASSIMP_VERSION))
-ASSIMP_LICENSE = BSD-3c
+ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
 ASSIMP_DEPENDENCIES = zlib
 ASSIMP_INSTALL_STAGING = YES
diff --git a/package/atf/atf.mk b/package/atf/atf.mk
index ed2080e..8eef1a8 100644
--- a/package/atf/atf.mk
+++ b/package/atf/atf.mk
@@ -7,7 +7,7 @@
 ATF_VERSION = 0.21
 ATF_SITE = https://github.com/jmmv/atf/releases/download/atf-$(ATF_VERSION)
 ATF_INSTALL_STAGING = YES
-ATF_LICENSE = BSD-2c, BSD-3c
+ATF_LICENSE = BSD-2c, BSD-3-Clause
 ATF_LICENSE_FILES = COPYING
 # Ships a beta libtool version hence our patch doesn't apply.
 ATF_AUTORECONF = YES
diff --git a/package/clapack/clapack.mk b/package/clapack/clapack.mk
index c3841f2..9a083f3 100644
--- a/package/clapack/clapack.mk
+++ b/package/clapack/clapack.mk
@@ -10,7 +10,7 @@ CLAPACK_SOURCE = clapack-$(CLAPACK_VERSION)-CMAKE.tgz
 # - libf2c.a (not installed)
 # - libblas (statically linked with libf2c.a)
 # - liblapack (statically linked with libf2c.a)
-CLAPACK_LICENSE = HPND (libf2c), BSD-3c (libblas and liblapack)
+CLAPACK_LICENSE = HPND (libf2c), BSD-3-Clause (libblas and liblapack)
 CLAPACK_LICENSE_FILES = F2CLIBS/libf2c/Notice COPYING
 CLAPACK_SITE = http://www.netlib.org/clapack
 CLAPACK_INSTALL_STAGING = YES
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 0fd7139..d9eea32 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -7,7 +7,7 @@
 CMAKE_VERSION_MAJOR = 3.7
 CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
-CMAKE_LICENSE = BSD-3c
+CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
 
 # CMake is a particular package:
diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index 1bab648..687567e 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -6,7 +6,7 @@
 
 DANTE_VERSION = 1.4.1
 DANTE_SITE = http://www.inet.no/dante/files
-DANTE_LICENSE = BSD-3c
+DANTE_LICENSE = BSD-3-Clause
 DANTE_LICENSE_FILES = LICENSE
 
 # Dante uses a *VERY* old configure.ac
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 26db5a8..0b58a46 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -8,7 +8,7 @@ DASH_VERSION = 0.5.8
 DASH_SOURCE = dash_$(DASH_VERSION).orig.tar.gz
 DASH_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/d/dash
 DASH_PATCH = dash_$(DASH_VERSION)-1.diff.gz
-DASH_LICENSE = BSD-3c, GPL-2.0+ (mksignames.c)
+DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
 
 # 0002-fix-parallel-build.patch
diff --git a/package/dawgdic/dawgdic.mk b/package/dawgdic/dawgdic.mk
index 2f0a53b..443782c 100644
--- a/package/dawgdic/dawgdic.mk
+++ b/package/dawgdic/dawgdic.mk
@@ -6,7 +6,7 @@
 
 DAWGDIC_VERSION = 16ac537ba9883ff01b63b6d1fdc3072150c68fee
 DAWGDIC_SITE = $(call github,stil,dawgdic,$(DAWGDIC_VERSION))
-DAWGDIC_LICENSE = BSD-3c
+DAWGDIC_LICENSE = BSD-3-Clause
 DAWGDIC_LICENSE_FILES = COPYING
 DAWGDIC_AUTORECONF = YES
 DAWGDIC_INSTALL_STAGING = YES
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 04471c6..3f235c5 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -7,7 +7,7 @@
 E2FSPROGS_VERSION = 1.43.4
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
-E2FSPROGS_LICENSE = GPL-2.0, BSD-3c (libuuid), MIT-like with advertising clause (libss and libet)
+E2FSPROGS_LICENSE = GPL-2.0, BSD-3-Clause (libuuid), MIT-like with advertising clause (libss and libet)
 E2FSPROGS_LICENSE_FILES = NOTICE lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
 E2FSPROGS_INSTALL_STAGING = YES
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 03eabf6..6ae2911 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -7,7 +7,7 @@
 EIGEN_VERSION = 3.2.5
 EIGEN_SITE = https://bitbucket.org/eigen/eigen
 EIGEN_SITE_METHOD = hg
-EIGEN_LICENSE = MPL2, BSD-3c, LGPL-2.1
+EIGEN_LICENSE = MPL2, BSD-3-Clause, LGPL-2.1
 EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.LGPL COPYING.README
 EIGEN_INSTALL_STAGING = YES
 EIGEN_INSTALL_TARGET = NO
diff --git a/package/elftosb/elftosb.mk b/package/elftosb/elftosb.mk
index ac9aa32..a24e515 100644
--- a/package/elftosb/elftosb.mk
+++ b/package/elftosb/elftosb.mk
@@ -6,7 +6,7 @@
 
 ELFTOSB_VERSION = 10.12.01
 ELFTOSB_SITE = http://repository.timesys.com/buildsources/e/elftosb/elftosb-$(ELFTOSB_VERSION)
-ELFTOSB_LICENSE = BSD-3c
+ELFTOSB_LICENSE = BSD-3-Clause
 ELFTOSB_LICENSE_FILES = COPYING
 
 define HOST_ELFTOSB_BUILD_CMDS
diff --git a/package/empty/empty.mk b/package/empty/empty.mk
index 3339ff6..a1cc3c0 100644
--- a/package/empty/empty.mk
+++ b/package/empty/empty.mk
@@ -7,7 +7,7 @@
 EMPTY_VERSION = 0.6.19b
 EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
 EMPTY_SITE = http://downloads.sourceforge.net/project/empty/empty/empty-$(EMPTY_VERSION)
-EMPTY_LICENSE = BSD-3c
+EMPTY_LICENSE = BSD-3-Clause
 EMPTY_LICENSE_FILES = COPYRIGHT
 
 define EMPTY_BUILD_CMDS
diff --git a/package/eventlog/eventlog.mk b/package/eventlog/eventlog.mk
index 76da002..7253657 100644
--- a/package/eventlog/eventlog.mk
+++ b/package/eventlog/eventlog.mk
@@ -8,7 +8,7 @@ EVENTLOG_VERSION_MAJOR = 0.2
 EVENTLOG_VERSION = $(EVENTLOG_VERSION_MAJOR).12
 EVENTLOG_SOURCE = eventlog_$(EVENTLOG_VERSION).tar.gz
 EVENTLOG_SITE = https://my.balabit.com/downloads/eventlog/$(EVENTLOG_VERSION_MAJOR)
-EVENTLOG_LICENSE = BSD-3c
+EVENTLOG_LICENSE = BSD-3-Clause
 EVENTLOG_LICENSE_FILES = COPYING
 EVENTLOG_INSTALL_STAGING = YES
 
diff --git a/package/faifa/faifa.mk b/package/faifa/faifa.mk
index a56a8c0..af7a174 100644
--- a/package/faifa/faifa.mk
+++ b/package/faifa/faifa.mk
@@ -8,7 +8,7 @@ FAIFA_VERSION = v0.1
 FAIFA_SITE = $(call github,ffainelli,faifa,$(FAIFA_VERSION))
 FAIFA_INSTALL_STAGING = YES
 FAIFA_DEPENDENCIES = libpcap host-autoconf
-FAIFA_LICENSE = BSD-3c
+FAIFA_LICENSE = BSD-3-Clause
 FAIFA_LICENSE_FILES = COPYING
 
 FAIFA_MAKE_OPTS += GIT_REV=$(FAIFA_VERSION)
diff --git a/package/file/file.mk b/package/file/file.mk
index 2fa6804..48c1e9f 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -10,7 +10,7 @@ FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
 FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 FILE_INSTALL_STAGING = YES
-FILE_LICENSE = BSD-2c, BSD-4c (one file), BSD-3c (one file)
+FILE_LICENSE = BSD-2c, BSD-4c (one file), BSD-3-Clause (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
 
 $(eval $(autotools-package))
diff --git a/package/flann/flann.mk b/package/flann/flann.mk
index af86a02..abfd0cd 100644
--- a/package/flann/flann.mk
+++ b/package/flann/flann.mk
@@ -7,7 +7,7 @@
 FLANN_VERSION = 3645f0c30a47267e56e5acdecfc7bac2b76bc3d5
 FLANN_SITE = $(call github,mariusmuja,flann,$(FLANN_VERSION))
 FLANN_INSTALL_STAGING = YES
-FLANN_LICENSE = BSD-3c
+FLANN_LICENSE = BSD-3-Clause
 FLANN_LICENSE_FILES = COPYING
 FLANN_CONF_OPTS = \
 	-DBUILD_C_BINDINGS=ON \
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index e75eeff..e67ab1e 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -6,7 +6,7 @@
 
 FMLIB_VERSION = fsl-sdk-v2.0
 FMLIB_SITE = git://git.freescale.com/ppc/sdk/fmlib.git
-FMLIB_LICENSE = BSD-3c, GPL-2.0+
+FMLIB_LICENSE = BSD-3-Clause, GPL-2.0+
 FMLIB_LICENSE_FILES = COPYING
 FMLIB_DEPENDENCIES = linux
 FMLIB_INSTALL_STAGING = YES
diff --git a/package/freescale-imx/imx-codec/imx-codec.mk b/package/freescale-imx/imx-codec/imx-codec.mk
index 911ad8b..44be941 100644
--- a/package/freescale-imx/imx-codec/imx-codec.mk
+++ b/package/freescale-imx/imx-codec/imx-codec.mk
@@ -9,7 +9,7 @@ IMX_CODEC_SITE = $(FREESCALE_IMX_SITE)
 IMX_CODEC_SOURCE = imx-codec-$(IMX_CODEC_VERSION).bin
 IMX_CODEC_INSTALL_STAGING = YES
 
-IMX_CODEC_LICENSE = NXP Semiconductor Software License Agreement, BSD-3c (flac, ogg headers)
+IMX_CODEC_LICENSE = NXP Semiconductor Software License Agreement, BSD-3-Clause (flac, ogg headers)
 IMX_CODEC_LICENSE_FILES = EULA COPYING
 IMX_CODEC_REDISTRIBUTE = NO
 
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index fe4db68..4e81854 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -163,7 +163,7 @@ FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
 # mod_isac supports a limited set of archs
 # src/mod/codecs/mod_isac/typedefs.h
 ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_x86_64),y)
-FREESWITCH_LICENSE := $(FREESWITCH_LICENSE), BSD-3c (mod_isac)
+FREESWITCH_LICENSE := $(FREESWITCH_LICENSE), BSD-3-Clause (mod_isac)
 FREESWITCH_LICENSE_FILES += src/mod/codecs/mod_isac/LICENSE
 FREESWITCH_ENABLED_MODULES += codecs/mod_isac
 endif
@@ -282,7 +282,7 @@ FREESWITCH_DEPENDENCIES += xz
 endif
 
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8)$(BR2_PACKAGE_FFMPEG),yy)
-FREESWITCH_LICENSE := $(FREESWITCH_LICENSE), BSD-3c (libvpx, libyuv)
+FREESWITCH_LICENSE := $(FREESWITCH_LICENSE), BSD-3-Clause (libvpx, libyuv)
 FREESWITCH_LICENSE_FILES += libs/libvpx/LICENSE libs/libyuv/LICENSE
 FREESWITCH_CONF_OPTS += --enable-libvpx --enable-libyuv
 FREESWITCH_DEPENDENCIES += host-yasm ffmpeg
diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index 85fcc71..5a4fe9a 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -7,7 +7,7 @@
 GAUCHE_VERSION = 0.9.4
 GAUCHE_SOURCE = Gauche-$(GAUCHE_VERSION).tgz
 GAUCHE_SITE = http://downloads.sourceforge.net/project/gauche/Gauche
-GAUCHE_LICENSE = BSD-3c, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
+GAUCHE_LICENSE = BSD-3-Clause, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
 GAUCHE_LICENSE_FILES = COPYING
 GAUCHE_DEPENDENCIES = host-gauche
 GAUCHE_PATCH = https://github.com/shirok/Gauche/commit/13a196557848f22a1607a300643131345e9f32b3.patch
diff --git a/package/gflags/gflags.mk b/package/gflags/gflags.mk
index 94f2210..45186a3 100644
--- a/package/gflags/gflags.mk
+++ b/package/gflags/gflags.mk
@@ -7,7 +7,7 @@
 GFLAGS_VERSION = v2.2.0
 GFLAGS_SITE = $(call github,gflags,gflags,$(GFLAGS_VERSION))
 GFLAGS_INSTALL_STAGING = YES
-GFLAGS_LICENSE = BSD-3c
+GFLAGS_LICENSE = BSD-3-Clause
 GFLAGS_LICENSE_FILES = COPYING.txt
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index e904bf8..58cb3d4 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -9,7 +9,7 @@ GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
 GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
 GLIBC_SRC_SUBDIR = .
 
-GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3c, MIT (library)
+GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
 GLIBC_LICENSE_FILES = $(addprefix $(GLIBC_SRC_SUBDIR)/,COPYING COPYING.LIB LICENSES)
 
 # glibc is part of the toolchain so disable the toolchain dependency
diff --git a/package/glog/glog.mk b/package/glog/glog.mk
index aa7cacb..8a5c36b 100644
--- a/package/glog/glog.mk
+++ b/package/glog/glog.mk
@@ -7,7 +7,7 @@
 GLOG_VERSION = v0.3.4
 GLOG_SITE = $(call github,google,glog,$(GLOG_VERSION))
 GLOG_INSTALL_STAGING = YES
-GLOG_LICENSE = BSD-3c
+GLOG_LICENSE = BSD-3-Clause
 GLOG_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_GFLAGS),y)
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 5ac615e..d427870 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -8,7 +8,7 @@ GNU_EFI_VERSION = 3.0.1
 GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
 GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
 GNU_EFI_INSTALL_STAGING = YES
-GNU_EFI_LICENSE = BSD-3c and/or GPL-2.0+ (gnuefi), BSD-3c (efilib)
+GNU_EFI_LICENSE = BSD-3-Clause and/or GPL-2.0+ (gnuefi), BSD-3-Clause (efilib)
 GNU_EFI_LICENSE_FILES = README.efilib
 
 # gnu-efi is a set of library and header files used to build
diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
index f403f78..28a113e 100644
--- a/package/go-bootstrap/go-bootstrap.mk
+++ b/package/go-bootstrap/go-bootstrap.mk
@@ -8,7 +8,7 @@ GO_BOOTSTRAP_VERSION = 1.4.3
 GO_BOOTSTRAP_SITE = https://storage.googleapis.com/golang
 GO_BOOTSTRAP_SOURCE = go$(GO_BOOTSTRAP_VERSION).src.tar.gz
 
-GO_BOOTSTRAP_LICENSE = BSD-3c
+GO_BOOTSTRAP_LICENSE = BSD-3-Clause
 GO_BOOTSTRAP_LICENSE_FILES = LICENSE
 
 # To build programs that need cgo support the toolchain needs to be
diff --git a/package/go/go.mk b/package/go/go.mk
index bd30890..a461342 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -8,7 +8,7 @@ GO_VERSION = 1.7.4
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-GO_LICENSE = BSD-3c
+GO_LICENSE = BSD-3-Clause
 GO_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_arm),y)
diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
index 7a11c72..fd5a45d 100644
--- a/package/google-breakpad/google-breakpad.mk
+++ b/package/google-breakpad/google-breakpad.mk
@@ -11,7 +11,7 @@ GOOGLE_BREAKPAD_CONF_OPTS = --disable-processor --disable-tools
 # Only a static library is installed
 GOOGLE_BREAKPAD_INSTALL_TARGET = NO
 GOOGLE_BREAKPAD_INSTALL_STAGING = YES
-GOOGLE_BREAKPAD_LICENSE = BSD-3c
+GOOGLE_BREAKPAD_LICENSE = BSD-3-Clause
 GOOGLE_BREAKPAD_LICENSE_FILES = LICENSE
 GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad linux-syscall-support
 
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 73067d3..552d6d9 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -6,7 +6,7 @@
 
 GPSD_VERSION = 3.16
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
-GPSD_LICENSE = BSD-3c
+GPSD_LICENSE = BSD-3-Clause
 GPSD_LICENSE_FILES = COPYING
 GPSD_INSTALL_STAGING = YES
 
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 329179d..9e69141 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -8,7 +8,7 @@ GTEST_VERSION = release-1.8.0
 GTEST_SITE = $(call github,google,googletest,$(GTEST_VERSION))
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
-GTEST_LICENSE = BSD-3c
+GTEST_LICENSE = BSD-3-Clause
 GTEST_LICENSE_FILES = googletest/LICENSE
 
 ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 5376a6c..d819731 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -25,7 +25,7 @@ HOST_HEIMDAL_CONF_OPTS = \
 	--without-x \
 	--disable-heimdal-documentation
 HOST_HEIMDAL_CONF_ENV = MAKEINFO=true
-HEIMDAL_LICENSE = BSD-3c
+HEIMDAL_LICENSE = BSD-3-Clause
 HEIMDAL_LICENSE_FILES = LICENSE
 
 # We need asn1_compile in the PATH for samba4
diff --git a/package/hidapi/hidapi.mk b/package/hidapi/hidapi.mk
index e4083ce..7eed800 100644
--- a/package/hidapi/hidapi.mk
+++ b/package/hidapi/hidapi.mk
@@ -11,7 +11,7 @@ HIDAPI_SITE = $(call github,signal11,hidapi,$(HIDAPI_VERSION))
 HIDAPI_INSTALL_STAGING = YES
 # No configure provided, so we need to autoreconf.
 HIDAPI_AUTORECONF = YES
-HIDAPI_LICENSE = GPL-3.0 or BSD-3c or HIDAPI license
+HIDAPI_LICENSE = GPL-3.0 or BSD-3-Clause or HIDAPI license
 HIDAPI_LICENSE_FILES = LICENSE.txt LICENSE-gpl3.txt LICENSE-bsd.txt LICENSE-orig.txt
 
 HIDAPI_DEPENDENCIES = libusb libgudev
diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index cd406f1..53ad0b9 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -6,7 +6,7 @@
 
 HIREDIS_VERSION = v0.13.3
 HIREDIS_SITE = $(call github,redis,hiredis,$(HIREDIS_VERSION))
-HIREDIS_LICENSE = BSD-3c
+HIREDIS_LICENSE = BSD-3-Clause
 HIREDIS_LICENSE_FILES = COPYING
 HIREDIS_INSTALL_STAGING = YES
 
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index a499011..cf651f8 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -10,7 +10,7 @@ HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
 HOSTAPD_DEPENDENCIES = host-pkgconf libnl
 HOSTAPD_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
-HOSTAPD_LICENSE = BSD-3c
+HOSTAPD_LICENSE = BSD-3-Clause
 HOSTAPD_LICENSE_FILES = README
 HOSTAPD_CONFIG_SET =
 
diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index 5f9aa6f..b1c167c 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -8,7 +8,7 @@ HPLIP_VERSION = 3.16.11
 HPLIP_SITE = http://downloads.sourceforge.net/hplip/hplip
 HPLIP_AUTORECONF = YES
 HPLIP_DEPENDENCIES = cups libusb jpeg host-pkgconf
-HPLIP_LICENSE = GPL-2.0, BSD-3c, MIT
+HPLIP_LICENSE = GPL-2.0, BSD-3-Clause, MIT
 HPLIP_LICENSE_FILES = COPYING
 
 HPLIP_CONF_OPTS = \
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 9b5eae8..ad2e090 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -8,7 +8,7 @@ HWLOC_VERSION_MAJOR = 1.10
 HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).1
 HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
 HWLOC_SITE = http://www.open-mpi.org/software/hwloc/v$(HWLOC_VERSION_MAJOR)/downloads
-HWLOC_LICENSE = BSD-3c
+HWLOC_LICENSE = BSD-3-Clause
 HWLOC_LICENSE_FILES = COPYING
 HWLOC_DEPENDENCIES = host-pkgconf
 # 0001-utils-hwloc-Makefile.am-fix-install-man-race-conditi.patch touches Makefile.am
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 909c104..aaf68b3 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -7,7 +7,7 @@
 IPERF3_VERSION = 3.1.5
 IPERF3_SITE = http://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
-IPERF3_LICENSE = BSD-3c, BSD-2c, MIT
+IPERF3_LICENSE = BSD-3-Clause, BSD-2c, MIT
 IPERF3_LICENSE_FILES = LICENSE
 
 IPERF3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index f4dca73..b47209d 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -7,7 +7,7 @@
 IPMITOOL_VERSION = 1.8.18
 IPMITOOL_SOURCE = ipmitool-$(IPMITOOL_VERSION).tar.bz2
 IPMITOOL_SITE = http://downloads.sourceforge.net/project/ipmitool/ipmitool/$(IPMITOOL_VERSION)
-IPMITOOL_LICENSE = BSD-3c
+IPMITOOL_LICENSE = BSD-3-Clause
 IPMITOOL_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_IPMITOOL_LANPLUS),y)
diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index 392856c..a5a6b49 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -6,7 +6,7 @@
 
 IPMIUTIL_VERSION = 2.9.9
 IPMIUTIL_SITE = http://sourceforge.net/projects/ipmiutil/files
-IPMIUTIL_LICENSE = BSD-3c
+IPMIUTIL_LICENSE = BSD-3-Clause
 IPMIUTIL_LICENSE_FILES = COPYING
 # We're patching configure.ac
 IPMIUTIL_AUTORECONF = YES
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 34c0a27..b5f0f26 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -13,7 +13,7 @@
 
 IPUTILS_VERSION = 55828d1fef3fed7f07abcbf7be9282a9662e78c7
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
-IPUTILS_LICENSE = GPL-2.0+, BSD-3c, BSD-4c
+IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause, BSD-4c
 # Only includes a license file for BSD
 IPUTILS_LICENSE_FILES = ninfod/COPYING
 
diff --git a/package/iqvlinux/iqvlinux.mk b/package/iqvlinux/iqvlinux.mk
index 5ceaaf4..165c7c4 100644
--- a/package/iqvlinux/iqvlinux.mk
+++ b/package/iqvlinux/iqvlinux.mk
@@ -8,7 +8,7 @@ IQVLINUX_VERSION = 1.1.5.3
 IQVLINUX_SITE = http://sourceforge.net/projects/e1000/files/iqvlinux/$(IQVLINUX_VERSION)
 IQVLINUX_SOURCE = iqvlinux.tar.gz
 
-IQVLINUX_LICENSE = GPL-2.0, BSD-3c
+IQVLINUX_LICENSE = GPL-2.0, BSD-3-Clause
 IQVLINUX_LICENSE_FILES = \
 	COPYING src/linux/driver/files.txt \
 	inc/linux/files.txt inc/files.txt
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index e2b7e63..c8c1747 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -7,7 +7,7 @@
 JPEG_TURBO_VERSION = 1.5.1
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = http://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
-JPEG_TURBO_LICENSE = jpeg-license (BSD-3c-like)
+JPEG_TURBO_LICENSE = jpeg-license (BSD-3-Clause-like)
 JPEG_TURBO_LICENSE_FILES = LICENSE.md
 JPEG_TURBO_INSTALL_STAGING = YES
 JPEG_TURBO_PROVIDES = jpeg
diff --git a/package/jquery-sparkline/jquery-sparkline.mk b/package/jquery-sparkline/jquery-sparkline.mk
index 4a7b94e..165c2fa 100644
--- a/package/jquery-sparkline/jquery-sparkline.mk
+++ b/package/jquery-sparkline/jquery-sparkline.mk
@@ -7,7 +7,7 @@
 JQUERY_SPARKLINE_VERSION = 2.1.2
 JQUERY_SPARKLINE_SITE = http://www.omnipotent.net/jquery.sparkline/$(JQUERY_SPARKLINE_VERSION)
 JQUERY_SPARKLINE_SOURCE = jquery.sparkline.min.js
-JQUERY_SPARKLINE_LICENSE = BSD-3c
+JQUERY_SPARKLINE_LICENSE = BSD-3-Clause
 
 define JQUERY_SPARKLINE_EXTRACT_CMDS
 	cp $(DL_DIR)/$(JQUERY_SPARKLINE_SOURCE) $(@D)
diff --git a/package/kyua/kyua.mk b/package/kyua/kyua.mk
index c75a09f..9e1c810 100644
--- a/package/kyua/kyua.mk
+++ b/package/kyua/kyua.mk
@@ -8,7 +8,7 @@ KYUA_VERSION = 0.11
 KYUA_SITE = https://github.com/jmmv/kyua/releases/download/kyua-$(KYUA_VERSION)
 KYUA_DEPENDENCIES = host-pkgconf atf lutok sqlite
 KYUA_CONF_OPTS = --without-doxygen --without-atf
-KYUA_LICENSE = BSD-3c
+KYUA_LICENSE = BSD-3-Clause
 KYUA_LICENSE_FILES = COPYING
 KYUA_CONF_ENV = \
 	kyua_cv_attribute_noreturn=yes \
diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index 56008e1..b747c76 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -6,7 +6,7 @@
 
 LAPACK_VERSION = 3.6.1
 LAPACK_SOURCE = lapack-$(LAPACK_VERSION).tgz
-LAPACK_LICENSE = BSD-3c
+LAPACK_LICENSE = BSD-3-Clause
 LAPACK_LICENSE_FILES = LICENSE
 LAPACK_SITE = http://www.netlib.org/lapack
 LAPACK_INSTALL_STAGING = YES
diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index ca2ed70..478f358 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -6,7 +6,7 @@
 
 LEVELDB_VERSION = v1.19
 LEVELDB_SITE = $(call github,google,leveldb,$(LEVELDB_VERSION))
-LEVELDB_LICENSE = BSD-3c
+LEVELDB_LICENSE = BSD-3-Clause
 LEVELDB_LICENSE_FILES = LICENSE
 LEVELDB_INSTALL_STAGING = YES
 LEVELDB_DEPENDENCIES = snappy
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index bcf92f9..0ad9489 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -7,7 +7,7 @@
 LIBARCHIVE_VERSION = 3.2.1
 LIBARCHIVE_SITE = http://www.libarchive.org/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-LIBARCHIVE_LICENSE = BSD-2c, BSD-3c
+LIBARCHIVE_LICENSE = BSD-2c, BSD-3-Clause
 LIBARCHIVE_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index a932f2b..eba25d7 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -7,7 +7,7 @@
 LIBBSD_VERSION = 0.8.3
 LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
 LIBBSD_SITE = http://libbsd.freedesktop.org/releases
-LIBBSD_LICENSE = BSD-3c, MIT
+LIBBSD_LICENSE = BSD-3-Clause, MIT
 LIBBSD_LICENSE_FILES = COPYING
 LIBBSD_INSTALL_STAGING = YES
 
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 508f67a..35a6a97 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -7,7 +7,7 @@
 LIBCAP_VERSION = 2.25
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
-LIBCAP_LICENSE = GPL-2.0 or BSD-3c
+LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
 LIBCAP_LICENSE_FILES = License
 
 LIBCAP_DEPENDENCIES = host-libcap host-gperf
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index f4e7a74..00d9c4f 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -6,7 +6,7 @@
 
 LIBDNET_VERSION = 1.11
 LIBDNET_SITE = http://downloads.sourceforge.net/project/libdnet/libdnet/libdnet-$(LIBDNET_VERSION)
-LIBDNET_LICENSE = BSD-3c
+LIBDNET_LICENSE = BSD-3-Clause
 LIBDNET_LICENSE_FILES = LICENSE
 LIBDNET_INSTALL_STAGING = YES
 LIBDNET_AUTORECONF = YES
diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index e7ddd1f..51ca87d 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -8,7 +8,7 @@ LIBEDIT_VERSION = 20150325-3.1
 LIBEDIT_SITE = http://www.thrysoee.dk/editline
 LIBEDIT_INSTALL_STAGING = YES
 LIBEDIT_DEPENDENCIES = ncurses
-LIBEDIT_LICENSE = BSD-3c
+LIBEDIT_LICENSE = BSD-3-Clause
 LIBEDIT_LICENSE_FILES = COPYING
 
 # We're patching configure.ac
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 5458ce3..36bca0b 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -7,7 +7,7 @@
 LIBEVENT_VERSION = 2.1.8-stable
 LIBEVENT_SITE = https://github.com/libevent/libevent/releases/download/release-$(LIBEVENT_VERSION)
 LIBEVENT_INSTALL_STAGING = YES
-LIBEVENT_LICENSE = BSD-3c, OpenBSD
+LIBEVENT_LICENSE = BSD-3-Clause, OpenBSD
 LIBEVENT_LICENSE_FILES = LICENSE
 # For 0001-Disable-building-test-programs.patch
 LIBEVENT_AUTORECONF = YES
diff --git a/package/libglew/libglew.mk b/package/libglew/libglew.mk
index 7af3aff..277a171 100644
--- a/package/libglew/libglew.mk
+++ b/package/libglew/libglew.mk
@@ -7,7 +7,7 @@
 LIBGLEW_VERSION = 2.0.0
 LIBGLEW_SOURCE = glew-$(LIBGLEW_VERSION).tgz
 LIBGLEW_SITE = http://sourceforge.net/projects/glew/files/glew/$(LIBGLEW_VERSION)
-LIBGLEW_LICENSE = BSD-3c, MIT
+LIBGLEW_LICENSE = BSD-3-Clause, MIT
 LIBGLEW_LICENSE_FILES = LICENSE.txt
 LIBGLEW_INSTALL_STAGING = YES
 LIBGLEW_DEPENDENCIES = libgl xlib_libX11 xlib_libXext xlib_libXi xlib_libXmu
diff --git a/package/libglob/libglob.mk b/package/libglob/libglob.mk
index cd6922e..90356b3 100644
--- a/package/libglob/libglob.mk
+++ b/package/libglob/libglob.mk
@@ -6,7 +6,7 @@
 
 LIBGLOB_VERSION = 1.0
 LIBGLOB_SITE = $(call github,voidlinux,libglob,$(LIBGLOB_VERSION))
-LIBGLOB_LICENSE = BSD-3c
+LIBGLOB_LICENSE = BSD-3-Clause
 LIBGLOB_LICENSE_FILES = LICENSE
 LIBGLOB_INSTALL_STAGING = YES
 
diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index b8f4bac..e5bd454 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -7,7 +7,7 @@
 LIBJPEG_VERSION = 9b
 LIBJPEG_SITE = http://www.ijg.org/files
 LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
-LIBJPEG_LICENSE = jpeg-license (BSD-3c-like)
+LIBJPEG_LICENSE = jpeg-license (BSD-3-Clause-like)
 LIBJPEG_LICENSE_FILES = README
 LIBJPEG_INSTALL_STAGING = YES
 LIBJPEG_PROVIDES = jpeg
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 7e518e7..3c30891 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -8,7 +8,7 @@ LIBKCAPI_VERSION = 79cb80714ebcbae2b9de9bb5aca9a6a546f2f121
 LIBKCAPI_SITE = $(call github,smuellerDD,libkcapi,$(LIBKCAPI_VERSION))
 LIBKCAPI_AUTORECONF = YES
 LIBKCAPI_INSTALL_STAGING = YES
-LIBKCAPI_LICENSE = BSD-3c (library), BSD-3c or GPL-2.0 (programs)
+LIBKCAPI_LICENSE = BSD-3-Clause (library), BSD-3-Clause or GPL-2.0 (programs)
 LIBKCAPI_LICENSE_FILES = COPYING COPYING.gplv2 COPYING.bsd
 
 ifeq ($(BR2_PACKAGE_LIBKCAPI_APPS),y)
diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 3d4d356..20323c0 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -7,7 +7,7 @@
 LIBLDNS_VERSION = 1.6.17
 LIBLDNS_SOURCE = ldns-$(LIBLDNS_VERSION).tar.gz
 LIBLDNS_SITE = http://www.nlnetlabs.nl/downloads/ldns
-LIBLDNS_LICENSE = BSD-3c
+LIBLDNS_LICENSE = BSD-3-Clause
 LIBLDNS_LICENSE_FILES = LICENSE
 LIBLDNS_INSTALL_STAGING = YES
 LIBLDNS_CONF_OPTS = \
diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index a9524e3..84527ab 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -6,7 +6,7 @@
 
 LIBLINEAR_VERSION = 2.1
 LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear
-LIBLINEAR_LICENSE = BSD-3c
+LIBLINEAR_LICENSE = BSD-3-Clause
 LIBLINEAR_LICENSE_FILES = COPYRIGHT
 LIBLINEAR_INSTALL_STAGING = YES
 LIBLINEAR_CFLAGS = $(TARGET_CFLAGS)
diff --git a/package/libmbus/libmbus.mk b/package/libmbus/libmbus.mk
index 75aaa8d..61f797b 100644
--- a/package/libmbus/libmbus.mk
+++ b/package/libmbus/libmbus.mk
@@ -7,7 +7,7 @@
 LIBMBUS_VERSION = 0.8.0
 LIBMBUS_SITE = http://www.rscada.se/public-dist
 LIBMBUS_INSTALL_STAGING = YES
-LIBMBUS_LICENSE = BSD-3c
+LIBMBUS_LICENSE = BSD-3-Clause
 LIBMBUS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index 36d0913..2495526 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -15,7 +15,7 @@ LIBMEMCACHED_INSTALL_STAGING = YES
 LIBMEMCACHED_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBEVENT),libevent)
 # For 0001-disable-tests.patch and 0002-disable-sanitizer.patch
 LIBMEMCACHED_AUTORECONF = YES
-LIBMEMCACHED_LICENSE = BSD-3c
+LIBMEMCACHED_LICENSE = BSD-3-Clause
 LIBMEMCACHED_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index 0eb7cf6..66b08b4 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -8,7 +8,7 @@ LIBMINIUPNPC_VERSION = 2.0
 LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
 LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
 LIBMINIUPNPC_INSTALL_STAGING = YES
-LIBMINIUPNPC_LICENSE = BSD-3c
+LIBMINIUPNPC_LICENSE = BSD-3-Clause
 LIBMINIUPNPC_LICENSE_FILES = LICENSE
 
 $(eval $(cmake-package))
diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index db3ae05..691aba9 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -10,7 +10,7 @@ LIBMPDCLIENT_SOURCE = libmpdclient-$(LIBMPDCLIENT_VERSION).tar.xz
 LIBMPDCLIENT_SITE = http://www.musicpd.org/download/libmpdclient/$(LIBMPDCLIENT_VERSION_MAJOR)
 LIBMPDCLIENT_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 LIBMPDCLIENT_INSTALL_STAGING = YES
-LIBMPDCLIENT_LICENSE = BSD-3c
+LIBMPDCLIENT_LICENSE = BSD-3-Clause
 LIBMPDCLIENT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libnatpmp/libnatpmp.mk b/package/libnatpmp/libnatpmp.mk
index cdd65e9..3623027 100644
--- a/package/libnatpmp/libnatpmp.mk
+++ b/package/libnatpmp/libnatpmp.mk
@@ -7,7 +7,7 @@
 LIBNATPMP_VERSION = 20150609
 LIBNATPMP_SITE = http://miniupnp.free.fr/files
 LIBNATPMP_INSTALL_STAGING = YES
-LIBNATPMP_LICENSE = BSD-3c
+LIBNATPMP_LICENSE = BSD-3-Clause
 LIBNATPMP_LICENSE_FILES = LICENSE
 
 define LIBNATPMP_BUILD_CMDS
diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
index d13c453..d5d7b9f 100644
--- a/package/libnet/libnet.mk
+++ b/package/libnet/libnet.mk
@@ -9,7 +9,7 @@ LIBNET_SITE = http://sourceforge.net/projects/libnet-dev/files
 LIBNET_INSTALL_STAGING = YES
 # PF_PACKET is always available on Linux
 LIBNET_CONF_OPTS = libnet_cv_have_packet_socket=yes
-LIBNET_LICENSE = BSD-2c, BSD-3c
+LIBNET_LICENSE = BSD-2c, BSD-3-Clause
 LIBNET_LICENSE_FILES = doc/COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index 8fff529..28b55a8 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -7,7 +7,7 @@
 LIBOGG_VERSION = 1.3.2
 LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.xz
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
-LIBOGG_LICENSE = BSD-3c
+LIBOGG_LICENSE = BSD-3-Clause
 LIBOGG_LICENSE_FILES = COPYING
 
 LIBOGG_INSTALL_STAGING = YES
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 505e2ab..c4c5f31 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -6,7 +6,7 @@
 
 LIBPCAP_VERSION = 1.8.1
 LIBPCAP_SITE = http://www.tcpdump.org/release
-LIBPCAP_LICENSE = BSD-3c
+LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
 LIBPCAP_INSTALL_STAGING = YES
 LIBPCAP_DEPENDENCIES = zlib host-flex host-bison
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index 0587190..ec6a3bc 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -8,7 +8,7 @@ LIBPQXX_VERSION = 4.0.1
 LIBPQXX_SITE = http://pqxx.org/download/software/libpqxx
 LIBPQXX_INSTALL_STAGING = YES
 LIBPQXX_DEPENDENCIES = postgresql
-LIBPQXX_LICENSE = BSD-3c
+LIBPQXX_LICENSE = BSD-3-Clause
 LIBPQXX_LICENSE_FILES = COPYING
 
 LIBPQXX_CONF_ENV += ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
diff --git a/package/libsha1/libsha1.mk b/package/libsha1/libsha1.mk
index 647f986..4d80f3a 100644
--- a/package/libsha1/libsha1.mk
+++ b/package/libsha1/libsha1.mk
@@ -6,7 +6,7 @@
 
 LIBSHA1_VERSION = 0.3
 LIBSHA1_SITE = $(call github,dottedmag,libsha1,$(LIBSHA1_VERSION))
-LIBSHA1_LICENSE = BSD-3c or GPL
+LIBSHA1_LICENSE = BSD-3-Clause or GPL
 LIBSHA1_LICENSE_FILES = COPYING
 
 LIBSHA1_INSTALL_STAGING = YES
diff --git a/package/libshairplay/libshairplay.mk b/package/libshairplay/libshairplay.mk
index 8360d79..4b2883c 100644
--- a/package/libshairplay/libshairplay.mk
+++ b/package/libshairplay/libshairplay.mk
@@ -8,7 +8,7 @@ LIBSHAIRPLAY_VERSION = ce80e005908f41d0e6fde1c4a21e9cb8ee54007b
 LIBSHAIRPLAY_SITE = $(call github,juhovh,shairplay,$(LIBSHAIRPLAY_VERSION))
 LIBSHAIRPLAY_INSTALL_STAGING = YES
 LIBSHAIRPLAY_AUTORECONF = YES
-LIBSHAIRPLAY_LICENSE = MIT, BSD-3c, LGPL-2.1+
+LIBSHAIRPLAY_LICENSE = MIT, BSD-3-Clause, LGPL-2.1+
 LIBSHAIRPLAY_LICENSE_FILES = LICENSE
 LIBSHAIRPLAY_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_LIBAO),libao)
 
diff --git a/package/libsilk/libsilk.mk b/package/libsilk/libsilk.mk
index eefdf8f..eba7085 100644
--- a/package/libsilk/libsilk.mk
+++ b/package/libsilk/libsilk.mk
@@ -8,7 +8,7 @@ LIBSILK_VERSION = 4268a02240c35c6055b0f237c46b09b2dcf79e45
 # we use the FreeSwitch fork because it contains pkgconf support
 LIBSILK_SITE = https://freeswitch.org/stash/scm/sd/libsilk.git
 LIBSILK_SITE_METHOD = git
-LIBSILK_LICENSE = BSD-3c
+LIBSILK_LICENSE = BSD-3-Clause
 LIBSILK_LICENSE_FILES = COPYING
 LIBSILK_AUTORECONF = YES
 LIBSILK_INSTALL_STAGING = YES
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index 40b85e6..9e72856 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -7,7 +7,7 @@
 LIBSRTP_VERSION = v1.5.4
 LIBSRTP_SITE = $(call github,cisco,libsrtp,$(LIBSRTP_VERSION))
 LIBSRTP_INSTALL_STAGING = YES
-LIBSRTP_LICENSE = BSD-3c
+LIBSRTP_LICENSE = BSD-3-Clause
 LIBSRTP_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_STATIC_LIBS),y)
diff --git a/package/libtheora/libtheora.mk b/package/libtheora/libtheora.mk
index 11f9852..f408e6c 100644
--- a/package/libtheora/libtheora.mk
+++ b/package/libtheora/libtheora.mk
@@ -10,7 +10,7 @@ LIBTHEORA_SITE = http://downloads.xiph.org/releases/theora
 LIBTHEORA_INSTALL_STAGING = YES
 # We're patching Makefile.am
 LIBTHEORA_AUTORECONF = YES
-LIBTHEORA_LICENSE = BSD-3c
+LIBTHEORA_LICENSE = BSD-3-Clause
 LIBTHEORA_LICENSE_FILES = COPYING LICENSE
 
 LIBTHEORA_CONF_OPTS = \
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 70a31ac..7747a1a 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -7,7 +7,7 @@
 LIBTIRPC_VERSION = 1.0.1
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
-LIBTIRPC_LICENSE = BSD-3c
+LIBTIRPC_LICENSE = BSD-3-Clause
 LIBTIRPC_LICENSE_FILES = COPYING
 
 LIBTIRPC_INSTALL_STAGING = YES
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 0675a17..5e2efad 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -6,7 +6,7 @@
 
 LIBUBOX_VERSION = 723730214732862de7e892bae2f7a7889e66bf1b
 LIBUBOX_SITE = git://git.openwrt.org/project/libubox.git
-LIBUBOX_LICENSE = ISC, BSD-3c
+LIBUBOX_LICENSE = ISC, BSD-3-Clause
 LIBUBOX_INSTALL_STAGING = YES
 LIBUBOX_DEPENDENCIES = $(if $(BR2_PACKAGE_JSON_C),json-c)
 
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index 8236cee..0701fb2 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -9,7 +9,7 @@ LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
 LIBUPNP_INSTALL_STAGING = YES
-LIBUPNP_LICENSE = BSD-3c
+LIBUPNP_LICENSE = BSD-3-Clause
 LIBUPNP_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index 661fa96..7466a77 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -7,7 +7,7 @@
 LIBURIPARSER_VERSION = 0.8.1
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.bz2
 LIBURIPARSER_SITE = http://sourceforge.net/projects/uriparser/files/Sources/$(LIBURIPARSER_VERSION)
-LIBURIPARSER_LICENSE = BSD-3c
+LIBURIPARSER_LICENSE = BSD-3-Clause
 LIBURIPARSER_LICENSE_FILES = COPYING
 LIBURIPARSER_INSTALL_STAGING = YES
 LIBURIPARSER_CONF_OPTS = --disable-test
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 6f6a1cc..eed81fe 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -9,7 +9,7 @@ LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
 LIBUV_AUTORECONF = YES
-LIBUV_LICENSE = BSD-2c, BSD-3c, ISC, MIT
+LIBUV_LICENSE = BSD-2c, BSD-3-Clause, ISC, MIT
 LIBUV_LICENSE_FILES = LICENSE
 
 # Upstream needs tests to be run sequentially. This is the default in
diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index f1b710c..98ec97b 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -10,7 +10,7 @@ LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis
 LIBVORBIS_INSTALL_STAGING = YES
 LIBVORBIS_CONF_OPTS = --disable-oggtest
 LIBVORBIS_DEPENDENCIES = host-pkgconf libogg
-LIBVORBIS_LICENSE = BSD-3c
+LIBVORBIS_LICENSE = BSD-3-Clause
 LIBVORBIS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 4ad5522..c4f102b 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -7,7 +7,7 @@
 LIBVPX_VERSION = 1.6.0
 LIBVPX_SOURCE = libvpx-$(LIBVPX_VERSION).tar.bz2
 LIBVPX_SITE = http://storage.googleapis.com/downloads.webmproject.org/releases/webm
-LIBVPX_LICENSE = BSD-3c
+LIBVPX_LICENSE = BSD-3-Clause
 LIBVPX_LICENSE_FILES = LICENSE PATENTS
 LIBVPX_INSTALL_STAGING = YES
 
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index 738ae9a..135c5f6 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -7,7 +7,7 @@
 LIBXMLRPC_VERSION = 1.39.12
 LIBXMLRPC_SOURCE = xmlrpc-c-$(LIBXMLRPC_VERSION).tgz
 LIBXMLRPC_SITE = http://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/$(LIBXMLRPC_VERSION)
-LIBXMLRPC_LICENSE = BSD-3c (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
+LIBXMLRPC_LICENSE = BSD-3-Clause (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
 LIBXMLRPC_LICENSE_FILES = doc/COPYING
 LIBXMLRPC_INSTALL_STAGING = YES
 LIBXMLRPC_DEPENDENCIES = libcurl host-autoconf
diff --git a/package/libyuv/libyuv.mk b/package/libyuv/libyuv.mk
index c00bc05..1abe126 100644
--- a/package/libyuv/libyuv.mk
+++ b/package/libyuv/libyuv.mk
@@ -10,7 +10,7 @@ LIBYUV_VERSION = 1ebf86795cb213a37f06eb1ef3713cff080568ea
 # deactivated in 2015.
 LIBYUV_SITE = https://freeswitch.org/stash/scm/sd/libyuv.git
 LIBYUV_SITE_METHOD = git
-LIBYUV_LICENSE = BSD-3c
+LIBYUV_LICENSE = BSD-3-Clause
 LIBYUV_LICENSE_FILES = LICENSE
 LIBYUV_INSTALL_STAGING = YES
 LIBYUV_DEPENDENCIES = $(if $(BR2_PACKAGE_JPEG),jpeg)
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index a419db7..b873746 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -7,7 +7,7 @@
 LIBZIP_VERSION = 0.11.2
 LIBZIP_SITE = http://www.nih.at/libzip
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
-LIBZIP_LICENSE = BSD-3c
+LIBZIP_LICENSE = BSD-3-Clause
 LIBZIP_LICENSE_FILES = LICENSE
 LIBZIP_INSTALL_STAGING = YES
 LIBZIP_DEPENDENCIES = zlib
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index b3127ef..97ddfc6 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -8,7 +8,7 @@ LIGHTTPD_VERSION_MAJOR = 1.4
 LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).45
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
-LIGHTTPD_LICENSE = BSD-3c
+LIGHTTPD_LICENSE = BSD-3-Clause
 LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_DEPENDENCIES = host-pkgconf
 LIGHTTPD_CONF_OPTS = \
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index c8ba30f..3522415 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -18,7 +18,7 @@ LINUX_PAM_CONF_OPTS = \
 	--libdir=/lib
 LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf
 LINUX_PAM_AUTORECONF = YES
-LINUX_PAM_LICENSE = BSD-3c
+LINUX_PAM_LICENSE = BSD-3-Clause
 LINUX_PAM_LICENSE_FILES = Copyright
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
diff --git a/package/linux-syscall-support/linux-syscall-support.mk b/package/linux-syscall-support/linux-syscall-support.mk
index 6833a62..c02610d 100644
--- a/package/linux-syscall-support/linux-syscall-support.mk
+++ b/package/linux-syscall-support/linux-syscall-support.mk
@@ -8,7 +8,7 @@
 LINUX_SYSCALL_SUPPORT_VERSION = 3f6478ac95edf86cd3da300c2c0d34a438f5dbeb
 LINUX_SYSCALL_SUPPORT_SITE = https://chromium.googlesource.com/linux-syscall-support
 LINUX_SYSCALL_SUPPORT_SITE_METHOD = git
-LINUX_SYSCALL_SUPPORT_LICENSE = BSD-3c
+LINUX_SYSCALL_SUPPORT_LICENSE = BSD-3-Clause
 LINUX_SYSCALL_SUPPORT_LICENSE_FILES = linux_syscall_support.h
 
 # Provide only one header file.
diff --git a/package/lua-csnappy/lua-csnappy.mk b/package/lua-csnappy/lua-csnappy.mk
index 1867b60..3325f1f 100644
--- a/package/lua-csnappy/lua-csnappy.mk
+++ b/package/lua-csnappy/lua-csnappy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUA_CSNAPPY_VERSION = 0.1.4-1
-LUA_CSNAPPY_LICENSE = BSD-3c
+LUA_CSNAPPY_LICENSE = BSD-3-Clause
 LUA_CSNAPPY_LICENSE_FILES = $(LUA_CSNAPPY_SUBDIR)/COPYRIGHT
 
 $(eval $(luarocks-package))
diff --git a/package/lutok/lutok.mk b/package/lutok/lutok.mk
index 6ee198b..41abddb 100644
--- a/package/lutok/lutok.mk
+++ b/package/lutok/lutok.mk
@@ -10,7 +10,7 @@ LUTOK_INSTALL_STAGING = YES
 LUTOK_DEPENDENCIES = host-pkgconf lua
 # --without-atf disables the atf-based lutok tests
 LUTOK_CONF_OPTS = --without-doxygen --without-atf
-LUTOK_LICENSE = BSD-3c
+LUTOK_LICENSE = BSD-3-Clause
 LUTOK_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 4de1bf6..90ede7d 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -9,7 +9,7 @@ MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 MEMCACHED_CONF_OPTS = --disable-coverage
-MEMCACHED_LICENSE = BSD-3c
+MEMCACHED_LICENSE = BSD-3-Clause
 MEMCACHED_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_ENDIAN),"BIG")
diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
index cc24352..a1a1fb3 100644
--- a/package/mfgtools/mfgtools.mk
+++ b/package/mfgtools/mfgtools.mk
@@ -7,7 +7,7 @@
 MFGTOOLS_VERSION = b219fc219a35c365010897ed093c40750f8cdac6
 MFGTOOLS_SITE = $(call github,NXPmicro,mfgtools,$(MFGTOOLS_VERSION))
 MFGTOOLS_SUBDIR = MfgToolLib
-MFGTOOLS_LICENSE = BSD-3c or CPOL
+MFGTOOLS_LICENSE = BSD-3-Clause or CPOL
 MFGTOOLS_LICENSE_FILES = LICENSE CPOL.htm
 HOST_MFGTOOLS_DEPENDENCIES = host-libusb
 
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index cf2f273..40f918c 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -6,7 +6,7 @@
 
 MINIDLNA_VERSION = 1.1.5
 MINIDLNA_SITE = http://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
-MINIDLNA_LICENSE = GPL-2.0, BSD-3c
+MINIDLNA_LICENSE = GPL-2.0, BSD-3-Clause
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
 
 MINIDLNA_DEPENDENCIES = \
diff --git a/package/minissdpd/minissdpd.mk b/package/minissdpd/minissdpd.mk
index 5c8bd37..f3f383b 100644
--- a/package/minissdpd/minissdpd.mk
+++ b/package/minissdpd/minissdpd.mk
@@ -6,7 +6,7 @@
 
 MINISSDPD_VERSION = 1.5
 MINISSDPD_SITE = http://miniupnp.free.fr/files
-MINISSDPD_LICENSE = BSD-3c
+MINISSDPD_LICENSE = BSD-3-Clause
 MINISSDPD_LICENSE_FILES = LICENSE
 MINISSDPD_DEPENDENCIES = libnfnetlink
 
diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
index c69c143..a35a872 100644
--- a/package/mongrel2/mongrel2.mk
+++ b/package/mongrel2/mongrel2.mk
@@ -9,7 +9,7 @@ MONGREL2_SOURCE = mongrel2-v$(MONGREL2_VERSION).tar.bz2
 # Do not use the github helper here, the generated tarball is *NOT* the same
 # as the one uploaded by upstream for the release.
 MONGREL2_SITE = https://github.com/mongrel2/mongrel2/releases/download/$(MONGREL2_VERSION)
-MONGREL2_LICENSE = BSD-3c
+MONGREL2_LICENSE = BSD-3-Clause
 MONGREL2_LICENSE_FILES = LICENSE
 MONGREL2_DEPENDENCIES = sqlite zeromq
 
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 2969e36..731e79e 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -7,7 +7,7 @@
 MROUTED_VERSION = 3.9.7
 MROUTED_SITE = $(call github,troglobit,mrouted,$(MROUTED_VERSION))
 MROUTED_DEPENDENCIES = host-bison
-MROUTED_LICENSE = BSD-3c
+MROUTED_LICENSE = BSD-3-Clause
 MROUTED_LICENSE_FILES = LICENSE
 
 define MROUTED_CONFIGURE_CMDS
diff --git a/package/musepack/musepack.mk b/package/musepack/musepack.mk
index 14f4921..fc66c68 100644
--- a/package/musepack/musepack.mk
+++ b/package/musepack/musepack.mk
@@ -10,7 +10,7 @@ MUSEPACK_SOURCE = musepack_src_$(MUSEPACK_VERSION).tar.gz
 MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
 MUSEPACK_INSTALL_STAGING = YES
 MUSEPACK_MAKE = $(MAKE1)
-MUSEPACK_LICENSE = BSD-3c (*mpcdec), LGPL-2.1+ (*mpcenc)
+MUSEPACK_LICENSE = BSD-3-Clause (*mpcdec), LGPL-2.1+ (*mpcenc)
 MUSEPACK_LICENSE_FILES = libmpcdec/COPYING libmpcenc/quant.c
 
 $(eval $(cmake-package))
diff --git a/package/musl-compat-headers/musl-compat-headers.mk b/package/musl-compat-headers/musl-compat-headers.mk
index 25e032c..91f5074 100644
--- a/package/musl-compat-headers/musl-compat-headers.mk
+++ b/package/musl-compat-headers/musl-compat-headers.mk
@@ -9,7 +9,7 @@ MUSL_COMPAT_HEADERS_QUEUE_H = http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/qu
 
 MUSL_COMPAT_HEADERS_EXTRA_DOWNLOADS = $(MUSL_COMPAT_HEADERS_QUEUE_H)
 
-MUSL_COMPAT_HEADERS_LICENSE = BSD-3c, Public Domain or CC0
+MUSL_COMPAT_HEADERS_LICENSE = BSD-3-Clause, Public Domain or CC0
 MUSL_COMPAT_HEADERS_LICENSE_FILES = queue.h cdefs.h
 
 MUSL_COMPAT_HEADERS_ADD_TOOLCHAIN_DEPENDENCY = NO
diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index aeaa041..63a79e7 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -6,7 +6,7 @@
 
 NE10_VERSION = v1.2.0
 NE10_SITE = $(call github,projectNe10,Ne10,$(NE10_VERSION))
-NE10_LICENSE = BSD-3c or Apache-2.0
+NE10_LICENSE = BSD-3-Clause or Apache-2.0
 NE10_LICENSE_FILES = doc/LICENSE
 NE10_INSTALL_STAGING = YES
 
diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index 5abfc7e..e1a6fee 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -6,7 +6,7 @@
 
 NETCAT_OPENBSD_VERSION = debian/1.105-7
 NETCAT_OPENBSD_SITE = git://anonscm.debian.org/collab-maint/netcat-openbsd
-NETCAT_OPENBSD_LICENSE = BSD-3c
+NETCAT_OPENBSD_LICENSE = BSD-3-Clause
 NETCAT_OPENBSD_LICENSE_FILES = debian/copyright
 NETCAT_OPENBSD_DEPENDENCIES = host-pkgconf libbsd
 
diff --git a/package/netsurf-buildsystem/netsurf-buildsystem.mk b/package/netsurf-buildsystem/netsurf-buildsystem.mk
index 3478850..f316eb1 100644
--- a/package/netsurf-buildsystem/netsurf-buildsystem.mk
+++ b/package/netsurf-buildsystem/netsurf-buildsystem.mk
@@ -7,7 +7,7 @@
 NETSURF_BUILDSYSTEM_VERSION = 7574b41345968b5f7e9ca5875faccb1478ce0555
 NETSURF_BUILDSYSTEM_SITE = http://git.netsurf-browser.org/buildsystem.git
 NETSURF_BUILDSYSTEM_SITE_METHOD = git
-NETSURF_BUILDSYSTEM_LICENSE = MIT, BSD-3c (for llvm/* files)
+NETSURF_BUILDSYSTEM_LICENSE = MIT, BSD-3-Clause (for llvm/* files)
 NETSURF_BUILDSYSTEM_LICENSE_FILES = llvm/LICENSE.TXT
 
 NETSURF_BUILDSYSTEM_INSTALL_DIR = $(HOST_DIR)/usr/share/netsurf-buildsystem
diff --git a/package/nginx-upload/nginx-upload.mk b/package/nginx-upload/nginx-upload.mk
index 6f94d35..ef67995 100644
--- a/package/nginx-upload/nginx-upload.mk
+++ b/package/nginx-upload/nginx-upload.mk
@@ -6,7 +6,7 @@
 
 NGINX_UPLOAD_VERSION = aba1e3f34c754551f4f49e572bc86863d535609d
 NGINX_UPLOAD_SITE = $(call github,vkholodkov,nginx-upload-module,$(NGINX_UPLOAD_VERSION))
-NGINX_UPLOAD_LICENSE = BSD-3c
+NGINX_UPLOAD_LICENSE = BSD-3-Clause
 NGINX_UPLOAD_LICENSE_FILES = LICENCE
 NGINX_UPLOAD_DEPENDENCIES = openssl
 
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index e7c3057..4ad5fc5 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -12,7 +12,7 @@ OLSR_PLUGINS = arprefresh bmf dot_draw dyn_gw dyn_gw_plain httpinfo jsoninfo \
 	mdns nameservice p2pd pgraph secure txtinfo watchdog
 # Doesn't really need quagga but not very useful without it
 OLSR_PLUGINS += $(if $(BR2_PACKAGE_QUAGGA),quagga)
-OLSR_LICENSE = BSD-3c, LGPL-2.1+
+OLSR_LICENSE = BSD-3-Clause, LGPL-2.1+
 OLSR_LICENSE_FILES = license.txt lib/pud/nmealib/LICENSE
 OLSR_DEPENDENCIES = host-flex host-bison
 
diff --git a/package/open-plc-utils/open-plc-utils.mk b/package/open-plc-utils/open-plc-utils.mk
index 67c8d7d..d45bb9d 100644
--- a/package/open-plc-utils/open-plc-utils.mk
+++ b/package/open-plc-utils/open-plc-utils.mk
@@ -6,7 +6,7 @@
 
 OPEN_PLC_UTILS_VERSION = 1be781d1ea81827e5f6c1a35961c65dd4d15472c
 OPEN_PLC_UTILS_SITE = $(call github,qca,open-plc-utils,$(OPEN_PLC_UTILS_VERSION))
-OPEN_PLC_UTILS_LICENSE = BSD-3c
+OPEN_PLC_UTILS_LICENSE = BSD-3-Clause
 OPEN_PLC_UTILS_LICENSE_FILES = LICENSE
 
 # We unfortunately can't use TARGET_CONFIGURE_OPTS, as it would
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index a26e10a..93dbc1f 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -6,7 +6,7 @@
 
 OPENBLAS_VERSION = f04af36ad0e85b64f12a7c38095383192cc52345
 OPENBLAS_SITE = $(call github,xianyi,OpenBLAS,$(OPENBLAS_VERSION))
-OPENBLAS_LICENSE = BSD-3c
+OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
 OPENBLAS_INSTALL_STAGING = YES
 
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 947589b..4ae550e 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -7,7 +7,7 @@
 OPENCV_VERSION = 2.4.13
 OPENCV_SITE = $(call github,itseez,opencv,$(OPENCV_VERSION))
 OPENCV_INSTALL_STAGING = YES
-OPENCV_LICENSE = BSD-3c
+OPENCV_LICENSE = BSD-3-Clause
 OPENCV_LICENSE_FILES = LICENSE
 
 # OpenCV component options
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 10660a9..10e0dfe 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -7,7 +7,7 @@
 OPENCV3_VERSION = 3.1.0
 OPENCV3_SITE = $(call github,itseez,opencv,$(OPENCV3_VERSION))
 OPENCV3_INSTALL_STAGING = YES
-OPENCV3_LICENSE = BSD-3c
+OPENCV3_LICENSE = BSD-3-Clause
 OPENCV3_LICENSE_FILES = LICENSE
 
 # Uses __atomic_fetch_add_4
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index 33c63c2..3f4f111 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -9,7 +9,7 @@ OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20
 OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
 OPENIPMI_PATCH = \
 	http://sourceforge.net/p/openipmi/patches/26/attachment/0001-ui-use-standard-uint32_t.patch
-OPENIPMI_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-3c
+OPENIPMI_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-3-Clause
 OPENIPMI_LICENSE_FILES = COPYING.LIB COPYING COPYING.BSD
 OPENIPMI_DEPENDENCIES = popt ncurses host-pkgconf
 # Patching Makefile.am
diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
index c5b8a01..3ffde89 100644
--- a/package/openmpi/openmpi.mk
+++ b/package/openmpi/openmpi.mk
@@ -8,7 +8,7 @@ OPENMPI_VERSION_MAJOR = 1.10
 OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).2
 OPENMPI_SITE = https://www.open-mpi.org/software/ompi/v$(OPENMPI_VERSION_MAJOR)/downloads
 OPENMPI_SOURCE = openmpi-$(OPENMPI_VERSION).tar.bz2
-OPENMPI_LICENSE = BSD-3c
+OPENMPI_LICENSE = BSD-3-Clause
 OPENMPI_LICENSE_FILES = LICENSE
 OPENMPI_INSTALL_STAGING = YES
 OPENMPI_CONF_OPTS = --disable-vt
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 9c98064..648427a 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -6,7 +6,7 @@
 
 OPENNTPD_VERSION = 6.0p1
 OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
-OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3c
+OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3-Clause
 OPENNTPD_LICENSE_FILES = COPYING
 # Ships a beta libtool version hence our patch doesn't apply.
 OPENNTPD_AUTORECONF = YES
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index ba48770..362bbb1 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -6,7 +6,7 @@
 
 OPENSSH_VERSION = 7.5p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
-OPENSSH_LICENSE = BSD-3c, BSD-2c, Public Domain
+OPENSSH_LICENSE = BSD-3-Clause, BSD-2c, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPTS = \
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index c83c583..d9628ed 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -6,7 +6,7 @@
 
 OPENSWAN_VERSION = 2.6.46
 OPENSWAN_SITE = http://download.openswan.org/openswan
-OPENSWAN_LICENSE = GPL-2.0+, BSD-3c
+OPENSWAN_LICENSE = GPL-2.0+, BSD-3-Clause
 OPENSWAN_LICENSE_FILES = COPYING LICENSE
 
 OPENSWAN_DEPENDENCIES = host-bison host-flex gmp iproute2
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 020be88..b810b77 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -6,7 +6,7 @@
 
 OPUS_VERSION = 1.1.4
 OPUS_SITE = http://downloads.xiph.org/releases/opus
-OPUS_LICENSE = BSD-3c
+OPUS_LICENSE = BSD-3-Clause
 OPUS_LICENSE_FILES = COPYING
 OPUS_INSTALL_STAGING = YES
 
diff --git a/package/opusfile/opusfile.mk b/package/opusfile/opusfile.mk
index 4c3fb35..846eedd 100644
--- a/package/opusfile/opusfile.mk
+++ b/package/opusfile/opusfile.mk
@@ -7,7 +7,7 @@
 OPUSFILE_VERSION = 0.8
 OPUSFILE_SITE = http://downloads.xiph.org/releases/opus
 OPUSFILE_DEPENDENCIES = host-pkgconf libogg opus
-OPUSFILE_LICENSE = BSD-3c
+OPUSFILE_LICENSE = BSD-3-Clause
 OPUSFILE_LICENSE_FILES = COPYING
 OPUSFILE_INSTALL_STAGING = YES
 
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 4456f53..5c8d4f7 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -7,7 +7,7 @@
 ORC_VERSION = 0.4.26
 ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
-ORC_LICENSE = BSD-2c, BSD-3c
+ORC_LICENSE = BSD-2c, BSD-3-Clause
 ORC_LICENSE_FILES = COPYING
 ORC_INSTALL_STAGING = YES
 ORC_DEPENDENCIES = host-orc
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index e856cac..d4cf9bc 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -11,7 +11,7 @@ P11_KIT_INSTALL_STAGING = YES
 P11_KIT_CONF_OPTS = --disable-static
 P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
 	ac_cv_have_decl___progname=no
-P11_KIT_LICENSE = BSD-3c
+P11_KIT_LICENSE = BSD-3-Clause
 P11_KIT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index 7fb3026..22ef2ef 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -6,7 +6,7 @@
 
 PAHO_MQTT_C_VERSION = v1.1.0
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,$(PAHO_MQTT_C_VERSION))
-PAHO_MQTT_C_LICENSE = EPL-1.0 or BSD-3c
+PAHO_MQTT_C_LICENSE = EPL-1.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v10 edl-v10
 PAHO_MQTT_C_INSTALL_STAGING = YES
 
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index e302ed7..0c145a9 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -7,7 +7,7 @@
 PCRE_VERSION = 8.40
 PCRE_SITE = https://ftp.pcre.org/pub/pcre
 PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
-PCRE_LICENSE = BSD-3c
+PCRE_LICENSE = BSD-3-Clause
 PCRE_LICENSE_FILES = LICENCE
 PCRE_INSTALL_STAGING = YES
 PCRE_CONFIG_SCRIPTS = pcre-config
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 3349b6c..f868b85 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -9,7 +9,7 @@ PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = http://alioth.debian.org/frs/download.php/file/3963
 PCSC_LITE_INSTALL_STAGING = YES
 PCSC_LITE_DEPENDENCIES = host-pkgconf
-PCSC_LITE_LICENSE = BSD-3c
+PCSC_LITE_LICENSE = BSD-3-Clause
 PCSC_LITE_LICENSE_FILES = COPYING
 PCSC_LITE_AUTORECONF = YES
 
diff --git a/package/php-zmq/php-zmq.mk b/package/php-zmq/php-zmq.mk
index 2730996..ba14113 100644
--- a/package/php-zmq/php-zmq.mk
+++ b/package/php-zmq/php-zmq.mk
@@ -10,7 +10,7 @@ PHP_ZMQ_SITE = https://pecl.php.net/get
 # phpize does the autoconf magic
 PHP_ZMQ_DEPENDENCIES = php zeromq host-autoconf host-pkgconf
 PHP_ZMQ_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config
-PHP_ZMQ_LICENSE = BSD-3c
+PHP_ZMQ_LICENSE = BSD-3-Clause
 PHP_ZMQ_LICENSE_FILES = LICENSE
 
 define PHP_ZMQ_PHPIZE
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index da957c0..f5fb663 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -7,7 +7,7 @@
 PPPD_VERSION = 2.4.7
 PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
 PPPD_SITE = https://download.samba.org/pub/ppp
-PPPD_LICENSE = LGPL-2.0+, LGPL, BSD-4c, BSD-3c, GPL-2.0+
+PPPD_LICENSE = LGPL-2.0+, LGPL, BSD-4c, BSD-3-Clause, GPL-2.0+
 PPPD_LICENSE_FILES = \
 	pppd/tdb.c pppd/plugins/pppoatm/COPYING \
 	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index dabbfb7..72930c1 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -9,7 +9,7 @@
 # version/site variables.
 PROTOBUF_VERSION = v3.0.0
 PROTOBUF_SITE = $(call github,google,protobuf,$(PROTOBUF_VERSION))
-PROTOBUF_LICENSE = BSD-3c
+PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
 # no configure script
 PROTOBUF_AUTORECONF = YES
diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
index ee28de6..f30ff6b 100644
--- a/package/pru-software-support/pru-software-support.mk
+++ b/package/pru-software-support/pru-software-support.mk
@@ -6,7 +6,7 @@
 
 PRU_SOFTWARE_SUPPORT_VERSION = v5.1.0
 PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/pru-software-support-package/pru-software-support-package/archive-tarball/$(PRU_SOFTWARE_SUPPORT_VERSION)?
-PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3c, GPL-2.0, Public Domain
+PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3-Clause, GPL-2.0, Public Domain
 PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v5.0-Manifest.html
 PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
 HOST_PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index 3627b15..d9bd0f0 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -8,7 +8,7 @@ PYTHON_BABEL_VERSION = 2.3.4
 PYTHON_BABEL_SOURCE = Babel-$(PYTHON_BABEL_VERSION).tar.gz
 PYTHON_BABEL_SITE = https://pypi.python.org/packages/6e/96/ba2a2462ed25ca0e651fb7b66e7080f5315f91425a07ea5b34d7c870c114
 PYTHON_BABEL_SETUP_TYPE = setuptools
-PYTHON_BABEL_LICENSE = BSD-3c
+PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
diff --git a/package/python-cherrypy/python-cherrypy.mk b/package/python-cherrypy/python-cherrypy.mk
index 754e0a2..54742b9 100644
--- a/package/python-cherrypy/python-cherrypy.mk
+++ b/package/python-cherrypy/python-cherrypy.mk
@@ -7,7 +7,7 @@
 PYTHON_CHERRYPY_VERSION = 4.0.0
 PYTHON_CHERRYPY_SOURCE = CherryPy-$(PYTHON_CHERRYPY_VERSION).tar.gz
 PYTHON_CHERRYPY_SITE = http://pypi.python.org/packages/source/C/CherryPy
-PYTHON_CHERRYPY_LICENSE = BSD-3c
+PYTHON_CHERRYPY_LICENSE = BSD-3-Clause
 PYTHON_CHERRYPY_LICENSE_FILES = cherrypy/LICENSE.txt
 PYTHON_CHERRYPY_SETUP_TYPE = distutils
 
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index e869dd5..e6df636 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -7,7 +7,7 @@
 PYTHON_CLICK_VERSION = 6.7
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
 PYTHON_CLICK_SITE = https://pypi.python.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897
-PYTHON_CLICK_LICENSE = BSD-3c
+PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE
 PYTHON_CLICK_SETUP_TYPE = setuptools
 
diff --git a/package/python-configobj/python-configobj.mk b/package/python-configobj/python-configobj.mk
index d9591d5..9e281d2 100644
--- a/package/python-configobj/python-configobj.mk
+++ b/package/python-configobj/python-configobj.mk
@@ -7,7 +7,7 @@
 PYTHON_CONFIGOBJ_VERSION = 5.0.6
 PYTHON_CONFIGOBJ_SOURCE = configobj-$(PYTHON_CONFIGOBJ_VERSION).tar.gz
 PYTHON_CONFIGOBJ_SITE = https://pypi.python.org/packages/64/61/079eb60459c44929e684fa7d9e2fdca403f67d64dd9dbac27296be2e0fab
-PYTHON_CONFIGOBJ_LICENSE = BSD-3c
+PYTHON_CONFIGOBJ_LICENSE = BSD-3-Clause
 # License only mentioned in the source
 PYTHON_CONFIGOBJ_SETUP_TYPE = distutils
 
diff --git a/package/python-couchdb/python-couchdb.mk b/package/python-couchdb/python-couchdb.mk
index c88787c..afdbdf5 100644
--- a/package/python-couchdb/python-couchdb.mk
+++ b/package/python-couchdb/python-couchdb.mk
@@ -8,7 +8,7 @@ PYTHON_COUCHDB_VERSION = 1.1
 PYTHON_COUCHDB_SOURCE = CouchDB-$(PYTHON_COUCHDB_VERSION).tar.gz
 PYTHON_COUCHDB_SITE = https://pypi.python.org/packages/9a/e8/c3c8da6d00145aaca07f2b784794917613dad26532068da4e8392dc48d7f
 PYTHON_COUCHDB_SETUP_TYPE = setuptools
-PYTHON_COUCHDB_LICENSE = BSD-3c
+PYTHON_COUCHDB_LICENSE = BSD-3-Clause
 PYTHON_COUCHDB_LICENSE_FILES = COPYING
 
 $(eval $(python-package))
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 9e2b86f..5373da8 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -8,7 +8,7 @@ PYTHON_CRYPTOGRAPHY_VERSION = 1.7.2
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
 PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/99/df/71c7260003f5c469cec3db4c547115df39e9ce6c719a99e067ba0e78fd8a
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
-PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3c
+PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
 PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
 
diff --git a/package/python-cssselect/python-cssselect.mk b/package/python-cssselect/python-cssselect.mk
index 5a4b63b..7136a52 100644
--- a/package/python-cssselect/python-cssselect.mk
+++ b/package/python-cssselect/python-cssselect.mk
@@ -8,7 +8,7 @@ PYTHON_CSSSELECT_VERSION = 1.0.1
 PYTHON_CSSSELECT_SOURCE = cssselect-$(PYTHON_CSSSELECT_VERSION).tar.gz
 PYTHON_CSSSELECT_SITE = https://pypi.python.org/packages/77/ff/9c865275cd19290feba56344eba570e719efb7ca5b34d67ed12b22ebbb0d
 PYTHON_CSSSELECT_SETUP_TYPE = setuptools
-PYTHON_CSSSELECT_LICENSE = BSD-3c
+PYTHON_CSSSELECT_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
diff --git a/package/python-dateutil/python-dateutil.mk b/package/python-dateutil/python-dateutil.mk
index b1f5e68..41dee2d 100644
--- a/package/python-dateutil/python-dateutil.mk
+++ b/package/python-dateutil/python-dateutil.mk
@@ -7,7 +7,7 @@
 PYTHON_DATEUTIL_VERSION = 2.6.0
 PYTHON_DATEUTIL_SITE = https://pypi.python.org/packages/51/fc/39a3fbde6864942e8bb24c93663734b74e281b984d1b8c4f95d64b0c21f6
 PYTHON_DATEUTIL_SETUP_TYPE = setuptools
-PYTHON_DATEUTIL_LICENSE = BSD-3c
+PYTHON_DATEUTIL_LICENSE = BSD-3-Clause
 PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 2a50231..9065a68 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -8,7 +8,7 @@ PYTHON_DJANGO_VERSION = 1.10.2
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
 PYTHON_DJANGO_SITE = https://pypi.python.org/packages/57/9e/59444485f092b6ed4f1931e7d2e13b67fdab967c041d02f58a0d1dab8c23
-PYTHON_DJANGO_LICENSE = BSD-3c
+PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
 
diff --git a/package/python-dpkt/python-dpkt.mk b/package/python-dpkt/python-dpkt.mk
index 3015502..9694b9e 100644
--- a/package/python-dpkt/python-dpkt.mk
+++ b/package/python-dpkt/python-dpkt.mk
@@ -7,7 +7,7 @@
 PYTHON_DPKT_VERSION = 1.8.r98
 PYTHON_DPKT_SITE = $(call github,kbandla,dpkt,$(PYTHON_DPKT_VERSION))
 PYTHON_DPKT_SETUP_TYPE = distutils
-PYTHON_DPKT_LICENSE = BSD-3c
+PYTHON_DPKT_LICENSE = BSD-3-Clause
 PYTHON_DPKT_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
diff --git a/package/python-enum34/python-enum34.mk b/package/python-enum34/python-enum34.mk
index 9b7fbd4..1a4c6c6 100644
--- a/package/python-enum34/python-enum34.mk
+++ b/package/python-enum34/python-enum34.mk
@@ -8,7 +8,7 @@ PYTHON_ENUM34_VERSION = 1.1.6
 PYTHON_ENUM34_SOURCE = enum34-$(PYTHON_ENUM34_VERSION).tar.gz
 PYTHON_ENUM34_SITE = https://pypi.python.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876
 PYTHON_ENUM34_SETUP_TYPE = distutils
-PYTHON_ENUM34_LICENSE = BSD-3c
+PYTHON_ENUM34_LICENSE = BSD-3-Clause
 PYTHON_ENUM34_LICENSE_FILES = enum/LICENSE
 
 $(eval $(python-package))
diff --git a/package/python-flask-babel/python-flask-babel.mk b/package/python-flask-babel/python-flask-babel.mk
index 35d34d1..0b74149 100644
--- a/package/python-flask-babel/python-flask-babel.mk
+++ b/package/python-flask-babel/python-flask-babel.mk
@@ -7,7 +7,7 @@
 PYTHON_FLASK_BABEL_VERSION = 0.11.1
 PYTHON_FLASK_BABEL_SOURCE = Flask-Babel-$(PYTHON_FLASK_BABEL_VERSION).tar.gz
 PYTHON_FLASK_BABEL_SITE = https://pypi.python.org/packages/47/96/6013d4091fb4238e27e918aec4929f082942fa8c9489ae3aad2f18de4b5b
-PYTHON_FLASK_BABEL_LICENSE = BSD-3c
+PYTHON_FLASK_BABEL_LICENSE = BSD-3-Clause
 PYTHON_FLASK_BABEL_SETUP_TYPE = setuptools
 PYTHON_FLASK_BABEL_LICENSE_FILES = LICENSE
 
diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
index ade39e1..dbb37c3 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
@@ -7,7 +7,7 @@
 PYTHON_FLASK_JSONRPC_VERSION = 0.3.1
 PYTHON_FLASK_JSONRPC_SOURCE = Flask-JSONRPC-$(PYTHON_FLASK_JSONRPC_VERSION).tar.gz
 PYTHON_FLASK_JSONRPC_SITE = https://pypi.python.org/packages/cb/1f/e6d66e8498609ba04bac76155b2ea884df95531e93501bf4ef009d40a83c
-PYTHON_FLASK_JSONRPC_LICENSE = BSD-3c
+PYTHON_FLASK_JSONRPC_LICENSE = BSD-3-Clause
 PYTHON_FLASK_JSONRPC_LICENSE_FILES = setup.py
 PYTHON_FLASK_JSONRPC_SETUP_TYPE = setuptools
 
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index 6c25a6d..856fa06 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -8,7 +8,7 @@ PYTHON_FLASK_VERSION = 0.12
 PYTHON_FLASK_SOURCE = Flask-$(PYTHON_FLASK_VERSION).tar.gz
 PYTHON_FLASK_SITE = https://pypi.python.org/packages/4b/3a/4c20183df155dd2e39168e35d53a388efb384a512ca6c73001d8292c094a
 PYTHON_FLASK_SETUP_TYPE = setuptools
-PYTHON_FLASK_LICENSE = BSD-3c
+PYTHON_FLASK_LICENSE = BSD-3-Clause
 PYTHON_FLASK_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index bb87f47..7e3a317 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -7,7 +7,7 @@
 PYTHON_IDNA_VERSION = 2.2
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
 PYTHON_IDNA_SITE = https://pypi.python.org/packages/94/fe/efb1cb6f505e1a560b3d080ae6b9fddc11e7c542d694ce4635c49b1ccdcb
-PYTHON_IDNA_LICENSE =  BSD-3c
+PYTHON_IDNA_LICENSE =  BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.rst
 PYTHON_IDNA_SETUP_TYPE = setuptools
 
diff --git a/package/python-ipy/python-ipy.mk b/package/python-ipy/python-ipy.mk
index ec0d0d7..2b2bdf2 100644
--- a/package/python-ipy/python-ipy.mk
+++ b/package/python-ipy/python-ipy.mk
@@ -7,7 +7,7 @@
 PYTHON_IPY_VERSION = 0.83
 PYTHON_IPY_SOURCE = IPy-$(PYTHON_IPY_VERSION).tar.gz
 PYTHON_IPY_SITE = https://pypi.python.org/packages/88/28/79162bfc351a3f1ab44d663ab3f03fb495806fdb592170990a1568ffbf63
-PYTHON_IPY_LICENSE = BSD-3c
+PYTHON_IPY_LICENSE = BSD-3-Clause
 PYTHON_IPY_LICENSE_FILES = COPYING
 PYTHON_IPY_SETUP_TYPE = distutils
 
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 07b682b..e57d69d 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -7,7 +7,7 @@
 PYTHON_IPYTHON_VERSION = 5.2.2
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
 PYTHON_IPYTHON_SITE = https://pypi.python.org/packages/6e/cf/c2a3ca5942e2d8084574157a8f818efafb7218204cd9e41166c92c452e07
-PYTHON_IPYTHON_LICENSE = BSD-3c
+PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst
 PYTHON_IPYTHON_SETUP_TYPE = distutils
 
diff --git a/package/python-itsdangerous/python-itsdangerous.mk b/package/python-itsdangerous/python-itsdangerous.mk
index 8b055d6..45adbb0 100644
--- a/package/python-itsdangerous/python-itsdangerous.mk
+++ b/package/python-itsdangerous/python-itsdangerous.mk
@@ -7,7 +7,7 @@
 PYTHON_ITSDANGEROUS_VERSION = 0.24
 PYTHON_ITSDANGEROUS_SITE = $(call github,mitsuhiko,itsdangerous,$(PYTHON_ITSDANGEROUS_VERSION))
 PYTHON_ITSDANGEROUS_SETUP_TYPE = setuptools
-PYTHON_ITSDANGEROUS_LICENSE = BSD-3c
+PYTHON_ITSDANGEROUS_LICENSE = BSD-3-Clause
 PYTHON_ITSDANGEROUS_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index f5ce04c..34342ab 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -8,7 +8,7 @@ PYTHON_JINJA2_VERSION = 2.9.5
 PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
 PYTHON_JINJA2_SITE = https://pypi.python.org/packages/71/59/d7423bd5e7ddaf3a1ce299ab4490e9044e8dfd195420fc83a24de9e60726
 PYTHON_JINJA2_SETUP_TYPE = setuptools
-PYTHON_JINJA2_LICENSE = BSD-3c
+PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE
 # In host build, setup.py tries to download markupsafe if it is not installed
 HOST_PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
diff --git a/package/python-logbook/python-logbook.mk b/package/python-logbook/python-logbook.mk
index 2912379..5fcf301 100644
--- a/package/python-logbook/python-logbook.mk
+++ b/package/python-logbook/python-logbook.mk
@@ -8,6 +8,6 @@ PYTHON_LOGBOOK_VERSION = 1.0.0
 PYTHON_LOGBOOK_SOURCE = Logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
 PYTHON_LOGBOOK_SITE = https://pypi.python.org/packages/34/e8/6419c217bbf464fe8a902418120cccaf476201bd03b50958db24d6e90f65
 PYTHON_LOGBOOK_SETUP_TYPE = setuptools
-PYTHON_LOGBOOK_LICENSE = BSD-3c
+PYTHON_LOGBOOK_LICENSE = BSD-3-Clause
 
 $(eval $(python-package))
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 62c2980..bb060d7 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -9,7 +9,7 @@ PYTHON_LXML_SITE = http://lxml.de/files
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tgz
 
 # Not including the GPL, because it is used only for the test scripts.
-PYTHON_LXML_LICENSE = BSD-3c, Others
+PYTHON_LXML_LICENSE = BSD-3-Clause, Others
 PYTHON_LXML_LICENSE_FILES = \
 	LICENSES.txt \
 	doc/licenses/BSD.txt \
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index 6968366..d5273f9 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -7,7 +7,7 @@
 PYTHON_MARKDOWN_VERSION = 2.6.8
 PYTHON_MARKDOWN_SOURCE = Markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
 PYTHON_MARKDOWN_SITE = https://pypi.python.org/packages/1d/25/3f6d2cb31ec42ca5bd3bfbea99b63892b735d76e26f20dd2dcc34ffe4f0d
-PYTHON_MARKDOWN_LICENSE = BSD-3c
+PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = distutils
 
diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index c815728..d8e3acb 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -8,7 +8,7 @@ PYTHON_MARKUPSAFE_VERSION = 0.23
 PYTHON_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
 PYTHON_MARKUPSAFE_SITE = http://pypi.python.org/packages/source/M/MarkupSafe
 PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
-PYTHON_MARKUPSAFE_LICENSE = BSD-3c
+PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
 PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
diff --git a/package/python-mistune/python-mistune.mk b/package/python-mistune/python-mistune.mk
index 91e97e8..6bc0b20 100644
--- a/package/python-mistune/python-mistune.mk
+++ b/package/python-mistune/python-mistune.mk
@@ -7,7 +7,7 @@
 PYTHON_MISTUNE_VERSION = 0.7.3
 PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
 PYTHON_MISTUNE_SITE = https://pypi.python.org/packages/88/1e/be99791262b3a794332fda598a07c2749a433b9378586361ba9d8e824607
-PYTHON_MISTUNE_LICENSE = BSD-3c
+PYTHON_MISTUNE_LICENSE = BSD-3-Clause
 PYTHON_MISTUNE_LICENSE_FILES = LICENSE
 PYTHON_MISTUNE_SETUP_TYPE = setuptools
 
diff --git a/package/python-netaddr/python-netaddr.mk b/package/python-netaddr/python-netaddr.mk
index 69ad3cc..95f78f1 100644
--- a/package/python-netaddr/python-netaddr.mk
+++ b/package/python-netaddr/python-netaddr.mk
@@ -7,7 +7,7 @@
 PYTHON_NETADDR_VERSION = 0.7.19
 PYTHON_NETADDR_SOURCE = netaddr-$(PYTHON_NETADDR_VERSION).tar.gz
 PYTHON_NETADDR_SITE = https://pypi.python.org/packages/0c/13/7cbb180b52201c07c796243eeff4c256b053656da5cfe3916c3f5b57b3a0
-PYTHON_NETADDR_LICENSE = BSD-3c
+PYTHON_NETADDR_LICENSE = BSD-3-Clause
 PYTHON_NETADDR_LICENSE_FILES = LICENSE
 PYTHON_NETADDR_SETUP_TYPE = distutils
 
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 0ab58b0..93ffaa4 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -7,7 +7,7 @@
 PYTHON_NUMPY_VERSION = 1.8.0
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
 PYTHON_NUMPY_SITE = http://downloads.sourceforge.net/numpy
-PYTHON_NUMPY_LICENSE = BSD-3c
+PYTHON_NUMPY_LICENSE = BSD-3-Clause
 PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt
 PYTHON_NUMPY_SETUP_TYPE = distutils
 
diff --git a/package/python-posix-ipc/python-posix-ipc.mk b/package/python-posix-ipc/python-posix-ipc.mk
index 7916537..6178c75 100644
--- a/package/python-posix-ipc/python-posix-ipc.mk
+++ b/package/python-posix-ipc/python-posix-ipc.mk
@@ -7,7 +7,7 @@
 PYTHON_POSIX_IPC_VERSION = 1.0.0
 PYTHON_POSIX_IPC_SOURCE = posix_ipc-$(PYTHON_POSIX_IPC_VERSION).tar.gz
 PYTHON_POSIX_IPC_SITE = https://pypi.python.org/packages/f0/e6/bff62b62b2e75f695b737695951b7a4c1c6595369268a37868f5c34e1c12
-PYTHON_POSIX_IPC_LICENSE = BSD-3c
+PYTHON_POSIX_IPC_LICENSE = BSD-3-Clause
 PYTHON_POSIX_IPC_LICENSE_FILES = LICENSE
 PYTHON_POSIX_IPC_SETUP_TYPE = distutils
 
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
index 0b80681..19b7b34 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.mk
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
@@ -8,7 +8,7 @@ PYTHON_PROMPT_TOOLKIT_VERSION = 1.0.13
 PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
 PYTHON_PROMPT_TOOLKIT_SITE = https://pypi.python.org/packages/23/be/4876b52d5cc159cbd4b0ff6e7aa419a26470849a43a8f647857a4a24467b
 PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
-PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3c
+PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3-Clause
 PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index d8be76d..5a64889 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -7,7 +7,7 @@
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
 PYTHON_PROTOBUF_SOURCE = $(PROTOBUF_SOURCE)
 PYTHON_PROTOBUF_SITE = $(PROTOBUF_SITE)
-PYTHON_PROTOBUF_LICENSE = BSD-3c
+PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
 PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
 PYTHON_PROTOBUF_SETUP_TYPE = setuptools
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 9783733..2b41df7 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -8,7 +8,7 @@ PYTHON_PSUTIL_VERSION = 5.2.0
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
 PYTHON_PSUTIL_SITE = https://pypi.python.org/packages/3c/2f/f3ab91349c666f009077157b12057e613a3152a46a6c3be883777546b6de
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
-PYTHON_PSUTIL_LICENSE = BSD-3c
+PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
index e66c80b..08a22b4 100644
--- a/package/python-pycparser/python-pycparser.mk
+++ b/package/python-pycparser/python-pycparser.mk
@@ -8,7 +8,7 @@ PYTHON_PYCPARSER_VERSION = 2.17
 PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
 PYTHON_PYCPARSER_SITE = https://pypi.python.org/packages/be/64/1bb257ffb17d01f4a38d7ce686809a736837ad4371bcc5c42ba7a715c3ac
 PYTHON_PYCPARSER_SETUP_TYPE = setuptools
-PYTHON_PYCPARSER_LICENSE = BSD-3c
+PYTHON_PYCPARSER_LICENSE = BSD-3-Clause
 PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 7492357..173fe6e 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -7,7 +7,7 @@
 PYTHON_PYDAL_VERSION = 17.1
 PYTHON_PYDAL_SOURCE = pyDAL-$(PYTHON_PYDAL_VERSION).tar.gz
 PYTHON_PYDAL_SITE = https://pypi.python.org/packages/64/9a/4fc08f6078b3a3019a9e33c8383bb023e064405dc5e16c273b8ec6d430cd
-PYTHON_PYDAL_LICENSE = BSD-3c
+PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE
 PYTHON_PYDAL_SETUP_TYPE = setuptools
 
diff --git a/package/python-pypcap/python-pypcap.mk b/package/python-pypcap/python-pypcap.mk
index 97d07f8..185ab1d 100644
--- a/package/python-pypcap/python-pypcap.mk
+++ b/package/python-pypcap/python-pypcap.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYPCAP_VERSION = 6f46e7bf29a648256ddc732a7d0ec83d3ffca390
 PYTHON_PYPCAP_SITE = $(call github,dugsong,pypcap,$(PYTHON_PYPCAP_VERSION))
-PYTHON_PYPCAP_LICENSE = BSD-3c
+PYTHON_PYPCAP_LICENSE = BSD-3-Clause
 PYTHON_PYPCAP_LICENSE_FILES = LICENSE
 PYTHON_PYPCAP_SETUP_TYPE = distutils
 PYTHON_PYPCAP_DEPENDENCIES = host-python-pyrex libpcap
diff --git a/package/python-pyqrcode/python-pyqrcode.mk b/package/python-pyqrcode/python-pyqrcode.mk
index 67e167a..f3eac5a 100644
--- a/package/python-pyqrcode/python-pyqrcode.mk
+++ b/package/python-pyqrcode/python-pyqrcode.mk
@@ -8,7 +8,7 @@ PYTHON_PYQRCODE_VERSION = 1.2.1
 PYTHON_PYQRCODE_SOURCE = PyQRCode-$(PYTHON_PYQRCODE_VERSION).tar.gz
 PYTHON_PYQRCODE_SITE = https://pypi.python.org/packages/37/61/f07226075c347897937d4086ef8e55f0a62ae535e28069884ac68d979316
 PYTHON_PYQRCODE_SETUP_TYPE = setuptools
-PYTHON_PYQRCODE_LICENSE = BSD-3c
+PYTHON_PYQRCODE_LICENSE = BSD-3-Clause
 PYTHON_PYQRCODE_LICENSE_FILES = setup.py
 
 $(eval $(python-package))
diff --git a/package/python-pysnmp-apps/python-pysnmp-apps.mk b/package/python-pysnmp-apps/python-pysnmp-apps.mk
index 2c831df..79c436f 100644
--- a/package/python-pysnmp-apps/python-pysnmp-apps.mk
+++ b/package/python-pysnmp-apps/python-pysnmp-apps.mk
@@ -8,7 +8,7 @@ PYTHON_PYSNMP_APPS_VERSION = 0.4.1
 PYTHON_PYSNMP_APPS_SOURCE = pysnmp-apps-$(PYTHON_PYSNMP_APPS_VERSION).tar.gz
 PYTHON_PYSNMP_APPS_SITE = https://pypi.python.org/packages/source/p/pysnmp-apps
 PYTHON_PYSNMP_APPS_SETUP_TYPE = setuptools
-PYTHON_PYSNMP_APPS_LICENSE = BSD-3c
+PYTHON_PYSNMP_APPS_LICENSE = BSD-3-Clause
 PYTHON_PYSNMP_APPS_LICENSE_FILES = LICENSE.txt
 
 PYTHON_PYSNMP_APPS_DEPENDENCIES = python-pysnmp
diff --git a/package/python-pysnmp-mibs/python-pysnmp-mibs.mk b/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
index a0db763..9772b78 100644
--- a/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
+++ b/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
@@ -8,7 +8,7 @@ PYTHON_PYSNMP_MIBS_VERSION = 0.1.6
 PYTHON_PYSNMP_MIBS_SOURCE = pysnmp-mibs-$(PYTHON_PYSNMP_MIBS_VERSION).tar.gz
 PYTHON_PYSNMP_MIBS_SITE = https://pypi.python.org/packages/bf/7c/99ab192af934ed5d41ceef92a1b949b41652f29b46241b902ffec55642f4
 PYTHON_PYSNMP_MIBS_SETUP_TYPE = setuptools
-PYTHON_PYSNMP_MIBS_LICENSE = BSD-3c
+PYTHON_PYSNMP_MIBS_LICENSE = BSD-3-Clause
 PYTHON_PYSNMP_MIBS_LICENSE_FILES = LICENSE.txt
 
 PYTHON_PYSNMP_MIBS_DEPENDENCIES = python-pysnmp
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index 0d72613..2721ba8 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -9,7 +9,7 @@ PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
 PYTHON_PYSNMP_SITE = https://pypi.python.org/packages/47/b5/c65b9b6fcc36d3f4caca30d3314920f1ca75f5ceecc1f6ae2538ede24511
 PYTHON_PYSNMP_SETUP_TYPE = setuptools
 
-PYTHON_PYSNMP_LICENSE = BSD-3c
+PYTHON_PYSNMP_LICENSE = BSD-3-Clause
 PYTHON_PYSNMP_LICENSE_FILES = LICENSE.txt
 
 PYTHON_PYSNMP_DEPENDENCIES = python-pyasn python-pycrypto
diff --git a/package/python-pysocks/python-pysocks.mk b/package/python-pysocks/python-pysocks.mk
index 0fa8c1d..10c76b2 100644
--- a/package/python-pysocks/python-pysocks.mk
+++ b/package/python-pysocks/python-pysocks.mk
@@ -7,7 +7,7 @@
 PYTHON_PYSOCKS_VERSION = 1.6.6
 PYTHON_PYSOCKS_SOURCE = PySocks-$(PYTHON_PYSOCKS_VERSION).tar.gz
 PYTHON_PYSOCKS_SITE = https://pypi.python.org/packages/fd/70/ba9982cedc9b3ed3c06934f1f46a609e0f23c7bfdf567c52a09f1296b8cb
-PYTHON_PYSOCKS_LICENSE = BSD-3c
+PYTHON_PYSOCKS_LICENSE = BSD-3-Clause
 PYTHON_PYSOCKS_LICENSE_FILES = socks.py
 PYTHON_PYSOCKS_SETUP_TYPE = distutils
 
diff --git a/package/python-pytrie/python-pytrie.mk b/package/python-pytrie/python-pytrie.mk
index e3bea4f..b651352 100644
--- a/package/python-pytrie/python-pytrie.mk
+++ b/package/python-pytrie/python-pytrie.mk
@@ -7,7 +7,7 @@
 PYTHON_PYTRIE_VERSION = 0.2
 PYTHON_PYTRIE_SITE = http://pypi.python.org/packages/source/P/PyTrie
 PYTHON_PYTRIE_SOURCE = PyTrie-$(PYTHON_PYTRIE_VERSION).tar.gz
-PYTHON_PYTRIE_LICENSE = BSD-3c
+PYTHON_PYTRIE_LICENSE = BSD-3-Clause
 PYTHON_PYTRIE_LICENSE_FILES = LICENSE
 PYTHON_PYTRIE_SETUP_TYPE = distutils
 
diff --git a/package/python-pyusb/python-pyusb.mk b/package/python-pyusb/python-pyusb.mk
index cfdef53..0afcbe8 100644
--- a/package/python-pyusb/python-pyusb.mk
+++ b/package/python-pyusb/python-pyusb.mk
@@ -7,7 +7,7 @@
 PYTHON_PYUSB_VERSION = 1.0.0
 PYTHON_PYUSB_SOURCE = PyUSB-$(PYTHON_PYUSB_VERSION).tar.gz
 PYTHON_PYUSB_SITE = https://pypi.python.org/packages/8a/19/66fb48a4905e472f5dfeda3a1bafac369fbf6d6fc5cf55b780864962652d
-PYTHON_PYUSB_LICENSE = BSD-3c
+PYTHON_PYUSB_LICENSE = BSD-3-Clause
 PYTHON_PYUSB_LICENSE_FILES = LICENSE
 PYTHON_PYUSB_SETUP_TYPE = distutils
 PYTHON_PYUSB_DEPENDENCIES = libusb
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index 4f8b5ec..c34c5af 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -7,7 +7,7 @@
 PYTHON_PYZMQ_VERSION = 16.0.2
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
 PYTHON_PYZMQ_SITE = https://pypi.python.org/packages/af/37/8e0bf3800823bc247c36715a52e924e8f8fd5d1432f04b44b8cd7a5d7e55
-PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3c, Apache-2.0
+PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
 PYTHON_PYZMQ_DEPENDENCIES = zeromq
diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
index 36cfec3..b839b5d 100644
--- a/package/python-setproctitle/python-setproctitle.mk
+++ b/package/python-setproctitle/python-setproctitle.mk
@@ -7,7 +7,7 @@
 PYTHON_SETPROCTITLE_VERSION = 1.1.10
 PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
 PYTHON_SETPROCTITLE_SITE = https://pypi.python.org/packages/5a/0d/dc0d2234aacba6cf1a729964383e3452c52096dc695581248b548786f2b3
-PYTHON_SETPROCTITLE_LICENSE = BSD-3c
+PYTHON_SETPROCTITLE_LICENSE = BSD-3-Clause
 PYTHON_SETPROCTITLE_LICENSE_FILES = COPYRIGHT
 PYTHON_SETPROCTITLE_SETUP_TYPE = distutils
 
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 8d4a12b..0a2184e 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -7,7 +7,7 @@
 PYTHON_UJSON_VERSION = 1.35
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
 PYTHON_UJSON_SITE = http://pypi.python.org/packages/source/u/ujson
-PYTHON_UJSON_LICENSE = BSD-3c
+PYTHON_UJSON_LICENSE = BSD-3-Clause
 PYTHON_UJSON_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index b4dc3cd..dfa657c 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -8,7 +8,7 @@ PYTHON_WERKZEUG_VERSION = 0.11.15
 PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
 PYTHON_WERKZEUG_SITE = https://pypi.python.org/packages/fe/7f/6d70f765ce5484e07576313897793cb49333dd34e462488ee818d17244af
 PYTHON_WERKZEUG_SETUP_TYPE = setuptools
-PYTHON_WERKZEUG_LICENSE = BSD-3c
+PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
diff --git a/package/python-whoosh/python-whoosh.mk b/package/python-whoosh/python-whoosh.mk
index 2baf657..a100c44 100644
--- a/package/python-whoosh/python-whoosh.mk
+++ b/package/python-whoosh/python-whoosh.mk
@@ -8,7 +8,7 @@ PYTHON_WHOOSH_VERSION = 2.7.4
 PYTHON_WHOOSH_SOURCE = Whoosh-$(PYTHON_WHOOSH_VERSION).tar.gz
 PYTHON_WHOOSH_SITE = https://pypi.python.org/packages/25/2b/6beed2107b148edc1321da0d489afc4617b9ed317ef7b72d4993cad9b684
 PYTHON_WHOOSH_SETUP_TYPE = setuptools
-PYTHON_WHOOSH_LICENSE = BSD-3c
+PYTHON_WHOOSH_LICENSE = BSD-3-Clause
 PYTHON_WHOOSH_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
diff --git a/package/python-ws4py/python-ws4py.mk b/package/python-ws4py/python-ws4py.mk
index fac99f3..8f3b985 100644
--- a/package/python-ws4py/python-ws4py.mk
+++ b/package/python-ws4py/python-ws4py.mk
@@ -8,7 +8,7 @@ PYTHON_WS4PY_VERSION = 0.3.5
 PYTHON_WS4PY_SOURCE = ws4py-$(PYTHON_WS4PY_VERSION).tar.gz
 PYTHON_WS4PY_SITE = https://pypi.python.org/packages/c8/b4/1784512791fbd196a48f282ca6c79398cace9541a9c151d89c30b6add6e1
 PYTHON_WS4PY_SETUP_TYPE = setuptools
-PYTHON_WS4PY_LICENSE = BSD-3c
+PYTHON_WS4PY_LICENSE = BSD-3-Clause
 PYTHON_WS4PY_LICENSE_FILES = ws4py/__init__.py
 
 $(eval $(python-package))
diff --git a/package/python-xlrd/python-xlrd.mk b/package/python-xlrd/python-xlrd.mk
index 50f7624..e3f078c 100644
--- a/package/python-xlrd/python-xlrd.mk
+++ b/package/python-xlrd/python-xlrd.mk
@@ -8,7 +8,7 @@ PYTHON_XLRD_VERSION = 1.0.0
 PYTHON_XLRD_SOURCE = xlrd-$(PYTHON_XLRD_VERSION).tar.gz
 PYTHON_XLRD_SITE = https://pypi.python.org/packages/42/85/25caf967c2d496067489e0bb32df069a8361e1fd96a7e9f35408e56b3aab
 PYTHON_XLRD_SETUP_TYPE = setuptools
-PYTHON_XLRD_LICENSE = BSD-3c
+PYTHON_XLRD_LICENSE = BSD-3-Clause
 PYTHON_XLRD_LICENSE_FILES = xlrd/licences.py
 
 $(eval $(python-package))
diff --git a/package/python-xlwt/python-xlwt.mk b/package/python-xlwt/python-xlwt.mk
index 27901f9..0438fc8 100644
--- a/package/python-xlwt/python-xlwt.mk
+++ b/package/python-xlwt/python-xlwt.mk
@@ -8,7 +8,7 @@ PYTHON_XLWT_VERSION = 1.2.0
 PYTHON_XLWT_SOURCE = xlwt-$(PYTHON_XLWT_VERSION).tar.gz
 PYTHON_XLWT_SITE = https://pypi.python.org/packages/5b/8d/22b9ec552a1d7865de39f54bd15f9db09c72a6bf8ab77b11dcce4ae336bb
 PYTHON_XLWT_SETUP_TYPE = setuptools
-PYTHON_XLWT_LICENSE = BSD-3c, BSD-4c
+PYTHON_XLWT_LICENSE = BSD-3-Clause, BSD-4c
 PYTHON_XLWT_LICENSE_FILES = docs/licenses.rst
 
 $(eval $(python-package))
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 4dffaed..649f060 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -7,7 +7,7 @@
 QEMU_VERSION = 2.8.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
-QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
+QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2c, Others/BSD-1c
 QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #?NOTE: there is no top-level license file for non-(L)GPL licenses;
 #       the non-(L)GPL license texts are specified in the affected
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e949cf4..d00d8e7 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -57,7 +57,7 @@ QT5BASE_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.3 (docs
 QT5BASE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-QT5BASE_LICENSE := $(QT5BASE_LICENSE), BSD-3c (examples)
+QT5BASE_LICENSE := $(QT5BASE_LICENSE), BSD-3-Clause (examples)
 QT5BASE_LICENSE_FILES += header.BSD
 endif
 else
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index c0861c8..1cdc9e5 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -19,7 +19,7 @@ QT5CONNECTIVITY_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-
 QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-QT5CONNECTIVITY_LICENSE := $(QT5CONNECTIVITY_LICENSE), BSD-3c (examples)
+QT5CONNECTIVITY_LICENSE := $(QT5CONNECTIVITY_LICENSE), BSD-3-Clause (examples)
 endif
 else
 QT5CONNECTIVITY_LICENSE = Commercial license
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index 468d1ff..46d30de 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -16,7 +16,7 @@ ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5ENGINIO_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.3 (docs)
 QT5ENGINIO_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-QT5ENGINIO_LICENSE := $(QT5ENGINIO_LICENSE), BSD-3c (examples)
+QT5ENGINIO_LICENSE := $(QT5ENGINIO_LICENSE), BSD-3-Clause (examples)
 endif
 else
 QT5ENGINIO_LICENSE = Commercial license
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index 570a14b..bbd8786 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -19,7 +19,7 @@ QT5WEBCHANNEL_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.
 QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-QT5WEBCHANNEL_LICENSE := $(QT5WEBCHANNEL_LICENSE), BSD-3c (examples)
+QT5WEBCHANNEL_LICENSE := $(QT5WEBCHANNEL_LICENSE), BSD-3-Clause (examples)
 endif
 else
 QT5WEBCHANNEL_LICENSE = Commercial license
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 09d09fd..3849959 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -15,7 +15,7 @@ QT5WEBKIT_INSTALL_STAGING = YES
 QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5WEBKIT_LICENSE = LGPL-2.1+, BSD-3c, BSD-2c
+QT5WEBKIT_LICENSE = LGPL-2.1+, BSD-3-Clause, BSD-2c
 # Source files contain references to LGPL_EXCEPTION.txt but it is not included
 # in the archive.
 QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index fe34748..bcbc56f 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -19,7 +19,7 @@ QT5WEBSOCKETS_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0
 QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-QT5WEBSOCKETS_LICENSE := $(QT5WEBSOCKETS_LICENSE), BSD-3c (examples)
+QT5WEBSOCKETS_LICENSE := $(QT5WEBSOCKETS_LICENSE), BSD-3-Clause (examples)
 endif
 else
 QT5WEBSOCKETS_LICENSE = Commercial license
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index c6d8137..065bf61 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -19,7 +19,7 @@ QT5XMLPATTERNS_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.
 QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-QT5XMLPATTERNS_LICENSE := $(QT5XMLPATTERNS_LICENSE), BSD-3c (examples)
+QT5XMLPATTERNS_LICENSE := $(QT5XMLPATTERNS_LICENSE), BSD-3-Clause (examples)
 endif
 else
 QT5XMLPATTERNS_LICENSE = Commercial license
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 8ab6e72..6798620 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -6,7 +6,7 @@
 
 REDIS_VERSION = 3.2.8
 REDIS_SITE = http://download.redis.io/releases
-REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
+REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
 
 define REDIS_USERS
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 4360d1f..28deb50 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -7,7 +7,7 @@
 RPCBIND_VERSION = 0.2.3
 RPCBIND_SITE = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
 RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
-RPCBIND_LICENSE = BSD-3c
+RPCBIND_LICENSE = BSD-3-Clause
 RPCBIND_LICENSE_FILES = COPYING
 
 RPCBIND_CONF_ENV += \
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index b73ef53..5d5c9f0 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -6,7 +6,7 @@
 
 RPI_FIRMWARE_VERSION = 78c4983379de0537f49a97fb37ceaaf42632b28c
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
-RPI_FIRMWARE_LICENSE = BSD-3c
+RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
 RPI_FIRMWARE_INSTALL_IMAGES = YES
 
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index aec721d..632552c 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -6,7 +6,7 @@
 
 RPI_USERLAND_VERSION = f410ec051a3724934e3671315474d4b81424b0ef
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
-RPI_USERLAND_LICENSE = BSD-3c
+RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
 RPI_USERLAND_INSTALL_STAGING = YES
 RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr \
diff --git a/package/rs485conf/rs485conf.mk b/package/rs485conf/rs485conf.mk
index 8749268..9d1b764 100644
--- a/package/rs485conf/rs485conf.mk
+++ b/package/rs485conf/rs485conf.mk
@@ -6,7 +6,7 @@
 
 RS485CONF_VERSION = 5c8d00cf70950fab3454549b81dea843d844492a
 RS485CONF_SITE = $(call github,mniestroj,rs485conf,$(RS485CONF_VERSION))
-RS485CONF_LICENSE = BSD-3c
+RS485CONF_LICENSE = BSD-3-Clause
 RS485CONF_LICENSE_FILES = LICENSE
 
 define RS485CONF_BUILD_CMDS
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index d0a81f1..32ab79c 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -17,7 +17,7 @@ HOST_RUBY_CONF_OPTS = \
 	--disable-install-doc \
 	--with-out-ext=curses,openssl,readline \
 	--without-gmp
-RUBY_LICENSE = Ruby or BSD-2c, BSD-3c, others
+RUBY_LICENSE = Ruby or BSD-2c, BSD-3-Clause, others
 RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 
 RUBY_CFLAGS = $(TARGET_CFLAGS)
diff --git a/package/sdparm/sdparm.mk b/package/sdparm/sdparm.mk
index ed1606c..b9fac51 100644
--- a/package/sdparm/sdparm.mk
+++ b/package/sdparm/sdparm.mk
@@ -7,7 +7,7 @@
 SDPARM_VERSION = 1.10
 SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tar.xz
 SDPARM_SITE = http://sg.danny.cz/sg/p
-SDPARM_LICENSE = BSD-3c
+SDPARM_LICENSE = BSD-3-Clause
 SDPARM_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_SG3_UTILS),y)
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index bc7b0b5..783f4f6 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -7,7 +7,7 @@
 SG3_UTILS_VERSION = 1.42
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
 SG3_UTILS_SITE = http://sg.danny.cz/sg/p
-SG3_UTILS_LICENSE = BSD-3c
+SG3_UTILS_LICENSE = BSD-3-Clause
 # utils progs are GPLv2+ licenced
 ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),y)
 SG3_UTILS_LICENSE += GPL-2.0+
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 976aff6..650c6d7 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -7,7 +7,7 @@
 SHAIRPORT_SYNC_VERSION = 3.0.1
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
-SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
+SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
 SHAIRPORT_SYNC_LICENSE_FILES = LICENSES
 SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libconfig libdaemon popt host-pkgconf
 
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index fcbcd13..2b1da8c 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -6,7 +6,7 @@
 
 SNAPPY_VERSION = 32d6d7d8a2ef328a2ee1dd40f072e21f4983ebda
 SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
-SNAPPY_LICENSE = BSD-3c
+SNAPPY_LICENSE = BSD-3-Clause
 SNAPPY_LICENSE_FILES = COPYING
 # from git
 SNAPPY_AUTORECONF = YES
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index 3b4bba6..aeb052c 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -7,7 +7,7 @@
 SOCKETCAND_VERSION = df7fb4ff8a4439d7737fe2df3540e1ab7465721a
 SOCKETCAND_SITE = $(call github,dschanoeh,socketcand,$(SOCKETCAND_VERSION))
 SOCKETCAND_AUTORECONF = YES
-SOCKETCAND_LICENSE = BSD-3c or GPL-2.0
+SOCKETCAND_LICENSE = BSD-3-Clause or GPL-2.0
 SOCKETCAND_LICENSE_FILES = socketcand.c
 
 ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
diff --git a/package/spawn-fcgi/spawn-fcgi.mk b/package/spawn-fcgi/spawn-fcgi.mk
index 13357bb..ed97d0a 100644
--- a/package/spawn-fcgi/spawn-fcgi.mk
+++ b/package/spawn-fcgi/spawn-fcgi.mk
@@ -7,7 +7,7 @@
 SPAWN_FCGI_VERSION = 1.6.4
 SPAWN_FCGI_SITE = http://www.lighttpd.net/download
 SPAWN_FCGI_SOURCE = spawn-fcgi-$(SPAWN_FCGI_VERSION).tar.bz2
-SPAWN_FCGI_LICENSE = BSD-3c
+SPAWN_FCGI_LICENSE = BSD-3-Clause
 SPAWN_FCGI_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index a34bfac..1b278ea 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -6,7 +6,7 @@
 
 SPEEX_VERSION = 1.2rc1
 SPEEX_SITE = http://downloads.us.xiph.org/releases/speex
-SPEEX_LICENSE = BSD-3c
+SPEEX_LICENSE = BSD-3-Clause
 SPEEX_LICENSE_FILES = COPYING
 
 SPEEX_INSTALL_STAGING = YES
diff --git a/package/spice-protocol/spice-protocol.mk b/package/spice-protocol/spice-protocol.mk
index 4e81e6c..dcc6fee 100644
--- a/package/spice-protocol/spice-protocol.mk
+++ b/package/spice-protocol/spice-protocol.mk
@@ -7,7 +7,7 @@
 SPICE_PROTOCOL_VERSION = 0.12.10
 SPICE_PROTOCOL_SOURCE = spice-protocol-$(SPICE_PROTOCOL_VERSION).tar.bz2
 SPICE_PROTOCOL_SITE = http://www.spice-space.org/download/releases
-SPICE_PROTOCOL_LICENSE = BSD-3c
+SPICE_PROTOCOL_LICENSE = BSD-3-Clause
 SPICE_PROTOCOL_LICENSE_FILES = COPYING
 SPICE_PROTOCOL_INSTALL_STAGING = YES
 
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 15a0fbf..008dc9f 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -7,7 +7,7 @@
 STRACE_VERSION = 4.16
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
-STRACE_LICENSE = BSD-3c
+STRACE_LICENSE = BSD-3-Clause
 STRACE_LICENSE_FILES = COPYING
 
 # strace bundle some kernel headers to build libmpers, this mixes userspace
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index bb0a2b5..0fcd740 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -6,7 +6,7 @@
 
 SUDO_VERSION = 1.8.19p2
 SUDO_SITE = http://www.sudo.ws/sudo/dist
-SUDO_LICENSE = ISC, BSD-3c
+SUDO_LICENSE = ISC, BSD-3-Clause
 SUDO_LICENSE_FILES = doc/LICENSE
 # This is to avoid sudo's make install from chown()ing files which fails
 SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 95eaeac..bf2b19d 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -12,7 +12,7 @@ HOST_SWIG_CONF_OPTS = \
 	--without-pcre \
 	--disable-ccache \
 	--without-octave
-SWIG_LICENSE = GPL-3.0+, BSD-2c, BSD-3c
+SWIG_LICENSE = GPL-3.0+, BSD-2c, BSD-3-Clause
 SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
 
 # CMake looks first at swig3.0, then swig2.0 and then swig. However,
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index e71f9c1..0e779a5 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -6,7 +6,7 @@
 
 TCPDUMP_VERSION = 4.9.0
 TCPDUMP_SITE = http://www.tcpdump.org/release
-TCPDUMP_LICENSE = BSD-3c
+TCPDUMP_LICENSE = BSD-3-Clause
 TCPDUMP_LICENSE_FILES = LICENSE
 TCPDUMP_CONF_ENV = \
 	ac_cv_linux_vers=2 \
diff --git a/package/tegrarcm/tegrarcm.mk b/package/tegrarcm/tegrarcm.mk
index 06fd039..ad4c317 100644
--- a/package/tegrarcm/tegrarcm.mk
+++ b/package/tegrarcm/tegrarcm.mk
@@ -6,7 +6,7 @@
 
 TEGRARCM_VERSION = v1.7
 TEGRARCM_SITE = $(call github,NVIDIA,tegrarcm,$(TEGRARCM_VERSION))
-TEGRARCM_LICENSE = BSD-3c / NVIDIA Software License (src/miniloader)
+TEGRARCM_LICENSE = BSD-3-Clause / NVIDIA Software License (src/miniloader)
 TEGRARCM_LICENSE_FILES = LICENSE
 TEGRARCM_AUTORECONF = YES
 HOST_TEGRARCM_DEPENDENCIES = host-libusb host-pkgconf host-cryptopp
diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index cfb0cb8..7304808 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -7,7 +7,7 @@
 TI_UTILS_VERSION = 06dbdb2727354b5f3ad7c723897f40051fddee49
 TI_UTILS_SITE = $(call github,gxk,ti-utils,$(TI_UTILS_VERSION))
 TI_UTILS_DEPENDENCIES = libnl host-pkgconf
-TI_UTILS_LICENSE = BSD-3c
+TI_UTILS_LICENSE = BSD-3-Clause
 TI_UTILS_LICENSE_FILES = COPYING
 
 TI_UTILS_CFLAGS = `$(PKG_CONFIG_HOST_BINARY) --cflags libnl-genl-3.0`
diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index d44155f..064dfd0 100644
--- a/package/tinyalsa/tinyalsa.mk
+++ b/package/tinyalsa/tinyalsa.mk
@@ -6,7 +6,7 @@
 
 TINYALSA_VERSION = 1.1.0
 TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,$(TINYALSA_VERSION))
-TINYALSA_LICENSE = BSD-3c
+TINYALSA_LICENSE = BSD-3-Clause
 TINYALSA_LICENSE_FILES = NOTICE
 TINYALSA_INSTALL_STAGING = YES
 
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 9ccde79..389af66 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -6,7 +6,7 @@
 
 TOR_VERSION = 0.2.9.10
 TOR_SITE = https://dist.torproject.org
-TOR_LICENSE = BSD-3c
+TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
 TOR_DEPENDENCIES = libevent openssl zlib
 TOR_AUTORECONF = YES
diff --git a/package/tremor/tremor.mk b/package/tremor/tremor.mk
index 2a791b6..05996e2 100644
--- a/package/tremor/tremor.mk
+++ b/package/tremor/tremor.mk
@@ -7,7 +7,7 @@
 TREMOR_SITE = http://svn.xiph.org/trunk/Tremor
 TREMOR_SITE_METHOD = svn
 TREMOR_VERSION = 19427
-TREMOR_LICENSE = BSD-3c
+TREMOR_LICENSE = BSD-3-Clause
 TREMOR_LICENSE_FILES = COPYING
 
 TREMOR_AUTORECONF = YES
diff --git a/package/trousers/trousers.mk b/package/trousers/trousers.mk
index 41129eb..e6d564a 100644
--- a/package/trousers/trousers.mk
+++ b/package/trousers/trousers.mk
@@ -6,7 +6,7 @@
 
 TROUSERS_VERSION = 0.3.13
 TROUSERS_SITE = http://downloads.sourceforge.net/project/trousers/trousers/$(TROUSERS_VERSION)
-TROUSERS_LICENSE = BSD-3c
+TROUSERS_LICENSE = BSD-3-Clause
 TROUSERS_LICENSE_FILES = LICENSE
 TROUSERS_INSTALL_STAGING = YES
 # Need autoreconf because of a patch touching configure.in and Makefile.am
diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
index 4281e84..e8b2953 100644
--- a/package/unionfs/unionfs.mk
+++ b/package/unionfs/unionfs.mk
@@ -7,7 +7,7 @@
 UNIONFS_VERSION = 2.0
 UNIONFS_SITE = $(call github,rpodgorny,unionfs-fuse,v$(UNIONFS_VERSION))
 UNIONFS_DEPENDENCIES = libfuse host-pkgconf
-UNIONFS_LICENSE = BSD-3c
+UNIONFS_LICENSE = BSD-3-Clause
 UNIONFS_LICENSE_FILES = LICENSE
 
 $(eval $(cmake-package))
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 6989749..b9c4bb0 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -14,7 +14,7 @@ UTIL_LINUX_AUTORECONF = YES
 
 # README.licensing claims that some files are GPLv2-only, but this is not true.
 # Some files are GPLv3+ but only in tests.
-UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4c, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3c (libuuid)
+UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4c, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid)
 UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf
diff --git a/package/vboot-utils/vboot-utils.mk b/package/vboot-utils/vboot-utils.mk
index a7592d6..9879dba 100644
--- a/package/vboot-utils/vboot-utils.mk
+++ b/package/vboot-utils/vboot-utils.mk
@@ -7,7 +7,7 @@
 VBOOT_UTILS_VERSION = bbdd62f9b030db7ad8eef789aaf58a7ff9a25656
 VBOOT_UTILS_SITE = https://chromium.googlesource.com/chromiumos/platform/vboot_reference
 VBOOT_UTILS_SITE_METHOD = git
-VBOOT_UTILS_LICENSE = BSD-3c
+VBOOT_UTILS_LICENSE = BSD-3-Clause
 VBOOT_UTILS_LICENSE_FILES = LICENSE
 
 HOST_VBOOT_UTILS_DEPENDENCIES = host-openssl host-util-linux host-pkgconf
diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index ed59b6d..e2ec124 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -7,7 +7,7 @@
 VDE2_VERSION = 2.3.2
 VDE2_SOURCE = vde2-$(VDE2_VERSION).tar.bz2
 VDE2_SITE = http://downloads.sourceforge.net/project/vde/vde2/$(VDE2_VERSION)
-VDE2_LICENSE = GPL-2.0+, LGPL-2.1+, BSD-3c
+VDE2_LICENSE = GPL-2.0+, LGPL-2.1+, BSD-3-Clause
 VDE2_LICENSE_FILES = COPYING COPYING.libvdeplug COPYING.slirpvde
 VDE2_INSTALL_STAGING = YES
 
diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index a613506..485213a 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -9,7 +9,7 @@ WAVPACK_SITE = http://www.wavpack.com
 WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.bz2
 WAVPACK_INSTALL_STAGING = YES
 WAVPACK_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),,libiconv)
-WAVPACK_LICENSE = BSD-3c
+WAVPACK_LICENSE = BSD-3-Clause
 WAVPACK_LICENSE_FILES = COPYING
 
 # Fetch patch from upstream to remove wchar dependency
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index d579d56..7cf3df2 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -7,7 +7,7 @@
 WEBP_VERSION = 0.5.2
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
-WEBP_LICENSE = BSD-3c
+WEBP_LICENSE = BSD-3-Clause
 WEBP_LICENSE_FILES = COPYING
 WEBP_INSTALL_STAGING = YES
 
diff --git a/package/webrtc-audio-processing/webrtc-audio-processing.mk b/package/webrtc-audio-processing/webrtc-audio-processing.mk
index 75e3c88..668e20d 100644
--- a/package/webrtc-audio-processing/webrtc-audio-processing.mk
+++ b/package/webrtc-audio-processing/webrtc-audio-processing.mk
@@ -8,7 +8,7 @@ WEBRTC_AUDIO_PROCESSING_VERSION = 0.3
 WEBRTC_AUDIO_PROCESSING_SOURCE = webrtc-audio-processing-$(WEBRTC_AUDIO_PROCESSING_VERSION).tar.xz
 WEBRTC_AUDIO_PROCESSING_SITE = http://freedesktop.org/software/pulseaudio/webrtc-audio-processing
 WEBRTC_AUDIO_PROCESSING_INSTALL_STAGING = YES
-WEBRTC_AUDIO_PROCESSING_LICENSE = BSD-3c
+WEBRTC_AUDIO_PROCESSING_LICENSE = BSD-3-Clause
 WEBRTC_AUDIO_PROCESSING_LICENSE_FILES = COPYING
 # 0001-configure.ac-fix-architecture-detection.patch
 # 0002-Proper-detection-of-cxxabi.h-and-execinfo.h.patch
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 9c8414b..6658662 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -6,7 +6,7 @@
 
 WPA_SUPPLICANT_VERSION = 2.6
 WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
-WPA_SUPPLICANT_LICENSE = BSD-3c
+WPA_SUPPLICANT_LICENSE = BSD-3-Clause
 WPA_SUPPLICANT_LICENSE_FILES = README
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
 WPA_SUPPLICANT_SUBDIR = wpa_supplicant
diff --git a/package/xdotool/xdotool.mk b/package/xdotool/xdotool.mk
index a799ea4..c18885c 100644
--- a/package/xdotool/xdotool.mk
+++ b/package/xdotool/xdotool.mk
@@ -6,7 +6,7 @@
 
 XDOTOOL_VERSION = v3.20150503.1
 XDOTOOL_SITE = $(call github,jordansissel,xdotool,$(XDOTOOL_VERSION))
-XDOTOOL_LICENSE = BSD-3c
+XDOTOOL_LICENSE = BSD-3-Clause
 XDOTOOL_LICENSE_FILES = COPYRIGHT
 XDOTOOL_DEPENDENCIES = xlib_libXtst xlib_libXinerama libxkbcommon xlib_libX11
 
diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
index babf2dd..23eeae0 100644
--- a/package/yasm/yasm.mk
+++ b/package/yasm/yasm.mk
@@ -6,7 +6,7 @@
 
 YASM_VERSION = 1.3.0
 YASM_SITE = http://www.tortall.net/projects/yasm/releases
-YASM_LICENSE = BSD-2c, BSD-3c, Artistic, GPL-2.0, LGPL-2.0
+YASM_LICENSE = BSD-2c, BSD-3-Clause, Artistic, GPL-2.0, LGPL-2.0
 YASM_LICENSE_FILES = COPYING BSD.txt Artistic.txt GNU_GPL-2.0 GNU_LGPL-2.0
 
 # This sed prevents it compiling 2 programs (vsyasm and ytasm)
-- 
2.6.2
