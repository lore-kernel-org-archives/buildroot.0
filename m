From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Thu, 30 Mar 2017 19:13:33 +0530
Subject: [Buildroot] [PATCH 04/21] boot,
	package: use SPDX short identifier for GPLv3/GPLv3+
In-Reply-To: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1490881430-10434-5-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We want to use SPDX identifier for license string as much as possible.
SPDX short identifier for GPLv3/GPLv3+ is GPL-3.0/GPL-3.0+.

This change is done using following command.
find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/\<GPLv3\>/GPL-3.0/g'

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 boot/grub2/grub2.mk                                      | 2 +-
 package/4th/4th.mk                                       | 2 +-
 package/at/at.mk                                         | 2 +-
 package/aubio/aubio.mk                                   | 2 +-
 package/autoconf-archive/autoconf-archive.mk             | 2 +-
 package/autoconf/autoconf.mk                             | 2 +-
 package/bash/bash.mk                                     | 2 +-
 package/binutils/binutils.mk                             | 2 +-
 package/bison/bison.mk                                   | 2 +-
 package/ccache/ccache.mk                                 | 2 +-
 package/cgroupfs-mount/cgroupfs-mount.mk                 | 2 +-
 package/cifs-utils/cifs-utils.mk                         | 2 +-
 package/comix-cursors/comix-cursors.mk                   | 2 +-
 package/coreutils/coreutils.mk                           | 2 +-
 package/cpio/cpio.mk                                     | 2 +-
 package/dc3dd/dc3dd.mk                                   | 2 +-
 package/diffutils/diffutils.mk                           | 2 +-
 package/dillo/dillo.mk                                   | 2 +-
 package/ding-libs/ding-libs.mk                           | 2 +-
 package/dnsmasq/dnsmasq.mk                               | 2 +-
 package/domoticz/domoticz.mk                             | 2 +-
 package/dosfstools/dosfstools.mk                         | 2 +-
 package/ed/ed.mk                                         | 2 +-
 package/elfutils/elfutils.mk                             | 2 +-
 package/enscript/enscript.mk                             | 2 +-
 package/espeak/espeak.mk                                 | 2 +-
 package/evemu/evemu.mk                                   | 2 +-
 package/exfat-utils/exfat-utils.mk                       | 2 +-
 package/exfat/exfat.mk                                   | 2 +-
 package/fakeroot/fakeroot.mk                             | 2 +-
 package/findutils/findutils.mk                           | 2 +-
 package/ftop/ftop.mk                                     | 2 +-
 package/gawk/gawk.mk                                     | 2 +-
 package/gdb/gdb.mk                                       | 2 +-
 package/gdbm/gdbm.mk                                     | 2 +-
 package/gengetopt/gengetopt.mk                           | 2 +-
 package/gettext/gettext.mk                               | 2 +-
 package/git-crypt/git-crypt.mk                           | 2 +-
 package/glmark2/glmark2.mk                               | 2 +-
 package/gnupg/gnupg.mk                                   | 2 +-
 package/gnupg2/gnupg2.mk                                 | 2 +-
 package/gnuradio/gnuradio.mk                             | 2 +-
 package/gnutls/gnutls.mk                                 | 2 +-
 package/gperf/gperf.mk                                   | 2 +-
 package/gqrx/gqrx.mk                                     | 2 +-
 package/gr-osmosdr/gr-osmosdr.mk                         | 2 +-
 package/grep/grep.mk                                     | 2 +-
 package/gsl/gsl.mk                                       | 2 +-
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk               | 2 +-
 package/gzip/gzip.mk                                     | 2 +-
 package/hans/hans.mk                                     | 2 +-
 package/haveged/haveged.mk                               | 2 +-
 package/hidapi/hidapi.mk                                 | 2 +-
 package/ifenslave/ifenslave.mk                           | 2 +-
 package/janus-gateway/janus-gateway.mk                   | 2 +-
 package/kodi-adsp-basic/kodi-adsp-basic.mk               | 2 +-
 package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk | 2 +-
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk   | 2 +-
 package/lensfun/lensfun.mk                               | 2 +-
 package/less/less.mk                                     | 2 +-
 package/lftp/lftp.mk                                     | 2 +-
 package/libasplib/libasplib.mk                           | 2 +-
 package/libassuan/libassuan.mk                           | 2 +-
 package/libcdio/libcdio.mk                               | 2 +-
 package/libfreeimage/libfreeimage.mk                     | 2 +-
 package/libgpiod/libgpiod.mk                             | 2 +-
 package/libgsasl/libgsasl.mk                             | 2 +-
 package/libiconv/libiconv.mk                             | 2 +-
 package/libidn/libidn.mk                                 | 2 +-
 package/libksba/libksba.mk                               | 2 +-
 package/libllcp/libllcp.mk                               | 2 +-
 package/libsigrok/libsigrok.mk                           | 2 +-
 package/libsigrokdecode/libsigrokdecode.mk               | 2 +-
 package/libstrophe/libstrophe.mk                         | 2 +-
 package/libtasn1/libtasn1.mk                             | 2 +-
 package/liburcu/liburcu.mk                               | 2 +-
 package/m4/m4.mk                                         | 2 +-
 package/make/make.mk                                     | 2 +-
 package/mc/mc.mk                                         | 2 +-
 package/mcrypt/mcrypt.mk                                 | 2 +-
 package/modplugtools/modplugtools.mk                     | 2 +-
 package/mosh/mosh.mk                                     | 2 +-
 package/msmtp/msmtp.mk                                   | 2 +-
 package/mtdev2tuio/mtdev2tuio.mk                         | 2 +-
 package/mtools/mtools.mk                                 | 2 +-
 package/nano/nano.mk                                     | 2 +-
 package/ndisc6/ndisc6.mk                                 | 2 +-
 package/nmon/nmon.mk                                     | 2 +-
 package/nut/nut.mk                                       | 2 +-
 package/ocrad/ocrad.mk                                   | 2 +-
 package/openzwave/openzwave.mk                           | 2 +-
 package/parted/parted.mk                                 | 2 +-
 package/patch/patch.mk                                   | 2 +-
 package/patchelf/patchelf.mk                             | 2 +-
 package/pifmrds/pifmrds.mk                               | 2 +-
 package/pound/pound.mk                                   | 2 +-
 package/pulseview/pulseview.mk                           | 2 +-
 package/python-daemon/python-daemon.mk                   | 2 +-
 package/python-docutils/python-docutils.mk               | 2 +-
 package/python-enum/python-enum.mk                       | 2 +-
 package/python-mwscrape2slob/python-mwscrape2slob.mk     | 2 +-
 package/python-networkmanager/python-networkmanager.mk   | 2 +-
 package/python-pyqt/python-pyqt.mk                       | 2 +-
 package/python-pyqt5/python-pyqt5.mk                     | 2 +-
 package/python-sip/python-sip.mk                         | 2 +-
 package/python-slob/python-slob.mk                       | 2 +-
 package/qt/qt.mk                                         | 2 +-
 package/qt5/qt53d/qt53d.mk                               | 2 +-
 package/qt5/qt5base/qt5base.mk                           | 4 ++--
 package/qt5/qt5canvas3d/qt5canvas3d.mk                   | 2 +-
 package/qt5/qt5connectivity/qt5connectivity.mk           | 4 ++--
 package/qt5/qt5declarative/qt5declarative.mk             | 4 ++--
 package/qt5/qt5enginio/qt5enginio.mk                     | 2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk   | 4 ++--
 package/qt5/qt5imageformats/qt5imageformats.mk           | 4 ++--
 package/qt5/qt5location/qt5location.mk                   | 4 ++--
 package/qt5/qt5multimedia/qt5multimedia.mk               | 4 ++--
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk         | 2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk       | 2 +-
 package/qt5/qt5script/qt5script.mk                       | 2 +-
 package/qt5/qt5sensors/qt5sensors.mk                     | 4 ++--
 package/qt5/qt5serialbus/qt5serialbus.mk                 | 2 +-
 package/qt5/qt5serialport/qt5serialport.mk               | 4 ++--
 package/qt5/qt5svg/qt5svg.mk                             | 4 ++--
 package/qt5/qt5tools/qt5tools.mk                         | 4 ++--
 package/qt5/qt5webchannel/qt5webchannel.mk               | 4 ++--
 package/qt5/qt5websockets/qt5websockets.mk               | 4 ++--
 package/qt5/qt5x11extras/qt5x11extras.mk                 | 4 ++--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk             | 4 ++--
 package/qtuio/qtuio.mk                                   | 2 +-
 package/ranger/ranger.mk                                 | 2 +-
 package/rdesktop/rdesktop.mk                             | 2 +-
 package/readline/readline.mk                             | 2 +-
 package/rsync/rsync.mk                                   | 2 +-
 package/rsyslog/rsyslog.mk                               | 2 +-
 package/samba4/samba4.mk                                 | 2 +-
 package/screen/screen.mk                                 | 2 +-
 package/sed/sed.mk                                       | 2 +-
 package/sigrok-cli/sigrok-cli.mk                         | 2 +-
 package/sngrep/sngrep.mk                                 | 2 +-
 package/squeezelite/squeezelite.mk                       | 2 +-
 package/supertuxkart/supertuxkart.mk                     | 2 +-
 package/swig/swig.mk                                     | 2 +-
 package/tar/tar.mk                                       | 2 +-
 package/tcping/tcping.mk                                 | 2 +-
 package/tcpreplay/tcpreplay.mk                           | 2 +-
 package/transmission/transmission.mk                     | 2 +-
 package/triggerhappy/triggerhappy.mk                     | 2 +-
 package/tvheadend/tvheadend.mk                           | 2 +-
 package/udpxy/udpxy.mk                                   | 2 +-
 package/wavemon/wavemon.mk                               | 2 +-
 package/wget/wget.mk                                     | 2 +-
 package/which/which.mk                                   | 2 +-
 package/xorriso/xorriso.mk                               | 2 +-
 package/xz/xz.mk                                         | 2 +-
 package/yad/yad.mk                                       | 2 +-
 package/zynq-boot-bin/zynq-boot-bin.mk                   | 2 +-
 157 files changed, 172 insertions(+), 172 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index dc4e51e..dc01983 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -7,7 +7,7 @@
 GRUB2_VERSION = 2.00
 GRUB2_SITE = $(BR2_GNU_MIRROR)/grub
 GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
-GRUB2_LICENSE = GPLv3+
+GRUB2_LICENSE = GPL-3.0+
 GRUB2_LICENSE_FILES = COPYING
 GRUB2_DEPENDENCIES = host-bison host-flex
 
diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index 0d82614..0226db1 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -7,7 +7,7 @@
 4TH_VERSION = 3.62.4
 4TH_SOURCE = 4th-$(4TH_VERSION)-unix.tar.gz
 4TH_SITE = http://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
-4TH_LICENSE = GPLv3+, LGPLv3+
+4TH_LICENSE = GPL-3.0+, LGPLv3+
 # The COPYING file only contains the text of the LGPLv3, but the
 # source code really contains parts under GPLv3+.
 4TH_LICENSE_FILES = COPYING
diff --git a/package/at/at.mk b/package/at/at.mk
index db38aa7..058ebac 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -11,7 +11,7 @@ AT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a
 AT_MAKE = $(MAKE1)
 AT_AUTORECONF = YES
 AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex) host-bison host-flex
-AT_LICENSE = GPL-2.0+, GPLv3+, ISC
+AT_LICENSE = GPL-2.0+, GPL-3.0+, ISC
 AT_LICENSE_FILES = Copyright COPYING
 
 AT_CONF_OPTS = \
diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index f3330c2..f8be19f 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -7,7 +7,7 @@
 AUBIO_VERSION = 0.4.3
 AUBIO_SITE = https://aubio.org/pub
 AUBIO_SOURCE = aubio-$(AUBIO_VERSION).tar.bz2
