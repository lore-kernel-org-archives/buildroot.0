From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Aug 2012 22:59:52 +0200
Subject: [Buildroot] [git commit] remove rest of the BR2_SOURCEFORGE_MIRROR
	references
Message-ID: <20120828230609.A5772994D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23ef45ca1ee8e9d6535fe4484b387c831a450c02
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stefan Fr??berg <stefan.froberg@petroprogram.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/beecrypt/beecrypt.mk            |    2 +-
 package/blackbox/blackbox.mk            |    2 +-
 package/boost/boost.mk                  |    2 +-
 package/bootutils/bootutils.mk          |    2 +-
 package/bridge-utils/bridge-utils.mk    |    2 +-
 package/bwm-ng/bwm-ng.mk                |    2 +-
 package/cjson/cjson.mk                  |    2 +-
 package/cramfs/cramfs.mk                |    2 +-
 package/e2fsprogs/e2fsprogs.mk          |    2 +-
 package/ebtables/ebtables.mk            |    2 +-
 package/expat/expat.mk                  |    2 +-
 package/ezxml/ezxml.mk                  |    2 +-
 package/fluxbox/fluxbox.mk              |    2 +-
 package/gdisk/gdisk.mk                  |    2 +-
 package/genext2fs/genext2fs.mk          |    2 +-
 package/genromfs/genromfs.mk            |    4 ++--
 package/gtkperf/gtkperf.mk              |    2 +-
 package/haserl/haserl.mk                |    2 +-
 package/hdparm/hdparm.mk                |    2 +-
 package/htop/htop.mk                    |    2 +-
 package/imlib2/imlib2.mk                |    2 +-
 package/iperf/iperf.mk                  |    2 +-
 package/irda-utils/irda-utils.mk        |    2 +-
 package/lcdproc/lcdproc.mk              |    2 +-
 package/libargtable2/libargtable2.mk    |    2 +-
 package/libcdaudio/libcdaudio.mk        |    2 +-
 package/libcgi/libcgi.mk                |    2 +-
 package/libcue/libcue.mk                |    2 +-
 package/libdmtx/libdmtx.mk              |    2 +-
 package/libdnet/libdnet.mk              |    2 +-
 package/libexif/libexif.mk              |    2 +-
 package/libical/libical.mk              |    2 +-
 package/libid3tag/libid3tag.mk          |    2 +-
 package/libmad/libmad.mk                |    2 +-
 package/libmms/libmms.mk                |    2 +-
 package/librsync/librsync.mk            |    2 +-
 package/libsysfs/libsysfs.mk            |    2 +-
 package/libtpl/libtpl.mk                |    2 +-
 package/libungif/libungif.mk            |    2 +-
 package/libupnp/libupnp.mk              |    2 +-
 package/libusb-compat/libusb-compat.mk  |    2 +-
 package/libusb/libusb.mk                |    2 +-
 package/libvncserver/libvncserver.mk    |    2 +-
 package/lmbench/lmbench.mk              |    2 +-
 package/logsurfer/logsurfer.mk          |    2 +-
 package/ltp-testsuite/ltp-testsuite.mk  |    2 +-
 package/multimedia/bellagio/bellagio.mk |    2 +-
 package/multimedia/faad2/faad2.mk       |    2 +-
 package/multimedia/flac/flac.mk         |    2 +-
 package/multimedia/lame/lame.mk         |    2 +-
 package/multimedia/madplay/madplay.mk   |    2 +-
 package/multimedia/mpd/mpd.mk           |    2 +-
 package/multimedia/mpg123/mpg123.mk     |    2 +-
 package/mutt/mutt.mk                    |    2 +-
 package/nanocom/nanocom.mk              |    2 +-
 package/nbd/nbd.mk                      |    2 +-
 package/netatalk/netatalk.mk            |    2 +-
 package/netcat/netcat.mk                |    2 +-
 package/netsnmp/netsnmp.mk              |    2 +-
 package/nfs-utils/nfs-utils.mk          |    2 +-
 package/ngrep/ngrep.mk                  |    2 +-
 package/ocf-linux/ocf-linux.mk          |    2 +-
 package/opencv/opencv.mk                |    2 +-
 package/openocd/openocd.mk              |    2 +-
 package/poco/poco.mk                    |    5 +++--
 package/pptp-linux/pptp-linux.mk        |    2 +-
 package/psmisc/psmisc.mk                |    2 +-
 package/python-id3/python-id3.mk        |    2 +-
 package/quota/quota.mk                  |    2 +-
 package/rdesktop/rdesktop.mk            |    2 +-
 package/rng-tools/rng-tools.mk          |    2 +-
 package/scons/scons.mk                  |    2 +-
 package/ser2net/ser2net.mk              |    2 +-
 package/smartmontools/smartmontools.mk  |    2 +-
 package/squashfs/squashfs.mk            |    2 +-
 package/squashfs3/squashfs3.mk          |    2 +-
 package/sshfs/sshfs.mk                  |    2 +-
 package/strace/strace.mk                |    2 +-
 package/synergy/synergy.mk              |    2 +-
 package/tcl/tcl.mk                      |    2 +-
 package/tcpreplay/tcpreplay.mk          |    2 +-
 package/tinyhttpd/tinyhttpd.mk          |    2 +-
 package/tn5250/tn5250.mk                |    2 +-
 package/vtun/vtun.mk                    |    2 +-
 package/wipe/wipe.mk                    |    2 +-
 package/xmlstarlet/xmlstarlet.mk        |    2 +-
 86 files changed, 89 insertions(+), 88 deletions(-)

diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index f3a8c03..d165aee 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 BEECRYPT_VERSION = 4.2.1
-BEECRYPT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/beecrypt
+BEECRYPT_SITE = http://downloads.sourceforge.net/project/beecrypt/beecrypt/$(BEECRYPT_VERSION)
 BEECRYPT_AUTORECONF = YES
 BEECRYPT_INSTALL_STAGING = YES
 
diff --git a/package/blackbox/blackbox.mk b/package/blackbox/blackbox.mk
index a6d4b45..43cd747 100644
--- a/package/blackbox/blackbox.mk
+++ b/package/blackbox/blackbox.mk
@@ -6,7 +6,7 @@
 
 BLACKBOX_VERSION:=0.70.1
 BLACKBOX_SOURCE:=blackbox-$(BLACKBOX_VERSION).tar.bz2
