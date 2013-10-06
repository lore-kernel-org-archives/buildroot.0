From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Oct 2013 21:52:19 +0200
Subject: [Buildroot] [git commit] package: remove the default value of the
	$(PKG)_SOURCE variable
Message-ID: <20131006203007.EF3AE9A139@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e2e7c71d0d3331053f97c140621b2d8374726ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire at gmail.com)
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aircrack-ng/aircrack-ng.mk                 |    1 -
 package/avahi/avahi.mk                             |    1 -
 package/axel/axel.mk                               |    1 -
 package/bmon/bmon.mk                               |    1 -
 package/bridge-utils/bridge-utils.mk               |    1 -
 package/bsdiff/bsdiff.mk                           |    1 -
 package/cramfs/cramfs.mk                           |    1 -
 package/ctorrent/ctorrent.mk                       |    1 -
 package/dbus-glib/dbus-glib.mk                     |    1 -
 package/dbus-python/dbus-python.mk                 |    1 -
 package/dfu-util/dfu-util.mk                       |    1 -
 package/dhcpdump/dhcpdump.mk                       |    1 -
 package/docker/docker.mk                           |    1 -
 package/dsp-tools/dsp-tools.mk                     |    1 -
 package/elftosb/elftosb.mk                         |    1 -
 package/enchant/enchant.mk                         |    1 -
 package/ezxml/ezxml.mk                             |    1 -
 package/fbdump/fbdump.mk                           |    1 -
 package/fbgrab/fbgrab.mk                           |    1 -
 package/fbset/fbset.mk                             |    1 -
 package/fbv/fbv.mk                                 |    1 -
 package/fconfig/fconfig.mk                         |    1 -
 package/flac/flac.mk                               |    1 -
 package/fontconfig/fontconfig.mk                   |    1 -
 package/gamin/gamin.mk                             |    1 -
 package/genext2fs/genext2fs.mk                     |    1 -
 package/genromfs/genromfs.mk                       |    1 -
 package/giblib/giblib.mk                           |    1 -
 package/gnuchess/gnuchess.mk                       |    1 -
 package/gqview/gqview.mk                           |    1 -
 package/gsl/gsl.mk                                 |    1 -
 package/gstreamer/gst-omapfb/gst-omapfb.mk         |    1 -
 package/intltool/intltool.mk                       |    1 -
 package/iperf/iperf.mk                             |    1 -
 package/ipkg/ipkg.mk                               |    1 -
 package/irda-utils/irda-utils.mk                   |    1 -
 package/lcdproc/lcdproc.mk                         |    1 -
 package/leafpad/leafpad.mk                         |    1 -
 package/libarchive/libarchive.mk                   |    1 -
 package/libatomic_ops/libatomic_ops.mk             |    1 -
 package/libbsd/libbsd.mk                           |    1 -
 package/libdmtx/libdmtx.mk                         |    1 -
 package/libdnet/libdnet.mk                         |    1 -
 package/libelf/libelf.mk                           |    1 -
 package/libev/libev.mk                             |    1 -
 package/libftdi/libftdi.mk                         |    1 -
 package/libgeotiff/libgeotiff.mk                   |    1 -
 package/libhid/libhid.mk                           |    1 -
 package/libiconv/libiconv.mk                       |    1 -
 package/libid3tag/libid3tag.mk                     |    1 -
 package/libiscsi/libiscsi.mk                       |    1 -
 package/liblo/liblo.mk                             |    1 -
 package/libmms/libmms.mk                           |    1 -
 package/libmpeg2/libmpeg2.mk                       |    1 -
 package/liboauth/liboauth.mk                       |    1 -
 package/librsvg/librsvg.mk                         |    1 -
 package/librsync/librsync.mk                       |    1 -
 package/libseccomp/libseccomp.mk                   |    1 -
 package/libsexy/libsexy.mk                         |    1 -
 package/linux-fusion/linux-fusion.mk               |    1 -
 package/logrotate/logrotate.mk                     |    1 -
 package/logsurfer/logsurfer.mk                     |    1 -
 package/lrzsz/lrzsz.mk                             |    1 -
 package/lsuio/lsuio.mk                             |    1 -
 package/lzop/lzop.mk                               |    1 -
 package/madplay/madplay.mk                         |    1 -
 package/memtester/memtester.mk                     |    1 -
 package/minicom/minicom.mk                         |    1 -
 package/netcat/netcat.mk                           |    1 -
 package/numactl/numactl.mk                         |    1 -
 package/opkg/opkg.mk                               |    1 -
 package/pcmanfm/pcmanfm.mk                         |    1 -
 package/pkg-config/pkg-config.mk                   |    1 -
 package/protobuf/protobuf.mk                       |    1 -
 package/quota/quota.mk                             |    1 -
 package/rdesktop/rdesktop.mk                       |    1 -
 package/readline/readline.mk                       |    1 -
 package/rsync/rsync.mk                             |    1 -
 package/sane-backends/sane-backends.mk             |    1 -
 package/scons/scons.mk                             |    1 -
 .../startup-notification/startup-notification.mk   |    1 -
 package/statserial/statserial.mk                   |    1 -
 package/supervisor/supervisor.mk                   |    1 -
 package/synergy/synergy.mk                         |    1 -
 package/tidsp-binaries/tidsp-binaries.mk           |    1 -
 package/torsmo/torsmo.mk                           |    1 -
 package/udpcast/udpcast.mk                         |    1 -
 package/vtun/vtun.mk                               |    1 -
 package/x11vnc/x11vnc.mk                           |    1 -
 package/xinetd/xinetd.mk                           |    1 -
 package/xstroke/xstroke.mk                         |    1 -
 package/xvkbd/xvkbd.mk                             |    1 -
 package/yasm/yasm.mk                               |    1 -
 93 files changed, 0 insertions(+), 93 deletions(-)

diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index 00f4bac..f4a2188 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 AIRCRACK_NG_VERSION = 1.1
-AIRCRACK_NG_SOURCE = aircrack-ng-$(AIRCRACK_NG_VERSION).tar.gz
 AIRCRACK_NG_SITE = http://download.aircrack-ng.org
 AIRCRACK_NG_LICENSE = GPLv2+
 AIRCRACK_NG_LICENSE_FILES = LICENSE
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index eb76d79..89aa023 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -12,7 +12,6 @@
 # later version.
 
 AVAHI_VERSION = 0.6.31
-AVAHI_SOURCE = avahi-$(AVAHI_VERSION).tar.gz
 AVAHI_SITE = http://www.avahi.org/download/
 AVAHI_LICENSE = LGPLv2.1+
 AVAHI_LICENSE_FILES = LICENSE
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index e8be1a6..c0e2e65 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 AXEL_VERSION = 2.4
-AXEL_SOURCE = axel-$(AXEL_VERSION).tar.gz
 AXEL_SITE = https://alioth.debian.org/frs/download.php/file/3015
 AXEL_LICENSE = GPLv2+
 AXEL_LICENSE_FILES = COPYING
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index bb6f17e..f852f49 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 BMON_VERSION = 2.1.0
-BMON_SOURCE = bmon-$(BMON_VERSION).tar.gz
 BMON_SITE = http://distfiles.gentoo.org/distfiles
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
diff --git a/package/bridge-utils/bridge-utils.mk b/package/bridge-utils/bridge-utils.mk
index 6c1975f..4a21990 100644
--- a/package/bridge-utils/bridge-utils.mk
+++ b/package/bridge-utils/bridge-utils.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 BRIDGE_UTILS_VERSION = 1.5
-BRIDGE_UTILS_SOURCE = bridge-utils-$(BRIDGE_UTILS_VERSION).tar.gz
 BRIDGE_UTILS_SITE = http://downloads.sourceforge.net/project/bridge/bridge
 BRIDGE_UTILS_AUTORECONF = YES
 BRIDGE_UTILS_CONF_OPT = --with-linux-headers=$(LINUX_HEADERS_DIR)
diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
index 13c7c16..259dc4f 100644
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 BSDIFF_VERSION = 4.3
-BSDIFF_SOURCE = bsdiff-$(BSDIFF_VERSION).tar.gz
 BSDIFF_SITE = http://www.daemonology.net/bsdiff
 BSDIFF_DEPENDENCIES = bzip2
 
diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index f38ac1a..0f29dd0 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 CRAMFS_VERSION = 1.1
-CRAMFS_SOURCE = cramfs-$(CRAMFS_VERSION).tar.gz
 CRAMFS_SITE = http://downloads.sourceforge.net/project/cramfs/cramfs/$(CRAMFS_VERSION)
 
 CRAMFS_DEPENDENCIES = zlib
diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
index d4f6b98..de28dd7 100644
--- a/package/ctorrent/ctorrent.mk
+++ b/package/ctorrent/ctorrent.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 CTORRENT_VERSION = dnh3.3.2
-CTORRENT_SOURCE = ctorrent-$(CTORRENT_VERSION).tar.gz
 CTORRENT_SITE = http://www.rahul.net/dholmes/ctorrent/
 CTORRENT_LICENSE = GPLv2
 CTORRENT_LICENSE_FILES = COPYING
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index d4685f6..ca1df22 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 DBUS_GLIB_VERSION = 0.98
-DBUS_GLIB_SOURCE = dbus-glib-$(DBUS_GLIB_VERSION).tar.gz
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib/
 DBUS_GLIB_INSTALL_STAGING = YES
 
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 6e260d0..7c59ceb 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 DBUS_PYTHON_VERSION = 0.83.0
-DBUS_PYTHON_SOURCE = dbus-python-$(DBUS_PYTHON_VERSION).tar.gz
 DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python/
 DBUS_PYTHON_INSTALL_STAGING = YES
 
diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index eab8c73..c58c347 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 DFU_UTIL_VERSION = 0.6
-DFU_UTIL_SOURCE = dfu-util-$(DFU_UTIL_VERSION).tar.gz
 DFU_UTIL_SITE = http://dfu-util.gnumonks.org/releases/
 
 HOST_DFU_UTIL_DEPENDENCIES = host-libusb
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index 0c47d06..1f1737d 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -6,7 +6,6 @@
 
 DHCPDUMP_VERSION = 1.8
 DHCPDUMP_SITE    = http://www.mavetju.org/download/
-DHCPDUMP_SOURCE  = dhcpdump-$(DHCPDUMP_VERSION).tar.gz
 
 DHCPDUMP_DEPENDENCIES = libpcap
 
diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index 9c8ded4..82cabec 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 DOCKER_VERSION = 1.5
-DOCKER_SOURCE = docker-$(DOCKER_VERSION).tar.gz
 DOCKER_SITE = http://icculus.org/openbox/2/docker
 
 DOCKER_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" \
diff --git a/package/dsp-tools/dsp-tools.mk b/package/dsp-tools/dsp-tools.mk
index e91c7bc..344e264 100644
--- a/package/dsp-tools/dsp-tools.mk
+++ b/package/dsp-tools/dsp-tools.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 DSP_TOOLS_VERSION = 2.0
-DSP_TOOLS_SOURCE = dsp-tools-$(DSP_TOOLS_VERSION).tar.gz
 DSP_TOOLS_SITE = http://gst-dsp.googlecode.com/files/
 DSP_TOOLS_DEPENDENCIES = tidsp-binaries
 