-AUBIO_LICENSE = GPLv3+
+AUBIO_LICENSE = GPL-3.0+
 AUBIO_LICENSE_FILES = COPYING
 AUBIO_INSTALL_STAGING = YES
 
diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
index 86956eb..053ea33 100644
--- a/package/autoconf-archive/autoconf-archive.mk
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -7,7 +7,7 @@
 AUTOCONF_ARCHIVE_VERSION = 2016.03.20
 AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
 AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
-AUTOCONF_ARCHIVE_LICENSE = GPLv3+ with exception
+AUTOCONF_ARCHIVE_LICENSE = GPL-3.0+ with exception
 AUTOCONF_ARCHIVE_LICENSE_FILES = COPYING COPYING.EXCEPTION
 HOST_AUTOCONF_ARCHIVE_INSTALL_OPTS = aclocaldir=$(HOST_DIR)/usr/share/autoconf-archive install
 
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index fd91961..904fada 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -8,7 +8,7 @@ AUTOCONF_VERSION = 2.69
 AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.xz
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
-AUTOCONF_LICENSE = GPLv3+ with exceptions
+AUTOCONF_LICENSE = GPL-3.0+ with exceptions
 AUTOCONF_LICENSE_FILES = COPYINGv3 COPYING.EXCEPTION
 
 HOST_AUTOCONF_CONF_ENV = \
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 090cf52..639f012 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -10,7 +10,7 @@ BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses readline host-bison \
 	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
 BASH_CONF_OPTS = --with-installed-readline
-BASH_LICENSE = GPLv3+
+BASH_LICENSE = GPL-3.0+
 BASH_LICENSE_FILES = COPYING
 
 BASH_CONF_ENV += \
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 7dfe4db..467db6e 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -25,7 +25,7 @@ BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.bz2
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 BINUTILS_INSTALL_STAGING = YES
 BINUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-BINUTILS_LICENSE = GPLv3+, libiberty LGPLv2.1+
+BINUTILS_LICENSE = GPL-3.0+, libiberty LGPLv2.1+
 BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
 
 ifeq ($(BINUTILS_FROM_GIT),y)
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 5779673..e4fc504 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -7,7 +7,7 @@
 BISON_VERSION = 3.0.4
 BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
-BISON_LICENSE = GPLv3+
+BISON_LICENSE = GPL-3.0+
 BISON_LICENSE_FILES = COPYING
 HOST_BISON_DEPENDENCIES = host-m4
 
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 6a20ee8..97d66bb 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -7,7 +7,7 @@
 CCACHE_VERSION = 3.3.4
 CCACHE_SITE = https://www.samba.org/ftp/ccache
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
-CCACHE_LICENSE = GPLv3+, others
+CCACHE_LICENSE = GPL-3.0+, others
 CCACHE_LICENSE_FILES = LICENSE.txt GPL-3.0.txt
 
 # Force ccache to use its internal zlib. The problem is that without
diff --git a/package/cgroupfs-mount/cgroupfs-mount.mk b/package/cgroupfs-mount/cgroupfs-mount.mk
index b375605..096c728 100644
--- a/package/cgroupfs-mount/cgroupfs-mount.mk
+++ b/package/cgroupfs-mount/cgroupfs-mount.mk
@@ -6,7 +6,7 @@
 
 CGROUPFS_MOUNT_VERSION = 7285bf44402029394808339f69f4f293730fc2c6
 CGROUPFS_MOUNT_SITE = $(call github,tianon,cgroupfs-mount,$(CGROUPFS_MOUNT_VERSION))
-CGROUPFS_MOUNT_LICENSE = GPLv3+
+CGROUPFS_MOUNT_LICENSE = GPL-3.0+
 CGROUPFS_MOUNT_LICENSE_FILES = debian/copyright
 
 define CGROUPFS_MOUNT_INSTALL_TARGET_CMDS
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index fdb1779..152a3ee 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -7,7 +7,7 @@
 CIFS_UTILS_VERSION = 6.6
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
-CIFS_UTILS_LICENSE = GPLv3+
+CIFS_UTILS_LICENSE = GPL-3.0+
 CIFS_UTILS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
diff --git a/package/comix-cursors/comix-cursors.mk b/package/comix-cursors/comix-cursors.mk
index f8e8284..6cc7376 100644
--- a/package/comix-cursors/comix-cursors.mk
+++ b/package/comix-cursors/comix-cursors.mk
@@ -7,7 +7,7 @@
 COMIX_CURSORS_VERSION = 0.8.2
 COMIX_CURSORS_SITE = http://limitland.de/downloads/comixcursors
 COMIX_CURSORS_SOURCE = ComixCursors-$(COMIX_CURSORS_VERSION).tar.bz2
-COMIX_CURSORS_LICENSE = GPLv3
+COMIX_CURSORS_LICENSE = GPL-3.0
 COMIX_CURSORS_STRIP_COMPONENTS = 0
 
 define COMIX_CURSORS_INSTALL_TARGET_CMDS
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 409089c..8c71561 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -7,7 +7,7 @@
 COREUTILS_VERSION = 8.26
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
-COREUTILS_LICENSE = GPLv3+
+COREUTILS_LICENSE = GPL-3.0+
 COREUTILS_LICENSE_FILES = COPYING
 
 # coreutils-01-fix-for-dummy-man-usage.patch triggers autoreconf on build
diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index b0b8fa6..7e8549d 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -8,7 +8,7 @@ CPIO_VERSION = 2.12
 CPIO_SITE = $(BR2_GNU_MIRROR)/cpio
 CPIO_CONF_OPTS = --bindir=/bin
 CPIO_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-CPIO_LICENSE = GPLv3+
+CPIO_LICENSE = GPL-3.0+
 CPIO_LICENSE_FILES = COPYING
 
 # cpio uses argp.h which is not provided by uclibc or musl by default.
diff --git a/package/dc3dd/dc3dd.mk b/package/dc3dd/dc3dd.mk
index fef9093..1ed60a4 100644
--- a/package/dc3dd/dc3dd.mk
+++ b/package/dc3dd/dc3dd.mk
@@ -8,7 +8,7 @@ DC3DD_VERSION_MAJOR = 7.2
 DC3DD_VERSION = $(DC3DD_VERSION_MAJOR).641
 DC3DD_SOURCE = dc3dd-$(DC3DD_VERSION).tar.xz
 DC3DD_SITE = https://downloads.sourceforge.net/project/dc3dd/dc3dd/$(DC3DD_VERSION_MAJOR)
-DC3DD_LICENSE = GPLv3+
+DC3DD_LICENSE = GPL-3.0+
 DC3DD_LICENSE_FILES = COPYING
 # We are patching the Makefile.am
 DC3DD_AUTORECONF = yes
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index d3e608c..dee3fac 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -8,7 +8,7 @@ DIFFUTILS_VERSION = 3.5
 DIFFUTILS_SOURCE = diffutils-$(DIFFUTILS_VERSION).tar.xz
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-DIFFUTILS_LICENSE = GPLv3+
+DIFFUTILS_LICENSE = GPL-3.0+
 DIFFUTILS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index 01ab4f5..a6885f5 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -7,7 +7,7 @@
 DILLO_VERSION = 3.0.5
 DILLO_SOURCE = dillo-$(DILLO_VERSION).tar.bz2
 DILLO_SITE = http://www.dillo.org/download
-DILLO_LICENSE = GPLv3+
+DILLO_LICENSE = GPL-3.0+
 DILLO_LICENSE_FILES = COPYING
 # configure.ac gets patched, so autoreconf is necessary
 DILLO_AUTORECONF = YES
diff --git a/package/ding-libs/ding-libs.mk b/package/ding-libs/ding-libs.mk
index 5b842ff..8a6615d 100644
--- a/package/ding-libs/ding-libs.mk
+++ b/package/ding-libs/ding-libs.mk
@@ -11,7 +11,7 @@ DING_LIBS_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 DING_LIBS_INSTALL_STAGING = YES
-DING_LIBS_LICENSE = LGPLv3+ (library),GPLv3+ (test programs)
+DING_LIBS_LICENSE = LGPLv3+ (library),GPL-3.0+ (test programs)
 DING_LIBS_LICENSE_FILES = COPYING COPYING.LESSER
 
 # autoconf/automake generated files not present in tarball
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 53a69d5..c6f15e2 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -11,7 +11,7 @@ DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
 DNSMASQ_MAKE_OPTS = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
 DNSMASQ_MAKE_OPTS += DESTDIR=$(TARGET_DIR) LDFLAGS="$(TARGET_LDFLAGS)"
 DNSMASQ_DEPENDENCIES = host-pkgconf
-DNSMASQ_LICENSE = GPL-2.0 or GPLv3
+DNSMASQ_LICENSE = GPL-2.0 or GPL-3.0
 DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
 
 ifneq ($(BR2_PACKAGE_DNSMASQ_DHCP),y)
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 48cdbc4..59731b5 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -6,7 +6,7 @@
 
 DOMOTICZ_VERSION = 3.5877
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
-DOMOTICZ_LICENSE = GPLv3
+DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
 DOMOTICZ_DEPENDENCIES = \
 	boost \
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 67c6f73..c2e1690 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -7,7 +7,7 @@
 DOSFSTOOLS_VERSION = 4.0
 DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.xz
 DOSFSTOOLS_SITE = https://github.com/dosfstools/dosfstools/releases/download/v$(DOSFSTOOLS_VERSION)
-DOSFSTOOLS_LICENSE = GPLv3+
+DOSFSTOOLS_LICENSE = GPL-3.0+
 DOSFSTOOLS_LICENSE_FILES = COPYING
 DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks --exec-prefix=/
 HOST_DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 33323be..ada0316 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -10,7 +10,7 @@ ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_CONF_OPTS = \
 	CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)"
-ED_LICENSE = GPLv3+
+ED_LICENSE = GPL-3.0+
 ED_LICENSE_FILES = COPYING
 
 define ED_CONFIGURE_CMDS
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index be6e626..a7800b9 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -74,7 +74,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_ELFUTILS_PROGS),y)
 ELFUTILS_CONF_OPTS += --enable-progs
-ELFUTILS_LICENSE := $(ELFUTILS_LICENSE), GPLv3+ (programs)
+ELFUTILS_LICENSE := $(ELFUTILS_LICENSE), GPL-3.0+ (programs)
 ELFUTILS_LICENSE_FILES += COPYING
 else
 ELFUTILS_CONF_OPTS += --disable-progs
diff --git a/package/enscript/enscript.mk b/package/enscript/enscript.mk
index fc2cd41..fbc9e69 100644
--- a/package/enscript/enscript.mk
+++ b/package/enscript/enscript.mk
@@ -6,7 +6,7 @@
 
 ENSCRIPT_VERSION = 1.6.6
 ENSCRIPT_SITE = $(BR2_GNU_MIRROR)/enscript
-ENSCRIPT_LICENSE = GPLv3+
+ENSCRIPT_LICENSE = GPL-3.0+
 ENSCRIPT_LICENSE_FILES = COPYING
 
 # Enable pthread threads if toolchain supports threads
diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
index 734ec30e..226f17f 100644
--- a/package/espeak/espeak.mk
+++ b/package/espeak/espeak.mk
@@ -8,7 +8,7 @@ ESPEAK_VERSION_MAJOR = 1.48
 ESPEAK_VERSION = $(ESPEAK_VERSION_MAJOR).04
 ESPEAK_SOURCE = espeak-$(ESPEAK_VERSION)-source.zip
 ESPEAK_SITE = http://downloads.sourceforge.net/project/espeak/espeak/espeak-$(ESPEAK_VERSION_MAJOR)