-BLACKBOX_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/blackboxwm/
+BLACKBOX_SITE:=http://downloads.sourceforge.net/project/blackboxwm/blackboxwm/Blackbox%20$(BLACKBOX_VERSION)
 
 BLACKBOX_CONF_OPT:=--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 3b08bb9..64856bc 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -7,7 +7,7 @@
 BOOST_VERSION = 1.49.0
 BOOST_FILE_VERSION = $(subst .,_,$(BOOST_VERSION))
 BOOST_SOURCE = boost_$(BOOST_FILE_VERSION).tar.bz2
-BOOST_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/boost
+BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
 BOOST_INSTALL_STAGING = YES
 
 TARGET_CC_VERSION = $(shell $(TARGET_CC) -dumpversion)
diff --git a/package/bootutils/bootutils.mk b/package/bootutils/bootutils.mk
index a37654b..3f943a7 100644
--- a/package/bootutils/bootutils.mk
+++ b/package/bootutils/bootutils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 BOOTUTILS_VERSION = 1.0.0
-BOOTUTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/bootutils
+BOOTUTILS_SITE = http://downloads.sourceforge.net/project/bootutils/Stable/v$(BOOTUTILS_VERSION)
 
 BOOTUTILS_CONF_OPT = --prefix=/ --exec-prefix=/
 
diff --git a/package/bridge-utils/bridge-utils.mk b/package/bridge-utils/bridge-utils.mk
index 5f846ff..685b657 100644
--- a/package/bridge-utils/bridge-utils.mk
+++ b/package/bridge-utils/bridge-utils.mk
@@ -6,7 +6,7 @@
 
 BRIDGE_UTILS_VERSION = 1.5
 BRIDGE_UTILS_SOURCE = bridge-utils-$(BRIDGE_UTILS_VERSION).tar.gz
-BRIDGE_UTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/bridge
+BRIDGE_UTILS_SITE = http://downloads.sourceforge.net/project/bridge/bridge
 BRIDGE_UTILS_AUTORECONF = YES
 BRIDGE_UTILS_CONF_OPT = --with-linux-headers=$(LINUX_HEADERS_DIR)
 
diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index ddc6f5b..7ec7d7f 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 BWM_NG_VERSION = 0.6
-BWM_NG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/bwmng/bwmng/$(BWM_NG_VERSION)/
+BWM_NG_SITE = http://downloads.sourceforge.net/project/bwmng/bwmng/$(BWM_NG_VERSION)/
 BWM_NG_CONF_OPT = --with-procnetdev --with-diskstats
 BWM_NG_LICENSE = GPLv2
 BWM_NG_LICENSE_FILES = COPYING
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 6f26bb8..79b4c31 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -5,7 +5,7 @@
 #############################################################
 CJSON_VERSION         = undefined
 CJSON_SOURCE          = cJSONFiles.zip
-CJSON_SITE            = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/cjson/
+CJSON_SITE            = http://downloads.sourceforge.net/project/cjson/
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE         = MIT
 
diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 71ed8cb..519a179 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -6,7 +6,7 @@
 
 CRAMFS_VERSION=1.1
 CRAMFS_SOURCE=cramfs-$(CRAMFS_VERSION).tar.gz
-CRAMFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/cramfs
+CRAMFS_SITE=http://downloads.sourceforge.net/project/cramfs/cramfs/$(CRAMFS_VERSION)
 
 CRAMFS_DEPENDENCIES = zlib
 
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 16725ac..9f2a5f7 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 E2FSPROGS_VERSION = 1.42.4
-E2FSPROGS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/e2fsprogs
+E2FSPROGS_SITE = http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/$(E2FSPROGS_VERSION)
 
 E2FSPROGS_CONF_OPT = \
 	--disable-tls \
diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 7676e9a..3f667ba 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -6,7 +6,7 @@
 
 EBTABLES_VERSION = 2.0.10-4
 EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
-EBTABLES_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ebtables
+EBTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/ebtables/ebtables-$(EBTABLES_VERSION)
 EBTABLES_LICENSE = GPLv2
 EBTABLES_LICENSE_FILES = COPYING
 
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 7fa3126..5b19b4c 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 EXPAT_VERSION = 2.1.0
-EXPAT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
+EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_INSTALL_STAGING = YES
 EXPAT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) installlib
 EXPAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) installlib
diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index 57c3ffb..89e1957 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -5,7 +5,7 @@
 #############################################################
 EZXML_VERSION = 0.8.6
 EZXML_SOURCE = ezxml-$(EZXML_VERSION).tar.gz
-EZXML_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ezxml/
+EZXML_SITE = http://downloads.sourceforge.net/project/ezxml/ezXML/ezXML%20$(EZXML_VERSION)
 EZXML_INSTALL_STAGING=YES
 
 define EZXML_BUILD_CMDS
diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index 6d7ff95..15136c9 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -6,7 +6,7 @@
 
 FLUXBOX_VERSION = 1.3.2
 FLUXBOX_SOURCE = fluxbox-$(FLUXBOX_VERSION).tar.bz2
-FLUXBOX_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fluxbox/
+FLUXBOX_SITE = http://downloads.sourceforge.net/project/fluxbox/fluxbox/$(FLUXBOX_VERSION)
 
 FLUXBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		   --x-libraries=$(STAGING_DIR)/usr/lib
diff --git a/package/gdisk/gdisk.mk b/package/gdisk/gdisk.mk
index d7c8bec..f933436 100644
--- a/package/gdisk/gdisk.mk
+++ b/package/gdisk/gdisk.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 GDISK_VERSION = 0.6.14
-GDISK_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gptfdisk
+GDISK_SITE = http://downloads.sourceforge.net/project/gptfdisk/gptfdisk/$(GDISK_VERSION)
 GDISK_SOURCE = gdisk-$(GDISK_VERSION).tgz
 
 GDISK_TARGETS_$(BR2_PACKAGE_GDISK_GDISK) += gdisk
