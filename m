From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:18:39 +0200
Subject: [Buildroot] [git commit] package: use SPDX short identifier for
	LGPLv3/LGPLv3+
Message-ID: <20170401134425.378D07FF41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89fbba72fa2121d7f3e1834e28f96335c3f2bf23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want to use SPDX identifier for license string as much as possible.
SPDX short identifier for LGPLv3/LGPLv3+ is LGPL-3.0/LGPL-3.0+.

This change is done using following command.
find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/LGPLv3(\+)?/LGPL-3.0\1/g'

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/4th/4th.mk                                                   | 2 +-
 package/adwaita-icon-theme/adwaita-icon-theme.mk                     | 2 +-
 package/cppcms/cppcms.mk                                             | 2 +-
 package/cxxtest/cxxtest.mk                                           | 2 +-
 package/ding-libs/ding-libs.mk                                       | 2 +-
 package/elfutils/elfutils.mk                                         | 2 +-
 package/evemu/evemu.mk                                               | 2 +-
 package/gdb/gdb.mk                                                   | 2 +-
 package/gmp/gmp.mk                                                   | 2 +-
 package/granite/granite.mk                                           | 2 +-
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk                           | 2 +-
 package/guile/guile.mk                                               | 2 +-
 package/kompexsqlite/kompexsqlite.mk                                 | 2 +-
 package/lensfun/lensfun.mk                                           | 2 +-
 package/libcgicc/libcgicc.mk                                         | 2 +-
 package/libfreefare/libfreefare.mk                                   | 2 +-
 package/libidn/libidn.mk                                             | 2 +-
 package/libksba/libksba.mk                                           | 2 +-
 package/libnfc/libnfc.mk                                             | 2 +-
 package/libnpth/libnpth.mk                                           | 2 +-
 package/libphidget/libphidget.mk                                     | 2 +-
 package/libserialport/libserialport.mk                               | 2 +-
 package/libunistring/libunistring.mk                                 | 2 +-
 package/libwebsock/libwebsock.mk                                     | 2 +-
 package/lightning/lightning.mk                                       | 2 +-
 package/mpc/mpc.mk                                                   | 2 +-
 package/mpfr/mpfr.mk                                                 | 2 +-
 package/netatalk/netatalk.mk                                         | 2 +-
 package/nettle/nettle.mk                                             | 2 +-
 package/openzwave/openzwave.mk                                       | 2 +-
 package/phidgetwebservice/phidgetwebservice.mk                       | 2 +-
 package/python-argh/python-argh.mk                                   | 2 +-
 package/python-can/python-can.mk                                     | 2 +-
 package/python-crc16/python-crc16.mk                                 | 2 +-
 package/python-cssutils/python-cssutils.mk                           | 2 +-
 package/python-dominate/python-dominate.mk                           | 2 +-
 package/python-iowait/python-iowait.mk                               | 2 +-
 package/python-json-schema-validator/python-json-schema-validator.mk | 2 +-
 package/python-pyzmq/python-pyzmq.mk                                 | 2 +-
 package/python-versiontools/python-versiontools.mk                   | 2 +-
 package/python-web2py/python-web2py.mk                               | 2 +-
 package/qt-webkit-kiosk/qt-webkit-kiosk.mk                           | 2 +-
 package/qt5/qt53d/qt53d.mk                                           | 2 +-
 package/qt5/qt5base/qt5base.mk                                       | 4 ++--
 package/qt5/qt5canvas3d/qt5canvas3d.mk                               | 2 +-
 package/qt5/qt5connectivity/qt5connectivity.mk                       | 4 ++--
 package/qt5/qt5declarative/qt5declarative.mk                         | 4 ++--
 package/qt5/qt5enginio/qt5enginio.mk                                 | 2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk               | 4 ++--
 package/qt5/qt5imageformats/qt5imageformats.mk                       | 4 ++--
 package/qt5/qt5location/qt5location.mk                               | 4 ++--
 package/qt5/qt5multimedia/qt5multimedia.mk                           | 4 ++--
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk                     | 2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk                   | 2 +-
 package/qt5/qt5script/qt5script.mk                                   | 2 +-
 package/qt5/qt5sensors/qt5sensors.mk                                 | 4 ++--
 package/qt5/qt5serialbus/qt5serialbus.mk                             | 2 +-
 package/qt5/qt5serialport/qt5serialport.mk                           | 4 ++--
 package/qt5/qt5svg/qt5svg.mk                                         | 4 ++--
 package/qt5/qt5tools/qt5tools.mk                                     | 4 ++--
 package/qt5/qt5webchannel/qt5webchannel.mk                           | 4 ++--
 package/qt5/qt5websockets/qt5websockets.mk                           | 4 ++--
 package/qt5/qt5x11extras/qt5x11extras.mk                             | 4 ++--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk                         | 4 ++--
 package/riemann-c-client/riemann-c-client.mk                         | 2 +-
 package/rsyslog/rsyslog.mk                                           | 2 +-
 package/urg/urg.mk                                                   | 2 +-
 package/wiringpi/wiringpi.mk                                         | 2 +-
 package/zeromq/zeromq.mk                                             | 2 +-
 69 files changed, 84 insertions(+), 84 deletions(-)

diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index 0226db1..d7daeb3 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -7,7 +7,7 @@
 4TH_VERSION = 3.62.4
 4TH_SOURCE = 4th-$(4TH_VERSION)-unix.tar.gz
 4TH_SITE = http://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