-ESPEAK_LICENSE = GPLv3+
+ESPEAK_LICENSE = GPL-3.0+
 ESPEAK_LICENSE_FILES = License.txt
 
 ifeq ($(BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA),y)
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index 4f59789..57f324b 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -7,7 +7,7 @@
 EVEMU_VERSION = 2.5.0
 EVEMU_SITE = http://www.freedesktop.org/software/evemu
 EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.xz
-EVEMU_LICENSE = LGPLv3 (library), GPLv3 (tools)
+EVEMU_LICENSE = LGPLv3 (library), GPL-3.0 (tools)
 EVEMU_LICENSE_FILES = COPYING
 
 # asciidoc used to generate manpages, which we don't need, and if it's
diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index 259c2da..622c181 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -6,7 +6,7 @@
 
 EXFAT_UTILS_VERSION = 1.2.4
 EXFAT_UTILS_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_UTILS_VERSION)
-EXFAT_UTILS_LICENSE = GPLv3+
+EXFAT_UTILS_LICENSE = GPL-3.0+
 EXFAT_UTILS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index 84b6001..ae89217 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -8,7 +8,7 @@ EXFAT_VERSION = 1.2.4
 EXFAT_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_VERSION)
 EXFAT_SOURCE = fuse-exfat-$(EXFAT_VERSION).tar.gz
 EXFAT_DEPENDENCIES = libfuse host-pkgconf
-EXFAT_LICENSE = GPLv3+
+EXFAT_LICENSE = GPL-3.0+
 EXFAT_LICENSE_FILES = COPYING
 EXFAT_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 731b06a..4aa27a1 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -16,7 +16,7 @@ HOST_FAKEROOT_CONF_ENV = \
 	ac_cv_header_sys_capability_h=no \
 	ac_cv_func_capset=no
 
-FAKEROOT_LICENSE = GPLv3+
+FAKEROOT_LICENSE = GPL-3.0+
 FAKEROOT_LICENSE_FILES = COPYING
 
 $(eval $(host-autotools-package))
diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 8f6b099..6ca0062 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -6,7 +6,7 @@
 
 FINDUTILS_VERSION = 4.6.0
 FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
-FINDUTILS_LICENSE = GPLv3+
+FINDUTILS_LICENSE = GPL-3.0+
 FINDUTILS_LICENSE_FILES = COPYING
 FINDUTILS_CONF_ENV = \
 	gl_cv_func_stdin=yes \
diff --git a/package/ftop/ftop.mk b/package/ftop/ftop.mk
index c8d0f93..d10e9cd 100644
--- a/package/ftop/ftop.mk
+++ b/package/ftop/ftop.mk
@@ -7,7 +7,7 @@
 FTOP_VERSION = 1.0
 FTOP_SITE = http://ftop.googlecode.com/files
 FTOP_DEPENDENCIES = ncurses
-FTOP_LICENSE = GPLv3+
+FTOP_LICENSE = GPL-3.0+
 FTOP_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 7c6689b..a3a2927 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -8,7 +8,7 @@ GAWK_VERSION = 4.1.4
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
-GAWK_LICENSE = GPLv3+
+GAWK_LICENSE = GPL-3.0+
 GAWK_LICENSE_FILES = COPYING
 
 # Prefer full-blown gawk over busybox awk
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 8067b63..f2315a9 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -20,7 +20,7 @@ GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
 endif
 
-GDB_LICENSE = GPL-2.0+, LGPLv2+, GPLv3+, LGPLv3+
+GDB_LICENSE = GPL-2.0+, LGPLv2+, GPL-3.0+, LGPLv3+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 
 # We only want gdbserver and not the entire debugger.
diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 55ece88..72f958d 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -6,7 +6,7 @@
 
 GDBM_VERSION = 1.12
 GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
-GDBM_LICENSE = GPLv3+
+GDBM_LICENSE = GPL-3.0+
 GDBM_LICENSE_FILES = COPYING
 GDBM_INSTALL_STAGING = YES
 
diff --git a/package/gengetopt/gengetopt.mk b/package/gengetopt/gengetopt.mk
index b7cbc7f..e7c49ba 100644
--- a/package/gengetopt/gengetopt.mk
+++ b/package/gengetopt/gengetopt.mk
@@ -6,7 +6,7 @@
 
 GENGETOPT_VERSION = 2.22.6
 GENGETOPT_SITE = $(BR2_GNU_MIRROR)/gengetopt
-GENGETOPT_LICENSE = GPLv3+
+GENGETOPT_LICENSE = GPL-3.0+
 GENGETOPT_LICENSE_FILES = COPYING LICENSE
 
 # Parallel build broken
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 1435388..34d8928 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -8,7 +8,7 @@ GETTEXT_VERSION = 0.19.8.1
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_SOURCE = gettext-$(GETTEXT_VERSION).tar.xz
 GETTEXT_INSTALL_STAGING = YES
-GETTEXT_LICENSE = LGPLv2.1+ (libintl), GPLv3+ (the rest)
+GETTEXT_LICENSE = LGPLv2.1+ (libintl), GPL-3.0+ (the rest)
 GETTEXT_LICENSE_FILES = COPYING gettext-runtime/intl/COPYING.LIB
 
 GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
diff --git a/package/git-crypt/git-crypt.mk b/package/git-crypt/git-crypt.mk
index 7785ddc..6cae456 100644
--- a/package/git-crypt/git-crypt.mk
+++ b/package/git-crypt/git-crypt.mk
@@ -7,7 +7,7 @@
 GIT_CRYPT_VERSION = 0.5.0
 GIT_CRYPT_SITE = https://www.agwa.name/projects/git-crypt/downloads
 GIT_CRYPT_DEPENDENCIES = host-pkgconf openssl
-GIT_CRYPT_LICENSE = GPLv3+, MIT
+GIT_CRYPT_LICENSE = GPL-3.0+, MIT
 GIT_CRYPT_LICENSE_FILES = COPYING parse_options.hpp
 
 GIT_CRYPT_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index c7cefeb..4edc713 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -6,7 +6,7 @@
 
 GLMARK2_VERSION = 7215c0f337dae0b232535549c37fca441747a891
 GLMARK2_SITE = $(call github,glmark2,glmark2,$(GLMARK2_VERSION))
-GLMARK2_LICENSE = GPLv3+, SGIv1
+GLMARK2_LICENSE = GPL-3.0+, SGIv1
 GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
 GLMARK2_DEPENDENCIES = host-pkgconf jpeg libpng \
 	$(if $(BR2_PACKAGE_HAS_LIBEGL),libegl) \
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index 182abd6..caa9d2c 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -7,7 +7,7 @@
 GNUPG_VERSION = 1.4.21
 GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
 GNUPG_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
-GNUPG_LICENSE = GPLv3+
+GNUPG_LICENSE = GPL-3.0+
 GNUPG_LICENSE_FILES = COPYING
 GNUPG_DEPENDENCIES = zlib ncurses $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 GNUPG_CONF_ENV = ac_cv_sys_symbol_underscore=no
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 3932c3a..c310f93 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -7,7 +7,7 @@
 GNUPG2_VERSION = 2.1.19
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
-GNUPG2_LICENSE = GPLv3+
+GNUPG2_LICENSE = GPL-3.0+
 GNUPG2_LICENSE_FILES = COPYING
 GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libnpth \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index f1817f6..dbd8ee2 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -6,7 +6,7 @@
 
 GNURADIO_VERSION = 3.7.9.1
 GNURADIO_SITE = http://gnuradio.org/releases/gnuradio
-GNURADIO_LICENSE = GPLv3+
+GNURADIO_LICENSE = GPL-3.0+
 GNURADIO_LICENSE_FILES = COPYING
 
 GNURADIO_SUPPORTS_IN_SOURCE_BUILD = NO
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index be1cf00..1d89b08 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -8,7 +8,7 @@ GNUTLS_VERSION_MAJOR = 3.5
 GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).10
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
-GNUTLS_LICENSE = LGPLv2.1+ (core library), GPLv3+ (gnutls-openssl library)
+GNUTLS_LICENSE = LGPLv2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
 GNUTLS_LICENSE_FILES = doc/COPYING doc/COPYING.LESSER
 GNUTLS_DEPENDENCIES = host-pkgconf libunistring libtasn1 nettle pcre
 GNUTLS_CONF_OPTS = \
diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index 8ce3c95..2a6192a 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -6,7 +6,7 @@
 
 GPERF_VERSION = 3.0.4
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
-GPERF_LICENSE = GPLv3+
+GPERF_LICENSE = GPL-3.0+
 GPERF_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/gqrx/gqrx.mk b/package/gqrx/gqrx.mk
index b591e60..12e79ed 100644
--- a/package/gqrx/gqrx.mk
+++ b/package/gqrx/gqrx.mk
@@ -6,7 +6,7 @@
 
 GQRX_VERSION = v2.6
 GQRX_SITE = $(call github,csete,gqrx,$(GQRX_VERSION))
-GQRX_LICENSE = GPLv3+, Apache-2.0
+GQRX_LICENSE = GPL-3.0+, Apache-2.0
 GQRX_LICENSE_FILES = COPYING LICENSE-CTK
 GQRX_DEPENDENCIES = boost gnuradio gr-osmosdr qt5base qt5svg
 
diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index d7c3d62..55e043e 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -6,7 +6,7 @@
 
 GR_OSMOSDR_VERSION = 164a09fc11cec2d8b15b38e8b512fa542d6cecc7
 GR_OSMOSDR_SITE = $(call github,osmocom,gr-osmosdr,$(GR_OSMOSDR_VERSION))
-GR_OSMOSDR_LICENSE = GPLv3+
+GR_OSMOSDR_LICENSE = GPL-3.0+
 GR_OSMOSDR_LICENSE_FILES = COPYING
 
 # gr-osmosdr prevents doing an in-source-tree build
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 7468831..92a915c 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -7,7 +7,7 @@
 GREP_VERSION = 3.0
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
-GREP_LICENSE = GPLv3+
+GREP_LICENSE = GPL-3.0+
 GREP_LICENSE_FILES = COPYING
 GREP_CONF_OPTS = --disable-perl-regexp \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index 0ad5377..3dd4904 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -7,7 +7,7 @@
 GSL_VERSION = 1.16
 GSL_SITE = $(BR2_GNU_MIRROR)/gsl
 GSL_INSTALL_STAGING = YES
-GSL_LICENSE = GPLv3
+GSL_LICENSE = GPL-3.0
 GSL_LICENSE_FILES = COPYING
 GSL_CONFIG_SCRIPTS = gsl-config
 
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index e178dbc..9757f16 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -12,7 +12,7 @@ GST_FFMPEG_DEPENDENCIES = host-pkgconf gstreamer gst-plugins-base
 
 ifeq ($(BR2_PACKAGE_GST_FFMPEG_GPL),y)
 GST_FFMPEG_CONF_OPTS += --disable-lgpl
-GST_FFMPEG_LICENSE = GPL-2.0+ (gst-ffmpeg), GPL-2.0+/GPLv3+ (libav)
+GST_FFMPEG_LICENSE = GPL-2.0+ (gst-ffmpeg), GPL-2.0+/GPL-3.0+ (libav)
 GST_FFMPEG_LICENSE_FILES = COPYING gst-libs/ext/libav/COPYING.GPLv2 gst-libs/ext/libav/COPYING.GPLv3
 else
 GST_FFMPEG_CONF_OPTS += --enable-lgpl
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index c4e91b0..26fc8ec 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -11,7 +11,7 @@ GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 GZIP_CONF_OPTS = --exec-prefix=/
 # Prefer full gzip over potentially lightweight/slower from busybox
 GZIP_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-GZIP_LICENSE = GPLv3+