diff --git a/package/genext2fs/genext2fs.mk b/package/genext2fs/genext2fs.mk
index 9757d9f..6472811 100644
--- a/package/genext2fs/genext2fs.mk
+++ b/package/genext2fs/genext2fs.mk
@@ -6,7 +6,7 @@
 
 GENEXT2FS_VERSION=1.4.1
 GENEXT2FS_SOURCE=genext2fs-$(GENEXT2FS_VERSION).tar.gz
-GENEXT2FS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/genext2fs
+GENEXT2FS_SITE:=http://downloads.sourceforge.net/project/genext2fs/genext2fs/$(GENEXT2FS_VERSION)
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
index c1cd608..3f5d44e 100644
--- a/package/genromfs/genromfs.mk
+++ b/package/genromfs/genromfs.mk
@@ -6,7 +6,7 @@
 
 GENROMFS_VERSION=0.5.2
 GENROMFS_SOURCE=genromfs-$(GENROMFS_VERSION).tar.gz
-GENROMFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/romfs
+GENROMFS_SITE=http://downloads.sourceforge.net/project/romfs/genromfs/$(GENROMFS_VERSION)
 
 define GENROMFS_BUILD_CMDS
  $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
@@ -28,4 +28,4 @@ define HOST_GENROMFS_INSTALL_CMDS
 endef
 
 $(eval $(generic-package))
-$(eval $(host-generic-package))
\ No newline at end of file
+$(eval $(host-generic-package))
diff --git a/package/gtkperf/gtkperf.mk b/package/gtkperf/gtkperf.mk
index 7b63dcb..b2ad943 100644
--- a/package/gtkperf/gtkperf.mk
+++ b/package/gtkperf/gtkperf.mk
@@ -5,7 +5,7 @@
 #############################################################
 GTKPERF_VERSION:=0.40
 GTKPERF_SOURCE:=gtkperf_$(GTKPERF_VERSION).tar.gz
-GTKPERF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gtkperf
+GTKPERF_SITE:=http://downloads.sourceforge.net/project/gtkperf/gtkperf/$(GTKPERF_VERSION)
 GTKPERF_DEPENDENCIES = libgtk2
 
 $(eval $(autotools-package))
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 14226c5..589b3e7 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 HASERL_VERSION = $(call qstrip,$(BR2_PACKAGE_HASERL_VERSION))
-HASERL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/haserl/
+HASERL_SITE = http://downloads.sourceforge.net/project/haserl/haserl-devel/$(HASERL_VERSION)
 
 ifeq ($(BR2_PACKAGE_HASERL_WITH_LUA),y)
 	HASERL_CONF_OPT += --with-lua=$(STAGING_DIR) \
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index c524c62..5c00e79 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 HDPARM_VERSION = 9.39
-HDPARM_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/hdparm
+HDPARM_SITE = http://downloads.sourceforge.net/project/hdparm/hdparm
 
 define HDPARM_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 9fa5bec..e7061bb 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 HTOP_VERSION = 1.0.1
-HTOP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/htop/htop/$(HTOP_VERSION)
+HTOP_SITE = http://downloads.sourceforge.net/project/htop/htop/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
 HTOP_AUTORECONF = YES
 HTOP_CONF_OPT = --disable-unicode
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index c94d96d..3adcd99 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -5,7 +5,7 @@
 ##############################################################
 IMLIB2_VERSION = 1.4.5
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
-IMLIB2_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)/
+IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)/
 IMLIB2_INSTALL_STAGING = YES
 IMLIB2_DEPENDENCIES = host-pkg-config freetype
 IMLIB2_CONF_OPT = --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index fdf1d47..b20080f 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -5,7 +5,7 @@
 #############################################################
 IPERF_VERSION = 2.0.5
 IPERF_SOURCE = iperf-$(IPERF_VERSION).tar.gz
-IPERF_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/iperf
+IPERF_SITE = http://downloads.sourceforge.net/project/iperf
 
 IPERF_CONF_ENV = \
 	ac_cv_func_malloc_0_nonnull=yes \
diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
index b2b84d5..34612c2 100644
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -6,7 +6,7 @@
 
 IRDA_UTILS_VERSION = 0.9.18
 IRDA_UTILS_SOURCE = irda-utils-$(IRDA_UTILS_VERSION).tar.gz
-IRDA_UTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/irda
+IRDA_UTILS_SITE = http://downloads.sourceforge.net/project/irda/irda-utils/$(IRDA_UTILS_VERSION)
 
 IRDA_UTILS_CFLAGS = $(TARGET_CFLAGS) -I.
 ifeq ($(BR2_USE_MMU),)
diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index 94848e6..e4944da 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -5,7 +5,7 @@
 #############################################################
 LCDPROC_VERSION = 0.5.5
 LCDPROC_SOURCE = lcdproc-$(LCDPROC_VERSION).tar.gz
-LCDPROC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/lcdproc/lcdproc/$(LCDPROC_VERSION)
+LCDPROC_SITE = http://downloads.sourceforge.net/project/lcdproc/lcdproc/$(LCDPROC_VERSION)
 LCDPROC_LICENSE = GPLv2+
 LCDPROC_LICENSE_FILES = COPYING
 
diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
index d5172d2..900a8b5 100644
--- a/package/libargtable2/libargtable2.mk
+++ b/package/libargtable2/libargtable2.mk
@@ -6,7 +6,7 @@
 
 LIBARGTABLE2_VERSION = 13
 LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_VERSION).tar.gz
-LIBARGTABLE2_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/argtable/
+LIBARGTABLE2_SITE = http://downloads.sourceforge.net/project/argtable/argtable/argtable-2.13
 
 LIBARGTABLE2_INSTALL_STAGING = YES
 LIBARGTABLE2_CONF_OPT= --disable-example \
diff --git a/package/libcdaudio/libcdaudio.mk b/package/libcdaudio/libcdaudio.mk
index 86b59a3..203a8aa 100644
--- a/package/libcdaudio/libcdaudio.mk
+++ b/package/libcdaudio/libcdaudio.mk
@@ -6,7 +6,7 @@
 
 LIBCDAUDIO_VERSION = 0.99.12p2
 LIBCDAUDIO_SOURCE = libcdaudio-$(LIBCDAUDIO_VERSION).tar.gz