-4TH_LICENSE = GPL-3.0+, LGPLv3+
+4TH_LICENSE = GPL-3.0+, LGPL-3.0+
 # The COPYING file only contains the text of the LGPLv3, but the
 # source code really contains parts under GPLv3+.
 4TH_LICENSE_FILES = COPYING
diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.mk b/package/adwaita-icon-theme/adwaita-icon-theme.mk
index fdf66c8..8c9dec1 100644
--- a/package/adwaita-icon-theme/adwaita-icon-theme.mk
+++ b/package/adwaita-icon-theme/adwaita-icon-theme.mk
@@ -9,7 +9,7 @@ ADWAITA_ICON_THEME_VERSION = $(ADWAITA_ICON_THEME_VERSION_MAJOR).0
 ADWAITA_ICON_THEME_SITE = http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/$(ADWAITA_ICON_THEME_VERSION_MAJOR)
 ADWAITA_ICON_THEME_SOURCE = adwaita-icon-theme-$(ADWAITA_ICON_THEME_VERSION).tar.xz
 ADWAITA_ICON_THEME_INSTALL_STAGING = YES
-ADWAITA_ICON_THEME_LICENSE = LGPLv3 or CC-BY-SA-3.0
+ADWAITA_ICON_THEME_LICENSE = LGPL-3.0 or CC-BY-SA-3.0
 ADWAITA_ICON_THEME_LICENSE_FILES = COPYING COPYING_LGPL COPYING_CCBYSA3
 ADWAITA_ICON_THEME_DEPENDENCIES = host-intltool host-libgtk3
 
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index 611020c..1f6c09d 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -6,7 +6,7 @@
 
 CPPCMS_VERSION = 1.0.5
 CPPCMS_SOURCE = cppcms-$(CPPCMS_VERSION).tar.bz2
-CPPCMS_LICENSE = LGPLv3
+CPPCMS_LICENSE = LGPL-3.0
 CPPCMS_LICENSE_FILES = COPYING.TXT
 CPPCMS_SITE = http://downloads.sourceforge.net/project/cppcms/cppcms/$(CPPCMS_VERSION)
 CPPCMS_INSTALL_STAGING = YES
diff --git a/package/cxxtest/cxxtest.mk b/package/cxxtest/cxxtest.mk
index 93bdd8b..4ea9adf 100644
--- a/package/cxxtest/cxxtest.mk
+++ b/package/cxxtest/cxxtest.mk
@@ -6,7 +6,7 @@
 
 CXXTEST_VERSION = 4.4
 CXXTEST_SITE = https://github.com/CxxTest/cxxtest/releases/download/$(CXXTEST_VERSION)
-CXXTEST_LICENSE = LGPLv3
+CXXTEST_LICENSE = LGPL-3.0
 CXXTEST_LICENSE_FILES = COPYING
 CXXTEST_INSTALL_STAGING = YES
 CXXTEST_INSTALL_TARGET = NO
diff --git a/package/ding-libs/ding-libs.mk b/package/ding-libs/ding-libs.mk
index 8a6615d..4b045be 100644
--- a/package/ding-libs/ding-libs.mk
+++ b/package/ding-libs/ding-libs.mk
@@ -11,7 +11,7 @@ DING_LIBS_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 DING_LIBS_INSTALL_STAGING = YES
-DING_LIBS_LICENSE = LGPLv3+ (library),GPL-3.0+ (test programs)
+DING_LIBS_LICENSE = LGPL-3.0+ (library),GPL-3.0+ (test programs)
 DING_LIBS_LICENSE_FILES = COPYING COPYING.LESSER
 
 # autoconf/automake generated files not present in tarball
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index a7800b9..de2ef9c 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -8,7 +8,7 @@ ELFUTILS_VERSION = 0.166
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
-ELFUTILS_LICENSE = GPL-2.0+ or LGPLv3+ (library)
+ELFUTILS_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 ELFUTILS_LICENSE_FILES = COPYING-GPLV2 COPYING-LGPLV3
 ELFUTILS_DEPENDENCIES = zlib
 HOST_ELFUTILS_DEPENDENCIES = host-zlib host-bzip2 host-xz
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index 57f324b..d525207 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -7,7 +7,7 @@
 EVEMU_VERSION = 2.5.0
 EVEMU_SITE = http://www.freedesktop.org/software/evemu
 EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.xz
-EVEMU_LICENSE = LGPLv3 (library), GPL-3.0 (tools)
+EVEMU_LICENSE = LGPL-3.0 (library), GPL-3.0 (tools)
 EVEMU_LICENSE_FILES = COPYING
 
 # asciidoc used to generate manpages, which we don't need, and if it's
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index f2315a9..8fc8bb7 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -20,7 +20,7 @@ GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
 endif
 
-GDB_LICENSE = GPL-2.0+, LGPLv2+, GPL-3.0+, LGPLv3+
+GDB_LICENSE = GPL-2.0+, LGPLv2+, GPL-3.0+, LGPL-3.0+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 
 # We only want gdbserver and not the entire debugger.
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index d85ab81..5ea79ae 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -8,7 +8,7 @@ GMP_VERSION = 6.1.2
 GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.xz
 GMP_INSTALL_STAGING = YES
-GMP_LICENSE = LGPLv3+ or GPL-2.0+
+GMP_LICENSE = LGPL-3.0+ or GPL-2.0+
 GMP_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
 GMP_DEPENDENCIES = host-m4
 HOST_GMP_DEPENDENCIES = host-m4
