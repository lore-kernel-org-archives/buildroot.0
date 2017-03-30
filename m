From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Thu, 30 Mar 2017 19:13:39 +0530
Subject: [Buildroot] [PATCH 10/21] boot,
	package: use SPDX short identifier for BSD-2c
In-Reply-To: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1490881430-10434-11-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We want to use SPDX identifier for license string as much as possible.
SPDX short identifier for BSD-2c is BSD-2-Clause.

This change is done using following command.
find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/BSD-2c/BSD-2-Clause/g'

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 boot/ts4800-mbrboot/ts4800-mbrboot.mk                | 2 +-
 package/atf/atf.mk                                   | 2 +-
 package/b43-fwcutter/b43-fwcutter.mk                 | 2 +-
 package/bmon/bmon.mk                                 | 2 +-
 package/botan/botan.mk                               | 2 +-
 package/bsdiff/bsdiff.mk                             | 2 +-
 package/celt051/celt051.mk                           | 2 +-
 package/dhcpcd/dhcpcd.mk                             | 2 +-
 package/dhcpdump/dhcpdump.mk                         | 2 +-
 package/dos2unix/dos2unix.mk                         | 2 +-
 package/dropbear/dropbear.mk                         | 2 +-
 package/dtc/dtc.mk                                   | 2 +-
 package/efl/efl.mk                                   | 2 +-
 package/enlightenment/enlightenment.mk               | 2 +-
 package/expedite/expedite.mk                         | 2 +-
 package/fastd/fastd.mk                               | 2 +-
 package/ficl/ficl.mk                                 | 2 +-
 package/file/file.mk                                 | 2 +-
 package/freeradius-client/freeradius-client.mk       | 2 +-
 package/iperf3/iperf3.mk                             | 2 +-
 package/jemalloc/jemalloc.mk                         | 2 +-
 package/jimtcl/jimtcl.mk                             | 2 +-
 package/leptonica/leptonica.mk                       | 2 +-
 package/libarchive/libarchive.mk                     | 2 +-
 package/libcoap/libcoap.mk                           | 2 +-
 package/libcue/libcue.mk                             | 2 +-
 package/libdmtx/libdmtx.mk                           | 2 +-
 package/libev/libev.mk                               | 2 +-
 package/libite/libite.mk                             | 2 +-
 package/libjson/libjson.mk                           | 2 +-
 package/liblogging/liblogging.mk                     | 2 +-
 package/libnet/libnet.mk                             | 2 +-
 package/libopenh264/libopenh264.mk                   | 2 +-
 package/libsamplerate/libsamplerate.mk               | 2 +-
 package/libscrypt/libscrypt.mk                       | 2 +-
 package/libucl/libucl.mk                             | 2 +-
 package/libuecc/libuecc.mk                           | 2 +-
 package/libuv/libuv.mk                               | 2 +-
 package/linenoise/linenoise.mk                       | 2 +-
 package/lz4/lz4.mk                                   | 2 +-
 package/mpdecimal/mpdecimal.mk                       | 2 +-
 package/nasm/nasm.mk                                 | 2 +-
 package/nginx-dav-ext/nginx-dav-ext.mk               | 2 +-
 package/nginx/nginx.mk                               | 2 +-
 package/openjpeg/openjpeg.mk                         | 2 +-
 package/openntpd/openntpd.mk                         | 2 +-
 package/openpowerlink/openpowerlink.mk               | 2 +-
 package/openssh/openssh.mk                           | 2 +-
 package/opus-tools/opus-tools.mk                     | 2 +-
 package/orc/orc.mk                                   | 2 +-
 package/php-gnupg/php-gnupg.mk                       | 2 +-
 package/protobuf-c/protobuf-c.mk                     | 2 +-
 package/ptpd2/ptpd2.mk                               | 2 +-
 package/python-docutils/python-docutils.mk           | 2 +-
 package/python-flup/python-flup.mk                   | 2 +-
 package/python-futures/python-futures.mk             | 2 +-
 package/python-pyasn-modules/python-pyasn-modules.mk | 2 +-
 package/python-pyasn/python-pyasn.mk                 | 2 +-
 package/python-pygments/python-pygments.mk           | 2 +-
 package/python-xlsxwriter/python-xlsxwriter.mk       | 2 +-
 package/qemu/qemu.mk                                 | 2 +-
 package/qlibc/qlibc.mk                               | 2 +-
 package/qt5/qt5webkit/qt5webkit.mk                   | 2 +-
 package/rabbitmq-server/rabbitmq-server.mk           | 2 +-
 package/ruby/ruby.mk                                 | 2 +-
 package/scrypt/scrypt.mk                             | 2 +-
 package/slirp/slirp.mk                               | 2 +-
 package/sphinxbase/sphinxbase.mk                     | 2 +-
 package/swig/swig.mk                                 | 2 +-
 package/terminology/terminology.mk                   | 2 +-
 package/thttpd/thttpd.mk                             | 2 +-
 package/udpcast/udpcast.mk                           | 2 +-
 package/usbmount/usbmount.mk                         | 2 +-
 package/ustr/ustr.mk                                 | 2 +-
 package/valijson/valijson.mk                         | 2 +-
 package/webkitgtk/webkitgtk.mk                       | 2 +-
 package/x11r7/xfont_font-util/xfont_font-util.mk     | 2 +-
 package/xxhash/xxhash.mk                             | 2 +-
 package/yasm/yasm.mk                                 | 2 +-
 79 files changed, 79 insertions(+), 79 deletions(-)

diff --git a/boot/ts4800-mbrboot/ts4800-mbrboot.mk b/boot/ts4800-mbrboot/ts4800-mbrboot.mk
index 9862092..3dde6c6 100644
--- a/boot/ts4800-mbrboot/ts4800-mbrboot.mk
+++ b/boot/ts4800-mbrboot/ts4800-mbrboot.mk
@@ -6,7 +6,7 @@
 
 TS4800_MBRBOOT_VERSION = cf8f7072ed5a4a4e48fcb9841b2e31e519ec5dca
 TS4800_MBRBOOT_SITE = $(call github,embeddedarm,ts4800-mbrboot,$(TS4800_MBRBOOT_VERSION))
-TS4800_MBRBOOT_LICENSE = BSD-2c
+TS4800_MBRBOOT_LICENSE = BSD-2-Clause
 TS4800_MBRBOOT_LICENSE_FILES = LICENSE
 TS4800_MBRBOOT_INSTALL_IMAGES = YES
 