+GZIP_LICENSE = GPL-3.0+
 GZIP_LICENSE_FILES = COPYING
 GZIP_CONF_ENV += gl_cv_func_fflush_stdin=yes
 # configure substitutes $(SHELL) for the shell shebang in scripts like
diff --git a/package/hans/hans.mk b/package/hans/hans.mk
index 5111d46..2e1e002 100644
--- a/package/hans/hans.mk
+++ b/package/hans/hans.mk
@@ -6,7 +6,7 @@
 
 HANS_VERSION = 0.4.4
 HANS_SITE = http://downloads.sourceforge.net/project/hanstunnel/source
-HANS_LICENSE = GPLv3+
+HANS_LICENSE = GPL-3.0+
 HANS_LICENSE_FILES = LICENSE
 
 define HANS_BUILD_CMDS
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index 66d69a6..a645557 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -6,7 +6,7 @@
 
 HAVEGED_VERSION = 1.9.1
 HAVEGED_SITE = http://www.issihosts.com/haveged
-HAVEGED_LICENSE = GPLv3+
+HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
diff --git a/package/hidapi/hidapi.mk b/package/hidapi/hidapi.mk
index 9922efc..e4083ce 100644
--- a/package/hidapi/hidapi.mk
+++ b/package/hidapi/hidapi.mk
@@ -11,7 +11,7 @@ HIDAPI_SITE = $(call github,signal11,hidapi,$(HIDAPI_VERSION))
 HIDAPI_INSTALL_STAGING = YES
 # No configure provided, so we need to autoreconf.
 HIDAPI_AUTORECONF = YES
-HIDAPI_LICENSE = GPLv3 or BSD-3c or HIDAPI license
+HIDAPI_LICENSE = GPL-3.0 or BSD-3c or HIDAPI license
 HIDAPI_LICENSE_FILES = LICENSE.txt LICENSE-gpl3.txt LICENSE-bsd.txt LICENSE-orig.txt
 
 HIDAPI_DEPENDENCIES = libusb libgudev
diff --git a/package/ifenslave/ifenslave.mk b/package/ifenslave/ifenslave.mk
index 1b82312..4030d22 100644
--- a/package/ifenslave/ifenslave.mk
+++ b/package/ifenslave/ifenslave.mk
@@ -7,7 +7,7 @@
 IFENSLAVE_VERSION = 2.9
 IFENSLAVE_SOURCE = ifenslave_$(IFENSLAVE_VERSION).tar.xz
 IFENSLAVE_SITE = http://snapshot.debian.org/archive/debian/20170102T091407Z/pool/main/i/ifenslave
-IFENSLAVE_LICENSE = GPLv3+
+IFENSLAVE_LICENSE = GPL-3.0+
 IFENSLAVE_LICENSE_FILES = debian/copyright
 IFENSLAVE_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index f58db81..7c35bfb 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -6,7 +6,7 @@
 
 JANUS_GATEWAY_VERSION = v0.2.2
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,$(JANUS_GATEWAY_VERSION))
-JANUS_GATEWAY_LICENSE = GPLv3
+JANUS_GATEWAY_LICENSE = GPL-3.0
 JANUS_GATEWAY_LICENSE_FILES = COPYING
 
 # ding-libs provides the ini_config library
diff --git a/package/kodi-adsp-basic/kodi-adsp-basic.mk b/package/kodi-adsp-basic/kodi-adsp-basic.mk
index 0b1ba95..f51594e 100644
--- a/package/kodi-adsp-basic/kodi-adsp-basic.mk
+++ b/package/kodi-adsp-basic/kodi-adsp-basic.mk
@@ -6,7 +6,7 @@
 
 KODI_ADSP_BASIC_VERSION = cb56e0eb6530fd50a286d47ef0be529001e9d556
 KODI_ADSP_BASIC_SITE = $(call github,kodi-adsp,adsp.basic,$(KODI_ADSP_BASIC_VERSION))
-KODI_ADSP_BASIC_LICENSE = GPLv3+
+KODI_ADSP_BASIC_LICENSE = GPL-3.0+
 KODI_ADSP_BASIC_LICENSE_FILES = LICENSE.md
 KODI_ADSP_BASIC_DEPENDENCIES = libplatform kodi-platform
 
diff --git a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
index 49cf673..c387d89 100644
--- a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
+++ b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
@@ -6,7 +6,7 @@
 
 KODI_ADSP_FREESURROUND_VERSION = 08b691d3d9a0382d2f6f789a31614fb02512036c
 KODI_ADSP_FREESURROUND_SITE = $(call github,kodi-adsp,adsp.freesurround,$(KODI_ADSP_FREESURROUND_VERSION))