diff --git a/package/granite/granite.mk b/package/granite/granite.mk
index 3faedf9..4ad64c2 100644
--- a/package/granite/granite.mk
+++ b/package/granite/granite.mk
@@ -10,7 +10,7 @@ GRANITE_SITE = https://launchpad.net/granite/$(GRANITE_VERSION_MAJOR)/$(GRANITE_
 GRANITE_SOURCE = granite-$(GRANITE_VERSION).tar.xz
 GRANITE_DEPENDENCIES = host-pkgconf host-vala libgee libglib2 libgtk3
 GRANITE_INSTALL_STAGING = YES
-GRANITE_LICENSE = LGPLv3+
+GRANITE_LICENSE = LGPL-3.0+
 GRANITE_LICENSE_FILES = COPYING
 
 $(eval $(cmake-package))
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index 6f0e38d..b04eecb 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -16,7 +16,7 @@ GST_FFMPEG_LICENSE = GPL-2.0+ (gst-ffmpeg), GPL-2.0+/GPL-3.0+ (libav)
 GST_FFMPEG_LICENSE_FILES = COPYING gst-libs/ext/libav/COPYING.GPLv2 gst-libs/ext/libav/COPYING.GPLv3
 else
 GST_FFMPEG_CONF_OPTS += --enable-lgpl
-GST_FFMPEG_LICENSE = LGPLv2+ (gst-ffmpeg), LGPL-2.1+/LGPLv3+ (libav)
+GST_FFMPEG_LICENSE = LGPLv2+ (gst-ffmpeg), LGPL-2.1+/LGPL-3.0+ (libav)
 GST_FFMPEG_LICENSE_FILES = COPYING.LIB gst-libs/ext/libav/COPYING.LGPLv2.1 gst-libs/ext/libav/COPYING.LGPLv3
 endif
 
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 88c7414..2ccd8e6 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -10,7 +10,7 @@ GUILE_SITE = $(BR2_GNU_MIRROR)/guile
 GUILE_INSTALL_STAGING = YES
 # For 0002-calculate-csqrt_manually.patch
 GUILE_AUTORECONF = YES
-GUILE_LICENSE = LGPLv3+
+GUILE_LICENSE = LGPL-3.0+
 GUILE_LICENSE_FILES = LICENSE COPYING COPYING.LESSER
 
 # libtool dependency is needed because guile uses libltdl
diff --git a/package/kompexsqlite/kompexsqlite.mk b/package/kompexsqlite/kompexsqlite.mk
index 7f57680..51b80aa 100644
--- a/package/kompexsqlite/kompexsqlite.mk
+++ b/package/kompexsqlite/kompexsqlite.mk
@@ -8,7 +8,7 @@ KOMPEXSQLITE_VERSION = v1.10.12-1
 KOMPEXSQLITE_SOURCE = $(KOMPEXSQLITE_VERSION).tar.gz
 KOMPEXSQLITE_SITE = https://github.com/Aethelflaed/kompex-sqlite-wrapper/archive
 KOMPEXSQLITE_INSTALL_STAGING = YES
-KOMPEXSQLITE_LICENSE = LGPLv3+ (wrapper), Public Domain (bundled sqlite)
+KOMPEXSQLITE_LICENSE = LGPL-3.0+ (wrapper), Public Domain (bundled sqlite)
 KOMPEXSQLITE_LICENSE_FILES = LICENSE.txt
 
 $(eval $(autotools-package))
diff --git a/package/lensfun/lensfun.mk b/package/lensfun/lensfun.mk
index 7979885..9258409 100644
--- a/package/lensfun/lensfun.mk
+++ b/package/lensfun/lensfun.mk
@@ -6,7 +6,7 @@
 
 LENSFUN_VERSION = 0.3.2
 LENSFUN_SITE = https://sourceforge.net/projects/lensfun/files/$(LENSFUN_VERSION)
-LENSFUN_LICENSE = LGPLv3+ (libraries), GPL-3.0+ (programs)
+LENSFUN_LICENSE = LGPL-3.0+ (libraries), GPL-3.0+ (programs)
 LENSFUN_LICENSE_FILES = docs/gpl-3.0.txt docs/lgpl-3.0.txt
 LENSFUN_INSTALL_STAGING = YES
 LENSFUN_DEPENDENCIES = libglib2
diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index 1c36d42..9657f87 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -7,7 +7,7 @@
 LIBCGICC_VERSION = 3.2.16
 LIBCGICC_SITE = $(BR2_GNU_MIRROR)/cgicc
 LIBCGICC_SOURCE = cgicc-$(LIBCGICC_VERSION).tar.bz2
-LIBCGICC_LICENSE = LGPLv3+ (library), GFDL1.2+ (docs)
+LIBCGICC_LICENSE = LGPL-3.0+ (library), GFDL1.2+ (docs)
 LIBCGICC_LICENSE_FILES = COPYING.LIB COPYING.DOC
 LIBCGICC_INSTALL_STAGING = YES
 LIBCGICC_AUTORECONF = YES
diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index e2d7bf1..13e6f2a 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -10,7 +10,7 @@ LIBFREEFARE_SOURCE = libfreefare-$(LIBFREEFARE_VERSION).tar.bz2
 # the same as the one uploaded by upstream for the release.
 LIBFREEFARE_SITE = https://github.com/nfc-tools/libfreefare/releases/download/libfreefare-$(LIBFREEFARE_VERSION)
 LIBFREEFARE_DEPENDENCIES = libnfc openssl