diff --git a/package/atf/atf.mk b/package/atf/atf.mk
index 8eef1a8..9630cf1 100644
--- a/package/atf/atf.mk
+++ b/package/atf/atf.mk
@@ -7,7 +7,7 @@
 ATF_VERSION = 0.21
 ATF_SITE = https://github.com/jmmv/atf/releases/download/atf-$(ATF_VERSION)
 ATF_INSTALL_STAGING = YES
-ATF_LICENSE = BSD-2c, BSD-3-Clause
+ATF_LICENSE = BSD-2-Clause, BSD-3-Clause
 ATF_LICENSE_FILES = COPYING
 # Ships a beta libtool version hence our patch doesn't apply.
 ATF_AUTORECONF = YES
diff --git a/package/b43-fwcutter/b43-fwcutter.mk b/package/b43-fwcutter/b43-fwcutter.mk
index d264b64..2d024f6 100644
--- a/package/b43-fwcutter/b43-fwcutter.mk
+++ b/package/b43-fwcutter/b43-fwcutter.mk
@@ -7,7 +7,7 @@
 B43_FWCUTTER_VERSION = 015
 B43_FWCUTTER_SITE = http://bues.ch/b43/fwcutter
 B43_FWCUTTER_SOURCE = b43-fwcutter-$(B43_FWCUTTER_VERSION).tar.bz2
-B43_FWCUTTER_LICENSE = BSD-2c
+B43_FWCUTTER_LICENSE = BSD-2-Clause
 B43_FWCUTTER_LICENSE_FILES = COPYING
 
 define HOST_B43_FWCUTTER_BUILD_CMDS
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index 32889a6..84dab70 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -8,7 +8,7 @@ BMON_VERSION = 4.0
 BMON_SITE = https://github.com/tgraf/bmon/releases/download/v$(BMON_VERSION)
 BMON_DEPENDENCIES = host-pkgconf libconfuse libnl ncurses
 BMON_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-BMON_LICENSE = BSD-2c, MIT
+BMON_LICENSE = BSD-2-Clause, MIT
 BMON_LICENSE_FILES = LICENSE.BSD LICENSE.MIT
 
 # link dynamically unless explicitly requested otherwise
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 94f1edd..7694b8d 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -7,7 +7,7 @@
 BOTAN_VERSION = 1.10.13
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tgz
 BOTAN_SITE = http://botan.randombit.net/releases
-BOTAN_LICENSE = BSD-2c
+BOTAN_LICENSE = BSD-2-Clause
 BOTAN_LICENSE_FILES = doc/license.txt
 
 BOTAN_INSTALL_STAGING = YES
diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
index eb903e0..9030284 100644
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -7,7 +7,7 @@
 BSDIFF_VERSION = 4.3
 BSDIFF_SITE = http://www.daemonology.net/bsdiff
 BSDIFF_DEPENDENCIES = bzip2
-BSDIFF_LICENSE = BSD-2c
+BSDIFF_LICENSE = BSD-2-Clause
 BSDIFF_LICENSE_FILES = bsdiff.c
 
 define BSDIFF_BUILD_CMDS
diff --git a/package/celt051/celt051.mk b/package/celt051/celt051.mk
index 9e25781..6074c49 100644
--- a/package/celt051/celt051.mk
+++ b/package/celt051/celt051.mk
@@ -9,7 +9,7 @@
 CELT051_VERSION = 0.5.1.3
 CELT051_SOURCE = celt-$(CELT051_VERSION).tar.gz
 CELT051_SITE = http://downloads.xiph.org/releases/celt
-CELT051_LICENSE = BSD-2c
+CELT051_LICENSE = BSD-2-Clause
 CELT051_LICENSE_FILES = COPYING
 CELT051_INSTALL_STAGING = YES
 CELT051_DEPENDENCIES = libogg
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 2d446fb..1d29cda 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -8,7 +8,7 @@ DHCPCD_VERSION = 6.11.5
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
-DHCPCD_LICENSE = BSD-2c
+DHCPCD_LICENSE = BSD-2-Clause
 DHCPCD_LICENSE_FILES = dhcpcd.c
 
 ifeq ($(BR2_STATIC_LIBS),y)
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index 3584f4f..96f2319 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -7,7 +7,7 @@
 DHCPDUMP_VERSION = 1.8
 DHCPDUMP_SITE = http://www.mavetju.org/download
 DHCPDUMP_DEPENDENCIES = libpcap
-DHCPDUMP_LICENSE = BSD-2c
+DHCPDUMP_LICENSE = BSD-2-Clause
 DHCPDUMP_LICENSE_FILES = LICENSE
 
 DHCPDUMP_LIBS = -lpcap
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index df2094e..3540ec8 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -6,7 +6,7 @@
 
 DOS2UNIX_VERSION = 7.3.4
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
-DOS2UNIX_LICENSE = BSD-2c
+DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
 DOS2UNIX_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 743d524..a4e2272 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -7,7 +7,7 @@
 DROPBEAR_VERSION = 2016.74
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
-DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
+DROPBEAR_LICENSE = MIT, BSD-2-Clause-like, BSD-2-Clause
 DROPBEAR_LICENSE_FILES = LICENSE
 DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
 DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 8643849..5bb2ca2 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -7,7 +7,7 @@
 DTC_VERSION = 1.4.1
 DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
-DTC_LICENSE = GPL-2.0+ or BSD-2c (library)
+DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
 DTC_LICENSE_FILES = README.license GPL
 DTC_INSTALL_STAGING = YES
 DTC_DEPENDENCIES = host-bison host-flex
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index a3443ad..3644000 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -7,7 +7,7 @@
 EFL_VERSION = 1.18.4
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
-EFL_LICENSE = BSD-2c, LGPL-2.1+, GPL-2.0+
+EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+
 EFL_LICENSE_FILES = \
 	COMPLIANCE \
 	COPYING \
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 0899890..7bfc25b 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -7,7 +7,7 @@
 ENLIGHTENMENT_VERSION = 0.21.7
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
-ENLIGHTENMENT_LICENSE = BSD-2c
+ENLIGHTENMENT_LICENSE = BSD-2-Clause
 ENLIGHTENMENT_LICENSE_FILES = COPYING
 
 ENLIGHTENMENT_DEPENDENCIES = \
diff --git a/package/expedite/expedite.mk b/package/expedite/expedite.mk
index 0b2901d..c18d32b 100644
--- a/package/expedite/expedite.mk
+++ b/package/expedite/expedite.mk
@@ -7,7 +7,7 @@
 EXPEDITE_VERSION = ffa005ea3de26b4219f32c285cb1665bb1366163
 EXPEDITE_SITE = http://git.enlightenment.org/tools/expedite.git
 EXPEDITE_SITE_METHOD = git