-LIBCDAUDIO_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libcdaudio/libcdaudio/$(LIBCDAUDIO_VERSION)/
+LIBCDAUDIO_SITE = http://downloads.sourceforge.net/project/libcdaudio/libcdaudio/$(LIBCDAUDIO_VERSION)/
 LIBCDAUDIO_AUTORECONF = YES
 LIBCDAUDIO_LIBTOOL_PATCH = YES
 LIBCDAUDIO_INSTALL_STAGING = YES
diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
index 549d0f2..286a8cd 100644
--- a/package/libcgi/libcgi.mk
+++ b/package/libcgi/libcgi.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 LIBCGI_VERSION = 1.0
-LIBCGI_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libcgi
+LIBCGI_SITE = http://downloads.sourceforge.net/project/libcgi/libcgi/$(LIBCGI_VERSION)
 LIBCGI_INSTALL_STAGING = YES
 # use cross CC/AR rather than host
 LIBCGI_MAKE_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS)" AR="$(TARGET_AR)"
diff --git a/package/libcue/libcue.mk b/package/libcue/libcue.mk
index 4ef1145..cd19f4a 100644
--- a/package/libcue/libcue.mk
+++ b/package/libcue/libcue.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCUE_VERSION = 1.4.0
-LIBCUE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libcue
+LIBCUE_SITE = http://downloads.sourceforge.net/project/libcue/libcue/$(LIBCUE_VERSION)
 LIBCUE_SOURCE = libcue-$(LIBCUE_VERSION).tar.bz2
 LIBCUE_DEPENDENCIES = flex
 LIBCUE_INSTALL_STAGING = YES
diff --git a/package/libdmtx/libdmtx.mk b/package/libdmtx/libdmtx.mk
index 800b4ff..7cea168 100644
--- a/package/libdmtx/libdmtx.mk
+++ b/package/libdmtx/libdmtx.mk
@@ -6,7 +6,7 @@
 
 LIBDMTX_VERSION = 0.7.4
 LIBDMTX_SOURCE = libdmtx-$(LIBDMTX_VERSION).tar.gz
-LIBDMTX_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libdmtx
+LIBDMTX_SITE = http://downloads.sourceforge.net/project/libdmtx/libdmtx/$(LIBDMTX_VERSION)
 LIBDMTX_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index f6daffd..03955a7 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -6,7 +6,7 @@
 
 LIBDNET_VERSION = 1.11
 LIBDNET_SOURCE = libdnet-$(LIBDNET_VERSION).tar.gz
-LIBDNET_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libdnet/
+LIBDNET_SITE = http://downloads.sourceforge.net/project/libdnet/libdnet/libdnet-$(LIBDNET_VERSION)
 LIBDNET_LICENSE = BSD-3c
 LIBDNET_LICENSE_FILES = LICENSE
 LIBDNET_INSTALL_STAGING = YES
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index a54694c..f7af18a 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -6,7 +6,7 @@
 
 LIBEXIF_VERSION = 0.6.21
 LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.bz2
-LIBEXIF_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libexif/libexif/$(LIBEXIF_VERSION)
+LIBEXIF_SITE = http://downloads.sourceforge.net/project/libexif/libexif/$(LIBEXIF_VERSION)
 LIBEXIF_INSTALL_STAGING = YES
 LIBEXIF_CONF_OPT = --disable-docs
 LIBEXIF_DEPENDENCIES = host-pkg-config
diff --git a/package/libical/libical.mk b/package/libical/libical.mk
index 7c5c881..e95a702 100644
--- a/package/libical/libical.mk
+++ b/package/libical/libical.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 LIBICAL_VERSION = 0.48
-LIBICAL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/freeassociation/libical/libical-$(LIBICAL_VERSION)
+LIBICAL_SITE = http://downloads.sourceforge.net/project/freeassociation/libical/libical-$(LIBICAL_VERSION)
 LIBICAL_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
diff --git a/package/libid3tag/libid3tag.mk b/package/libid3tag/libid3tag.mk
index 20579d6..1e78fca 100644
--- a/package/libid3tag/libid3tag.mk
+++ b/package/libid3tag/libid3tag.mk
@@ -6,7 +6,7 @@
 
 LIBID3TAG_VERSION:=0.15.1b
 LIBID3TAG_SOURCE:=libid3tag-$(LIBID3TAG_VERSION).tar.gz
-LIBID3TAG_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mad
+LIBID3TAG_SITE:=http://downloads.sourceforge.net/project/mad/libid3tag/$(LIBID3TAG_VERSION)
 LIBID3TAG_INSTALL_STAGING=YES
 LIBID3TAG_DEPENDENCIES=zlib
 LIBID3TAG_LIBTOOL_PATCH=NO
diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index 71e9c34..d9ce0ae 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 LIBMAD_VERSION = 0.15.1b
-LIBMAD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mad/
+LIBMAD_SITE = http://downloads.sourceforge.net/project/mad/libmad/$(LIBMAD_VERSION)
 LIBMAD_INSTALL_STAGING = YES
 LIBMAD_LIBTOOL_PATCH = NO
 
diff --git a/package/libmms/libmms.mk b/package/libmms/libmms.mk
index 1058303..bc66f53 100644
--- a/package/libmms/libmms.mk
+++ b/package/libmms/libmms.mk
@@ -5,7 +5,7 @@
 #############################################################
 LIBMMS_VERSION = 0.6.2
 LIBMMS_SOURCE = libmms-$(LIBMMS_VERSION).tar.gz
-LIBMMS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libmms
+LIBMMS_SITE = http://downloads.sourceforge.net/project/libmms/libmms/$(LIBMMS_VERSION)
 
 LIBMMS_INSTALL_STAGING = YES
 
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index f0f543f..45b715b 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -5,7 +5,7 @@
 #############################################################
 LIBRSYNC_VERSION:=0.9.7
 LIBRSYNC_SOURCE:=librsync-$(LIBRSYNC_VERSION).tar.gz
-LIBRSYNC_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/librsync/
+LIBRSYNC_SITE:=http://downloads.sourceforge.net/project/librsync/librsync/$(LIBRSYNC_VERSION)
 LIBRSYNC_LICENSE = LGPLv2.1+
 LIBRSYNC_LICENSE_FILES = COPYING
 LIBRSYNC_INSTALL_STAGING = YES