-KODI_ADSP_FREESURROUND_LICENSE = GPLv3+
+KODI_ADSP_FREESURROUND_LICENSE = GPL-3.0+
 KODI_ADSP_FREESURROUND_LICENSE_FILES = LICENSE.md
 KODI_ADSP_FREESURROUND_DEPENDENCIES = libplatform kodi-platform
 
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index 7df6c22..2cd94da 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -6,7 +6,7 @@
 
 KODI_SCREENSAVER_RSXS_VERSION = 195e0ec3fbbcb2ee2012cd560e42d05167f0f259
 KODI_SCREENSAVER_RSXS_SITE = $(call github,notspiff,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
-KODI_SCREENSAVER_RSXS_LICENSE = GPLv3
+KODI_SCREENSAVER_RSXS_LICENSE = GPL-3.0
 KODI_SCREENSAVER_RSXS_LICENSE_FILES = lib/rsxs-1.0/COPYING
 
 KODI_SCREENSAVER_RSXS_DEPENDENCIES = kodi xlib_libXmu
diff --git a/package/lensfun/lensfun.mk b/package/lensfun/lensfun.mk
index 8e92e59..c2b7ea4 100644
--- a/package/lensfun/lensfun.mk
+++ b/package/lensfun/lensfun.mk
@@ -6,7 +6,7 @@
 
 LENSFUN_VERSION = 0.3.2
 LENSFUN_SITE = https://sourceforge.net/projects/lensfun/files/$(LENSFUN_VERSION)
-LENSFUN_LICENSE = LGPLv3+ (libraries), GPLv3+ (programs)
+LENSFUN_LICENSE = LGPLv3+ (libraries), GPL-3.0+ (programs)
 LENSFUN_LICENSE_FILES = docs/gpl-3.0.txt docs/lgpl-3.0.txt
 LENSFUN_INSTALL_STAGING = YES
 LENSFUN_DEPENDENCIES = libglib2
diff --git a/package/less/less.mk b/package/less/less.mk
index c217543..2102d3c 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -6,7 +6,7 @@
 
 LESS_VERSION = 481
 LESS_SITE = $(BR2_GNU_MIRROR)/less
-LESS_LICENSE = GPLv3+
+LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
 # Build after busybox, full-blown is better
 LESS_DEPENDENCIES = ncurses $(if $(BR2_PACKAGE_BUSYBOX),busybox)
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index a7e1f92..e658d59 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -7,7 +7,7 @@
 LFTP_VERSION = 4.7.4
 LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
-LFTP_LICENSE = GPLv3+
+LFTP_LICENSE = GPL-3.0+
 LFTP_LICENSE_FILES = COPYING
 # Needed so that our libtool patch applies properly, and for patch
 # 0001-fix-static-link-with-readline.patch.
diff --git a/package/libasplib/libasplib.mk b/package/libasplib/libasplib.mk
index 558d173..e13945c 100644
--- a/package/libasplib/libasplib.mk
+++ b/package/libasplib/libasplib.mk
@@ -6,7 +6,7 @@
 
 LIBASPLIB_VERSION = be7fac89218a84b75f7598e3d76625ece99296f2
 LIBASPLIB_SITE = $(call github,AchimTuran,asplib,$(LIBASPLIB_VERSION))
-LIBASPLIB_LICENSE = GPLv3+
+LIBASPLIB_LICENSE = GPL-3.0+
 LIBASPLIB_LICENSE_FILES = LICENSE
 LIBASPLIB_INSTALL_STAGING = YES
 
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index c4d2e4f..8c74e2b 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -7,7 +7,7 @@
 LIBASSUAN_VERSION = 2.4.3
 LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
-LIBASSUAN_LICENSE = LGPLv2.1+ (library), GPLv3 (tests, doc)
+LIBASSUAN_LICENSE = LGPLv2.1+ (library), GPL-3.0 (tests, doc)
 LIBASSUAN_LICENSE_FILES = COPYING.LIB COPYING
 LIBASSUAN_INSTALL_STAGING = YES
 LIBASSUAN_DEPENDENCIES = libgpg-error
diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index 4a7c674..f0fc335 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -7,7 +7,7 @@
 LIBCDIO_VERSION = 0.94
 LIBCDIO_SITE = $(BR2_GNU_MIRROR)/libcdio
 LIBCDIO_INSTALL_STAGING = YES
-LIBCDIO_LICENSE = GPLv3+
+LIBCDIO_LICENSE = GPL-3.0+
 LIBCDIO_LICENSE_FILES = COPYING
 LIBCDIO_CONF_OPTS = --disable-example-progs --disable-cddb
 
diff --git a/package/libfreeimage/libfreeimage.mk b/package/libfreeimage/libfreeimage.mk
index e6790b1..cd73f5a 100644
--- a/package/libfreeimage/libfreeimage.mk
+++ b/package/libfreeimage/libfreeimage.mk
@@ -7,7 +7,7 @@
 LIBFREEIMAGE_VERSION = 3.17.0
 LIBFREEIMAGE_SITE = http://downloads.sourceforge.net/freeimage
 LIBFREEIMAGE_SOURCE = FreeImage$(subst .,,$(LIBFREEIMAGE_VERSION)).zip
-LIBFREEIMAGE_LICENSE = GPL-2.0 or GPLv3 or FreeImage Public License
+LIBFREEIMAGE_LICENSE = GPL-2.0 or GPL-3.0 or FreeImage Public License
 LIBFREEIMAGE_LICENSE_FILES = license-gplv2.txt license-gplv3.txt license-fi.txt
 LIBFREEIMAGE_INSTALL_STAGING = YES
 
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index bc9c6ec..0947a4a 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -6,7 +6,7 @@
 
 LIBGPIOD_VERSION = v0.1.3
 LIBGPIOD_SITE = $(call github,brgl,libgpiod,$(LIBGPIOD_VERSION))
-LIBGPIOD_LICENSE = GPLv3+
+LIBGPIOD_LICENSE = GPL-3.0+
 LIBGPIOD_LICENSE_FILES = COPYING
 # fetched from github, no configure script provided
 LIBGPIOD_AUTORECONF = YES
diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
index 00ce8e0..057138d 100644
--- a/package/libgsasl/libgsasl.mk
+++ b/package/libgsasl/libgsasl.mk
@@ -6,7 +6,7 @@
 
 LIBGSASL_VERSION = 1.8.0
 LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
-LIBGSASL_LICENSE = LGPLv2.1+ (library), GPLv3+ (programs)
+LIBGSASL_LICENSE = LGPLv2.1+ (library), GPL-3.0+ (programs)
 LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING
 LIBGSASL_INSTALL_STAGING = YES
 # It doesn't seem to build with our libgcrypt so better be safe
diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index f014da0..26fa154 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -7,7 +7,7 @@
 LIBICONV_VERSION = 1.14
 LIBICONV_SITE = $(BR2_GNU_MIRROR)/libiconv
 LIBICONV_INSTALL_STAGING = YES
-LIBICONV_LICENSE = GPLv3+ (iconv program), LGPLv2+ (library)
+LIBICONV_LICENSE = GPL-3.0+ (iconv program), LGPLv2+ (library)
 LIBICONV_LICENSE_FILES = COPYING COPYING.LIB
 
 # Don't build the preloadable library, as we don't need it (it's only
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index d348665..8145e08 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -10,7 +10,7 @@ LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
 LIBIDN_CONF_OPTS = --disable-java --enable-csharp=no
 LIBIDN_DEPENDENCIES = host-pkgconf $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-LIBIDN_LICENSE = GPL-2.0+, GPLv3+, LGPLv3+
+LIBIDN_LICENSE = GPL-2.0+, GPL-3.0+, LGPLv3+
 LIBIDN_LICENSE_FILES = COPYINGv2 COPYINGv3 COPYING.LESSERv3
 
 define LIBIDN_REMOVE_BINARY
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index 58d0ff3..1a72cfd 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -7,7 +7,7 @@
 LIBKSBA_VERSION = 1.3.5
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
-LIBKSBA_LICENSE = LGPLv3+ or GPL-2.0+ (library, headers), GPLv3+ (manual, tests, build system)
+LIBKSBA_LICENSE = LGPLv3+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
 LIBKSBA_LICENSE_FILES = AUTHORS COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv3
 LIBKSBA_INSTALL_STAGING = YES
 LIBKSBA_DEPENDENCIES = libgpg-error
diff --git a/package/libllcp/libllcp.mk b/package/libllcp/libllcp.mk
index 2c2014a..ad4fca6 100644
--- a/package/libllcp/libllcp.mk
+++ b/package/libllcp/libllcp.mk
@@ -10,7 +10,7 @@ LIBLLCP_DEPENDENCIES = host-pkgconf libnfc
 # There's no ./configure in the repository, so we need to autoreconf
 LIBLLCP_AUTORECONF = YES
 LIBLLCP_INSTALL_STAGING = YES
-LIBLLCP_LICENSE = GPLv3+
+LIBLLCP_LICENSE = GPL-3.0+
 LIBLLCP_LICENSE_FILES = COPYING
 # ensure graphviz isn't used
 LIBLLCP_CONF_ENV = ac_cv_path_DOT=
diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index e4e079d..9137165 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -6,7 +6,7 @@
 
 LIBSIGROK_VERSION = 0.4.0
 LIBSIGROK_SITE = http://sigrok.org/download/source/libsigrok
-LIBSIGROK_LICENSE = GPLv3+
+LIBSIGROK_LICENSE = GPL-3.0+
 LIBSIGROK_LICENSE_FILES = COPYING
 LIBSIGROK_INSTALL_STAGING = YES
 LIBSIGROK_DEPENDENCIES = libglib2 libzip host-pkgconf
diff --git a/package/libsigrokdecode/libsigrokdecode.mk b/package/libsigrokdecode/libsigrokdecode.mk
index 7006b0c..ac53e7e 100644
--- a/package/libsigrokdecode/libsigrokdecode.mk
+++ b/package/libsigrokdecode/libsigrokdecode.mk
@@ -6,7 +6,7 @@
 
 LIBSIGROKDECODE_VERSION = 0.4.1
 LIBSIGROKDECODE_SITE = http://sigrok.org/download/source/libsigrokdecode
-LIBSIGROKDECODE_LICENSE = GPLv3+
+LIBSIGROKDECODE_LICENSE = GPL-3.0+
 LIBSIGROKDECODE_LICENSE_FILES = COPYING
 LIBSIGROKDECODE_INSTALL_STAGING = YES
 LIBSIGROKDECODE_DEPENDENCIES = host-pkgconf libglib2 python3
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index 60e29d3..0dd7c89 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -9,7 +9,7 @@ LIBSTROPHE_SITE = $(call github,strophe,libstrophe,$(LIBSTROPHE_VERSION))
 LIBSTROPHE_DEPENDENCIES = openssl host-pkgconf
 # Doesn't ship configure
 LIBSTROPHE_AUTORECONF = YES
-LIBSTROPHE_LICENSE = MIT or GPLv3
+LIBSTROPHE_LICENSE = MIT or GPL-3.0
 LIBSTROPHE_LICENSE_FILES = MIT-LICENSE.txt GPL-LICENSE.txt
 LIBSTROPHE_INSTALL_STAGING = YES
 LIBSTROPHE_PATCH = https://github.com/msantos/libstrophe/commit/b08766c8e46956daba010044b00c97f78b598780.patch
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index ac99868..f471a51 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -7,7 +7,7 @@
 LIBTASN1_VERSION = 4.9
 LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison
-LIBTASN1_LICENSE = GPLv3+ (tests, tools), LGPLv2.1+ (library)
+LIBTASN1_LICENSE = GPL-3.0+ (tests, tools), LGPLv2.1+ (library)
 LIBTASN1_LICENSE_FILES = COPYING COPYING.LIB
 LIBTASN1_INSTALL_STAGING = YES
 # 'missing' fallback logic botched so disable it completely
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 9092c79..da2ba35 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -7,7 +7,7 @@
 LIBURCU_VERSION = 0.9.2
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
-LIBURCU_LICENSE = LGPLv2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPLv3 (few *.m4 files)
+LIBURCU_LICENSE = LGPLv2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPL-3.0 (few *.m4 files)
 LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt gpl-2.0.txt LICENSE
 
 LIBURCU_INSTALL_STAGING = YES
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index d53f7cb..849e7f4 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -7,7 +7,7 @@
 M4_VERSION = 1.4.18
 M4_SOURCE = m4-$(M4_VERSION).tar.xz
 M4_SITE = $(BR2_GNU_MIRROR)/m4
-M4_LICENSE = GPLv3+
+M4_LICENSE = GPL-3.0+
 M4_LICENSE_FILES = COPYING
 HOST_M4_CONF_OPTS = --disable-static
 
diff --git a/package/make/make.mk b/package/make/make.mk
index c51ce3b..41a7023 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -8,7 +8,7 @@ MAKE_VERSION = 4.2.1
 MAKE_SOURCE = make-$(MAKE_VERSION).tar.bz2
 MAKE_SITE = $(BR2_GNU_MIRROR)/make
 MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-MAKE_LICENSE = GPLv3+
+MAKE_LICENSE = GPL-3.0+
 MAKE_LICENSE_FILES = COPYING
 
 MAKE_CONF_OPTS = --without-guile
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index ff4c8ad..8139648 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -7,7 +7,7 @@
 MC_VERSION = 4.8.18
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
-MC_LICENSE = GPLv3+
+MC_LICENSE = GPL-3.0+
 MC_LICENSE_FILES = COPYING
 MC_DEPENDENCIES = libglib2 host-pkgconf
 
diff --git a/package/mcrypt/mcrypt.mk b/package/mcrypt/mcrypt.mk
index b413ffa..03a1719 100644
--- a/package/mcrypt/mcrypt.mk
+++ b/package/mcrypt/mcrypt.mk
@@ -11,7 +11,7 @@ MCRYPT_DEPENDENCIES = libmcrypt libmhash \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 MCRYPT_CONF_OPTS = --with-libmcrypt-prefix=$(STAGING_DIR)/usr
-MCRYPT_LICENSE = GPLv3
+MCRYPT_LICENSE = GPL-3.0
 MCRYPT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/modplugtools/modplugtools.mk b/package/modplugtools/modplugtools.mk
index e8d73af..59a2a52 100644
--- a/package/modplugtools/modplugtools.mk
+++ b/package/modplugtools/modplugtools.mk
@@ -6,7 +6,7 @@
 
 MODPLUGTOOLS_VERSION = 0.5.3
 MODPLUGTOOLS_SITE = http://downloads.sourceforge.net/project/modplug-xmms/modplug-tools
-MODPLUGTOOLS_LICENSE = GPLv3
+MODPLUGTOOLS_LICENSE = GPL-3.0
 MODPLUGTOOLS_LICENSE_FILES = COPYING
 
 MODPLUGTOOLS_DEPENDENCIES = libao libmodplug
diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
index 2cd358b..0da9105 100644
--- a/package/mosh/mosh.mk
+++ b/package/mosh/mosh.mk
@@ -7,7 +7,7 @@
 MOSH_VERSION = 1.2.6
 MOSH_SITE = https://mosh.mit.edu
 MOSH_DEPENDENCIES = zlib ncurses protobuf host-pkgconf
-MOSH_LICENSE = GPLv3+ with exception
+MOSH_LICENSE = GPL-3.0+ with exception
 MOSH_LICENSE_FILES = COPYING COPYING.iOS
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 7ede66c..1821d39 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -12,7 +12,7 @@ MSMTP_CONF_OPTS = \
 	--without-libidn \
 	--disable-gai-idn \
 	--without-libgsasl
-MSMTP_LICENSE = GPLv3+
+MSMTP_LICENSE = GPL-3.0+
 MSMTP_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBSECRET),y)
diff --git a/package/mtdev2tuio/mtdev2tuio.mk b/package/mtdev2tuio/mtdev2tuio.mk
index d2e7040..e9085b0 100644
--- a/package/mtdev2tuio/mtdev2tuio.mk
+++ b/package/mtdev2tuio/mtdev2tuio.mk
@@ -7,7 +7,7 @@
 MTDEV2TUIO_VERSION = e1e7378d86abe751158e743586133022f32fa4d1
 MTDEV2TUIO_SITE = $(call github,olivopaolo,mtdev2tuio,$(MTDEV2TUIO_VERSION))
 MTDEV2TUIO_DEPENDENCIES = mtdev liblo
-MTDEV2TUIO_LICENSE = GPLv3+
+MTDEV2TUIO_LICENSE = GPL-3.0+
 MTDEV2TUIO_LICENSE_FILES = COPYING
 
 # mtdev2tuio Makefile misuses $(LD) as gcc, so we need to override LD
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index adba1fc..5db548f 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -7,7 +7,7 @@
 MTOOLS_VERSION = 4.0.18
 MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.bz2
 MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
-MTOOLS_LICENSE = GPLv3+
+MTOOLS_LICENSE = GPL-3.0+
 MTOOLS_LICENSE_FILES = COPYING
 MTOOLS_CONF_OPTS = --without-x
 # info documentation not needed
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 4632bed..c20e231 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -8,7 +8,7 @@ NANO_VERSION_MAJOR = 2.7
 NANO_VERSION = $(NANO_VERSION_MAJOR).4
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
-NANO_LICENSE = GPLv3+
+NANO_LICENSE = GPL-3.0+
 NANO_LICENSE_FILES = COPYING
 NANO_CONF_OPTS = \
 	--without-slang \
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index 4797a8e..8326fc7 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -9,7 +9,7 @@ NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
 NDISC6_SITE = http://www.remlab.net/files/ndisc6
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99"
 NDISC6_CONF_OPTS = --disable-rpath --disable-suid-install
-NDISC6_LICENSE = GPL-2.0 or GPLv3
+NDISC6_LICENSE = GPL-2.0 or GPL-3.0
 NDISC6_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
diff --git a/package/nmon/nmon.mk b/package/nmon/nmon.mk
index 9b9f889..2c1ff02 100644
--- a/package/nmon/nmon.mk
+++ b/package/nmon/nmon.mk
@@ -7,7 +7,7 @@
 NMON_VERSION = 16f
 NMON_SITE = http://sourceforge.net/projects/nmon/files
 NMON_SOURCE = lmon$(NMON_VERSION).c
-NMON_LICENSE = GPLv3+
+NMON_LICENSE = GPL-3.0+
 NMON_LICENSE_FILES = $(NMON_SOURCE)
 NMON_DEPENDENCIES = ncurses
 NMON_CFLAGS = $(TARGET_CFLAGS) -D JFS -D GETUSER -D LARGEMEM -D DEBIAN
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 8cd4184..332ccf9 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -7,7 +7,7 @@
 NUT_VERSION_MAJOR = 2.7
 NUT_VERSION = $(NUT_VERSION_MAJOR).4
 NUT_SITE = http://www.networkupstools.org/source/$(NUT_VERSION_MAJOR)