-LIBFREEFARE_LICENSE = LGPLv3+ with exception
+LIBFREEFARE_LICENSE = LGPL-3.0+ with exception
 LIBFREEFARE_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_STATIC_LIBS),y)
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 8145e08..18e28e0 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -10,7 +10,7 @@ LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
 LIBIDN_CONF_OPTS = --disable-java --enable-csharp=no
 LIBIDN_DEPENDENCIES = host-pkgconf $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-LIBIDN_LICENSE = GPL-2.0+, GPL-3.0+, LGPLv3+
+LIBIDN_LICENSE = GPL-2.0+, GPL-3.0+, LGPL-3.0+
 LIBIDN_LICENSE_FILES = COPYINGv2 COPYINGv3 COPYING.LESSERv3
 
 define LIBIDN_REMOVE_BINARY
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index 1a72cfd..25b17a4 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -7,7 +7,7 @@
 LIBKSBA_VERSION = 1.3.5
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
-LIBKSBA_LICENSE = LGPLv3+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
+LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
 LIBKSBA_LICENSE_FILES = AUTHORS COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv3
 LIBKSBA_INSTALL_STAGING = YES
 LIBKSBA_DEPENDENCIES = libgpg-error
diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index aceedb0..b13fd69 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -7,7 +7,7 @@
 LIBNFC_VERSION = 1.7.1
 LIBNFC_SOURCE = libnfc-$(LIBNFC_VERSION).tar.bz2
 LIBNFC_SITE = https://github.com/nfc-tools/libnfc/releases/download/libnfc-$(LIBNFC_VERSION)
-LIBNFC_LICENSE = LGPLv3+
+LIBNFC_LICENSE = LGPL-3.0+
 LIBNFC_LICENSE_FILES = COPYING
 LIBNFC_AUTORECONF = YES
 LIBNFC_INSTALL_STAGING = YES
diff --git a/package/libnpth/libnpth.mk b/package/libnpth/libnpth.mk
index 51bdc51..35111dd 100644
--- a/package/libnpth/libnpth.mk
+++ b/package/libnpth/libnpth.mk
@@ -7,7 +7,7 @@
 LIBNPTH_VERSION = 1.3
 LIBNPTH_SOURCE = npth-$(LIBNPTH_VERSION).tar.bz2
 LIBNPTH_SITE = ftp://ftp.gnupg.org/gcrypt/npth
-LIBNPTH_LICENSE = LGPLv3+ or GPL-2.0+
+LIBNPTH_LICENSE = LGPL-3.0+ or GPL-2.0+
 LIBNPTH_LICENSE_FILES = COPYING COPYING.LESSER
 LIBNPTH_INSTALL_STAGING = YES
 
diff --git a/package/libphidget/libphidget.mk b/package/libphidget/libphidget.mk
index 1b2557d..23a320b 100644
--- a/package/libphidget/libphidget.mk
+++ b/package/libphidget/libphidget.mk
@@ -10,7 +10,7 @@ LIBPHIDGET_SITE = http://www.phidgets.com/downloads/libraries
 LIBPHIDGET_DEPENDENCIES = libusb
 LIBPHIDGET_CONF_OPTS = --disable-ldconfig
 LIBPHIDGET_INSTALL_STAGING = YES
-LIBPHIDGET_LICENSE = LGPLv3
+LIBPHIDGET_LICENSE = LGPL-3.0
 LIBPHIDGET_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libserialport/libserialport.mk b/package/libserialport/libserialport.mk
index 86ae17f..84d7a53 100644
--- a/package/libserialport/libserialport.mk
+++ b/package/libserialport/libserialport.mk
@@ -6,7 +6,7 @@
 
 LIBSERIALPORT_VERSION = 0.1.1
 LIBSERIALPORT_SITE = http://sigrok.org/download/source/libserialport
-LIBSERIALPORT_LICENSE = LGPLv3+
+LIBSERIALPORT_LICENSE = LGPL-3.0+
 LIBSERIALPORT_LICENSE_FILES = COPYING
 LIBSERIALPORT_INSTALL_STAGING = YES
 LIBSERIALPORT_DEPENDENCIES = host-pkgconf
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index fc47ae4..9340e79 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -8,7 +8,7 @@ LIBUNISTRING_VERSION = 0.9.7
 LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
 LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
-LIBUNISTRING_LICENSE = LGPLv3+ or GPL-2.0
+LIBUNISTRING_LICENSE = LGPL-3.0+ or GPL-2.0
 LIBUNISTRING_LICENSE_FILES = COPYING.LIB
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
diff --git a/package/libwebsock/libwebsock.mk b/package/libwebsock/libwebsock.mk
index b52293b..df3af3b 100644
--- a/package/libwebsock/libwebsock.mk
+++ b/package/libwebsock/libwebsock.mk
@@ -9,7 +9,7 @@ LIBWEBSOCK_SITE = $(call github,payden,libwebsock,$(LIBWEBSOCK_VERSION))
 LIBWEBSOCK_DEPENDENCIES = libevent host-pkgconf
 LIBWEBSOCK_AUTORECONF = YES
 LIBWEBSOCK_INSTALL_STAGING = YES
-LIBWEBSOCK_LICENSE = LGPLv3
+LIBWEBSOCK_LICENSE = LGPL-3.0
 LIBWEBSOCK_LICENSE_FILES = COPYING.lesser
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index 052e593..0c2a101 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -6,7 +6,7 @@
 
 LIGHTNING_VERSION = 2.1.0
 LIGHTNING_SITE = $(BR2_GNU_MIRROR)/lightning