diff --git a/package/libsysfs/libsysfs.mk b/package/libsysfs/libsysfs.mk
index 996903d..4fbb195 100644
--- a/package/libsysfs/libsysfs.mk
+++ b/package/libsysfs/libsysfs.mk
@@ -22,7 +22,7 @@
 # USA
 
 LIBSYSFS_VERSION:=2.1.0
-LIBSYSFS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/linux-diag
+LIBSYSFS_SITE:=http://downloads.sourceforge.net/project/linux-diag/sysfsutils/$(LIBSYSFS_VERSION)
 LIBSYSFS_SOURCE:=sysfsutils-$(LIBSYSFS_VERSION).tar.gz
 LIBSYSFS_INSTALL_STAGING=YES
 
diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
index 7af0b06..3ef9cc3 100644
--- a/package/libtpl/libtpl.mk
+++ b/package/libtpl/libtpl.mk
@@ -5,7 +5,7 @@
 #############################################################
 LIBTPL_VERSION = 1.5
 LIBTPL_SOURCE = libtpl-$(LIBTPL_VERSION).tar.bz2
-LIBTPL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tpl
+LIBTPL_SITE = http://downloads.sourceforge.net/project/tpl/tpl/libtpl-$(LIBTPL_VERSION)
 LIBTPL_INSTALL_STAGING = YES
 LIBTPL_LICENSE = BSD-like
 LIBTPL_LICENSE_FILES = LICENSE
diff --git a/package/libungif/libungif.mk b/package/libungif/libungif.mk
index 3b9583c..de9dc12 100644
--- a/package/libungif/libungif.mk
+++ b/package/libungif/libungif.mk
@@ -5,7 +5,7 @@
 #############################################################
 LIBUNGIF_VERSION:=4.1.4
 LIBUNGIF_SOURCE:=libungif-$(LIBUNGIF_VERSION).tar.bz2
-LIBUNGIF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/giflib
+LIBUNGIF_SITE:=http://downloads.sourceforge.net/project/giflib/libungif-4.x/libungif-$(LIBUNGIF_VERSION)
 LIBUNGIF_INSTALL_STAGING = YES
 LIBUNGIF_CONF_OPT = --without-x
 
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index 18968d8..3d4606b 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -6,7 +6,7 @@
 
 LIBUPNP_VERSION = 1.6.17
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
-LIBUPNP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP_VERSION)
+LIBUPNP_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
 LIBUPNP_INSTALL_STAGING = YES
 
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 1659fd1..d42abf5 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -5,7 +5,7 @@
 #############################################################
 LIBUSB_COMPAT_VERSION = 0.1.4
 LIBUSB_COMPAT_SOURCE = libusb-compat-$(LIBUSB_COMPAT_VERSION).tar.bz2
-LIBUSB_COMPAT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libusb/libusb-compat-0.1/libusb-compat-$(LIBUSB_COMPAT_VERSION)
+LIBUSB_COMPAT_SITE = http://downloads.sourceforge.net/project/libusb/libusb-compat-0.1/libusb-compat-$(LIBUSB_COMPAT_VERSION)
 LIBUSB_COMPAT_DEPENDENCIES = host-pkg-config libusb
 LIBUSB_COMPAT_INSTALL_STAGING = YES
 
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 5c485c6..d4ca31e 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -5,7 +5,7 @@
 #############################################################
 LIBUSB_VERSION = 1.0.9
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
-LIBUSB_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libusb/libusb-1.0/libusb-$(LIBUSB_VERSION)
+LIBUSB_SITE = http://downloads.sourceforge.net/project/libusb/libusb-1.0/libusb-$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPLv2.1+
 LIBUSB_LICENSE_FILES = COPYING
 LIBUSB_DEPENDENCIES = host-pkg-config
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index ad5f595..f94670e 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -6,7 +6,7 @@
 
 LIBVNCSERVER_VERSION = 0.9.8.2
 LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
-LIBVNCSERVER_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libvncserver/$(LIBVNCSERVER_VERSION)
+LIBVNCSERVER_SITE = http://downloads.sourceforge.net/project/libvncserver/libvncserver/$(LIBVNCSERVER_VERSION)
 
 LIBVNCSERVER_INSTALL_STAGING = YES
 
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 10f6d14..d3d0f8f 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -5,7 +5,7 @@
 #############################################################
 LMBENCH_VERSION:=3.0-a9
 LMBENCH_SOURCE:=lmbench-$(LMBENCH_VERSION).tgz
-LMBENCH_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/lmbench/development/lmbench-3.0-a9/
+LMBENCH_SITE:=http://downloads.sourceforge.net/project/lmbench/development/lmbench-$(LMBENCH_VERSION)/
 LMBENCH_LICENSE =  lmbench license (based on GPLv2)
 LMBENCH_LICENSE_FILES = COPYING COPYING-2
 
diff --git a/package/logsurfer/logsurfer.mk b/package/logsurfer/logsurfer.mk
index 17c3e9e..4d9a8d4 100644
--- a/package/logsurfer/logsurfer.mk
+++ b/package/logsurfer/logsurfer.mk
@@ -6,7 +6,7 @@
 
 LOGSURFER_VERSION = 1.8
 LOGSURFER_SOURCE = logsurfer-$(LOGSURFER_VERSION).tar.gz
-LOGSURFER_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/logsurfer/logsurfer/logsurfer-$(LOGSURFER_VERSION)
+LOGSURFER_SITE = http://downloads.sourceforge.net/project/logsurfer/logsurfer/logsurfer-$(LOGSURFER_VERSION)
 
 define LOGSURFER_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/src/logsurfer \
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index c0cb676..c6b34f0 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -5,6 +5,6 @@
 #############################################################
 LTP_TESTSUITE_VERSION = 20101031
 LTP_TESTSUITE_SOURCE  = ltp-full-$(LTP_TESTSUITE_VERSION).bz2
-LTP_TESTSUITE_SITE    = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ltp
+LTP_TESTSUITE_SITE    = http://downloads.sourceforge.net/project/ltp/LTP%20Source/ltp-$(LTP_TESTSUITE_VERSION)
 
 $(eval $(autotools-package))