-NUT_LICENSE = GPL-2.0+, GPLv3+ (python scripts), GPL/Artistic (perl client)
+NUT_LICENSE = GPL-2.0+, GPL-3.0+ (python scripts), GPL/Artistic (perl client)
 NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
 NUT_DEPENDENCIES = host-pkgconf
 
diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
index 54b607c..3a858ef 100644
--- a/package/ocrad/ocrad.mk
+++ b/package/ocrad/ocrad.mk
@@ -7,7 +7,7 @@
 OCRAD_VERSION = 0.25
 OCRAD_SOURCE = ocrad-$(OCRAD_VERSION).tar.lz
 OCRAD_SITE = $(BR2_GNU_MIRROR)/ocrad
-OCRAD_LICENSE = GPLv3+
+OCRAD_LICENSE = GPL-3.0+
 OCRAD_LICENSE_FILES = COPYING
 OCRAD_INSTALL_STAGING = YES
 
diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
index 199d9e1..5f480e9 100644
--- a/package/openzwave/openzwave.mk
+++ b/package/openzwave/openzwave.mk
@@ -6,7 +6,7 @@
 
 OPENZWAVE_VERSION = V1.5
 OPENZWAVE_SITE = $(call github,OpenZWave,open-zwave,$(OPENZWAVE_VERSION))
-OPENZWAVE_LICENSE = LGPLv3+, GPLv3 (examples), Apache-2.0 (sh2ju.sh)
+OPENZWAVE_LICENSE = LGPLv3+, GPL-3.0 (examples), Apache-2.0 (sh2ju.sh)
 OPENZWAVE_LICENSE_FILES = license/license.txt license/lgpl.txt \
 	license/gpl.txt license/Apache-License-2.0.txt
 
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index dc7ff2b..f88143b 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -12,7 +12,7 @@ PARTED_INSTALL_STAGING = YES
 # For uclinux patch
 PARTED_AUTORECONF = YES
 PARTED_GETTEXTIZE = YES
-PARTED_LICENSE = GPLv3+
+PARTED_LICENSE = GPL-3.0+
 PARTED_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 3a94252..4c76a31 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -7,7 +7,7 @@
 PATCH_VERSION = 2.7.5
 PATCH_SOURCE = patch-$(PATCH_VERSION).tar.xz
 PATCH_SITE = $(BR2_GNU_MIRROR)/patch
-PATCH_LICENSE = GPLv3+
+PATCH_LICENSE = GPL-3.0+
 PATCH_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_ATTR),y)
diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
index cf2e43a..74e6ccc 100644
--- a/package/patchelf/patchelf.mk
+++ b/package/patchelf/patchelf.mk
@@ -7,7 +7,7 @@
 PATCHELF_VERSION = 0.9
 PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-$(PATCHELF_VERSION)
 PATCHELF_SOURCE = patchelf-$(PATCHELF_VERSION).tar.bz2
-PATCHELF_LICENSE = GPLv3+
+PATCHELF_LICENSE = GPL-3.0+
 PATCHELF_LICENSE_FILES = COPYING
 
 $(eval $(host-autotools-package))
diff --git a/package/pifmrds/pifmrds.mk b/package/pifmrds/pifmrds.mk
index a30c013..509ec80 100644
--- a/package/pifmrds/pifmrds.mk
+++ b/package/pifmrds/pifmrds.mk
@@ -7,7 +7,7 @@
 PIFMRDS_VERSION = 0bf57f9ce0d954365a38d8af8e7be6f28521c3f2
 PIFMRDS_SITE = $(call github,ChristopheJacquet,PiFmRds,$(PIFMRDS_VERSION))
 PIFMRDS_DEPENDENCIES = libsndfile
-PIFMRDS_LICENSE = GPLv3+
+PIFMRDS_LICENSE = GPL-3.0+
 PIFMRDS_LICENSE_FILES = LICENSE
 
 define PIFMRDS_BUILD_CMDS
diff --git a/package/pound/pound.mk b/package/pound/pound.mk
index 4086642..6f7cc84 100644
--- a/package/pound/pound.mk
+++ b/package/pound/pound.mk
@@ -7,7 +7,7 @@
 POUND_VERSION = 2.7
 POUND_SITE = http://www.apsis.ch/pound
 POUND_SOURCE = Pound-$(POUND_VERSION).tgz
-POUND_LICENSE = GPLv3+
+POUND_LICENSE = GPL-3.0+
 POUND_LICENSE_FILES = GPL.txt
 POUND_DEPENDENCIES = openssl
 
diff --git a/package/pulseview/pulseview.mk b/package/pulseview/pulseview.mk
index cc97187..fbcf451 100644
--- a/package/pulseview/pulseview.mk
+++ b/package/pulseview/pulseview.mk
@@ -8,7 +8,7 @@
 
 PULSEVIEW_VERSION = 0.3.0
 PULSEVIEW_SITE = http://sigrok.org/download/source/pulseview
-PULSEVIEW_LICENSE = GPLv3+
+PULSEVIEW_LICENSE = GPL-3.0+
 PULSEVIEW_LICENSE_FILES = COPYING
 PULSEVIEW_DEPENDENCIES = libsigrok qt5base qt5svg boost
 PULSEVIEW_CONF_OPTS = -DDISABLE_WERROR=TRUE
diff --git a/package/python-daemon/python-daemon.mk b/package/python-daemon/python-daemon.mk
index 648d549..76820b7 100644
--- a/package/python-daemon/python-daemon.mk
+++ b/package/python-daemon/python-daemon.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DAEMON_VERSION = 2.1.1
 PYTHON_DAEMON_SITE = https://pypi.python.org/packages/source/p/python-daemon
-PYTHON_DAEMON_LICENSE = Apache-2.0 (library), GPLv3+ (test, build)
+PYTHON_DAEMON_LICENSE = Apache-2.0 (library), GPL-3.0+ (test, build)
 PYTHON_DAEMON_LICENSE_FILES = LICENSE.ASF-2 LICENSE.GPL-3
 PYTHON_DAEMON_SETUP_TYPE = setuptools
 PYTHON_DAEMON_DEPENDENCIES = host-python-docutils
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index 070d805..544165a 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -7,7 +7,7 @@
 PYTHON_DOCUTILS_VERSION = 0.13.1
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
 PYTHON_DOCUTILS_SITE = https://pypi.python.org/packages/05/25/7b5484aca5d46915493f1fd4ecb63c38c333bd32aa9ad6e19da8d08895ae
-PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2c, GPLv3 (emacs mode), other
+PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2c, GPL-3.0 (emacs mode), other
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.txt
 PYTHON_DOCUTILS_SETUP_TYPE = distutils
 
diff --git a/package/python-enum/python-enum.mk b/package/python-enum/python-enum.mk
index aac9328..ea602e4 100644
--- a/package/python-enum/python-enum.mk
+++ b/package/python-enum/python-enum.mk
@@ -8,7 +8,7 @@ PYTHON_ENUM_VERSION = 0.4.6
 PYTHON_ENUM_SOURCE = enum-$(PYTHON_ENUM_VERSION).tar.gz
 PYTHON_ENUM_SITE = https://pypi.python.org/packages/0c/4e/1ea357e7783c756bb579333c1e4a026fb331371ee771f616ffedc781e531
 PYTHON_ENUM_SETUP_TYPE = setuptools
-PYTHON_ENUM_LICENSE = GPLv3+
+PYTHON_ENUM_LICENSE = GPL-3.0+
 PYTHON_ENUM_LICENSE_FILES = LICENSE.GPL-3
 
 $(eval $(python-package))
diff --git a/package/python-mwscrape2slob/python-mwscrape2slob.mk b/package/python-mwscrape2slob/python-mwscrape2slob.mk
index 4d27d8d..519f5e5 100644
--- a/package/python-mwscrape2slob/python-mwscrape2slob.mk
+++ b/package/python-mwscrape2slob/python-mwscrape2slob.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MWSCRAPE2SLOB_VERSION = 0f9124ed62009dff6a230947d80340f5a61a6f49
 PYTHON_MWSCRAPE2SLOB_SITE = $(call github,itkach,mwscrape2slob,$(PYTHON_MWSCRAPE2SLOB_VERSION))
-PYTHON_MWSCRAPE2SLOB_LICENSE = GPLv3, Apache-2.0 (MathJax), GPL (MediaWiki monobook style sheet)
+PYTHON_MWSCRAPE2SLOB_LICENSE = GPL-3.0, Apache-2.0 (MathJax), GPL (MediaWiki monobook style sheet)
 PYTHON_MWSCRAPE2SLOB_SETUP_TYPE = distutils
 
 $(eval $(python-package))
diff --git a/package/python-networkmanager/python-networkmanager.mk b/package/python-networkmanager/python-networkmanager.mk
index 875748f..d0e4011 100644
--- a/package/python-networkmanager/python-networkmanager.mk
+++ b/package/python-networkmanager/python-networkmanager.mk
@@ -7,7 +7,7 @@
 PYTHON_NETWORKMANAGER_VERSION = 1.2.1
 PYTHON_NETWORKMANAGER_SITE = https://pypi.python.org/packages/e7/b1/09993250ceea9e03bc65fbabcd5286540200292c011b22237b2963c11471
 PYTHON_NETWORKMANAGER_SETUP_TYPE = distutils
-PYTHON_NETWORKMANAGER_LICENSE = GPLv3+
+PYTHON_NETWORKMANAGER_LICENSE = GPL-3.0+
 PYTHON_NETWORKMANAGER_LICENSE_FILES = COPYING
 PYTHON_NETWORKMANAGER_DEPENDENCIES = dbus-python
 
diff --git a/package/python-pyqt/python-pyqt.mk b/package/python-pyqt/python-pyqt.mk
index f689be6..ab658e9 100644
--- a/package/python-pyqt/python-pyqt.mk
+++ b/package/python-pyqt/python-pyqt.mk
@@ -7,7 +7,7 @@
 PYTHON_PYQT_VERSION = 4.11.3
 PYTHON_PYQT_SOURCE = PyQt-x11-gpl-$(PYTHON_PYQT_VERSION).tar.gz
 PYTHON_PYQT_SITE = http://downloads.sourceforge.net/project/pyqt/PyQt4/PyQt-$(PYTHON_PYQT_VERSION)
-PYTHON_PYQT_LICENSE = GPL-2.0 or GPLv3
+PYTHON_PYQT_LICENSE = GPL-2.0 or GPL-3.0
 PYTHON_PYQT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3
 
 PYTHON_PYQT_DEPENDENCIES = python-sip host-python-sip qt
diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index e58ee5a..965c2d8 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -7,7 +7,7 @@
 PYTHON_PYQT5_VERSION = 5.7
 PYTHON_PYQT5_SOURCE = PyQt5_gpl-$(PYTHON_PYQT5_VERSION).tar.gz
 PYTHON_PYQT5_SITE = http://downloads.sourceforge.net/project/pyqt/PyQt5/PyQt-$(PYTHON_PYQT5_VERSION)
-PYTHON_PYQT5_LICENSE = GPLv3
+PYTHON_PYQT5_LICENSE = GPL-3.0
 PYTHON_PYQT5_LICENSE_FILES = LICENSE
 
 PYTHON_PYQT5_DEPENDENCIES = python-sip host-python-sip qt5base
diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 60adec2..1d84e83 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -7,7 +7,7 @@
 PYTHON_SIP_VERSION = 4.18
 PYTHON_SIP_SOURCE = sip-$(PYTHON_SIP_VERSION).tar.gz
 PYTHON_SIP_SITE = http://downloads.sourceforge.net/project/pyqt/sip/sip-$(PYTHON_SIP_VERSION)