-EXPEDITE_LICENSE = BSD-2c
+EXPEDITE_LICENSE = BSD-2-Clause
 EXPEDITE_LICENSE_FILES = COPYING
 
 EXPEDITE_DEPENDENCIES = host-efl host-pkgconf efl
diff --git a/package/fastd/fastd.mk b/package/fastd/fastd.mk
index 0e510db..e67acdb 100644
--- a/package/fastd/fastd.mk
+++ b/package/fastd/fastd.mk
@@ -7,7 +7,7 @@
 FASTD_VERSION = 18
 FASTD_SITE = https://projects.universe-factory.net/attachments/download/86
 FASTD_SOURCE = fastd-$(FASTD_VERSION).tar.xz
-FASTD_LICENSE = BSD-2c
+FASTD_LICENSE = BSD-2-Clause
 FASTD_LICENSE_FILES = COPYRIGHT
 FASTD_CONF_OPTS = -DENABLE_LIBSODIUM=ON
 FASTD_DEPENDENCIES = host-bison host-pkgconf libuecc libsodium libcap
diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
index 65df146..5d2d600 100644
--- a/package/ficl/ficl.mk
+++ b/package/ficl/ficl.mk
@@ -7,7 +7,7 @@
 FICL_VERSION_MAJOR = 4.1
 FICL_VERSION = $(FICL_VERSION_MAJOR).0
 FICL_SITE = http://downloads.sourceforge.net/project/ficl/ficl-all/ficl$(FICL_VERSION_MAJOR)
-FICL_LICENSE = BSD-2c
+FICL_LICENSE = BSD-2-Clause
 FICL_LICENSE_FILES = ReadMe.txt
 FICL_INSTALL_STAGING = YES
 
diff --git a/package/file/file.mk b/package/file/file.mk
index 48c1e9f..00fdcce 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -10,7 +10,7 @@ FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
 FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 FILE_INSTALL_STAGING = YES