diff --git a/package/elftosb/elftosb.mk b/package/elftosb/elftosb.mk
index b2bd76f..c2943e4 100644
--- a/package/elftosb/elftosb.mk
+++ b/package/elftosb/elftosb.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 ELFTOSB_VERSION = 10.12.01
-ELFTOSB_SOURCE = elftosb-$(ELFTOSB_VERSION).tar.gz
 ELFTOSB_SITE = http://repository.timesys.com/buildsources/e/elftosb/elftosb-$(ELFTOSB_VERSION)
 
 define HOST_ELFTOSB_BUILD_CMDS
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index 977c37b..4a23293 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 ENCHANT_VERSION = 1.6.0
-ENCHANT_SOURCE = enchant-$(ENCHANT_VERSION).tar.gz
 ENCHANT_SITE = http://www.abisource.com/downloads/enchant/$(ENCHANT_VERSION)
 ENCHANT_INSTALL_STAGING = YES
 ENCHANT_DEPENDENCIES = libglib2 host-pkgconf
diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index 83a4fa9..756e13f 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 EZXML_VERSION = 0.8.6
-EZXML_SOURCE = ezxml-$(EZXML_VERSION).tar.gz
 EZXML_SITE = http://downloads.sourceforge.net/project/ezxml/ezXML/ezXML%20$(EZXML_VERSION)
 EZXML_INSTALL_STAGING = YES
 
diff --git a/package/fbdump/fbdump.mk b/package/fbdump/fbdump.mk
index e9828df..568d314 100644
--- a/package/fbdump/fbdump.mk
+++ b/package/fbdump/fbdump.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 FBDUMP_VERSION = 0.4.2
-FBDUMP_SOURCE = fbdump-$(FBDUMP_VERSION).tar.gz
 FBDUMP_SITE = http://www.rcdrummond.net/fbdump
 FBDUMP_LICENSE = GPLv2
 FBDUMP_LICENSE_FILES = COPYING
diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
index b404c69..1a91f5e 100644
--- a/package/fbgrab/fbgrab.mk
+++ b/package/fbgrab/fbgrab.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 FBGRAB_VERSION = 1.1
-FBGRAB_SOURCE = fbgrab-$(FBGRAB_VERSION).tar.gz
 FBGRAB_SITE = http://fbgrab.monells.se
 FBGRAB_DEPENDENCIES = libpng
 FBGRAB_LICENSE = GPLv2
diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 59284ee..f1ce178 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 FBSET_VERSION = 2.1
-FBSET_SOURCE = fbset-$(FBSET_VERSION).tar.gz
 FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
 FBSET_DEPENDENCIES = host-bison host-flex
 FBSET_LICENSE = GPLv2
diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index 010e79e..883a910 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 FBV_VERSION = 1.0b
-FBV_SOURCE = fbv-$(FBV_VERSION).tar.gz
 FBV_SITE = http://s-tech.elsat.net.pl/fbv
 
 FBV_LICENSE = GPLv2
diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
index 45fd2a0..80de4dc 100644
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 FCONFIG_VERSION = 20080329
-FCONFIG_SOURCE = fconfig-$(FCONFIG_VERSION).tar.gz
 FCONFIG_SITE = http://andrzejekiert.ovh.org/software/fconfig/
 
 define FCONFIG_BUILD_CMDS
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index cace0d9..95cd5a1 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 FLAC_VERSION = 1.2.1
-FLAC_SOURCE = flac-$(FLAC_VERSION).tar.gz
 FLAC_SITE = http://downloads.sourceforge.net/project/flac/flac-src/flac-$(FLAC_VERSION)-src
 FLAC_INSTALL_STAGING = YES
 
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 0abf865..5ce6be2 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 FONTCONFIG_VERSION = 2.6.0
-FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.gz
 FONTCONFIG_SITE = http://fontconfig.org/release
 FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index 9f6ec96..e3d26fa 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 GAMIN_VERSION = 0.1.10
-GAMIN_SOURCE = gamin-$(GAMIN_VERSION).tar.gz
 GAMIN_SITE = http://www.gnome.org/~veillard/gamin/sources
 GAMIN_AUTORECONF = YES
 GAMIN_INSTALL_STAGING = YES
diff --git a/package/genext2fs/genext2fs.mk b/package/genext2fs/genext2fs.mk
index b2a301b..528912e 100644
--- a/package/genext2fs/genext2fs.mk
+++ b/package/genext2fs/genext2fs.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 GENEXT2FS_VERSION = 1.4.1
-GENEXT2FS_SOURCE = genext2fs-$(GENEXT2FS_VERSION).tar.gz
 GENEXT2FS_SITE = http://downloads.sourceforge.net/project/genext2fs/genext2fs/$(GENEXT2FS_VERSION)
 GENEXT2FS_LICENSE = GPLv2
 GENEXT2FS_LICENSE_FILES = COPYING
diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
index 9e7c2ff..c45d1e1 100644
--- a/package/genromfs/genromfs.mk
+++ b/package/genromfs/genromfs.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 GENROMFS_VERSION = 0.5.2
-GENROMFS_SOURCE = genromfs-$(GENROMFS_VERSION).tar.gz
 GENROMFS_SITE = http://downloads.sourceforge.net/project/romfs/genromfs/$(GENROMFS_VERSION)
 
 define GENROMFS_BUILD_CMDS
diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
index 69100c0..b955943 100644
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 GIBLIB_VERSION = 1.2.4
-GIBLIB_SOURCE = giblib-$(GIBLIB_VERSION).tar.gz
 GIBLIB_SITE = http://linuxbrit.co.uk/downloads/
 GIBLIB_INSTALL_STAGING = YES
 GIBLIB_DEPENDENCIES = imlib2
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index e91046d..1ab22db 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 GNUCHESS_VERSION = 5.07
-GNUCHESS_SOURCE = gnuchess-$(GNUCHESS_VERSION).tar.gz
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
 GNUCHESS_LICENSE = GPLv2+
 GNUCHESS_LICENSE_FILES = COPYING
diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
index bffda59..07cb5ad 100644
--- a/package/gqview/gqview.mk
+++ b/package/gqview/gqview.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 GQVIEW_VERSION = 2.1.5
-GQVIEW_SOURCE = gqview-$(GQVIEW_VERSION).tar.gz
 GQVIEW_SITE = http://prdownloads.sourceforge.net/gqview
 GQVIEW_DEPENDENCIES = host-pkgconf libgtk2
 GQVIEW_CONF_ENV = LIBS="-lm"
diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index 08266d4..1dfc0f9 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 GSL_VERSION = 1.16
-GSL_SOURCE = gsl-$(GSL_VERSION).tar.gz
 GSL_SITE = $(BR2_GNU_MIRROR)/gsl
 GSL_INSTALL_STAGING = YES
 GSL_LICENSE = GPLv3
diff --git a/package/gstreamer/gst-omapfb/gst-omapfb.mk b/package/gstreamer/gst-omapfb/gst-omapfb.mk
index bfcaa5d..78a59f6 100644
--- a/package/gstreamer/gst-omapfb/gst-omapfb.mk
+++ b/package/gstreamer/gst-omapfb/gst-omapfb.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 GST_OMAPFB_VERSION = 1.0
-GST_OMAPFB_SOURCE = gst-omapfb-$(GST_OMAPFB_VERSION).tar.gz
 GST_OMAPFB_SITE = http://gst-dsp.googlecode.com/files/
 
 define GST_OMAPFB_BUILD_CMDS
diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 3772960..b2418fe 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 INTLTOOL_VERSION = 0.50.2
-INTLTOOL_SOURCE = intltool-$(INTLTOOL_VERSION).tar.gz
 INTLTOOL_SITE = https://launchpad.net/intltool/trunk/$(INTLTOOL_VERSION)/+download/
 INTLTOOL_LICENSE = GPLv2+
 INTLTOOL_LICENSE_FILES = COPYING
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 7fa7d3e..c570d67 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 IPERF_VERSION = 2.0.5
-IPERF_SOURCE = iperf-$(IPERF_VERSION).tar.gz
 IPERF_SITE = http://downloads.sourceforge.net/project/iperf
 
 IPERF_CONF_ENV = \
diff --git a/package/ipkg/ipkg.mk b/package/ipkg/ipkg.mk
index 9572d54..b9cba58 100644
--- a/package/ipkg/ipkg.mk
+++ b/package/ipkg/ipkg.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 IPKG_VERSION = 0.99.163
-IPKG_SOURCE = ipkg-$(IPKG_VERSION).tar.gz
 IPKG_SITE = http://www.handhelds.org/download/packages/ipkg
 IPKG_INSTALL_STAGING = YES
 
diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
index 333aa58..ebbe64e 100644
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 IRDA_UTILS_VERSION = 0.9.18
-IRDA_UTILS_SOURCE = irda-utils-$(IRDA_UTILS_VERSION).tar.gz
 IRDA_UTILS_SITE = http://downloads.sourceforge.net/project/irda/irda-utils/$(IRDA_UTILS_VERSION)
 
 IRDA_UTILS_CFLAGS = $(TARGET_CFLAGS) -I.
diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index 8fab979..dfd7f7f 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LCDPROC_VERSION = 0.5.6
-LCDPROC_SOURCE = lcdproc-$(LCDPROC_VERSION).tar.gz
 LCDPROC_SITE = http://downloads.sourceforge.net/project/lcdproc/lcdproc/$(LCDPROC_VERSION)
 LCDPROC_LICENSE = GPLv2+
 LCDPROC_LICENSE_FILES = COPYING
diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index 8a04ebf..b533ea0 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LEAFPAD_VERSION = 0.8.18
-LEAFPAD_SOURCE = leafpad-$(LEAFPAD_VERSION).tar.gz
 LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
 LEAFPAD_DEPENDENCIES = libgtk2 host-intltool
 
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 1b25013..44d9cd2 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -6,7 +6,6 @@
 
 LIBARCHIVE_VERSION = 3.0.4
 LIBARCHIVE_SITE = http://github.com/downloads/libarchive/libarchive
-LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.gz
 LIBARCHIVE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index cf2146e..fbe250c 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBATOMIC_OPS_VERSION = 7.2
-LIBATOMIC_OPS_SOURCE = libatomic_ops-$(LIBATOMIC_OPS_VERSION).tar.gz
 LIBATOMIC_OPS_SITE = http://www.hpl.hp.com/research/linux/atomic_ops/download
 
 # From doc/LICENSING.txt: "Our intent is to make it easy to use
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index dc4d88f..be4175a 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBBSD_VERSION         = 0.4.2
-LIBBSD_SOURCE          = libbsd-$(LIBBSD_VERSION).tar.gz
 LIBBSD_SITE            = http://libbsd.freedesktop.org/releases
 LIBBSD_LICENSE         = BSD-3c MIT
 LIBBSD_LICENSE_FILES   = COPYING