-PYTHON_SIP_LICENSE = SIP license or GPL-2.0 or GPLv3
+PYTHON_SIP_LICENSE = SIP license or GPL-2.0 or GPL-3.0
 PYTHON_SIP_LICENSE_FILES = LICENSE LICENSE-GPL2 LICENSE-GPL3
 
 ifeq ($(BR2_PACKAGE_QT5),y)
diff --git a/package/python-slob/python-slob.mk b/package/python-slob/python-slob.mk
index 474c0c9..2db3932 100644
--- a/package/python-slob/python-slob.mk
+++ b/package/python-slob/python-slob.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SLOB_VERSION = 31ad0e769360a5b10a4893f686587bb8e48c3895
 PYTHON_SLOB_SITE = $(call github,itkach,slob,$(PYTHON_SLOB_VERSION))
-PYTHON_SLOB_LICENSE = GPLv3
+PYTHON_SLOB_LICENSE = GPL-3.0
 PYTHON_SLOB_LICENSE_FILES = LICENSE
 PYTHON_SLOB_SETUP_TYPE = distutils
 
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 1faab74..68d407e 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -21,7 +21,7 @@ QT_PATCH = https://github.com/qtproject/qtbase/commit/b8f98d956501dfa4ce03a137f1
 QT_DEPENDENCIES = host-pkgconf
 QT_INSTALL_STAGING = YES
 
-QT_LICENSE := LGPLv2.1 with exceptions or GPLv3
+QT_LICENSE := LGPLv2.1 with exceptions or GPL-3.0
 ifneq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
 QT_LICENSE := $(QT_LICENSE) or Digia Qt Commercial license
 endif
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 77e9c53..8cac2d2 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -15,7 +15,7 @@ QT53D_DEPENDENCIES += assimp
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT53D_LICENSE = GPL-2.0 or GPLv3 or LGPLv3
+QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv3
 QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.GPLv3 LICENSE.LGPLv3
 else
 QT53D_LICENSE = Commercial license
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index b1fd6fb..a8e044a 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -50,10 +50,10 @@ endif
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5BASE_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5BASE_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5BASE_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5BASE_LICENSE = GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5BASE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index 7a35a76..cbdbf80 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -11,7 +11,7 @@ QT5CANVAS3D_DEPENDENCIES = qt5base qt5declarative
 QT5CANVAS3D_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5CANVAS3D_LICENSE = GPL-2.0 or GPLv3 or LGPLv3
+QT5CANVAS3D_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv3
 QT5CANVAS3D_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3
 else
 QT5CANVAS3D_LICENSE = Commercial license
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index f0e1e4d..08eda9f 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -12,10 +12,10 @@ QT5CONNECTIVITY_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5CONNECTIVITY_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5CONNECTIVITY_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5CONNECTIVITY_LICENSE = GPL-2.0 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5CONNECTIVITY_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 66a2696..63a5a63 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -12,10 +12,10 @@ QT5DECLARATIVE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5DECLARATIVE_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5DECLARATIVE_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5DECLARATIVE_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5DECLARATIVE_LICENSE = GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index dad7889..c39b953 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -13,7 +13,7 @@ QT5ENGINIO_DEPENDENCIES = openssl qt5base
 QT5ENGINIO_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5ENGINIO_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5ENGINIO_LICENSE = GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5ENGINIO_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5ENGINIO_LICENSE := $(QT5ENGINIO_LICENSE), BSD-3c (examples)
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 76d9ddc..78aa570 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -12,10 +12,10 @@ QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5GRAPHICALEFFECTS_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5GRAPHICALEFFECTS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5GRAPHICALEFFECTS_LICENSE = GPL-2.0 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5GRAPHICALEFFECTS_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index 802a3f4..afc7a45 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -12,10 +12,10 @@ QT5IMAGEFORMATS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5IMAGEFORMATS_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5IMAGEFORMATS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5IMAGEFORMATS_LICENSE = GPL-2.0 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5IMAGEFORMATS_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index f6f413c..da55f64 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -12,10 +12,10 @@ QT5LOCATION_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5LOCATION_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5LOCATION_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5LOCATION_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5LOCATION_LICENSE = GPL-2.0 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5LOCATION_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5LOCATION_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 638133d..012ce1f 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -12,10 +12,10 @@ QT5MULTIMEDIA_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5MULTIMEDIA_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5MULTIMEDIA_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5MULTIMEDIA_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5MULTIMEDIA_LICENSE = GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 0a1d632..0653ef6 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -11,7 +11,7 @@ QT5QUICKCONTROLS_DEPENDENCIES = qt5base qt5declarative
 QT5QUICKCONTROLS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5QUICKCONTROLS_LICENSE = GPL-2.0 or GPLv3 or LGPLv3, GFDLv1.3 (docs)
+QT5QUICKCONTROLS_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv3, GFDLv1.3 (docs)
 QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5QUICKCONTROLS_LICENSE = Commercial license
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index f6aca2c..1b33623 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -11,7 +11,7 @@ QT5QUICKCONTROLS2_DEPENDENCIES = qt5base qt5declarative
 QT5QUICKCONTROLS2_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5QUICKCONTROLS2_LICENSE = GPLv3 or LGPLv3, GFDLv1.3 (docs)
+QT5QUICKCONTROLS2_LICENSE = GPL-3.0 or LGPLv3, GFDLv1.3 (docs)
 QT5QUICKCONTROLS2_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5QUICKCONTROLS2_LICENSE = Commercial license
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index 57ba6f0..43971c7 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -11,7 +11,7 @@ QT5SCRIPT_DEPENDENCIES = qt5base
 QT5SCRIPT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5SCRIPT_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5SCRIPT_LICENSE = GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5SCRIPT_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5SCRIPT_LICENSE = Commercial license
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 00c0ac0..b89149c 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -12,10 +12,10 @@ QT5SENSORS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5SENSORS_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5SENSORS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5SENSORS_LICENSE = GPL-2.0 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5SENSORS_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index 636b529..0386b63 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -11,7 +11,7 @@ QT5SERIALBUS_DEPENDENCIES = qt5base qt5serialport
 QT5SERIALBUS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5SERIALBUS_LICENSE = GPL-2.0 or GPLv3 or LGPLv3, GFDLv1.3 (docs)
+QT5SERIALBUS_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv3, GFDLv1.3 (docs)
 QT5SERIALBUS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5SERIALBUS_LICENSE = Commercial license
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index b0f0cec..d81af17 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -12,10 +12,10 @@ QT5SERIALPORT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5SERIALPORT_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5SERIALPORT_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5SERIALPORT_LICENSE = GPL-2.0 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5SERIALPORT_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index e946a67..787c4aa 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -12,10 +12,10 @@ QT5SVG_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5SVG_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5SVG_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5SVG_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5SVG_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5SVG_LICENSE = GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5SVG_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index 1f02eb2..6a843fa 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -21,10 +21,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5TOOLS_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5TOOLS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5TOOLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5TOOLS_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5TOOLS_LICENSE = GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5TOOLS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index 1d10a5c..93d3ed6 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -12,10 +12,10 @@ QT5WEBCHANNEL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5WEBCHANNEL_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5WEBCHANNEL_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5WEBCHANNEL_LICENSE = GPL-2.0 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5WEBCHANNEL_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index 972fa73..be0fc87 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -12,10 +12,10 @@ QT5WEBSOCKETS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5WEBSOCKETS_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools)
+QT5WEBSOCKETS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools)
 QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3
 else
-QT5WEBSOCKETS_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3
+QT5WEBSOCKETS_LICENSE = GPL-3.0 or LGPLv2.1 with exception or LGPLv3
 QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index d3d409e..119d15e 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -12,10 +12,10 @@ QT5X11EXTRAS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5X11EXTRAS_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5X11EXTRAS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5X11EXTRAS_LICENSE = GPL-2.0 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5X11EXTRAS_LICENSE = GPL-2.0 or GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index d33d180..bb2f4ed 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -12,10 +12,10 @@ QT5XMLPATTERNS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5XMLPATTERNS_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5XMLPATTERNS_LICENSE = GPL-2.0+ or LGPLv3, GPL-3.0 with exception(tools), GFDLv1.3 (docs)
 QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5XMLPATTERNS_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5XMLPATTERNS_LICENSE = GPL-3.0 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
index 6238b50..6b90a2c 100644
--- a/package/qtuio/qtuio.mk
+++ b/package/qtuio/qtuio.mk
@@ -9,7 +9,7 @@ QTUIO_SITE = $(call github,x29a,qTUIO,$(QTUIO_VERSION))
 QTUIO_INSTALL_STAGING = YES
 QTUIO_DEPENDENCIES = qt
 
-QTUIO_LICENSE = GPLv3+
+QTUIO_LICENSE = GPL-3.0+
 QTUIO_LICENSE_FILES = COPYING
 
 # The pong example needs QtOpenGL support, which might become available
diff --git a/package/ranger/ranger.mk b/package/ranger/ranger.mk
index fd6809a..aaca438 100644
--- a/package/ranger/ranger.mk
+++ b/package/ranger/ranger.mk
@@ -7,7 +7,7 @@
 RANGER_VERSION = 1.7.2
 RANGER_SITE = http://ranger.nongnu.org
 RANGER_SETUP_TYPE = distutils
-RANGER_LICENSE = GPLv3
+RANGER_LICENSE = GPL-3.0
 RANGER_LICENSE_FILES = AUTHORS
 
 # The ranger script request python to be called with -O (optimize generated
diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index 79187b5..da8a80e 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -11,7 +11,7 @@ RDESKTOP_DEPENDENCIES = host-pkgconf openssl xlib_libX11 xlib_libXt \
 	$(if $(BR2_PACKAGE_LIBAO),libao) \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate)
 RDESKTOP_CONF_OPTS = --with-openssl=$(STAGING_DIR)/usr --disable-credssp
-RDESKTOP_LICENSE = GPLv3+
+RDESKTOP_LICENSE = GPL-3.0+
 RDESKTOP_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_PCSC_LITE),y)
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index ed4e144..cc5d4f2 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -11,7 +11,7 @@ READLINE_DEPENDENCIES = ncurses
 HOST_READLINE_DEPENDENCIES = host-ncurses
 READLINE_CONF_ENV = bash_cv_func_sigsetjmp=yes \
 	bash_cv_wcwidth_broken=no
-READLINE_LICENSE = GPLv3+
+READLINE_LICENSE = GPL-3.0+
 READLINE_LICENSE_FILES = COPYING
 
 define READLINE_PURGE_EXAMPLES
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index e1e850c..e6b955a 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -6,7 +6,7 @@
 
 RSYNC_VERSION = 3.1.2
 RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
-RSYNC_LICENSE = GPLv3+
+RSYNC_LICENSE = GPL-3.0+
 RSYNC_LICENSE_FILES = COPYING
 RSYNC_DEPENDENCIES = zlib popt
 RSYNC_CONF_OPTS = \
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 3254d99..6370726 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -6,7 +6,7 @@
 
 RSYSLOG_VERSION = 8.22.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