diff --git a/package/multimedia/bellagio/bellagio.mk b/package/multimedia/bellagio/bellagio.mk
index 8b7e79f..6aadbbf 100644
--- a/package/multimedia/bellagio/bellagio.mk
+++ b/package/multimedia/bellagio/bellagio.mk
@@ -5,7 +5,7 @@
 #############################################################
 BELLAGIO_VERSION = 0.9.3
 BELLAGIO_SOURCE = libomxil-bellagio-$(BELLAGIO_VERSION).tar.gz
-BELLAGIO_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/omxil
+BELLAGIO_SITE = http://downloads.sourceforge.net/project/omxil/omxil/Bellagio%20$(BELLAGIO_VERSION)
 BELLAGIO_AUTORECONF = YES
 BELLAGIO_INSTALL_STAGING = YES
 
diff --git a/package/multimedia/faad2/faad2.mk b/package/multimedia/faad2/faad2.mk
index f3c4712..8c4fc1a 100644
--- a/package/multimedia/faad2/faad2.mk
+++ b/package/multimedia/faad2/faad2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FAAD2_VERSION = 2.7
-FAAD2_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/faac
+FAAD2_SITE = http://downloads.sourceforge.net/project/faac/faad2-src/faad2-$(FAAD2_VERSION)
 FAAD2_LICENSE = GPLv2
 FAAD2_LICENSE_FILES = COPYING
 # frontend/faad calls frexp()
diff --git a/package/multimedia/flac/flac.mk b/package/multimedia/flac/flac.mk
index e19a9fb..cace0d9 100644
--- a/package/multimedia/flac/flac.mk
+++ b/package/multimedia/flac/flac.mk
@@ -6,7 +6,7 @@
 
 FLAC_VERSION = 1.2.1
 FLAC_SOURCE = flac-$(FLAC_VERSION).tar.gz
-FLAC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/flac/
+FLAC_SITE = http://downloads.sourceforge.net/project/flac/flac-src/flac-$(FLAC_VERSION)-src
 FLAC_INSTALL_STAGING = YES
 
 FLAC_CONF_OPT = \
diff --git a/package/multimedia/lame/lame.mk b/package/multimedia/lame/lame.mk
index 81a8f2a..a022312 100644
--- a/package/multimedia/lame/lame.mk
+++ b/package/multimedia/lame/lame.mk
@@ -7,7 +7,7 @@
 LAME_VERSION_MAJOR = 3.99
 LAME_VERSION_MINOR = 5
 LAME_VERSION = $(LAME_VERSION_MAJOR).$(LAME_VERSION_MINOR)
-LAME_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/lame/lame/$(LAME_VERSION_MAJOR)
+LAME_SITE = http://downloads.sourceforge.net/project/lame/lame/$(LAME_VERSION_MAJOR)
 LAME_DEPENDENCIES = host-pkg-config
 LAME_INSTALL_STAGING = YES
 LAME_CONF_ENV = GTK_CONFIG=/bin/false
diff --git a/package/multimedia/madplay/madplay.mk b/package/multimedia/madplay/madplay.mk
index 56007eb..9055951 100644
--- a/package/multimedia/madplay/madplay.mk
+++ b/package/multimedia/madplay/madplay.mk
@@ -5,7 +5,7 @@
 #############################################################
 MADPLAY_VERSION:=0.15.2b
 MADPLAY_SOURCE:=madplay-$(MADPLAY_VERSION).tar.gz
-MADPLAY_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mad
+MADPLAY_SITE:=http://downloads.sourceforge.net/project/mad/madplay/$(MADPLAY_VERSION)
 MADPLAY_LIBTOOL_PATCH=NO
 MADPLAY_DEPENDENCIES=libmad libid3tag
 
diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index 28bc4cb..7c88b9c 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 MPD_VERSION = 0.16.8
-MPD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/musicpd/mpd/$(MPD_VERSION)
+MPD_SITE = http://downloads.sourceforge.net/project/musicpd/mpd/$(MPD_VERSION)
 MPD_DEPENDENCIES = host-pkg-config libglib2
 
 # Some options need an explicit --disable or --enable
diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index c3d2c9c..5ed43a1 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -6,7 +6,7 @@
 
 MPG123_VERSION = 1.14.2
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
-MPG123_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
+MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPT = --with-optimization=0 --disable-lfs-alias
 MPG123_INSTALL_STAGING = YES
 
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index afff723..ed5e86e 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 MUTT_VERSION = 1.5.21
-MUTT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mutt
+MUTT_SITE = http://downloads.sourceforge.net/project/mutt/mutt-dev
 MUTT_DEPENDENCIES = ncurses
 MUTT_CONF_OPT = --disable-iconv --disable-smtp
 MUTT_AUTORECONF = YES
diff --git a/package/nanocom/nanocom.mk b/package/nanocom/nanocom.mk
index a88daeb..de4cc5f 100644
--- a/package/nanocom/nanocom.mk
+++ b/package/nanocom/nanocom.mk
@@ -5,7 +5,7 @@
 #############################################################
 NANOCOM_VERSION = 2.6.1
 NANOCOM_SOURCE = nanocom.tar.gz
-NANOCOM_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/nanocom/nanocom/v1.0
+NANOCOM_SITE = http://downloads.sourceforge.net/project/nanocom/nanocom/v1.0
 NANOCOM_LICENSE = GPLv2+
 NANOCOM_LICENSE_FILES = COPYING
 
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index c2257f7..bd63caa 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -6,7 +6,7 @@
 
 NBD_VERSION = 3.1
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.bz2
-NBD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
+NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPT = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
 NBD_DEPENDENCIES = libglib2
 
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index b7015e6..4b8d66f 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 NETATALK_VERSION = 2.2.2
-NETATALK_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)/
+NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)/
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 
 NETATALK_DEPENDENCIES = openssl berkeleydb libgcrypt libgpg-error
diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index d2c6962..7513686 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -6,6 +6,6 @@
 
 NETCAT_VERSION:=0.7.1
 NETCAT_SOURCE:=netcat-$(NETCAT_VERSION).tar.gz
-NETCAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/netcat
+NETCAT_SITE=http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT_VERSION)
 
 $(eval $(autotools-package))
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index df5f003..bbe0dbb 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 NETSNMP_VERSION = 5.7.1
-NETSNMP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/net-snmp
+NETSNMP_SITE = http://downloads.sourceforge.net/project/net-snmp/net-snmp/$(NETSNMP_VERSION)
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_LICENSE = Various BSD-like
 NETSNMP_LICENSE_FILES = COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index c8795fb..61e0d67 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -6,7 +6,7 @@
 
 NFS_UTILS_VERSION = 1.2.6
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.bz2
-NFS_UTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/nfs/nfs-utils/$(NFS_UTILS_VERSION)
+NFS_UTILS_SITE = http://downloads.sourceforge.net/project/nfs/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_AUTORECONF = YES
 NFS_UTILS_DEPENDENCIES = host-pkg-config
 
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index c296e34..274bbbd 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -6,7 +6,7 @@
 
 NGREP_VERSION = 1.45
 NGREP_SOURCE = ngrep-$(NGREP_VERSION).tar.bz2
-NGREP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ngrep/ngrep/$(NGREP_VERSION)
+NGREP_SITE = http://downloads.sourceforge.net/project/ngrep/ngrep/$(NGREP_VERSION)
 NGREP_INSTALL_STAGING = YES
 NGREP_CONF_ENV = LDFLAGS="-lpcre"
 NGREP_CONF_OPT =  \
diff --git a/package/ocf-linux/ocf-linux.mk b/package/ocf-linux/ocf-linux.mk
index 5d25597..fb5f7e8 100644
--- a/package/ocf-linux/ocf-linux.mk
+++ b/package/ocf-linux/ocf-linux.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 OCF_LINUX_VERSION = 20120127
-OCF_LINUX_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/ocf-linux/ocf-linux/$(OCF_LINUX_VERSION)
+OCF_LINUX_SITE = http://downloads.sourceforge.net/project/ocf-linux/ocf-linux/$(OCF_LINUX_VERSION)
 OCF_LINUX_INSTALL_STAGING = YES
 
 define OCF_LINUX_INSTALL_STAGING_CMDS
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 1b06e56..bc71ead 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 OPENCV_VERSION = 2.4.2
-OPENCV_SITE    = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_VERSION)
+OPENCV_SITE    = http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_VERSION)
 OPENCV_SOURCE  = OpenCV-$(OPENCV_VERSION).tar.bz2
 OPENCV_INSTALL_STAGING = YES
 
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 9c377c5..6354ab7 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -5,7 +5,7 @@
 #############################################################
 OPENOCD_VERSION:=0.5.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
-OPENOCD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/openocd/openocd/$(OPENOCD_VERSION)
+OPENOCD_SITE = http://downloads.sourceforge.net/project/openocd/openocd/$(OPENOCD_VERSION)
 
 OPENOCD_AUTORECONF = YES
 OPENOCD_CONF_OPT = \
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index f74c2b1..69ef314 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -3,9 +3,10 @@
 # poco
 #
 #############################################################
-POCO_VERSION = 1.4.3p1
+POCO_VERSION_MAJOR = 1.4.3
+POCO_VERSION = $(POCO_VERSION_MAJOR)p1
 POCO_SOURCE = poco-$(POCO_VERSION)-all.tar.gz
-POCO_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/poco
+POCO_SITE = http://downloads.sourceforge.net/project/poco/sources/poco-$(POCO_VERSION_MAJOR)
 POCO_LICENSE = Boost-v1.0
 POCO_LICENSE_FILES = LICENSE
 POCO_INSTALL_STAGING = YES
diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index 1e2c460..ded2a19 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 PPTP_LINUX_VERSION = 1.7.2
-PPTP_LINUX_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/pptpclient
+PPTP_LINUX_SITE = http://downloads.sourceforge.net/project/pptpclient/pptp/pptp-$(PPTP_LINUX_VERSION)
 PPTP_LINUX_SOURCE = pptp-$(PPTP_LINUX_VERSION).tar.gz
 PPTP_LINUX_MAKE = $(MAKE1)
 
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index cd381e5..3132b70 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 PSMISC_VERSION = 22.16
-PSMISC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/psmisc/psmisc
+PSMISC_SITE = http://downloads.sourceforge.net/project/psmisc/psmisc
 PSMISC_LICENSE = GPLv2
 PSMISC_LICENSE_FILES = COPYING
 PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
diff --git a/package/python-id3/python-id3.mk b/package/python-id3/python-id3.mk
index 82776c0..c642072 100644
--- a/package/python-id3/python-id3.mk
+++ b/package/python-id3/python-id3.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ID3_VERSION = 1.2
 PYTHON_ID3_SOURCE = id3-py_$(PYTHON_ID3_VERSION).tar.gz
-PYTHON_ID3_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/id3-py
+PYTHON_ID3_SITE = http://downloads.sourceforge.net/project/id3-py/id3-py/$(PYTHON_ID3_VERSION)
 
 PYTHON_ID3_DEPENDENCIES = python
 
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 44a5073..7602e93 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -6,7 +6,7 @@
 
 QUOTA_VERSION = 4.00
 QUOTA_SOURCE = quota-$(QUOTA_VERSION).tar.gz
-QUOTA_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
+QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
 
 QUOTA_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index aee8bc4..b39b29b 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -6,7 +6,7 @@
 
 RDESKTOP_VERSION = 1.5.0
 RDESKTOP_SOURCE = rdesktop-$(RDESKTOP_VERSION).tar.gz
-RDESKTOP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/rdesktop/
+RDESKTOP_SITE = http://downloads.sourceforge.net/project/rdesktop/rdesktop/$(RDESKTOP_VERSION)
 RDESKTOP_DEPENDENCIES = openssl xlib_libX11 xlib_libXt
 RDESKTOP_CONF_OPT = --with-openssl=$(STAGING_DIR)/usr
 
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index b4b1bd5..347d89d 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 RNG_TOOLS_VERSION = 3
-RNG_TOOLS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gkernel
+RNG_TOOLS_SITE = http://downloads.sourceforge.net/project/gkernel/rng-tools/$(RNG_TOOLS_VERSION)
 RNG_TOOLS_CONF_ENV = LIBS="-largp"
 RNG_TOOLS_DEPENDENCIES = argp-standalone
 
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index b81c4f4..2aed62c 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -1,6 +1,6 @@
 SCONS_VERSION = 2.0.1
 SCONS_SOURCE = scons-$(SCONS_VERSION).tar.gz