diff --git a/package/libdmtx/libdmtx.mk b/package/libdmtx/libdmtx.mk
index a1e0c5b..69c7b88 100644
--- a/package/libdmtx/libdmtx.mk
+++ b/package/libdmtx/libdmtx.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBDMTX_VERSION = 0.7.4
-LIBDMTX_SOURCE = libdmtx-$(LIBDMTX_VERSION).tar.gz
 LIBDMTX_SITE = http://downloads.sourceforge.net/project/libdmtx/libdmtx/$(LIBDMTX_VERSION)
 LIBDMTX_INSTALL_STAGING = YES
 
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index ea10251..177ef78 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBDNET_VERSION = 1.11
-LIBDNET_SOURCE = libdnet-$(LIBDNET_VERSION).tar.gz
 LIBDNET_SITE = http://downloads.sourceforge.net/project/libdnet/libdnet/libdnet-$(LIBDNET_VERSION)
 LIBDNET_LICENSE = BSD-3c
 LIBDNET_LICENSE_FILES = LICENSE
diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
index b5aff56..047d00b 100644
--- a/package/libelf/libelf.mk
+++ b/package/libelf/libelf.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBELF_VERSION = 0.8.12
-LIBELF_SOURCE = libelf-$(LIBELF_VERSION).tar.gz
 LIBELF_SITE = http://www.mr511.de/software/
 LIBELF_INSTALL_STAGING = YES
 LIBELF_INSTALL_STAGING_OPT = instroot=$(STAGING_DIR) install
diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 0056501..1742231 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBEV_VERSION = 4.11
-LIBEV_SOURCE = libev-$(LIBEV_VERSION).tar.gz
 LIBEV_SITE = http://dist.schmorp.de/libev/
 LIBEV_INSTALL_STAGING = YES
 
diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index b31d14b..6c405bb 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBFTDI_VERSION = 0.19
-LIBFTDI_SOURCE = libftdi-$(LIBFTDI_VERSION).tar.gz
 LIBFTDI_SITE = http://www.intra2net.com/en/developer/libftdi/download/
 LIBFTDI_DEPENDENCIES = libusb-compat libusb
 LIBFTDI_INSTALL_STAGING = YES
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index bd953ef..5cfcbea 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBGEOTIFF_VERSION = 1.3.0
-LIBGEOTIFF_SOURCE = libgeotiff-$(LIBGEOTIFF_VERSION).tar.gz
 LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
 LIBGEOTIFF_DEPENDENCIES = tiff
 LIBGEOTIFF_INSTALL_STAGING = YES
diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
index 4cecd34..97aab5d 100644
--- a/package/libhid/libhid.mk
+++ b/package/libhid/libhid.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBHID_VERSION = 0.2.16
-LIBHID_SOURCE = libhid-$(LIBHID_VERSION).tar.gz
 LIBHID_SITE = http://alioth.debian.org/frs/download.php/file/1958
 LIBHID_DEPENDENCIES = libusb-compat libusb
 LIBHID_INSTALL_STAGING = YES
diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index aa6d6de..3a513b3 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBICONV_VERSION = 1.14
-LIBICONV_SOURCE = libiconv-$(LIBICONV_VERSION).tar.gz
 LIBICONV_SITE = $(BR2_GNU_MIRROR)/libiconv
 LIBICONV_INSTALL_STAGING = YES
 
diff --git a/package/libid3tag/libid3tag.mk b/package/libid3tag/libid3tag.mk
index e67a46e..2cd7820 100644
--- a/package/libid3tag/libid3tag.mk
+++ b/package/libid3tag/libid3tag.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBID3TAG_VERSION = 0.15.1b
-LIBID3TAG_SOURCE = libid3tag-$(LIBID3TAG_VERSION).tar.gz
 LIBID3TAG_SITE = http://downloads.sourceforge.net/project/mad/libid3tag/$(LIBID3TAG_VERSION)
 LIBID3TAG_LICENSE = GPLv2+
 LIBID3TAG_LICENSE_FILES = COPYING COPYRIGHT
diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index 11b92ca..5a29923 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBISCSI_VERSION         = 1.6.0
-LIBISCSI_SOURCE          = libiscsi-$(LIBISCSI_VERSION).tar.gz
 LIBISCSI_SITE            = https://github.com/downloads/sahlberg/libiscsi
 LIBISCSI_LICENSE         = GPLv2+ LGPLv2.1+
 LIBISCSI_LICENSE_FILES   = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index dcf72ff..a6b9075 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBLO_VERSION = 0.26
-LIBLO_SOURCE = liblo-$(LIBLO_VERSION).tar.gz
 LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
 
 LIBLO_LICENSE = LGPLv2.1+
diff --git a/package/libmms/libmms.mk b/package/libmms/libmms.mk
index 37447be..405729f 100644
--- a/package/libmms/libmms.mk
+++ b/package/libmms/libmms.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBMMS_VERSION = 0.6.2
-LIBMMS_SOURCE = libmms-$(LIBMMS_VERSION).tar.gz
 LIBMMS_SITE = http://downloads.sourceforge.net/project/libmms/libmms/$(LIBMMS_VERSION)
 
 LIBMMS_INSTALL_STAGING = YES
diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
index e8d7192..5364c88 100644
--- a/package/libmpeg2/libmpeg2.mk
+++ b/package/libmpeg2/libmpeg2.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBMPEG2_VERSION = 0.5.1
-LIBMPEG2_SOURCE = libmpeg2-$(LIBMPEG2_VERSION).tar.gz
 LIBMPEG2_SITE = http://libmpeg2.sourceforge.net/files
 LIBMPEG2_LICENSE = GPLv2+
 LIBMPEG2_LICENSE_FILES = COPYING
diff --git a/package/liboauth/liboauth.mk b/package/liboauth/liboauth.mk
index 330bec0..6ade856 100644
--- a/package/liboauth/liboauth.mk
+++ b/package/liboauth/liboauth.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBOAUTH_VERSION = 0.9.6
-LIBOAUTH_SOURCE = liboauth-$(LIBOAUTH_VERSION).tar.gz
 LIBOAUTH_SITE = http://liboauth.sourceforge.net/pool
 LIBOAUTH_INSTALL_STAGING = YES
 
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 8cf2823..2decd94 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -7,7 +7,6 @@
 LIBRSVG_VERSION_MAJOR = 2.26
 LIBRSVG_VERSION_MINOR = 3
 LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).$(LIBRSVG_VERSION_MINOR)
-LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.gz
 LIBRSVG_SITE = http://ftp.gnome.org/pub/GNOME/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)/
 LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_OPT = --disable-tools
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index dca5667..d475c73 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBRSYNC_VERSION = 0.9.7
-LIBRSYNC_SOURCE = librsync-$(LIBRSYNC_VERSION).tar.gz
 LIBRSYNC_SITE = http://downloads.sourceforge.net/project/librsync/librsync/$(LIBRSYNC_VERSION)
 LIBRSYNC_LICENSE = LGPLv2.1+
 LIBRSYNC_LICENSE_FILES = COPYING
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index a69af97..da1dadd 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBSECCOMP_VERSION         = 1.0.0
-LIBSECCOMP_SOURCE          = libseccomp-$(LIBSECCOMP_VERSION).tar.gz
 LIBSECCOMP_SITE            = http://downloads.sourceforge.net/project/libseccomp
 LIBSECCOMP_LICENSE         = LGPLv2.1
 LIBSECCOMP_LICENSE_FILES   = LICENSE
diff --git a/package/libsexy/libsexy.mk b/package/libsexy/libsexy.mk
index aec0378..4f0f87c 100644
--- a/package/libsexy/libsexy.mk
+++ b/package/libsexy/libsexy.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBSEXY_VERSION = 0.1.11
-LIBSEXY_SOURCE = libsexy-$(LIBSEXY_VERSION).tar.gz
 LIBSEXY_SITE = http://releases.chipx86.com/libsexy/libsexy/
 LIBSEXY_DEPENDENCIES = libgtk2 libxml2
 LIBSEXY_INSTALL_STAGING = YES
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index 6f3d50a..433c2d6 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LINUX_FUSION_VERSION = 9.0.2
-LINUX_FUSION_SOURCE = linux-fusion-$(LINUX_FUSION_VERSION).tar.gz
 LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
 LINUX_FUSION_INSTALL_STAGING = YES
 LINUX_FUSION_DEPENDENCIES = linux
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 4bae431..1cefff1 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LOGROTATE_VERSION = 3.8.6
-LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.gz
 LOGROTATE_SITE = https://www.fedorahosted.org/releases/l/o/logrotate/
 LOGROTATE_LICENSE = GPLv2+
 LOGROTATE_LICENSE_FILES = COPYING
diff --git a/package/logsurfer/logsurfer.mk b/package/logsurfer/logsurfer.mk
index c0daa24..0a597f4 100644
--- a/package/logsurfer/logsurfer.mk
+++ b/package/logsurfer/logsurfer.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LOGSURFER_VERSION = 1.8
-LOGSURFER_SOURCE = logsurfer-$(LOGSURFER_VERSION).tar.gz
 LOGSURFER_SITE = http://downloads.sourceforge.net/project/logsurfer/logsurfer/logsurfer-$(LOGSURFER_VERSION)
 
 define LOGSURFER_INSTALL_TARGET_CMDS
diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 2ecd280..49d515e 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -6,7 +6,6 @@
 
 LRZSZ_VERSION = 0.12.20
 LRZSZ_SITE = http://www.ohse.de/uwe/releases
-LRZSZ_SOURCE = lrzsz-$(LRZSZ_VERSION).tar.gz
 
 LRZSR_CONF_OPT = --disable-timesync
 
diff --git a/package/lsuio/lsuio.mk b/package/lsuio/lsuio.mk
index ae44a78..4e4f592 100644
--- a/package/lsuio/lsuio.mk
+++ b/package/lsuio/lsuio.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LSUIO_VERSION = 0.2.0
-LSUIO_SOURCE = lsuio-$(LSUIO_VERSION).tar.gz
 LSUIO_SITE = http://www.osadl.org/projects/downloads/UIO/user
 
 $(eval $(autotools-package))
diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 1ac85eb..9709f7b 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LZOP_VERSION = 1.03
-LZOP_SOURCE = lzop-$(LZOP_VERSION).tar.gz
 LZOP_SITE = http://www.lzop.org/download/
 LZOP_LICENSE = GPLv2+
 LZOP_LICENSE_FILES = COPYING
diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
index 19ab13f..35aa651 100644
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 MADPLAY_VERSION = 0.15.2b
-MADPLAY_SOURCE = madplay-$(MADPLAY_VERSION).tar.gz
 MADPLAY_SITE = http://downloads.sourceforge.net/project/mad/madplay/$(MADPLAY_VERSION)
 MADPLAY_LICENSE = GPLv2+
 MADPLAY_LICENSE_FILES = COPYING COPYRIGHT
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 3e2092a..db5e6a5 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 MEMTESTER_VERSION = 4.3.0
-MEMTESTER_SOURCE = memtester-$(MEMTESTER_VERSION).tar.gz
 MEMTESTER_SITE = http://pyropus.ca/software/memtester/old-versions/
 MEMTESTER_LICENSE = GPLv2
 MEMTESTER_LICENSE_FILES = COPYING
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index f967d87..d46376e 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 MINICOM_VERSION = 2.6.1
-MINICOM_SOURCE = minicom-$(MINICOM_VERSION).tar.gz
 MINICOM_SITE = http://alioth.debian.org/frs/download.php/file/3700/
 MINICOM_LICENSE = GPLv2+
 MINICOM_LICENSE_FILES = COPYING
diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index 594ef2f..5b083e6 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 NETCAT_VERSION = 0.7.1
-NETCAT_SOURCE = netcat-$(NETCAT_VERSION).tar.gz
 NETCAT_SITE = http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT_VERSION)
 
 $(eval $(autotools-package))
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index 5b2b022..ee62f73 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 NUMACTL_VERSION = 2.0.8
-NUMACTL_SOURCE = numactl-$(NUMACTL_VERSION).tar.gz
 NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download/
 NUMACTL_LICENSE = LGPLv2.1 (libnuma), GPLv2 (programs)
 NUMACTL_LICENSE_FILES = README
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 5846433..f183d6e 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 OPKG_VERSION = 635
-OPKG_SOURCE = opkg-$(OPKG_VERSION).tar.gz
 OPKG_SITE = http://opkg.googlecode.com/svn/trunk/
 OPKG_SITE_METHOD = svn
 OPKG_INSTALL_STAGING = YES
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index edc970e..80eedd4 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 PCMANFM_VERSION = 0.3.5.9
-PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.gz
 PCMANFM_SITE = http://downloads.sourceforge.net/project/pcmanfm/pcmanfm-legacy%20%28Old%200.5%20series%29/PCManFM%20$(PCMANFM_VERSION)
 PCMANFM_CONF_OPT = --disable-hal
 PCMANFM_DEPENDENCIES = host-pkgconf libgtk2 gamin startup-notification xlib_libX11
diff --git a/package/pkg-config/pkg-config.mk b/package/pkg-config/pkg-config.mk
index 1f859b5..a80d7cb 100644
--- a/package/pkg-config/pkg-config.mk
+++ b/package/pkg-config/pkg-config.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 PKG_CONFIG_VERSION = 0.25
-PKG_CONFIG_SOURCE = pkg-config-$(PKG_CONFIG_VERSION).tar.gz
 PKG_CONFIG_SITE = http://pkgconfig.freedesktop.org/releases/
 PKG_CONFIG_DEPENDENCIES = libglib2
 PKG_CONFIG_CONF_OPT = --with-installed-glib
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 278ed29..3538aaa 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 PROTOBUF_VERSION = 2.4.1
-PROTOBUF_SOURCE = protobuf-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = http://protobuf.googlecode.com/files/
 PROTOBUF_LICENSE = BSD-3c
 PROTOBUF_LICENSE_FILES = COPYING.txt
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 7bec9a2..4febb50 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 QUOTA_VERSION = 4.00
-QUOTA_SOURCE = quota-$(QUOTA_VERSION).tar.gz
 QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
 QUOTA_DEPENDENCIES = host-gettext
 QUOTA_AUTORECONF = YES
diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index ea2ca0a..94e0282 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 RDESKTOP_VERSION = 1.5.0
-RDESKTOP_SOURCE = rdesktop-$(RDESKTOP_VERSION).tar.gz
 RDESKTOP_SITE = http://downloads.sourceforge.net/project/rdesktop/rdesktop/$(RDESKTOP_VERSION)
 RDESKTOP_DEPENDENCIES = openssl xlib_libX11 xlib_libXt
 RDESKTOP_CONF_OPT = --with-openssl=$(STAGING_DIR)/usr
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index ff55199..c9df708 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 READLINE_VERSION = 6.2
-READLINE_SOURCE = readline-$(READLINE_VERSION).tar.gz
 READLINE_SITE = $(BR2_GNU_MIRROR)/readline
 READLINE_INSTALL_STAGING = YES
 READLINE_DEPENDENCIES = ncurses
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 30748b5..d8e5f3f 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 RSYNC_VERSION = 3.1.0
-RSYNC_SOURCE = rsync-$(RSYNC_VERSION).tar.gz
 RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPLv3+
 RSYNC_LICENSE_FILES = COPYING
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 3b7076e..e2adc1a 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 SANE_BACKENDS_VERSION = 1.0.22
-SANE_BACKENDS_SOURCE = sane-backends-$(SANE_BACKENDS_VERSION).tar.gz
 SANE_BACKENDS_SITE = https://alioth.debian.org/frs/download.php/file/3503
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index c256d5f..aee0af1 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 SCONS_VERSION = 2.2.0
-SCONS_SOURCE = scons-$(SCONS_VERSION).tar.gz
 SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
 SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE.txt
diff --git a/package/startup-notification/startup-notification.mk b/package/startup-notification/startup-notification.mk
index 7ebebdd..140b681 100644
--- a/package/startup-notification/startup-notification.mk
+++ b/package/startup-notification/startup-notification.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 STARTUP_NOTIFICATION_VERSION = 0.9
-STARTUP_NOTIFICATION_SOURCE = startup-notification-$(STARTUP_NOTIFICATION_VERSION).tar.gz
 STARTUP_NOTIFICATION_SITE = http://freedesktop.org/software/startup-notification/releases
 STARTUP_NOTIFICATION_INSTALL_STAGING = YES
 STARTUP_NOTIFICATION_DEPENDENCIES = xlib_libX11