-RSYSLOG_LICENSE = GPLv3, LGPLv3, Apache-2.0
+RSYSLOG_LICENSE = GPL-3.0, LGPLv3, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
 RSYSLOG_DEPENDENCIES = zlib libestr liblogging libfastjson host-pkgconf
 RSYSLOG_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index aa7cb57..130b661 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -8,7 +8,7 @@ SAMBA4_VERSION = 4.5.7
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-SAMBA4_LICENSE = GPLv3+
+SAMBA4_LICENSE = GPL-3.0+
 SAMBA4_LICENSE_FILES = COPYING
 SAMBA4_DEPENDENCIES = \
 	host-e2fsprogs host-heimdal host-python \
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index e67eb4a..f22f8a6 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -6,7 +6,7 @@
 
 SCREEN_VERSION = 4.5.1
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
-SCREEN_LICENSE = GPLv3+
+SCREEN_LICENSE = GPL-3.0+
 SCREEN_LICENSE_FILES = COPYING
 SCREEN_DEPENDENCIES = ncurses
 SCREEN_AUTORECONF = YES
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 68bcb98..28df140 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -7,7 +7,7 @@
 SED_VERSION = 4.4
 SED_SOURCE = sed-$(SED_VERSION).tar.xz
 SED_SITE = $(BR2_GNU_MIRROR)/sed
-SED_LICENSE = GPLv3
+SED_LICENSE = GPL-3.0
 SED_LICENSE_FILES = COPYING
 
 SED_CONF_OPTS = \
diff --git a/package/sigrok-cli/sigrok-cli.mk b/package/sigrok-cli/sigrok-cli.mk
index ec5c8bd..3e2d1bf 100644
--- a/package/sigrok-cli/sigrok-cli.mk
+++ b/package/sigrok-cli/sigrok-cli.mk
@@ -6,7 +6,7 @@
 
 SIGROK_CLI_VERSION = 0.6.0
 SIGROK_CLI_SITE = http://sigrok.org/download/source/sigrok-cli
-SIGROK_CLI_LICENSE = GPLv3+
+SIGROK_CLI_LICENSE = GPL-3.0+
 SIGROK_CLI_LICENSE_FILES = COPYING
 SIGROK_CLI_DEPENDENCIES = host-pkgconf libsigrok
 
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 1e0e051..74b05b1 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -6,7 +6,7 @@
 
 SNGREP_VERSION = v1.4.2
 SNGREP_SITE = $(call github,irontec,sngrep,$(SNGREP_VERSION))
-SNGREP_LICENSE = GPLv3+
+SNGREP_LICENSE = GPL-3.0+
 SNGREP_LICENSE_FILES = LICENSE
 SNGREP_AUTORECONF = YES
 SNGREP_DEPENDENCIES = libpcap ncurses host-pkgconf
diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
index 7a82f4a..3b23b10 100644
--- a/package/squeezelite/squeezelite.mk
+++ b/package/squeezelite/squeezelite.mk
@@ -6,7 +6,7 @@
 
 SQUEEZELITE_VERSION = v1.8
 SQUEEZELITE_SITE = $(call github,robadenshi,squeezelite,$(SQUEEZELITE_VERSION))
-SQUEEZELITE_LICENSE = GPLv3
+SQUEEZELITE_LICENSE = GPL-3.0
 SQUEEZELITE_LICENSE_FILES = LICENSE.txt
 SQUEEZELITE_DEPENDENCIES = alsa-lib flac libmad libvorbis faad2 mpg123
 SQUEEZELITE_MAKE_OPTS = -DLINKALL
diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
index 037c6f3..98b9ca4 100644
--- a/package/supertuxkart/supertuxkart.mk
+++ b/package/supertuxkart/supertuxkart.mk
@@ -11,7 +11,7 @@ SUPERTUXKART_SITE = http://downloads.sourceforge.net/project/supertuxkart/SuperT
 # Supertuxkart itself is GPLv3+, but it bundles a few libraries with different
 # licenses. Irrlicht, bullet and angelscript have zlib license, while glew is
 # BSD-3c. Since they are linked statically, the result is GPLv3+.
-SUPERTUXKART_LICENSE = GPLv3+
+SUPERTUXKART_LICENSE = GPL-3.0+
 SUPERTUXKART_LICENSE_FILES = COPYING
 
 SUPERTUXKART_DEPENDENCIES = \
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 8fed8da..95eaeac 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -12,7 +12,7 @@ HOST_SWIG_CONF_OPTS = \
 	--without-pcre \
 	--disable-ccache \
 	--without-octave
-SWIG_LICENSE = GPLv3+, BSD-2c, BSD-3c
+SWIG_LICENSE = GPL-3.0+, BSD-2c, BSD-3c
 SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
 
 # CMake looks first at swig3.0, then swig2.0 and then swig. However,
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 26f113a..cb2ddc0 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -10,7 +10,7 @@ TAR_SITE = $(BR2_GNU_MIRROR)/tar
 # busybox installs in /bin, so we need tar to install as well in /bin
 # so that it overrides the Busybox symlinks.
 TAR_CONF_OPTS = --exec-prefix=/
-TAR_LICENSE = GPLv3+
+TAR_LICENSE = GPL-3.0+
 TAR_LICENSE_FILES = COPYING
 
 # Prefer full-blown tar over buybox's version
diff --git a/package/tcping/tcping.mk b/package/tcping/tcping.mk
index f5919bb..7edf45e 100644
--- a/package/tcping/tcping.mk
+++ b/package/tcping/tcping.mk
@@ -6,7 +6,7 @@
 
 TCPING_VERSION = 1.3.5
 TCPING_SITE = http://linuxco.de/tcping
-TCPING_LICENSE = GPLv3+
+TCPING_LICENSE = GPL-3.0+
 TCPING_LICENSE_FILES = LICENSE
 
 define TCPING_BUILD_CMDS
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index bc572f3..df85fe1 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -6,7 +6,7 @@
 
 TCPREPLAY_VERSION = 4.2.1
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
-TCPREPLAY_LICENSE = GPLv3
+TCPREPLAY_LICENSE = GPL-3.0
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
 TCPREPLAY_CONF_ENV = \
 	tr_cv_libpcap_version=">= 0.7.0" \
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index fd923fe..f8abb2b 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -18,7 +18,7 @@ TRANSMISSION_AUTORECONF = YES
 TRANSMISSION_CONF_OPTS = \
 	--disable-libnotify \
 	--enable-lightweight
-TRANSMISSION_LICENSE = GPL-2.0 or GPLv3 with OpenSSL exception
+TRANSMISSION_LICENSE = GPL-2.0 or GPL-3.0 with OpenSSL exception
 TRANSMISSION_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBMINIUPNPC),y)
diff --git a/package/triggerhappy/triggerhappy.mk b/package/triggerhappy/triggerhappy.mk
index 5a29ca7..a57f1a7 100644
--- a/package/triggerhappy/triggerhappy.mk
+++ b/package/triggerhappy/triggerhappy.mk
@@ -6,7 +6,7 @@
 
 TRIGGERHAPPY_VERSION = 7e5abc69f215678e93a6b999524981c8b40bdcd9
 TRIGGERHAPPY_SITE = $(call github,wertarbyte,triggerhappy,$(TRIGGERHAPPY_VERSION))
-TRIGGERHAPPY_LICENSE = GPLv3+
+TRIGGERHAPPY_LICENSE = GPL-3.0+
 TRIGGERHAPPY_LICENSE_FILES = COPYING
 
 define TRIGGERHAPPY_BUILD_CMDS
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 42c6767..77843e2 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -6,7 +6,7 @@
 
 TVHEADEND_VERSION = e5f5a4278949afc96e26d6cd50cf968e0e92d7b6
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
-TVHEADEND_LICENSE = GPLv3+
+TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
 TVHEADEND_DEPENDENCIES = \
 	host-gettext \
diff --git a/package/udpxy/udpxy.mk b/package/udpxy/udpxy.mk
index dd8c91f..36b9afd 100644
--- a/package/udpxy/udpxy.mk
+++ b/package/udpxy/udpxy.mk
@@ -7,7 +7,7 @@
 UDPXY_VERSION = 1.0.23-9-prod
 UDPXY_SOURCE = udpxy.$(UDPXY_VERSION).tar.gz
 UDPXY_SITE = http://www.udpxy.com/download/1_23
-UDPXY_LICENSE = GPLv3+
+UDPXY_LICENSE = GPL-3.0+
 UDPXY_LICENSE_FILES = README
 
 define UDPXY_BUILD_CMDS
diff --git a/package/wavemon/wavemon.mk b/package/wavemon/wavemon.mk
index 5a1b7ee..e87ab7a 100644
--- a/package/wavemon/wavemon.mk
+++ b/package/wavemon/wavemon.mk
@@ -6,7 +6,7 @@
 
 WAVEMON_VERSION = v0.8.1
 WAVEMON_SITE = $(call github,uoaerg,wavemon,$(WAVEMON_VERSION))
-WAVEMON_LICENSE = GPLv3+
+WAVEMON_LICENSE = GPL-3.0+
 WAVEMON_LICENSE_FILES = COPYING
 WAVEMON_DEPENDENCIES = host-pkgconf libnl ncurses
 
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 22e057d..4cb48dc 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -8,7 +8,7 @@ WGET_VERSION = 1.19.1
 WGET_SOURCE = wget-$(WGET_VERSION).tar.xz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
-WGET_LICENSE = GPLv3+
+WGET_LICENSE = GPL-3.0+
 WGET_LICENSE_FILES = COPYING
 
 # Prefer full-blown wget over busybox
diff --git a/package/which/which.mk b/package/which/which.mk
index 938b770..c96e893 100644
--- a/package/which/which.mk
+++ b/package/which/which.mk
@@ -6,7 +6,7 @@
 
 WHICH_VERSION = 2.21
 WHICH_SITE = $(BR2_GNU_MIRROR)/which
-WHICH_LICENSE = GPLv3+
+WHICH_LICENSE = GPL-3.0+
 WHICH_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index be19322..b502a9d 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -6,7 +6,7 @@
 
 XORRISO_VERSION = 1.4.2
 XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
-XORRISO_LICENSE = GPLv3+
+XORRISO_LICENSE = GPL-3.0+
 XORRISO_LICENSE_FILES = COPYING COPYRIGHT
 # Disable everything until we actually need those features, and add the correct
 # host libraries
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 4785be8..83e834c 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -9,7 +9,7 @@ XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-XZ_LICENSE = GPL-2.0+, GPLv3+, LGPLv2.1+
+XZ_LICENSE = GPL-2.0+, GPL-3.0+, LGPLv2.1+
 XZ_LICENSE_FILES = COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
diff --git a/package/yad/yad.mk b/package/yad/yad.mk
index a7f5ba2..d674316 100644
--- a/package/yad/yad.mk
+++ b/package/yad/yad.mk
@@ -7,7 +7,7 @@
 YAD_VERSION = 0.33.1
 YAD_SOURCE = yad-$(YAD_VERSION).tar.xz
 YAD_SITE = http://sourceforge.net/projects/yad-dialog/files
-YAD_LICENSE = GPLv3
+YAD_LICENSE = GPL-3.0
 YAD_LICENSE_FILES = COPYING
 YAD_DEPENDENCIES = host-intltool host-pkgconf
 YAD_CONF_OPTS = --enable-html=no
diff --git a/package/zynq-boot-bin/zynq-boot-bin.mk b/package/zynq-boot-bin/zynq-boot-bin.mk
index 46051fb..f5f2f10 100644
--- a/package/zynq-boot-bin/zynq-boot-bin.mk
+++ b/package/zynq-boot-bin/zynq-boot-bin.mk
@@ -7,7 +7,7 @@
 ZYNQ_BOOT_BIN_VERSION = xilinx-v2015.1
 ZYNQ_BOOT_BIN_SOURCE = zynq-boot-bin.py
 ZYNQ_BOOT_BIN_SITE = https://raw.githubusercontent.com/Xilinx/u-boot-xlnx/$(ZYNQ_BOOT_BIN_VERSION)/tools
-ZYNQ_BOOT_BIN_LICENSE = GPLv3+
+ZYNQ_BOOT_BIN_LICENSE = GPL-3.0+
 
 HOST_ZYNQ_BOOT_BIN_DEPENDENCIES = host-python
 
-- 
2.6.2