-LIGHTNING_LICENSE = LGPLv3+
+LIGHTNING_LICENSE = LGPL-3.0+
 LIGHTNING_LICENSE_FILES = COPYING.LESSER
 LIGHTNING_INSTALL_STAGING = YES
 
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 579e2cc..89bbfd9 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -6,7 +6,7 @@
 
 MPC_VERSION = 1.0.3
 MPC_SITE = $(BR2_GNU_MIRROR)/mpc
-MPC_LICENSE = LGPLv3+
+MPC_LICENSE = LGPL-3.0+
 MPC_LICENSE_FILES = COPYING.LESSER
 MPC_INSTALL_STAGING = YES
 MPC_DEPENDENCIES = gmp mpfr
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index bb78ccc..48dd487 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -7,7 +7,7 @@
 MPFR_VERSION = 3.1.5
 MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
-MPFR_LICENSE = LGPLv3+
+MPFR_LICENSE = LGPL-3.0+
 MPFR_LICENSE_FILES = COPYING.LESSER
 MPFR_INSTALL_STAGING = YES
 MPFR_DEPENDENCIES = gmp
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 053a55d..8e661a0 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -12,7 +12,7 @@ NETATALK_AUTORECONF = YES
 NETATALK_CONFIG_SCRIPTS = netatalk-config
 NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error \
 	libevent
-NETATALK_LICENSE = GPL-2.0+, LGPLv3+, MIT-like
+NETATALK_LICENSE = GPL-2.0+, LGPL-3.0+, MIT-like
 NETATALK_LICENSE_FILES = COPYING COPYRIGHT
 
 # Don't run ldconfig!
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 4937f4e..e5012d2 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -8,7 +8,7 @@ NETTLE_VERSION = 3.3
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
-NETTLE_LICENSE = Dual GPL-2.0+/LGPLv3+
+NETTLE_LICENSE = Dual GPL-2.0+/LGPL-3.0+
 NETTLE_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
 # don't include openssl support for (unused) examples as it has problems
 # with static linking
diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
index 5f480e9..a632468 100644
--- a/package/openzwave/openzwave.mk
+++ b/package/openzwave/openzwave.mk
@@ -6,7 +6,7 @@
 
 OPENZWAVE_VERSION = V1.5
 OPENZWAVE_SITE = $(call github,OpenZWave,open-zwave,$(OPENZWAVE_VERSION))
-OPENZWAVE_LICENSE = LGPLv3+, GPL-3.0 (examples), Apache-2.0 (sh2ju.sh)
+OPENZWAVE_LICENSE = LGPL-3.0+, GPL-3.0 (examples), Apache-2.0 (sh2ju.sh)
 OPENZWAVE_LICENSE_FILES = license/license.txt license/lgpl.txt \
 	license/gpl.txt license/Apache-License-2.0.txt
 
diff --git a/package/phidgetwebservice/phidgetwebservice.mk b/package/phidgetwebservice/phidgetwebservice.mk
index f7d1b48..36c0185 100644
--- a/package/phidgetwebservice/phidgetwebservice.mk
+++ b/package/phidgetwebservice/phidgetwebservice.mk
@@ -8,7 +8,7 @@ PHIDGETWEBSERVICE_VERSION = 2.1.8.20140319
 PHIDGETWEBSERVICE_SOURCE = phidgetwebservice_$(PHIDGETWEBSERVICE_VERSION).tar.gz
 PHIDGETWEBSERVICE_SITE = http://www.phidgets.com/downloads/libraries
 PHIDGETWEBSERVICE_DEPENDENCIES = libphidget
-PHIDGETWEBSERVICE_LICENSE = LGPLv3
+PHIDGETWEBSERVICE_LICENSE = LGPL-3.0
 PHIDGETWEBSERVICE_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/python-argh/python-argh.mk b/package/python-argh/python-argh.mk
index bc5d713..ac51417 100644
--- a/package/python-argh/python-argh.mk
+++ b/package/python-argh/python-argh.mk
@@ -8,7 +8,7 @@ PYTHON_ARGH_VERSION = 0.26.2
 PYTHON_ARGH_SOURCE = argh-$(PYTHON_ARGH_VERSION).tar.gz
 PYTHON_ARGH_SITE = https://pypi.python.org/packages/e3/75/1183b5d1663a66aebb2c184e0398724b624cecd4f4b679cb6e25de97ed15
 PYTHON_ARGH_SETUP_TYPE = setuptools
-PYTHON_ARGH_LICENSE = LGPLv3+
+PYTHON_ARGH_LICENSE = LGPL-3.0+
 PYTHON_ARGH_LICENSE_FILES = README.rst
 
 $(eval $(python-package))
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index ae9ef1a..eddefdb 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CAN_VERSION = 1.4.3
 PYTHON_CAN_SITE = https://pypi.python.org/packages/source/p/python-can
-PYTHON_CAN_LICENSE = LGPLv3
+PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
 PYTHON_CAN_SETUP_TYPE = setuptools
 
diff --git a/package/python-crc16/python-crc16.mk b/package/python-crc16/python-crc16.mk
index 3a292a0..9809f1e 100644
--- a/package/python-crc16/python-crc16.mk
+++ b/package/python-crc16/python-crc16.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CRC16_VERSION = 0.1.1
 PYTHON_CRC16_SITE = $(call github,gennady,pycrc16,v$(PYTHON_CRC16_VERSION))
-PYTHON_CRC16_LICENSE = LGPLv3+
+PYTHON_CRC16_LICENSE = LGPL-3.0+
 PYTHON_CRC16_LICENSE_FILES = COPYING.txt
 PYTHON_CRC16_SETUP_TYPE = distutils
 