-FILE_LICENSE = BSD-2c, BSD-4c (one file), BSD-3-Clause (one file)
+FILE_LICENSE = BSD-2-Clause, BSD-4c (one file), BSD-3-Clause (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
 
 $(eval $(autotools-package))
diff --git a/package/freeradius-client/freeradius-client.mk b/package/freeradius-client/freeradius-client.mk
index 0ed7fbe..981ed16 100644
--- a/package/freeradius-client/freeradius-client.mk
+++ b/package/freeradius-client/freeradius-client.mk
@@ -6,7 +6,7 @@
 
 FREERADIUS_CLIENT_VERSION = 1.1.7
 FREERADIUS_CLIENT_SITE = ftp://ftp.freeradius.org/pub/freeradius
-FREERADIUS_CLIENT_LICENSE = BSD-2c
+FREERADIUS_CLIENT_LICENSE = BSD-2-Clause
 FREERADIUS_CLIENT_LICENSE_FILES = COPYRIGHT
 FREERADIUS_CLIENT_INSTALL_STAGING = YES
 
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index aaf68b3..b07cd21 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -7,7 +7,7 @@
 IPERF3_VERSION = 3.1.5
 IPERF3_SITE = http://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
-IPERF3_LICENSE = BSD-3-Clause, BSD-2c, MIT
+IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
 IPERF3_LICENSE_FILES = LICENSE
 
 IPERF3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index f1c9ffe..975d319 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -7,7 +7,7 @@
 JEMALLOC_VERSION = 4.2.1
 JEMALLOC_SOURCE = jemalloc-$(JEMALLOC_VERSION).tar.bz2
 JEMALLOC_SITE = http://www.canonware.com/download/jemalloc
-JEMALLOC_LICENSE = BSD-2c
+JEMALLOC_LICENSE = BSD-2-Clause
 JEMALLOC_LICENSE_FILES = COPYING
 JEMALLOC_INSTALL_STAGING = YES
 
diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 1c1a6b8..78517c4 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -8,7 +8,7 @@ JIMTCL_VERSION = 0.75
 JIMTCL_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/j/jimtcl
 JIMTCL_SOURCE = jimtcl_$(JIMTCL_VERSION).orig.tar.xz
 JIMTCL_INSTALL_STAGING = YES
-JIMTCL_LICENSE = BSD-2c
+JIMTCL_LICENSE = BSD-2-Clause
 JIMTCL_LICENSE_FILES = LICENSE
 
 JIMTCL_HEADERS_TO_INSTALL = \
diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index aa8274d..11680e1 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -6,7 +6,7 @@
 
 LEPTONICA_VERSION = 1.74.1
 LEPTONICA_SITE = http://www.leptonica.org/source
-LEPTONICA_LICENSE = BSD-2c
+LEPTONICA_LICENSE = BSD-2-Clause
 LEPTONICA_LICENSE_FILES = leptonica-license.txt
 LEPTONICA_INSTALL_STAGING = YES
 
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 0ad9489..9956b63 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -7,7 +7,7 @@
 LIBARCHIVE_VERSION = 3.2.1
 LIBARCHIVE_SITE = http://www.libarchive.org/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-LIBARCHIVE_LICENSE = BSD-2c, BSD-3-Clause
+LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause
 LIBARCHIVE_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index 03aabec..fb5d2bf 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -7,7 +7,7 @@
 LIBCOAP_VERSION = c909bf802034b7762a2182848304b2530e58444f
 LIBCOAP_SITE = $(call github,obgm,libcoap,$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
-LIBCOAP_LICENSE = GPL-2.0+ or BSD-2c
+LIBCOAP_LICENSE = GPL-2.0+ or BSD-2-Clause
 LIBCOAP_LICENSE_FILES = COPYING LICENSE.GPL LICENSE.BSD
 LIBCOAP_CONF_OPTS = --disable-examples
 LIBCOAP_AUTORECONF = YES
diff --git a/package/libcue/libcue.mk b/package/libcue/libcue.mk
index e6ee7fe..3aa3b48 100644
--- a/package/libcue/libcue.mk
+++ b/package/libcue/libcue.mk
@@ -6,7 +6,7 @@
 
 LIBCUE_VERSION = v1.4.0
 LIBCUE_SITE = $(call github,lipnitsk,libcue,$(LIBCUE_VERSION))
-LIBCUE_LICENSE = GPL-2.0, BSD-2c (rem.c)
+LIBCUE_LICENSE = GPL-2.0, BSD-2-Clause (rem.c)
 LIBCUE_LICENSE_FILES = COPYING
 LIBCUE_DEPENDENCIES = host-bison host-flex flex
 LIBCUE_INSTALL_STAGING = YES
diff --git a/package/libdmtx/libdmtx.mk b/package/libdmtx/libdmtx.mk
index 146534e..f718b13 100644
--- a/package/libdmtx/libdmtx.mk
+++ b/package/libdmtx/libdmtx.mk
@@ -6,7 +6,7 @@
 
 LIBDMTX_VERSION = 0.7.4
 LIBDMTX_SITE = http://downloads.sourceforge.net/project/libdmtx/libdmtx/$(LIBDMTX_VERSION)
-LIBDMTX_LICENSE = BSD-2c or Special Permission
+LIBDMTX_LICENSE = BSD-2-Clause or Special Permission
 LIBDMTX_LICENSE_FILES = LICENSE
 LIBDMTX_INSTALL_STAGING = YES
 
diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 390cc83..2e3ed45 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -7,7 +7,7 @@
 LIBEV_VERSION = 4.22
 LIBEV_SITE = http://dist.schmorp.de/libev
 LIBEV_INSTALL_STAGING = YES
-LIBEV_LICENSE = BSD-2c or GPL-2.0+
+LIBEV_LICENSE = BSD-2-Clause or GPL-2.0+
 LIBEV_LICENSE_FILES = LICENSE
 
 # The 'compatibility' event.h header conflicts with libevent
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index b56c430..56b0d5c 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -6,7 +6,7 @@
 
 LIBITE_VERSION = v1.8.2
 LIBITE_SITE = $(call github,troglobit,libite,$(LIBITE_VERSION))
-LIBITE_LICENSE = MIT, X11, ISC, BSD-2c
+LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
 LIBITE_LICENSE_FILES = LICENSE chomp.c pidfile.c
 LIBITE_INSTALL_STAGING = YES
 LIBITE_AUTORECONF = YES
diff --git a/package/libjson/libjson.mk b/package/libjson/libjson.mk
index c73a69f..74224ba 100644
--- a/package/libjson/libjson.mk
+++ b/package/libjson/libjson.mk
@@ -8,7 +8,7 @@ LIBJSON_VERSION = 7.6.1
 LIBJSON_SITE = http://downloads.sourceforge.net/project/libjson
 LIBJSON_SOURCE = libjson_$(LIBJSON_VERSION).zip
 LIBJSON_INSTALL_STAGING = YES
-LIBJSON_LICENSE = BSD-2c
+LIBJSON_LICENSE = BSD-2-Clause
 LIBJSON_LICENSE_FILES = License.txt
 
 LIBJSON_CXXFLAGS = $(TARGET_CFLAGS) -DNDEBUG
diff --git a/package/liblogging/liblogging.mk b/package/liblogging/liblogging.mk
index 9ef2e28..ec57a0a 100644
--- a/package/liblogging/liblogging.mk
+++ b/package/liblogging/liblogging.mk
@@ -6,7 +6,7 @@
 
 LIBLOGGING_VERSION = 1.0.5
 LIBLOGGING_SITE = http://download.rsyslog.com/liblogging
-LIBLOGGING_LICENSE = BSD-2c
+LIBLOGGING_LICENSE = BSD-2-Clause
 LIBLOGGING_LICENSE_FILES = COPYING
 LIBLOGGING_INSTALL_STAGING = YES
 LIBLOGGING_CONF_OPTS = --enable-cached-man-pages
diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
index d5d7b9f..9661068 100644
--- a/package/libnet/libnet.mk
+++ b/package/libnet/libnet.mk
@@ -9,7 +9,7 @@ LIBNET_SITE = http://sourceforge.net/projects/libnet-dev/files
 LIBNET_INSTALL_STAGING = YES
 # PF_PACKET is always available on Linux
 LIBNET_CONF_OPTS = libnet_cv_have_packet_socket=yes
-LIBNET_LICENSE = BSD-2c, BSD-3-Clause
+LIBNET_LICENSE = BSD-2-Clause, BSD-3-Clause
 LIBNET_LICENSE_FILES = doc/COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index 40bbf80..feead5b 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -6,7 +6,7 @@
 
 LIBOPENH264_VERSION = v1.6.0
 LIBOPENH264_SITE = $(call github,cisco,openh264,$(LIBOPENH264_VERSION))
-LIBOPENH264_LICENSE = BSD-2c
+LIBOPENH264_LICENSE = BSD-2-Clause
 LIBOPENH264_LICENSE_FILES = LICENSE
 LIBOPENH264_INSTALL_STAGING = YES
 
diff --git a/package/libsamplerate/libsamplerate.mk b/package/libsamplerate/libsamplerate.mk
index 802b5b1..76e93f9 100644
--- a/package/libsamplerate/libsamplerate.mk
+++ b/package/libsamplerate/libsamplerate.mk
@@ -9,7 +9,7 @@ LIBSAMPLERATE_SITE = http://www.mega-nerd.com/SRC
 LIBSAMPLERATE_INSTALL_STAGING = YES
 LIBSAMPLERATE_DEPENDENCIES = host-pkgconf
 LIBSAMPLERATE_CONF_OPTS = --disable-fftw --program-transform-name=''
-LIBSAMPLERATE_LICENSE = BSD-2c
+LIBSAMPLERATE_LICENSE = BSD-2-Clause
 LIBSAMPLERATE_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
diff --git a/package/libscrypt/libscrypt.mk b/package/libscrypt/libscrypt.mk
index a0dcce0..6086ea9 100644
--- a/package/libscrypt/libscrypt.mk
+++ b/package/libscrypt/libscrypt.mk
@@ -6,7 +6,7 @@
 
 LIBSCRYPT_VERSION = v1.21
 LIBSCRYPT_SITE = $(call github,technion,libscrypt,$(LIBSCRYPT_VERSION))
-LIBSCRYPT_LICENSE = BSD-2c
+LIBSCRYPT_LICENSE = BSD-2-Clause
 LIBSCRYPT_LICENSE_FILES = LICENSE
 LIBSCRYPT_INSTALL_STAGING = YES
 
diff --git a/package/libucl/libucl.mk b/package/libucl/libucl.mk
index 3530bbe..39a7ed3 100644
--- a/package/libucl/libucl.mk
+++ b/package/libucl/libucl.mk
@@ -8,7 +8,7 @@ LIBUCL_VERSION = 0.7.3
 LIBUCL_SITE = $(call github,vstakhov,libucl,$(LIBUCL_VERSION))
 LIBUCL_INSTALL_STAGING = YES
 LIBUCL_AUTORECONF = YES
-LIBUCL_LICENSE = BSD-2c
+LIBUCL_LICENSE = BSD-2-Clause
 LIBUCL_LICENSE_FILES = COPYING
 LIBUCL_DEPENDENCIES = host-pkgconf
 
diff --git a/package/libuecc/libuecc.mk b/package/libuecc/libuecc.mk
index 87ca2e4..aad26e5 100644
--- a/package/libuecc/libuecc.mk
+++ b/package/libuecc/libuecc.mk
@@ -7,7 +7,7 @@
 LIBUECC_VERSION = 7
 LIBUECC_SITE = https://projects.universe-factory.net/attachments/download/85
 LIBUECC_SOURCE = libuecc-$(LIBUECC_VERSION).tar.xz
-LIBUECC_LICENSE = BSD-2c
+LIBUECC_LICENSE = BSD-2-Clause
 LIBUECC_LICENSE_FILES = COPYRIGHT
 LIBUECC_INSTALL_STAGING = YES
 
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index eed81fe..33525ff 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -9,7 +9,7 @@ LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
 LIBUV_AUTORECONF = YES
-LIBUV_LICENSE = BSD-2c, BSD-3-Clause, ISC, MIT
+LIBUV_LICENSE = BSD-2-Clause, BSD-3-Clause, ISC, MIT
 LIBUV_LICENSE_FILES = LICENSE
 
 # Upstream needs tests to be run sequentially. This is the default in
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 64a7b7c..f51e287 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -6,7 +6,7 @@
 
 LINENOISE_VERSION = 1.0
 LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
-LINENOISE_LICENSE = BSD-2c
+LINENOISE_LICENSE = BSD-2-Clause
 LINENOISE_LICENSE_FILES = LICENSE
 LINENOISE_INSTALL_STAGING = YES
 # Static library only, nothing to install on target
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 8316a88..d350d4c 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -7,7 +7,7 @@
 LZ4_VERSION = v1.7.5
 LZ4_SITE = $(call github,lz4,lz4,$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
-LZ4_LICENSE = BSD-2c (library), GPL-2.0+ (programs)
+LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
 LZ4_LICENSE_FILES = lib/LICENSE programs/COPYING
 
 ifeq ($(BR2_STATIC_LIBS),y)
diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
index 9b13def..5e0929e 100644
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -7,7 +7,7 @@
 MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases
 MPDECIMAL_VERSION = 2.4.1
 MPDECIMAL_INSTALL_STAGING = YES
-MPDECIMAL_LICENSE = BSD-2c
+MPDECIMAL_LICENSE = BSD-2-Clause
 MPDECIMAL_LICENSE_FILES = LICENSE.txt
 MPDECIMAL_CONF_OPTS = LD="$(TARGET_CC)"
 MPDECIMAL_AUTORECONF = YES
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index f5d9ea0..8afd320 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -7,7 +7,7 @@
 NASM_VERSION = 2.12.02
 NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
-NASM_LICENSE = BSD-2c
+NASM_LICENSE = BSD-2-Clause
 NASM_LICENSE_FILES = LICENSE
 
 $(eval $(host-autotools-package))
diff --git a/package/nginx-dav-ext/nginx-dav-ext.mk b/package/nginx-dav-ext/nginx-dav-ext.mk
index 61e5bd0..1ba6e10 100644
--- a/package/nginx-dav-ext/nginx-dav-ext.mk
+++ b/package/nginx-dav-ext/nginx-dav-ext.mk
@@ -6,7 +6,7 @@
 
 NGINX_DAV_EXT_VERSION = v0.0.3
 NGINX_DAV_EXT_SITE = $(call github,arut,nginx-dav-ext-module,$(NGINX_DAV_EXT_VERSION))
-NGINX_DAV_EXT_LICENSE = BSD-2c
+NGINX_DAV_EXT_LICENSE = BSD-2-Clause
 NGINX_DAV_EXT_LICENSE_FILES = ngx_http_dav_ext_module.c
 NGINX_DAV_EXT_DEPENDENCIES = expat
 
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index f9b2cd1..88afc94 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -6,7 +6,7 @@
 
 NGINX_VERSION = 1.10.3
 NGINX_SITE = http://nginx.org/download
-NGINX_LICENSE = BSD-2c
+NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
 NGINX_DEPENDENCIES = host-pkgconf
 
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index ca22068..6f8b263 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -6,7 +6,7 @@
 
 OPENJPEG_VERSION = 2.1.2
 OPENJPEG_SITE = $(call github,uclouvain,openjpeg,v$(OPENJPEG_VERSION))
-OPENJPEG_LICENSE = BSD-2c
+OPENJPEG_LICENSE = BSD-2-Clause
 OPENJPEG_LICENSE_FILES = LICENSE
 OPENJPEG_INSTALL_STAGING = YES
 
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 648427a..021a393 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -6,7 +6,7 @@
 
 OPENNTPD_VERSION = 6.0p1
 OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
-OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3-Clause
+OPENNTPD_LICENSE = MIT-like, BSD-2-Clause, BSD-3-Clause
 OPENNTPD_LICENSE_FILES = COPYING
 # Ships a beta libtool version hence our patch doesn't apply.
 OPENNTPD_AUTORECONF = YES
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index a3fbd18..06846ee 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -7,7 +7,7 @@
 OPENPOWERLINK_VERSION = V2.5.0
 OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_VERSION)
 OPENPOWERLINK_SOURCE = openPOWERLINK_$(OPENPOWERLINK_VERSION).tar.gz
-OPENPOWERLINK_LICENSE = BSD-2c, GPL-2.0
+OPENPOWERLINK_LICENSE = BSD-2-Clause, GPL-2.0
 OPENPOWERLINK_LICENSE_FILES = license.md
 
 OPENPOWERLINK_INSTALL_STAGING = YES
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 362bbb1..f971e99 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -6,7 +6,7 @@
 
 OPENSSH_VERSION = 7.5p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
-OPENSSH_LICENSE = BSD-3-Clause, BSD-2c, Public Domain
+OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPTS = \
diff --git a/package/opus-tools/opus-tools.mk b/package/opus-tools/opus-tools.mk
index de1b439..9b3953c 100644
--- a/package/opus-tools/opus-tools.mk
+++ b/package/opus-tools/opus-tools.mk
@@ -6,7 +6,7 @@
 
 OPUS_TOOLS_VERSION = 0.1.9
 OPUS_TOOLS_SITE = http://downloads.xiph.org/releases/opus
-OPUS_TOOLS_LICENSE = BSD-2c
+OPUS_TOOLS_LICENSE = BSD-2-Clause
 OPUS_TOOLS_LICENSE_FILES = COPYING
 OPUS_TOOLS_CONF_OPTS = --disable-oggtest --disable-opustest
 OPUS_TOOLS_DEPENDENCIES = opus libogg host-pkgconf
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 5c8d4f7..8e2b39a 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -7,7 +7,7 @@
 ORC_VERSION = 0.4.26
 ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
-ORC_LICENSE = BSD-2c, BSD-3-Clause
+ORC_LICENSE = BSD-2-Clause, BSD-3-Clause
 ORC_LICENSE_FILES = COPYING
 ORC_INSTALL_STAGING = YES
 ORC_DEPENDENCIES = host-orc
diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
index c1c6680..e595cd3 100644
--- a/package/php-gnupg/php-gnupg.mk
+++ b/package/php-gnupg/php-gnupg.mk
@@ -10,7 +10,7 @@ PHP_GNUPG_SITE = $(call github,Sean-Der,pecl-encryption-gnupg,$(PHP_GNUPG_VERSIO
 PHP_GNUPG_DEPENDENCIES = php libgpgme host-autoconf host-pkgconf
 PHP_GNUPG_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-gnupg=$(STAGING_DIR)/usr/include --with-gpg=/usr/bin/gpg
-PHP_GNUPG_LICENSE = BSD-2c
+PHP_GNUPG_LICENSE = BSD-2-Clause
 PHP_GNUPG_LICENSE_FILES = LICENSE
 
 define PHP_GNUPG_PHPIZE
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index ee4500e..391b310 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -11,7 +11,7 @@ HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
 PROTOBUF_C_MAKE = $(MAKE1)
 PROTOBUF_C_CONF_OPTS = --disable-protoc
 PROTOBUF_C_INSTALL_STAGING = YES
-PROTOBUF_C_LICENSE = BSD-2c
+PROTOBUF_C_LICENSE = BSD-2-Clause
 PROTOBUF_C_LICENSE_FILES = LICENSE
 PROTOBUF_C_AUTORECONF = YES
 HOST_PROTOBUF_C_AUTORECONF = YES
diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
index d53b135..d95d415 100644
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -10,7 +10,7 @@ PTPD2_DEPENDENCIES = libpcap
 PTPD2_CONF_OPTS = --with-pcap-config=$(STAGING_DIR)/usr/bin/pcap-config
 # configure not shipped
 PTPD2_AUTORECONF = YES
-PTPD2_LICENSE = BSD-2c
+PTPD2_LICENSE = BSD-2-Clause
 PTPD2_LICENSE_FILES = COPYRIGHT
 
 ifeq ($(BR2_STATIC_LIBS),y)
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index 544165a..a42b34b 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -7,7 +7,7 @@
 PYTHON_DOCUTILS_VERSION = 0.13.1
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
 PYTHON_DOCUTILS_SITE = https://pypi.python.org/packages/05/25/7b5484aca5d46915493f1fd4ecb63c38c333bd32aa9ad6e19da8d08895ae
-PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2c, GPL-3.0 (emacs mode), other
+PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, GPL-3.0 (emacs mode), other
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.txt
 PYTHON_DOCUTILS_SETUP_TYPE = distutils
 
diff --git a/package/python-flup/python-flup.mk b/package/python-flup/python-flup.mk
index edcff2a..26d5938 100644
--- a/package/python-flup/python-flup.mk
+++ b/package/python-flup/python-flup.mk
@@ -8,7 +8,7 @@ PYTHON_FLUP_VERSION = 1.0.3.dev20161029
 PYTHON_FLUP_SOURCE = flup-$(PYTHON_FLUP_VERSION).tar.gz
 PYTHON_FLUP_SITE = https://pypi.python.org/packages/17/33/36768930a5ffe4f294ed3987c631bfd3fddb4f9e5e46bc8dc30fd731dbcd
 
-PYTHON_FLUP_LICENSE = BSD-2c, MIT
+PYTHON_FLUP_LICENSE = BSD-2-Clause, MIT
 
 PYTHON_FLUP_SETUP_TYPE = setuptools
 
diff --git a/package/python-futures/python-futures.mk b/package/python-futures/python-futures.mk
index 8a1afa3..fabfa6a 100644
--- a/package/python-futures/python-futures.mk
+++ b/package/python-futures/python-futures.mk
@@ -8,7 +8,7 @@ PYTHON_FUTURES_VERSION = 3.0.5
 PYTHON_FUTURES_SOURCE = futures-$(PYTHON_FUTURES_VERSION).tar.gz
 PYTHON_FUTURES_SITE = https://pypi.python.org/packages/55/db/97c1ca37edab586a1ae03d6892b6633d8eaa23b23ac40c7e5bbc55423c78
 PYTHON_FUTURES_SETUP_TYPE = setuptools
-PYTHON_FUTURES_LICENSE = BSD-2c
+PYTHON_FUTURES_LICENSE = BSD-2-Clause
 PYTHON_FUTURES_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
diff --git a/package/python-pyasn-modules/python-pyasn-modules.mk b/package/python-pyasn-modules/python-pyasn-modules.mk
index bb32227..4e8f9b9 100644
--- a/package/python-pyasn-modules/python-pyasn-modules.mk
+++ b/package/python-pyasn-modules/python-pyasn-modules.mk
@@ -7,7 +7,7 @@
 PYTHON_PYASN_MODULES_VERSION = 0.0.8
 PYTHON_PYASN_MODULES_SOURCE = pyasn1-modules-$(PYTHON_PYASN_MODULES_VERSION).tar.gz
 PYTHON_PYASN_MODULES_SITE = http://pypi.python.org/packages/source/p/pyasn1-modules
-PYTHON_PYASN_MODULES_LICENSE = BSD-2c
+PYTHON_PYASN_MODULES_LICENSE = BSD-2-Clause
 PYTHON_PYASN_MODULES_LICENSE_FILES = LICENSE.txt
 PYTHON_PYASN_MODULES_SETUP_TYPE = setuptools
 
diff --git a/package/python-pyasn/python-pyasn.mk b/package/python-pyasn/python-pyasn.mk
index 80d18cd..255341f 100644
--- a/package/python-pyasn/python-pyasn.mk
+++ b/package/python-pyasn/python-pyasn.mk
@@ -7,7 +7,7 @@
 PYTHON_PYASN_VERSION = 0.1.9
 PYTHON_PYASN_SOURCE = pyasn1-$(PYTHON_PYASN_VERSION).tar.gz
 PYTHON_PYASN_SITE = https://pypi.python.org/packages/source/p/pyasn1
-PYTHON_PYASN_LICENSE = BSD-2c
+PYTHON_PYASN_LICENSE = BSD-2-Clause
 PYTHON_PYASN_LICENSE_FILES = LICENSE.txt
 PYTHON_PYASN_SETUP_TYPE = distutils
 
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index 9a7b848..6e7eae6 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -7,7 +7,7 @@
 PYTHON_PYGMENTS_VERSION = 2.2.0
 PYTHON_PYGMENTS_SOURCE = Pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
 PYTHON_PYGMENTS_SITE = https://pypi.python.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a
-PYTHON_PYGMENTS_LICENSE = BSD-2c
+PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
 PYTHON_PYGMENTS_SETUP_TYPE = setuptools
 
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index 3a08dd4..2c86e5d 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -8,7 +8,7 @@ PYTHON_XLSXWRITER_VERSION = 0.9.6
 PYTHON_XLSXWRITER_SOURCE = XlsxWriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
 PYTHON_XLSXWRITER_SITE = https://pypi.python.org/packages/c9/e0/c2b2f57bf53c84af3d2a41a82af7025828cb2bc8a312848a6ab7d018de56
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
-PYTHON_XLSXWRITER_LICENSE = BSD-2c
+PYTHON_XLSXWRITER_LICENSE = BSD-2-Clause
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 649f060..2b6aafb 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -7,7 +7,7 @@
 QEMU_VERSION = 2.8.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
-QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2c, Others/BSD-1c
+QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
 QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #?NOTE: there is no top-level license file for non-(L)GPL licenses;
 #       the non-(L)GPL license texts are specified in the affected
diff --git a/package/qlibc/qlibc.mk b/package/qlibc/qlibc.mk
index a146fa3..55c7aa3 100644
--- a/package/qlibc/qlibc.mk
+++ b/package/qlibc/qlibc.mk
@@ -6,7 +6,7 @@
 
 QLIBC_VERSION = v2.4.1
 QLIBC_SITE = $(call github,wolkykim,qlibc,$(QLIBC_VERSION))
-QLIBC_LICENSE = BSD-2c
+QLIBC_LICENSE = BSD-2-Clause
 QLIBC_LICENSE_FILES = LICENSE
 
 # We're patching configure.ac
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 3849959..295d24d 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -15,7 +15,7 @@ QT5WEBKIT_INSTALL_STAGING = YES
 QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5WEBKIT_LICENSE = LGPL-2.1+, BSD-3-Clause, BSD-2c
+QT5WEBKIT_LICENSE = LGPL-2.1+, BSD-3-Clause, BSD-2-Clause
 # Source files contain references to LGPL_EXCEPTION.txt but it is not included
 # in the archive.
 QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21
diff --git a/package/rabbitmq-server/rabbitmq-server.mk b/package/rabbitmq-server/rabbitmq-server.mk
index d55a8cc..ac76939 100644
--- a/package/rabbitmq-server/rabbitmq-server.mk
+++ b/package/rabbitmq-server/rabbitmq-server.mk
@@ -7,7 +7,7 @@
 RABBITMQ_SERVER_VERSION = 3.6.6
 RABBITMQ_SERVER_SITE = http://www.rabbitmq.com/releases/rabbitmq-server/v$(RABBITMQ_SERVER_VERSION)
 RABBITMQ_SERVER_SOURCE = rabbitmq-server-$(RABBITMQ_SERVER_VERSION).tar.xz
-RABBITMQ_SERVER_LICENSE = MPLv1.1, Apache-2.0, BSD-2c, EPL, MIT, MPLv2.0
+RABBITMQ_SERVER_LICENSE = MPLv1.1, Apache-2.0, BSD-2-Clause, EPL, MIT, MPLv2.0
 RABBITMQ_SERVER_LICENSE_FILES = LICENSE-MPL-RabbitMQ \
 				LICENSE LICENSE-APACHE2-ExplorerCanvas \
 				LICENSE-APL2-Rebar LICENSE-APL2-Stomp-Websocket \
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 32ab79c..3302811 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -17,7 +17,7 @@ HOST_RUBY_CONF_OPTS = \
 	--disable-install-doc \
 	--with-out-ext=curses,openssl,readline \
 	--without-gmp
-RUBY_LICENSE = Ruby or BSD-2c, BSD-3-Clause, others
+RUBY_LICENSE = Ruby or BSD-2-Clause, BSD-3-Clause, others
 RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 
 RUBY_CFLAGS = $(TARGET_CFLAGS)
diff --git a/package/scrypt/scrypt.mk b/package/scrypt/scrypt.mk
index 7ffa7cc..ae5a64e 100644
--- a/package/scrypt/scrypt.mk
+++ b/package/scrypt/scrypt.mk
@@ -7,7 +7,7 @@
 SCRYPT_VERSION = 1.2.0
 SCRYPT_SOURCE = scrypt-$(SCRYPT_VERSION).tgz
 SCRYPT_SITE = http://www.tarsnap.com/scrypt
-SCRYPT_LICENSE = BSD-2c
+SCRYPT_LICENSE = BSD-2-Clause
 SCRYPT_LICENSE_FILES = main.c
 SCRYPT_DEPENDENCIES = openssl
 SCRYPT_INSTALL_STAGING = YES
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index be3e72d..dce21ff 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -9,7 +9,7 @@
 # of today)
 SLIRP_VERSION = 8c2da74c1385242f20799fec8c04f8378edc6550
 SLIRP_SITE = git://anongit.freedesktop.org/spice/slirp
-SLIRP_LICENSE = BSD-4c, BSD-2c
+SLIRP_LICENSE = BSD-4c, BSD-2-Clause
 # Note: The license file 'COPYRIGHT' is missing from the sources,
 # although some files refer to it.
 SLIRP_INSTALL_STAGING = YES
diff --git a/package/sphinxbase/sphinxbase.mk b/package/sphinxbase/sphinxbase.mk
index 5c87c89..86f9089 100644
--- a/package/sphinxbase/sphinxbase.mk
+++ b/package/sphinxbase/sphinxbase.mk
@@ -6,7 +6,7 @@
 
 SPHINXBASE_VERSION = 5prealpha
 SPHINXBASE_SITE = http://downloads.sourceforge.net/project/cmusphinx/sphinxbase/5prealpha
-SPHINXBASE_LICENSE = BSD-2c
+SPHINXBASE_LICENSE = BSD-2-Clause
 # Note http://sourceforge.net/p/cmusphinx/bugs/441/ "LICENSE file missing in"
 # 5prealpha tarballs". The license is contained in the copyright notice at the
 # top of each source file. For example:
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index bf2b19d..740b597 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -12,7 +12,7 @@ HOST_SWIG_CONF_OPTS = \
 	--without-pcre \
 	--disable-ccache \
 	--without-octave
-SWIG_LICENSE = GPL-3.0+, BSD-2c, BSD-3-Clause
+SWIG_LICENSE = GPL-3.0+, BSD-2-Clause, BSD-3-Clause
 SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
 
 # CMake looks first at swig3.0, then swig2.0 and then swig. However,
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index d7e9827..a62a8e8 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -7,7 +7,7 @@
 TERMINOLOGY_VERSION = 1.0.0
 TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
 TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
-TERMINOLOGY_LICENSE = BSD-2c
+TERMINOLOGY_LICENSE = BSD-2-Clause
 TERMINOLOGY_LICENSE_FILES = COPYING
 
 TERMINOLOGY_DEPENDENCIES = efl host-pkgconf
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index 5b4b0c4..f1bee01 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -8,7 +8,7 @@ THTTPD_VERSION = 2.25b
 THTTPD_SOURCE = thttpd_$(THTTPD_VERSION).orig.tar.gz
 THTTPD_PATCH = thttpd_$(THTTPD_VERSION)-11.diff.gz
 THTTPD_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/t/thttpd
-THTTPD_LICENSE = BSD-2c
+THTTPD_LICENSE = BSD-2-Clause
 THTTPD_LICENSE_FILES = thttpd.c
 
 ifneq ($(THTTPD_PATCH),)
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index cb81781..e9116d2 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -7,7 +7,7 @@
 UDPCAST_VERSION = 20120424
 UDPCAST_SITE = http://www.udpcast.linux.lu/download
 UDPCAST_DEPENDENCIES = host-m4
-UDPCAST_LICENSE = BSD-2c, GPL-2.0+
+UDPCAST_LICENSE = BSD-2-Clause, GPL-2.0+
 UDPCAST_LICENSE_FILES = COPYING
 
 define UDPCAST_REMOVE_UDP_SENDER
diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
index f69e1f6..9007175 100644
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -8,7 +8,7 @@ USBMOUNT_VERSION = 0.0.22
 USBMOUNT_SOURCE = usbmount_$(USBMOUNT_VERSION).tar.gz
 USBMOUNT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/u/usbmount
 USBMOUNT_DEPENDENCIES = udev lockfile-progs
-USBMOUNT_LICENSE = BSD-2c
+USBMOUNT_LICENSE = BSD-2-Clause
 USBMOUNT_LICENSE_FILES = debian/copyright
 
 define USBMOUNT_INSTALL_TARGET_CMDS
diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
index 0051b89..6fca334 100644
--- a/package/ustr/ustr.mk
+++ b/package/ustr/ustr.mk
@@ -9,7 +9,7 @@
 USTR_VERSION = 1.0.4
 USTR_SOURCE = ustr-$(USTR_VERSION).tar.bz2
 USTR_SITE = http://www.and.org/ustr/$(USTR_VERSION)
-USTR_LICENSE = BSD-2c, MIT, LGPL-2.0+
+USTR_LICENSE = BSD-2-Clause, MIT, LGPL-2.0+
 USTR_LICENSE_FILES = LICENSE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
 USTR_AUTORECONF = YES
 USTR_PATCH = \
diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index e0813b3..71bd6a8 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -6,7 +6,7 @@
 
 VALIJSON_VERSION = 424b706f990a9eb96dfc19cc8e54f2cd6ce5e186
 VALIJSON_SITE = $(call github,tristanpenman,valijson,$(VALIJSON_VERSION))
-VALIJSON_LICENSE = BSD-2c
+VALIJSON_LICENSE = BSD-2-Clause
 VALIJSON_LICENSE_FILES = LICENSE
 VALIJSON_INSTALL_STAGING = YES
 VALIJSON_INSTALL_TARGET = NO
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 8e253b5..f37aaa6 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -8,7 +8,7 @@ WEBKITGTK_VERSION = 2.12.5
 WEBKITGTK_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-WEBKITGTK_LICENSE = LGPL-2.1+, BSD-2c
+WEBKITGTK_LICENSE = LGPL-2.1+, BSD-2-Clause
 WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2.1
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 3685377..89b138b 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -7,7 +7,7 @@
 XFONT_FONT_UTIL_VERSION = 1.3.1
 XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.bz2
 XFONT_FONT_UTIL_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_UTIL_LICENSE = MIT/BSD-2c
+XFONT_FONT_UTIL_LICENSE = MIT/BSD-2-Clause
 XFONT_FONT_UTIL_LICENSE_FILES = COPYING
 
 XFONT_FONT_UTIL_DEPENDENCIES = host-pkgconf
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index e38b2dc..7e04066 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -6,7 +6,7 @@
 
 XXHASH_VERSION = r40
 XXHASH_SITE = $(call github,Cyan4973,xxHash,$(XXHASH_VERSION))
-XXHASH_LICENSE = BSD-2c, GPL-2.0+
+XXHASH_LICENSE = BSD-2-Clause, GPL-2.0+
 XXHASH_LICENSE_FILES = LICENSE xxhsum.c
 
 define XXHASH_BUILD_CMDS
diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
index 23eeae0..b294bd3 100644
--- a/package/yasm/yasm.mk
+++ b/package/yasm/yasm.mk
@@ -6,7 +6,7 @@
 
 YASM_VERSION = 1.3.0
 YASM_SITE = http://www.tortall.net/projects/yasm/releases
-YASM_LICENSE = BSD-2c, BSD-3-Clause, Artistic, GPL-2.0, LGPL-2.0
+YASM_LICENSE = BSD-2-Clause, BSD-3-Clause, Artistic, GPL-2.0, LGPL-2.0
 YASM_LICENSE_FILES = COPYING BSD.txt Artistic.txt GNU_GPL-2.0 GNU_LGPL-2.0
 
 # This sed prevents it compiling 2 programs (vsyasm and ytasm)
-- 
2.6.2