-SCONS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/scons
+SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
 
 define HOST_SCONS_BUILD_CMDS
 	(cd $(@D); python setup.py build)
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 26cd5fc..d2c3270 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -6,6 +6,6 @@
 
 SER2NET_VERSION = 2.7
 SER2NET_SOURCE = ser2net-$(SER2NET_VERSION).tar.gz
-SER2NET_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ser2net
+SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net/$(SER2NET_VERSION)
 
 $(eval $(autotools-package))
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index a6873f0..ad3bc18 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -5,6 +5,6 @@
 #############################################################
 
 SMARTMONTOOLS_VERSION = 5.42
-SMARTMONTOOLS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/smartmontools
+SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
 
 $(eval $(autotools-package))
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 0ec61ee..c0485a3 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -1,6 +1,6 @@
 SQUASHFS_VERSION=4.2
 SQUASHFS_SOURCE=squashfs$(SQUASHFS_VERSION).tar.gz
-SQUASHFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/squashfs
+SQUASHFS_SITE=http://downloads.sourceforge.net/projct/squashfs/squashfs/squashfs$(SQUASHFS_VERSION)
 
 # no libattr in BR
 SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=0
diff --git a/package/squashfs3/squashfs3.mk b/package/squashfs3/squashfs3.mk
index 6f28e6e..e121c51 100644
--- a/package/squashfs3/squashfs3.mk
+++ b/package/squashfs3/squashfs3.mk
@@ -1,6 +1,6 @@
 SQUASHFS3_VERSION=3.4
 SQUASHFS3_SOURCE=squashfs$(SQUASHFS3_VERSION).tar.gz
-SQUASHFS3_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/squashfs
+SQUASHFS3_SITE=http://downloads.sourceforge.net/project/squashfs/squashfs/$(SQUASHFS3_VERSION)
 
 SQUASHFS3_DEPENDENCIES = zlib
 
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index 80d3a45..67b9c7f 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 SSHFS_VERSION = 2.4
-SSHFS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/fuse/sshfs-fuse/$(SSHFS_VERSION)
+SSHFS_SITE = http://downloads.sourceforge.net/project/fuse/sshfs-fuse/$(SSHFS_VERSION)
 SSHFS_SOURCE = sshfs-fuse-$(SSHFS_VERSION).tar.gz
 SSHFS_DEPENDENCIES = \
 	libglib2 libfuse openssh \
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 3393e66..2d95137 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -6,7 +6,7 @@
 
 STRACE_VERSION = 4.5.20
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.bz2
-STRACE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/strace
+STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
 
 STRACE_CONF_ENV = ac_cv_header_linux_if_packet_h=yes \
 		  ac_cv_header_linux_netlink_h=yes \
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index b1afff7..240f83c 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -6,7 +6,7 @@
 
 SYNERGY_VERSION = 1.3.1
 SYNERGY_SOURCE = synergy-$(SYNERGY_VERSION).tar.gz
-SYNERGY_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/synergy2/
+SYNERGY_SITE = http://downloads.sourceforge.net/project/synergy2/Sources/$(SYNERGY_VERSION)
 
 SYNERGY_AUTORECONF = YES
 SYNERGY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index a48f69d..606042e 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -7,7 +7,7 @@ TCL_VERSION_MAJOR = 8.4
 TCL_VERSION_MINOR = 19
 TCL_VERSION = $(TCL_VERSION_MAJOR).$(TCL_VERSION_MINOR)
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
-TCL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tcl
+TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION_MAJOR).$(TCL_VERSION_MINOR)
 TCL_SUBDIR = unix
 TCL_CONF_OPT = \
 		--disable-symbols \
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 3c23c6a..2662a7d 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 TCPREPLAY_VERSION = 3.4.3
-TCPREPLAY_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/tcpreplay
+TCPREPLAY_SITE = http://downloads.sourceforge.net/project/tcpreplay/tcpreplay/$(TCPREPLAY_VERSION)
 TCPREPLAY_CONF_ENV = tr_cv_libpcap_version=">= 0.7.0"
 TCPREPLAY_CONF_OPT = --with-libpcap=$(STAGING_DIR)/usr
 TCPREPLAY_AUTORECONF = YES
diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index 238330e..3d1845d 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 TINYHTTPD_VERSION = 0.1.0
-TINYHTTPD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tinyhttpd/
+TINYHTTPD_SITE = http://downloads.sourceforge.net/project/tinyhttpd/tinyhttpd%20source/tinyhttpd%20$(TINYHTTPD_VERSION)
 
 define TINYHTTPD_BUILD_CMDS
 	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
index 9b5e60e..f43f847 100644
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 TN5250_VERSION = 0.17.4
-TN5250_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tn5250
+TN5250_SITE = http://downloads.sourceforge.net/project/tn5250/tn5250/$(TN5250_VERSION)
 TN5250_MAKE_OPT = CPPFLAGS=""
 TN5250_DEPENDENCIES = ncurses
 
diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index f2cef6c..2b24c68 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -8,7 +8,7 @@
 #############################################################
 VTUN_VERSION:=3.0.2
 VTUN_SOURCE:=vtun-$(VTUN_VERSION).tar.gz
-VTUN_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/vtun/
+VTUN_SITE:=http://downloads.sourceforge.net/project/vtun/vtun/$(VTUN_VERSION)
 VTUN_DEPENDENCIES = zlib lzo openssl
 
 VTUN_CONF_OPT = \
diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index 289102f..e523a31 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 WIPE_VERSION = 2.3.1
-WIPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/wipe
+WIPE_SITE = http://downloads.sourceforge.net/project/wipe/wipe/$(WIPE_VERSION)
 WIPE_SOURCE = wipe-$(WIPE_VERSION).tar.bz2
 WIPE_AUTORECONF = YES
 
diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 9061714..5919619 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 XMLSTARLET_VERSION = 1.3.0
-XMLSTARLET_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/xmlstar/xmlstarlet/$(XMLSTARLET_VERSION)
+XMLSTARLET_SITE = http://downloads.sourceforge.net/project/xmlstar/xmlstarlet/$(XMLSTARLET_VERSION)
 
 XMLSTARLET_DEPENDENCIES += libxml2 libxslt \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