diff --git a/package/python-cssutils/python-cssutils.mk b/package/python-cssutils/python-cssutils.mk
index 3dd501a..3aa96f4 100644
--- a/package/python-cssutils/python-cssutils.mk
+++ b/package/python-cssutils/python-cssutils.mk
@@ -7,7 +7,7 @@
 PYTHON_CSSUTILS_VERSION = 1.0.1
 PYTHON_CSSUTILS_SOURCE = cssutils-$(PYTHON_CSSUTILS_VERSION).tar.gz
 PYTHON_CSSUTILS_SITE = https://pypi.python.org/packages/22/de/6b03e0088baf0299ab7d2e95a9e26c2092e9cb3855876b958b6a62175ca2
-PYTHON_CSSUTILS_LICENSE = LGPLv3+
+PYTHON_CSSUTILS_LICENSE = LGPL-3.0+
 PYTHON_CSSUTILS_LICENSE_FILES = COPYING.LESSER
 PYTHON_CSSUTILS_SETUP_TYPE = setuptools
 
diff --git a/package/python-dominate/python-dominate.mk b/package/python-dominate/python-dominate.mk
index 3e264ca..70ddb06 100644
--- a/package/python-dominate/python-dominate.mk
+++ b/package/python-dominate/python-dominate.mk
@@ -8,7 +8,7 @@ PYTHON_DOMINATE_VERSION = 2.3.1
 PYTHON_DOMINATE_SOURCE = dominate-$(PYTHON_DOMINATE_VERSION).tar.gz
 PYTHON_DOMINATE_SITE = https://pypi.python.org/packages/43/b2/3b7d67dd59dab93ae08569384b254323516e8868b453eea5614a53835baf
 PYTHON_DOMINATE_SETUP_TYPE = setuptools
-PYTHON_DOMINATE_LICENSE = LGPLv3+
+PYTHON_DOMINATE_LICENSE = LGPL-3.0+
 PYTHON_DOMINATE_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
diff --git a/package/python-iowait/python-iowait.mk b/package/python-iowait/python-iowait.mk
index 99c2922..e327053 100644
--- a/package/python-iowait/python-iowait.mk
+++ b/package/python-iowait/python-iowait.mk
@@ -8,7 +8,7 @@ PYTHON_IOWAIT_VERSION = 0.2
 PYTHON_IOWAIT_SOURCE = iowait-$(PYTHON_IOWAIT_VERSION).tar.gz
 PYTHON_IOWAIT_SITE = https://pypi.python.org/packages/65/30/e953673fe9619938e9c74408401cf865f37716da89f61f6e5d9328c0f71e
 PYTHON_IOWAIT_SETUP_TYPE = distutils
-PYTHON_IOWAIT_LICENSE = LGPLv3+
+PYTHON_IOWAIT_LICENSE = LGPL-3.0+
 PYTHON_IOWAIT_LICENSE_FILES = COPYING.LESSER
 
 $(eval $(python-package))
diff --git a/package/python-json-schema-validator/python-json-schema-validator.mk b/package/python-json-schema-validator/python-json-schema-validator.mk
index 1456c34..6accbd6 100644
--- a/package/python-json-schema-validator/python-json-schema-validator.mk
+++ b/package/python-json-schema-validator/python-json-schema-validator.mk
@@ -7,7 +7,7 @@
 PYTHON_JSON_SCHEMA_VALIDATOR_VERSION = 2.4.1
 PYTHON_JSON_SCHEMA_VALIDATOR_SOURCE = json-schema-validator-$(PYTHON_JSON_SCHEMA_VALIDATOR_VERSION).tar.gz
 PYTHON_JSON_SCHEMA_VALIDATOR_SITE = https://pypi.python.org/packages/70/46/ba39cb7efad1898cfc89bf3588b8612f24d128f1c25b761994f524a59cef
-PYTHON_JSON_SCHEMA_VALIDATOR_LICENSE = LGPLv3
+PYTHON_JSON_SCHEMA_VALIDATOR_LICENSE = LGPL-3.0
 PYTHON_JSON_SCHEMA_VALIDATOR_SETUP_TYPE = setuptools
 PYTHON_JSON_SCHEMA_VALIDATOR_DEPENDENCIES = python-versiontools
 
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index ade2d3a..4f8b5ec 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -7,7 +7,7 @@
 PYTHON_PYZMQ_VERSION = 16.0.2
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
 PYTHON_PYZMQ_SITE = https://pypi.python.org/packages/af/37/8e0bf3800823bc247c36715a52e924e8f8fd5d1432f04b44b8cd7a5d7e55
-PYTHON_PYZMQ_LICENSE = LGPLv3+, BSD-3c, Apache-2.0
+PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3c, Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
 PYTHON_PYZMQ_DEPENDENCIES = zeromq
diff --git a/package/python-versiontools/python-versiontools.mk b/package/python-versiontools/python-versiontools.mk
index 4f763db..2170730 100644
--- a/package/python-versiontools/python-versiontools.mk
+++ b/package/python-versiontools/python-versiontools.mk
@@ -8,6 +8,6 @@ PYTHON_VERSIONTOOLS_VERSION = 1.9.1
 PYTHON_VERSIONTOOLS_SOURCE = versiontools-$(PYTHON_VERSIONTOOLS_VERSION).tar.gz
 PYTHON_VERSIONTOOLS_SITE = http://pypi.python.org/packages/source/v/versiontools
 PYTHON_VERSIONTOOLS_SETUP_TYPE = setuptools