diff --git a/package/statserial/statserial.mk b/package/statserial/statserial.mk
index 22dc8c6..25989bc 100644
--- a/package/statserial/statserial.mk
+++ b/package/statserial/statserial.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 STATSERIAL_VERSION = 1.1
-STATSERIAL_SOURCE = statserial-$(STATSERIAL_VERSION).tar.gz
 STATSERIAL_SITE = http://www.ibiblio.org/pub/Linux/system/serial/
 STATSERIAL_DEPENDENCIES = ncurses
 
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index 516065b..40ad8ce 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 SUPERVISOR_VERSION = 3.0a12
-SUPERVISOR_SOURCE = supervisor-$(SUPERVISOR_VERSION).tar.gz
 SUPERVISOR_SITE = http://pypi.python.org/packages/source/s/supervisor/
 SUPERVISOR_LICENSE_FILES = LICENSES.txt
 
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index c6119b5..89a3d49 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 SYNERGY_VERSION = 1.3.1
-SYNERGY_SOURCE = synergy-$(SYNERGY_VERSION).tar.gz
 SYNERGY_SITE = http://downloads.sourceforge.net/project/synergy2/Sources/$(SYNERGY_VERSION)
 
 SYNERGY_AUTORECONF = YES
diff --git a/package/tidsp-binaries/tidsp-binaries.mk b/package/tidsp-binaries/tidsp-binaries.mk
index fd799fb..8c06ea7 100644
--- a/package/tidsp-binaries/tidsp-binaries.mk
+++ b/package/tidsp-binaries/tidsp-binaries.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 TIDSP_BINARIES_VERSION = 23.i3.8
-TIDSP_BINARIES_SOURCE = tidsp-binaries-$(TIDSP_BINARIES_VERSION).tar.gz
 TIDSP_BINARIES_SITE = http://gst-dsp.googlecode.com/files/
 
 define TIDSP_BINARIES_INSTALL_TARGET_CMDS
diff --git a/package/torsmo/torsmo.mk b/package/torsmo/torsmo.mk
index a09013a..ad846ca 100644
--- a/package/torsmo/torsmo.mk
+++ b/package/torsmo/torsmo.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 TORSMO_VERSION = 0.18
-TORSMO_SOURCE = torsmo-$(TORSMO_VERSION).tar.gz
 TORSMO_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/Torsmo
 
 # help2man doesn't work when cross compiling
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index e391cf9..8c22130 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 UDPCAST_VERSION = 20120424
-UDPCAST_SOURCE = udpcast-$(UDPCAST_VERSION).tar.gz
 UDPCAST_SITE = http://www.udpcast.linux.lu/download
 UDPCAST_CONF_ENV = $(if $(BR_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no)
 UDPCAST_DEPENDENCIES = host-m4
diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index b0c0db3..7c0e70a 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 VTUN_VERSION = 3.0.3
-VTUN_SOURCE = vtun-$(VTUN_VERSION).tar.gz
 VTUN_SITE = http://downloads.sourceforge.net/project/vtun/vtun/$(VTUN_VERSION)
 VTUN_DEPENDENCIES = host-bison host-flex zlib lzo openssl
 VTUN_AUTORECONF = YES
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index bf9b96e..a2d68f6 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 X11VNC_VERSION = 0.9.13
-X11VNC_SOURCE = x11vnc-$(X11VNC_VERSION).tar.gz
 X11VNC_SITE = http://downloads.sourceforge.net/project/libvncserver/x11vnc/$(X11VNC_VERSION)
 # sdl support is not used in x11vnc, but host include / library search paths
 # leak in if host has sdl-config
diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index 32cdf28..34a449f 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 XINETD_VERSION       = 2.3.15
-XINETD_SOURCE        = xinetd-$(XINETD_VERSION).tar.gz
 XINETD_SITE          = http://www.xinetd.org
 XINETD_LICENSE       = xinetd license
 XINETD_LICENSE_FILES = COPYRIGHT
diff --git a/package/xstroke/xstroke.mk b/package/xstroke/xstroke.mk
index 5440495..bc4b2c6 100644
--- a/package/xstroke/xstroke.mk
+++ b/package/xstroke/xstroke.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 XSTROKE_VERSION = 0.6
-XSTROKE_SOURCE = xstroke-$(XSTROKE_VERSION).tar.gz
 XSTROKE_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/XStroke
 
 XSTROKE_DEPENDENCIES = xlib_libXft xlib_libXtst xlib_libXpm xlib_libXrender xlib_libXext
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index c7d40a1..15aa940 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 XVKBD_VERSION = 3.2
-XVKBD_SOURCE = xvkbd-$(XVKBD_VERSION).tar.gz
 XVKBD_SITE = http://homepage3.nifty.com/tsato/xvkbd
 
 # Passing USRLIBDIR ensures that the stupid Makefile doesn't add
diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
index 26324da..20063ba 100644
--- a/package/yasm/yasm.mk
+++ b/package/yasm/yasm.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 YASM_VERSION = 1.2.0
-YASM_SOURCE = yasm-$(YASM_VERSION).tar.gz
 YASM_SITE = http://www.tortall.net/projects/yasm/releases/
 
 define YASM_PRE_CONFIGURE_FIXUP