-PYTHON_VERSIONTOOLS_LICENSE = LGPLv3
+PYTHON_VERSIONTOOLS_LICENSE = LGPL-3.0
 
 $(eval $(python-package))
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 38faabc..7fe9f82 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WEB2PY_VERSION = R-2.12.3
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,$(PYTHON_WEB2PY_VERSION))
-PYTHON_WEB2PY_LICENSE = LGPLv3
+PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
 PYTHON_WEB2PY_DEPENDENCIES = python python-pydal host-python-pydal
 
diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
index d54c8d5..341c20a 100644
--- a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
+++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
@@ -8,7 +8,7 @@ QT_WEBKIT_KIOSK_VERSION = 7fe40a350abfbe5ec194e7c6c740f7099e8704cd
 QT_WEBKIT_KIOSK_SITE = https://github.com/sergey-dryabzhinsky/qt-webkit-kiosk.git
 QT_WEBKIT_KIOSK_SITE_METHOD = git
 QT_WEBKIT_KIOSK_DEPENDENCIES = qt5webkit qt5multimedia
-QT_WEBKIT_KIOSK_LICENSE = LGPLv3
+QT_WEBKIT_KIOSK_LICENSE = LGPL-3.0
 QT_WEBKIT_KIOSK_LICENSE_FILES = doc/lgpl.html
 
 define QT_WEBKIT_KIOSK_CONFIGURE_CMDS
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 8cac2d2..9d89020 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -15,7 +15,7 @@ QT53D_DEPENDENCIES += assimp
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv3
+QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
 QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.GPLv3 LICENSE.LGPLv3
 else
 QT53D_LICENSE = Commercial license
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 706a7dc..e949cf4 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -50,10 +50,10 @@ endif
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5BASE_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
+QT5BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5BASE_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5BASE_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.3 (docs)
 QT5BASE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index cbdbf80..f49113b 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -11,7 +11,7 @@ QT5CANVAS3D_DEPENDENCIES = qt5base qt5declarative
 QT5CANVAS3D_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5CANVAS3D_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv3
+QT5CANVAS3D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
 QT5CANVAS3D_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3
 else
 QT5CANVAS3D_LICENSE = Commercial license
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 11a16e7..c0861c8 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -12,10 +12,10 @@ QT5CONNECTIVITY_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5CONNECTIVITY_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
+QT5CONNECTIVITY_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5CONNECTIVITY_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5CONNECTIVITY_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.3 (docs)
 QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 546f13d..faf18ac 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -12,10 +12,10 @@ QT5DECLARATIVE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5DECLARATIVE_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
+QT5DECLARATIVE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5DECLARATIVE_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5DECLARATIVE_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.3 (docs)
 QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index 8d0f385..468d1ff 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -13,7 +13,7 @@ QT5ENGINIO_DEPENDENCIES = openssl qt5base
 QT5ENGINIO_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5ENGINIO_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5ENGINIO_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.3 (docs)
 QT5ENGINIO_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5ENGINIO_LICENSE := $(QT5ENGINIO_LICENSE), BSD-3c (examples)
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 281c766..83e6c15 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -12,10 +12,10 @@ QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5GRAPHICALEFFECTS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
+QT5GRAPHICALEFFECTS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5GRAPHICALEFFECTS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5GRAPHICALEFFECTS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.3 (docs)
 QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index 658ab68..06797be 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -12,10 +12,10 @@ QT5IMAGEFORMATS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5IMAGEFORMATS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
+QT5IMAGEFORMATS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5IMAGEFORMATS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5IMAGEFORMATS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.3 (docs)
 QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index 3b9b5d0..16927ae 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -12,10 +12,10 @@ QT5LOCATION_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5LOCATION_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
+QT5LOCATION_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5LOCATION_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5LOCATION_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5LOCATION_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.3 (docs)
 QT5LOCATION_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 93b14d3..e83aae2 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -12,10 +12,10 @@ QT5MULTIMEDIA_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5MULTIMEDIA_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
+QT5MULTIMEDIA_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5MULTIMEDIA_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5MULTIMEDIA_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.3 (docs)
 QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 0653ef6..bf566fc 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -11,7 +11,7 @@ QT5QUICKCONTROLS_DEPENDENCIES = qt5base qt5declarative
 QT5QUICKCONTROLS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5QUICKCONTROLS_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv3, GFDLv1.3 (docs)
+QT5QUICKCONTROLS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDLv1.3 (docs)
 QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5QUICKCONTROLS_LICENSE = Commercial license
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index 1b33623..a19a05e 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -11,7 +11,7 @@ QT5QUICKCONTROLS2_DEPENDENCIES = qt5base qt5declarative
 QT5QUICKCONTROLS2_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5QUICKCONTROLS2_LICENSE = GPL-3.0 or LGPLv3, GFDLv1.3 (docs)
+QT5QUICKCONTROLS2_LICENSE = GPL-3.0 or LGPL-3.0, GFDLv1.3 (docs)
 QT5QUICKCONTROLS2_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5QUICKCONTROLS2_LICENSE = Commercial license
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index ec9b750..7e25eb1 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -11,7 +11,7 @@ QT5SCRIPT_DEPENDENCIES = qt5base
 QT5SCRIPT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5SCRIPT_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5SCRIPT_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.3 (docs)
 QT5SCRIPT_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5SCRIPT_LICENSE = Commercial license
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index bf3ab1c..ee8aeba 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -12,10 +12,10 @@ QT5SENSORS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5SENSORS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
+QT5SENSORS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5SENSORS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5SENSORS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.3 (docs)
 QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index 0386b63..eb9bf65 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -11,7 +11,7 @@ QT5SERIALBUS_DEPENDENCIES = qt5base qt5serialport
 QT5SERIALBUS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5SERIALBUS_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv3, GFDLv1.3 (docs)
+QT5SERIALBUS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDLv1.3 (docs)
 QT5SERIALBUS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5SERIALBUS_LICENSE = Commercial license
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index d6a0bfb..49b7271 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -12,10 +12,10 @@ QT5SERIALPORT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5SERIALPORT_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
+QT5SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5SERIALPORT_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5SERIALPORT_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.3 (docs)
 QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index ec82334..74bc142 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -12,10 +12,10 @@ QT5SVG_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5SVG_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
+QT5SVG_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5SVG_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5SVG_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5SVG_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.3 (docs)
 QT5SVG_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index d531ecf..d02806b 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -21,10 +21,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5TOOLS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
+QT5TOOLS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5TOOLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5TOOLS_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5TOOLS_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.3 (docs)
 QT5TOOLS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index 18544b8..570a14b 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -12,10 +12,10 @@ QT5WEBCHANNEL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5WEBCHANNEL_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
+QT5WEBCHANNEL_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5WEBCHANNEL_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5WEBCHANNEL_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.3 (docs)
 QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index cbe06d8..fe34748 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -12,10 +12,10 @@ QT5WEBSOCKETS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5WEBSOCKETS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools)
+QT5WEBSOCKETS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools)
 QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3
 else
-QT5WEBSOCKETS_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPLv3
+QT5WEBSOCKETS_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0
 QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 78f8aee..b3090cf 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -12,10 +12,10 @@ QT5X11EXTRAS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5X11EXTRAS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
+QT5X11EXTRAS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5X11EXTRAS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5X11EXTRAS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.3 (docs)
 QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index fa2bfa8..c6d8137 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -12,10 +12,10 @@ QT5XMLPATTERNS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5XMLPATTERNS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
+QT5XMLPATTERNS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5XMLPATTERNS_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5XMLPATTERNS_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDLv1.3 (docs)
 QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/riemann-c-client/riemann-c-client.mk b/package/riemann-c-client/riemann-c-client.mk
index c8a411c..09f7900 100644
--- a/package/riemann-c-client/riemann-c-client.mk
+++ b/package/riemann-c-client/riemann-c-client.mk
@@ -7,7 +7,7 @@
 RIEMANN_C_CLIENT_VERSION = 1.9.1
 RIEMANN_C_CLIENT_SOURCE = riemann-c-client-$(RIEMANN_C_CLIENT_VERSION).tar.xz
 RIEMANN_C_CLIENT_SITE = https://github.com/algernon/riemann-c-client/releases/download/riemann-c-client-$(RIEMANN_C_CLIENT_VERSION)
-RIEMANN_C_CLIENT_LICENSE = LGPLv3+
+RIEMANN_C_CLIENT_LICENSE = LGPL-3.0+
 RIEMANN_C_CLIENT_LICENSE_FILES = LICENSE
 RIEMANN_C_CLIENT_INSTALL_STAGING = YES
 RIEMANN_C_CLIENT_MAKE = $(MAKE1)
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 6370726..bbf7d95 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -6,7 +6,7 @@
 
 RSYSLOG_VERSION = 8.22.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
-RSYSLOG_LICENSE = GPL-3.0, LGPLv3, Apache-2.0
+RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
 RSYSLOG_DEPENDENCIES = zlib libestr liblogging libfastjson host-pkgconf
 RSYSLOG_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
diff --git a/package/urg/urg.mk b/package/urg/urg.mk
index 5d49aeb..4a41779 100644
--- a/package/urg/urg.mk
+++ b/package/urg/urg.mk
@@ -7,7 +7,7 @@
 URG_VERSION = 0.8.18
 URG_SITE = http://pkgs.fedoraproject.org/repo/pkgs/urg/urg-0.8.18.zip/md5/93f90d2ccc36e784407c5282ef6bd2cb
 URG_SOURCE = urg-$(URG_VERSION).zip
-URG_LICENSE = LGPLv3
+URG_LICENSE = LGPL-3.0
 URG_LICENSE_FILES = COPYING
 
 URG_INSTALL_STAGING = YES
diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
index 3227fb2..cec34fa 100644
--- a/package/wiringpi/wiringpi.mk
+++ b/package/wiringpi/wiringpi.mk
@@ -7,7 +7,7 @@
 WIRINGPI_VERSION = 2.44
 WIRINGPI_SITE = git://git.drogon.net/wiringPi
 
-WIRINGPI_LICENSE = LGPLv3+
+WIRINGPI_LICENSE = LGPL-3.0+
 WIRINGPI_LICENSE_FILES = COPYING.LESSER
 WIRINGPI_INSTALL_STAGING = YES
 
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 5c99983..1d3be4e 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -9,7 +9,7 @@ ZEROMQ_SITE = https://github.com/zeromq/zeromq4-1/releases/download/v$(ZEROMQ_VE
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_CONF_OPTS = --without-documentation
-ZEROMQ_LICENSE = LGPLv3+ with exceptions
+ZEROMQ_LICENSE = LGPL-3.0+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
 # For 0001-acinclude.m4-make-kernel-specific-flags-cacheable.patch
 ZEROMQ_AUTORECONF = YES
