From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 07 Dec 2013 10:16:49 +0100
Subject: [Buildroot] [PATCH 3 of 3] packages: remove package clean commands
In-Reply-To: <patchbomb.1386407806@argentina>
References: <patchbomb.1386407806@argentina>
Message-ID: <173ba6d46de2d40f47c2.1386407809@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 boot/syslinux/syslinux.mk                            |   4 ----
 package/acpid/acpid.mk                               |   4 ----
 package/aircrack-ng/aircrack-ng.mk                   |   5 -----
 package/axel/axel.mk                                 |   4 ----
 package/bsdiff/bsdiff.mk                             |   4 ----
 package/busybox/busybox.mk                           |   4 ----
 package/bzip2/bzip2.mk                               |  10 ----------
 package/cjson/cjson.mk                               |   4 ----
 package/dash/dash.mk                                 |   5 -----
 package/devmem2/devmem2.mk                           |   4 ----
 package/dhrystone/dhrystone.mk                       |   4 ----
 package/distcc/distcc.mk                             |   6 ------
 package/dmalloc/dmalloc.mk                           |   9 ---------
 package/dosfstools/dosfstools.mk                     |   4 ----
 package/dropwatch/dropwatch.mk                       |   4 ----
 package/dtc/dtc.mk                                   |   6 ------
 package/elftosb/elftosb.mk                           |   4 ----
 package/ezxml/ezxml.mk                               |   4 ----
 package/fb-test-app/fb-test-app.mk                   |   4 ----
 package/fbset/fbset.mk                               |   4 ----
 package/fbv/fbv.mk                                   |   5 -----
 package/fconfig/fconfig.mk                           |   4 ----
 package/gadgetfs-test/gadgetfs-test.mk               |   4 ----
 package/hdparm/hdparm.mk                             |   4 ----
 package/httping/httping.mk                           |   4 ----
 package/input-event-daemon/input-event-daemon.mk     |   4 ----
 package/input-tools/input-tools.mk                   |   4 ----
 package/iostat/iostat.mk                             |   4 ----
 package/iozone/iozone.mk                             |   4 ----
 package/irda-utils/irda-utils.mk                     |   4 ----
 package/lbase64/lbase64.mk                           |   4 ----
 package/lcdapi/lcdapi.mk                             |   4 ----
 package/liberation/liberation.mk                     |   4 ----
 package/libfuse/libfuse.mk                           |   6 ------
 package/libjson/libjson.mk                           |   5 -----
 package/liblockfile/liblockfile.mk                   |   7 -------
 package/libnss/libnss.mk                             |   7 -------
 package/libroxml/libroxml.mk                         |   4 ----
 package/libsepol/libsepol.mk                         |   8 --------
 package/libsvgtiny/libsvgtiny.mk                     |   4 ----
 package/linenoise/linenoise.mk                       |   4 ----
 package/live555/live555.mk                           |   4 ----
 package/lm-sensors/lm-sensors.mk                     |   4 ----
 package/lmbench/lmbench.mk                           |   4 ----
 package/lockfile-progs/lockfile-progs.mk             |   4 ----
 package/logrotate/logrotate.mk                       |   4 ----
 package/lrzsz/lrzsz.mk                               |   5 -----
 package/lsof/lsof.mk                                 |   4 ----
 package/lua-msgpack-native/lua-msgpack-native.mk     |   4 ----
 package/lua/lua.mk                                   |   8 --------
 package/luabitop/luabitop.mk                         |   4 ----
 package/luacjson/luacjson.mk                         |   4 ----
 package/luaexpat/luaexpat.mk                         |   4 ----
 package/luafilesystem/luafilesystem.mk               |   4 ----
 package/luajit/luajit.mk                             |   4 ----
 package/luasocket/luasocket.mk                       |   4 ----
 package/memtester/memtester.mk                       |   4 ----
 package/mii-diag/mii-diag.mk                         |   4 ----
 package/minidlna/minidlna.mk                         |   4 ----
 package/mplayer/mplayer.mk                           |   4 ----
 package/mrouted/mrouted.mk                           |   4 ----
 package/mtdev2tuio/mtdev2tuio.mk                     |   4 ----
 package/netplug/netplug.mk                           |   4 ----
 package/noip/noip.mk                                 |   4 ----
 package/olsr/olsr.mk                                 |   4 ----
 package/pax-utils/pax-utils.mk                       |   8 --------
 package/perl/perl.mk                                 |   4 ----
 package/portmap/portmap.mk                           |   4 ----
 package/qt/qt.mk                                     |   4 ----
 package/qtuio/qtuio.mk                               |   7 -------
 package/rings/rings.mk                               |   4 ----
 package/schifra/schifra.mk                           |   4 ----
 package/sdl_mixer/sdl_mixer.mk                       |   6 ------
 package/slang/slang.mk                               |   4 ----
 package/snowball-hdmiservice/snowball-hdmiservice.mk |   5 -----
 package/sredird/sredird.mk                           |   4 ----
 package/sysklogd/sysklogd.mk                         |   4 ----
 package/sysvinit/sysvinit.mk                         |   4 ----
 package/tinyhttpd/tinyhttpd.mk                       |   5 -----
 package/tree/tree.mk                                 |   4 ----
 package/usb_modeswitch/usb_modeswitch.mk             |   5 -----
 package/usb_modeswitch_data/usb_modeswitch_data.mk   |   4 ----
 package/vsftpd/vsftpd.mk                             |   4 ----
 package/whetstone/whetstone.mk                       |   4 ----
 package/wireless_tools/wireless_tools.mk             |   4 ----
 package/wvdial/wvdial.mk                             |   4 ----
 package/zlib/zlib.mk                                 |   4 ----
 package/zmqpp/zmqpp.mk                               |   5 -----
 88 files changed, 0 insertions(+), 401 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -41,9 +41,5 @@ define HOST_SYSLINUX_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) INSTALLROOT=$(HOST_DIR) install
 endef
 
-define HOST_SYSLINUX_CLEAN_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -24,8 +24,4 @@ define ACPID_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 package/acpid/S02acpid $(TARGET_DIR)/etc/init.d/S02acpid
 endef
 
-define ACPID_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -29,11 +29,6 @@ define AIRCRACK_NG_BUILD_CMDS
 		-C $(@D) $(AIRCRACK_NG_MAKE_OPTS) all
 endef
 
-define AIRCRACK_NG_CLEAN_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
-		-C $(@D) $(AIRCRACK_NG_MAKE_OPTS) clean
-endef
-
 define AIRCRACK_NG_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) \
 		prefix=/usr $(AIRCRACK_NG_MAKE_OPTS) install
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -38,8 +38,4 @@ define AXEL_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-define AXEL_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -20,8 +20,4 @@ define BSDIFF_INSTALL_TARGET_CMDS
 	install -D -m 755 $(@D)/bspatch $(TARGET_DIR)/usr/bin/bspatch
 endef
 
-define BSDIFF_CLEAN_CMDS
-	rm -f $(@D)/bsdiff $(@D)/bspatch
-endef
-
 $(eval $(generic-package))
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -207,10 +207,6 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 endef
 
-define BUSYBOX_CLEAN_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
 
 busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -51,16 +51,6 @@ define BZIP2_INSTALL_TARGET_CMDS
 	$(BZIP2_INSTALL_TARGET_SHARED_CMDS)
 endef
 
-define BZIP2_CLEAN_CMDS
-	rm -f $(addprefix $(TARGET_DIR),/lib/libbz2.* \
-					/usr/lib/libbz2.* \
-					/usr/include/bzlib.h)
-	rm -f $(addprefix $(STAGING_DIR),/lib/libbz2.* \
-					/usr/lib/libbz2.* \
-					/usr/include/bzlib.h)
-	-$(MAKE) -C $(@D) clean
-endef
-
 define HOST_BZIP2_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) \
 		$(MAKE) -C $(@D) -f Makefile-libbz2_so
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -26,8 +26,4 @@ define CJSON_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/libcJSON.so $(TARGET_DIR)/usr/lib/libcJSON.so
 endef
 
-define CJSON_CLEAN_CMDS
-	rm -f $(@D)/libcJSON.so
-endef
-
 $(eval $(generic-package))
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -15,9 +15,4 @@ define DASH_INSTALL_TARGET_CMDS
 	cp -a $(@D)/src/dash $(TARGET_DIR)/bin/dash
 endef
 
-define DASH_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-	rm -f $(TARGET_DIR)/bin/dash
-endef
-
 $(eval $(autotools-package))
diff --git a/package/devmem2/devmem2.mk b/package/devmem2/devmem2.mk
--- a/package/devmem2/devmem2.mk
+++ b/package/devmem2/devmem2.mk
@@ -16,10 +16,6 @@ define DEVMEM2_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) devmem2
 endef
 
-define DEVMEM2_CLEAN_CMDS
-	rm -f $(@D)/devmem2
-endef
-
 define DEVMEM2_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/devmem2 $(TARGET_DIR)/sbin/devmem2
 endef
diff --git a/package/dhrystone/dhrystone.mk b/package/dhrystone/dhrystone.mk
--- a/package/dhrystone/dhrystone.mk
+++ b/package/dhrystone/dhrystone.mk
@@ -17,10 +17,6 @@ define DHRYSTONE_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
-define DHRYSTONE_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 define DHRYSTONE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/dhrystone $(TARGET_DIR)/usr/bin/dhrystone
 endef
diff --git a/package/distcc/distcc.mk b/package/distcc/distcc.mk
--- a/package/distcc/distcc.mk
+++ b/package/distcc/distcc.mk
@@ -16,10 +16,4 @@ define DISTCC_INSTALL_TARGET_CMDS
 	install -D $(@D)/distcc $(TARGET_DIR)/usr/bin/distcc
 endef
 
-define DISTCC_CLEAN_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/distcc
-	rm -f $(TARGET_DIR)/usr/bin/distccd
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(autotools-package))
diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -51,13 +51,4 @@ define DMALLOC_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/bin/dmalloc $(TARGET_DIR)/usr/bin/dmalloc
 endef
 
-define DMALLOC_CLEAN_CMDS
-	-rm -f $(TARGET_DIR)/usr/lib/libdmalloc*
-	-rm -f $(STAGING_DIR)/usr/lib/libdmalloc*
-	rm -f $(STAGING_DIR)/usr/include/dmalloc.h
-	rm -f $(TARGET_DIR)/usr/bin/dmalloc
-	-$(MAKE) -C $(DMALLOC_DIR) clean
-endef
-
-
 $(eval $(autotools-package))
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -38,10 +38,6 @@ define DOSFSTOOLS_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/sbin/
 endef
 
-define DOSFSTOOLS_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 define HOST_DOSFSTOOLS_BUILD_CMDS
 	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
 endef
diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -28,10 +28,6 @@ define DROPWATCH_BUILD_CMDS
 		LDFLAGS="$(DROPWATCH_LDFLAGS)" build
 endef
 
-define DROPWATCH_CLEAN_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
-endef
-
 define DROPWATCH_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/src/dropwatch \
 		$(TARGET_DIR)/usr/bin/dropwatch
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -21,7 +21,6 @@ DTC_LICENSE        += (for the library),
 # Use default goal to build everything
 DTC_BUILD_GOAL      =
 DTC_INSTALL_GOAL    = install
-DTC_CLEAN_GOAL      = clean
 ifeq ($(BR2_PACKAGE_BASH),)
 DTC_POST_INSTALL_TARGET_HOOKS += DTC_POST_INSTALL_TARGET_RM_DTDIFF
 endif
@@ -31,7 +30,6 @@ else # $(BR2_PACKAGE_DTC_PROGRAMS) != y
 DTC_BUILD_GOAL      = libfdt
 #?libfdt_install is our own install rule added by our patch
 DTC_INSTALL_GOAL    = libfdt_install
-DTC_CLEAN_GOAL      = libfdt_clean
 
 endif # $(BR2_PACKAGE_DTC_PROGRAMS) != y
 
@@ -50,8 +48,4 @@ define DTC_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr $(DTC_INSTALL_GOAL)
 endef
 
-define DTC_CLEAN_CMDS
-	$(MAKE) -C $(@D) $(DTC_CLEAN_GOAL)
-endef
-
 $(eval $(generic-package))
diff --git a/package/elftosb/elftosb.mk b/package/elftosb/elftosb.mk
--- a/package/elftosb/elftosb.mk
+++ b/package/elftosb/elftosb.mk
@@ -17,8 +17,4 @@ define HOST_ELFTOSB_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/bld/linux/sbtool $(HOST_DIR)/usr/bin/sbtool
 endef
 
-define HOST_ELFTOSB_CLEAN_CMDS
-	rm -rf $(@D)/bld/linux
-endef
-
 $(eval $(host-generic-package))
diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -23,8 +23,4 @@ define EZXML_INSTALL_TARGET_CMDS
 	install -D -m 0644 $(@D)/libezxml.a $(TARGET_DIR)/usr/lib/libezxml.a
 endef
 
-define EZXML_CLEAN_CMDS
-	-$(MAKE) -C $(@D) -f GNUmakefile clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -20,8 +20,4 @@ define FB_TEST_APP_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/offset $(TARGET_DIR)/usr/bin/fb-test-offset
 endef
 
-define FB_TEST_APP_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -22,8 +22,4 @@ define FBSET_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/fbset $(TARGET_DIR)/usr/sbin/fbset
 endef
 
-define FBSET_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -48,9 +48,4 @@ define FBV_INSTALL_TARGET_CMDS
 	install -D $(@D)/fbv $(TARGET_DIR)/usr/bin/fbv
 endef
 
-define FBV_CLEAN_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/fbv
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(autotools-package))
diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -17,8 +17,4 @@ define FCONFIG_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/fconfig $(TARGET_DIR)/sbin/fconfig
 endef
 
-define FCONFIG_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -22,8 +22,4 @@ define GADGETFS_TEST_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) prefix=/usr install
 endef
 
-define GADGETFS_TEST_CLEAN_CMDS
-	-$(MAKE) -C $(@D) $(GADGETFS_TEST_MAKEOPTS) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -26,8 +26,4 @@ define HDPARM_INSTALL_TARGET_CMDS
 	$(HDPARM_INSTALL_DOCUMENTATION)
 endef
 
-define HDPARM_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -27,8 +27,4 @@ define HTTPING_INSTALL_TARGET_CMDS
 	$(HTTPING_MAKE_OPT) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-define HTTPING_CLEAN_CMDS
-       $(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -26,8 +26,4 @@ define INPUT_EVENT_DAEMON_INSTALL_TARGET
 			$(TARGET_DIR)/etc/init.d/S99input-event-daemon
 endef
 
-define INPUT_EVENT_DAEMON_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -39,8 +39,4 @@ define INPUT_TOOLS_INSTALL_TARGET_CMDS
 	done
 endef
 
-define INPUT_TOOLS_CLEAN_CMDS
-	rm -f $(addprefix $(@D)/,$(INPUT_TOOLS_TARGETS_y))
-endef
-
 $(eval $(generic-package))
diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -15,10 +15,6 @@ define IOSTAT_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
 endef
 
-define IOSTAT_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 define IOSTAT_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(IOSTAT_DIR)/iostat $(TARGET_DIR)/usr/bin/iostat
 	$(INSTALL) -D $(IOSTAT_DIR)/iostat.8 \
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -30,8 +30,4 @@ define IOZONE_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/bin/iozone
 endef
 
-define IOZONE_CLEAN_CMDS
-       $(MAKE) -C $(@D)/src/current clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -21,10 +21,6 @@ define IRDA_UTILS_BUILD_CMDS
 		V=1 -C $(@D)
 endef
 
-define IRDA_UTILS_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 IRDA_UTILS_SBINS-  =
 IRDA_UTILS_SBINS-y =
 IRDA_UTILS_SBINS-$(BR2_PACKAGE_IRDA_UTILS_IRATTACH) += irattach
diff --git a/package/lbase64/lbase64.mk b/package/lbase64/lbase64.mk
--- a/package/lbase64/lbase64.mk
+++ b/package/lbase64/lbase64.mk
@@ -21,8 +21,4 @@ define LBASE64_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/lib/lua/base64.so
 endef
 
-define LBASE64_CLEAN_CMDS
-       $(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
--- a/package/lcdapi/lcdapi.mk
+++ b/package/lcdapi/lcdapi.mk
@@ -25,8 +25,4 @@ define LCDAPI_INSTALL_TARGET_CMDS
 		DESTDIR="$(TARGET_DIR)" install
 endef
 
-define LCDAPI_CLEAN_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -35,8 +35,4 @@ define LIBERATION_INSTALL_TARGET_CMDS
 	$(LIBERATION_INSTALL_SERIF)
 endef
 
-define LIBERATION_CLEAN_CMDS
-	rm -rf $(LIBERATION_TARGET_DIR)
-endef
-
 $(eval $(generic-package))
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -21,10 +21,4 @@ define LIBFUSE_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so* $(TARGET_DIR)/usr/lib/
 endef
 
-define LIBFUSE_CLEAN_CMDS
-	-$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) uninstall
-	-$(MAKE) -C $(@D) clean
-	rm -f $(TARGET_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/lib/libfuse.so*
-endef
-
 $(eval $(autotools-package))
diff --git a/package/libjson/libjson.mk b/package/libjson/libjson.mk
--- a/package/libjson/libjson.mk
+++ b/package/libjson/libjson.mk
@@ -46,9 +46,4 @@ define LIBJSON_INSTALL_STAGING_CMDS
 		$(LIBJSON_MAKE_OPT) prefix=$(STAGING_DIR)/usr install -C $(@D)
 endef
 
-define LIBJSON_CLEAN_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) $(LIBJSON_MAKE_OPT) \
-		clean -C $(@D)
-endef
-
 $(eval $(generic-package))
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -26,11 +26,4 @@ define LIBLOCKFILE_INSTALL_TARGET_CMDS
 	cp -a $(STAGING_DIR)/usr/lib/liblockfile.so* $(TARGET_DIR)/usr/lib
 endef
 
-define LIBLOCKFILE_CLEAN_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/liblockfile.so*
-	rm -f $(STAGING_DIR)/usr/lib/liblockfile*
-	rm -f $(addprefix $(STAGING_DIR)/usr/include/,lockfile.h mailfile.h)
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(autotools-package))
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -76,11 +76,4 @@ define LIBNSS_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/lib/pkgconfig/nss.pc
 endef
 
-define LIBNSS_CLEAN_CMDS
-	-$(MAKE1) -C $(@D)/$(LIBNSS_SUBDIR) clobber \
-					clobber_dbm \
-					clobber_coreconf \
-					BUILD_OPT=1
-endef
-
 $(eval $(generic-package))
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -20,10 +20,6 @@ define LIBROXML_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR)/usr/ -C $(@D) install
 endef
 
-define LIBROXML_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 define LIBROXML_DISABLE_DOXYGEN
 	$(SED) 's:) doxy:):' $(@D)/Makefile
 endef
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -25,10 +25,6 @@ define LIBSEPOL_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) install $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR)
 endef
 
-define LIBSEPOL_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 define HOST_LIBSEPOL_BUILD_CMDS
 	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR)
 endef
@@ -40,9 +36,5 @@ define HOST_LIBSEPOL_INSTALL_CMDS
 	-rmdir $(HOST_DIR)/lib
 endef
 
-define HOST_LIBSEPOL_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -23,8 +23,4 @@ define LIBSVGTINY_INSTALL_TARGET_CMDS
 		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
 endef
 
-define LIBSVGTINY_CLEAN_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -27,8 +27,4 @@ define LINENOISE_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 -D $(@D)/linenoise_example    $(TARGET_DIR)/usr/bin/linenoise_example
 endef
 
-define LINENOISE_CLEAN_CMDS
-	rm -f $(@D)/*.o $(@D)/*.a $(@D)/linenoise_example
-endef
-
 $(eval $(generic-package))
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -22,10 +22,6 @@ define LIVE555_BUILD_CMDS
 	$(MAKE) -C $(@D) all
 endef
 
-define LIVE555_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 LIVE555_HEADERS_TO_INSTALL = \
 	liveMedia/include \
 	groupsock/include \
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -35,8 +35,4 @@ define LM_SENSORS_INSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/,$(LM_SENSORS_BINS_))
 endef
 
-define LM_SENSORS_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -35,8 +35,4 @@ define LMBENCH_INSTALL_TARGET_CMDS
 	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC="$(TARGET_CC)" BASE=$(TARGET_DIR)/usr -C $(@D)/src install
 endef
 
-define LMBENCH_CLEAN_CMDS
-	$(MAKE) -C $(@D)/src clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -25,8 +25,4 @@ define LOCKFILE_PROGS_INSTALL_TARGET_CMD
 	done
 endef
 
-define LOCKFILE_PROGS_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -23,8 +23,4 @@ define LOGROTATE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/logrotate.d
 endef
 
-define LOGROTATE_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -25,9 +25,4 @@ define LRZSZ_INSTALL_TARGET_CMDS
 	ln -sf sz $(TARGET_DIR)/usr/bin/lsz
 endef
 
-define LRZSZ_CLEAN_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,rz sz lrz lsz)
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(autotools-package))
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -62,8 +62,4 @@ define LSOF_INSTALL_TARGET_CMDS
 	install -D -m 755 $(@D)/lsof $(TARGET_DIR)/bin/lsof
 endef
 
-define LSOF_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -18,8 +18,4 @@ define LUA_MSGPACK_NATIVE_INSTALL_TARGET
 	$(INSTALL) -m 755 -D $(@D)/msgpack.so $(TARGET_DIR)/usr/lib/lua/msgpack.so
 endef
 
-define LUA_MSGPACK_NATIVE_CLEAN_CMDS
-	rm -f $(@D)/msgpack.so
-endef
-
 $(eval $(generic-package))
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -99,13 +99,5 @@ LUA_INSTALLED_FILES = \
 	/usr/lib/liblua.a \
 	/usr/lib/liblua.so*
 
-define LUA_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
-define HOST_LUA_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/luabitop/luabitop.mk b/package/luabitop/luabitop.mk
--- a/package/luabitop/luabitop.mk
+++ b/package/luabitop/luabitop.mk
@@ -20,8 +20,4 @@ define LUABITOP_INSTALL_TARGET_CMDS
 	$(INSTALL) -p $(@D)/bit.so $(TARGET_DIR)/usr/lib/lua
 endef
 
-define LUABITOP_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/luacjson/luacjson.mk b/package/luacjson/luacjson.mk
--- a/package/luacjson/luacjson.mk
+++ b/package/luacjson/luacjson.mk
@@ -24,8 +24,4 @@ define LUACJSON_INSTALL_TARGET_CMDS
 	install -D -m 0644 $(@D)/cjson.so $(TARGET_DIR)/usr/lib/lua/cjson.so
 endef
 
-define LUACJSON_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -27,8 +27,4 @@ define LUAEXPAT_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/src/lxp/lom.lua $(TARGET_DIR)/usr/share/lua/lxp/lom.lua
 endef
 
-define LUAEXPAT_CLEAN_CMDS
-	$(MAKE) -C $(@D) $(LUAEXPAT_MFLAGS) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -21,8 +21,4 @@ define LUAFILESYSTEM_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/src/lfs.so $(TARGET_DIR)/usr/lib/lua/lfs.so
 endef
 
-define LUAFILESYSTEM_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -55,8 +55,4 @@ define LUAJIT_INSTALL_TARGET_CMDS
 	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" -C $(@D) install
 endef
 
-define LUAJIT_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -22,8 +22,4 @@ define LUASOCKET_INSTALL_TARGET_CMDS
 		INSTALL_TOP_LIB="$(TARGET_DIR)/usr/lib/lua" install
 endef
 
-define LUASOCKET_CLEAN_CMDS
-	$(MAKE) -C $(@D) -f makefile clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -20,8 +20,4 @@ define MEMTESTER_INSTALL_TARGET_CMDS
 	$(MAKE) $(MEMTESTER_TARGET_INSTALL_OPTS) -C $(@D) install
 endef
 
-define MEMTESTER_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -29,8 +29,4 @@ define MII_DIAG_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install-mii-diag
 endef
 
-define MII_DIAG_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -53,8 +53,4 @@ define MINIDLNA_INSTALL_TARGET_CMDS
 		-C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
-define MINIDLNA_CLEAN_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -167,8 +167,4 @@ define MPLAYER_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-define MPLAYER_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -17,8 +17,4 @@ define MROUTED_INSTALL_TARGET_CMDS
 	$(MAKE) prefix=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-define MROUTED_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/mtdev2tuio/mtdev2tuio.mk b/package/mtdev2tuio/mtdev2tuio.mk
--- a/package/mtdev2tuio/mtdev2tuio.mk
+++ b/package/mtdev2tuio/mtdev2tuio.mk
@@ -23,8 +23,4 @@ define MTDEV2TUIO_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/mtdev2tuio $(TARGET_DIR)/usr/bin/mtdev2tuio
 endef
 
-define MTDEV2TUIO_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -21,8 +21,4 @@ define NETPLUG_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S29netplug
 endef
 
-define NETPLUG_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/noip/noip.mk b/package/noip/noip.mk
--- a/package/noip/noip.mk
+++ b/package/noip/noip.mk
@@ -21,8 +21,4 @@ define NOIP_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/noip2 $(TARGET_DIR)/usr/sbin/noip2
 endef
 
-define NOIP_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -37,8 +37,4 @@ define OLSR_INSTALL_TARGET_CMDS
 		$(INSTALL) -D -m 0644 $(@D)/files/olsrd.conf.default.lq $(TARGET_DIR)/etc/olsrd.conf
 endef
 
-define OLSR_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/pax-utils/pax-utils.mk b/package/pax-utils/pax-utils.mk
--- a/package/pax-utils/pax-utils.mk
+++ b/package/pax-utils/pax-utils.mk
@@ -34,14 +34,6 @@ define PAX_UTILS_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(PAX_UTILS_USE_CAP) -C $(@D)
 endef
 
-define HOST_PAX_UTILS_CLEAN_CMDS
-	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) clean
-endef
-
-define PAX_UTILS_CLEAN_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) clean
-endef
-
 define HOST_PAX_UTILS_INSTALL_CMDS
 	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) DESTDIR="$(HOST_DIR)" install
 endef
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -102,8 +102,4 @@ define PERL_INSTALL_TARGET_CMDS
 	PERL5LIB=$(@D)/dist/base/lib $(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" $(PERL_INSTALL_TARGET_GOALS)
 endef
 
-define PERL_CLEAN_CMDS
-	-$(MAKE1) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -19,10 +19,6 @@ define PORTMAP_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" -C $(@D) $(PORTMAP_FLAGS)
 endef
 
-define PORTMAP_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 define PORTMAP_INSTALL_TARGET_CMDS
 	for sbin in $(PORTMAP_SBINS); do \
 		$(INSTALL) -D $(@D)/$$sbin $(TARGET_DIR)/sbin/$$sbin; \
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -682,8 +682,4 @@ define QT_INSTALL_TARGET_CMDS
 	$(QT_INSTALL_TARGET_TRANSLATIONS)
 endef
 
-define QT_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
--- a/package/qtuio/qtuio.mk
+++ b/package/qtuio/qtuio.mk
@@ -60,11 +60,4 @@ define QTUIO_INSTALL_STAGING_CMDS
 	cp -dpf $(@D)/lib/libqTUIO.so* $(STAGING_DIR)/usr/lib
 endef
 
-define QTUIO_CLEAN_CMDS
-	$(MAKE) -C $(@D)/src clean
-	for example in $(QTUIO_EXAMPLES) ; do \
-		($(MAKE) -C $(@D)/examples/$${example} clean) ; \
-	done
-endef
-
 $(eval $(generic-package))
diff --git a/package/rings/rings.mk b/package/rings/rings.mk
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -18,8 +18,4 @@ define RINGS_INSTALL_TARGET_CMDS
 		LUA_DIR="$(TARGET_DIR)/usr/share/lua" install
 endef
 
-define RINGS_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/schifra/schifra.mk b/package/schifra/schifra.mk
--- a/package/schifra/schifra.mk
+++ b/package/schifra/schifra.mk
@@ -40,8 +40,4 @@ define SCHIFRA_INSTALL_STAGING_CMDS
 		$(INSTALL) -m 0644 -D $$i $(STAGING_DIR)/usr/include/$$i; done
 endef
 
-define SCHIFRA_CLEAN_CMDS
-	$(MAKE) -C $(@D) $(SCHIFRA_MAKE_OPT) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -38,10 +38,4 @@ define SDL_MIXER_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_mixer*.so* $(TARGET_DIR)/usr/lib/
 endef
 
-define SDL_MIXER_CLEAN_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/libSDL_mixer*.so*
-	-$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) uninstall
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(autotools-package))
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -32,8 +32,4 @@ define SLANG_INSTALL_TARGET_CMDS
 	(cd $(TARGET_DIR)/usr/lib; ln -fs libslang.so libslang.so.1)
 endef
 
-define SLANG_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/snowball-hdmiservice/snowball-hdmiservice.mk b/package/snowball-hdmiservice/snowball-hdmiservice.mk
--- a/package/snowball-hdmiservice/snowball-hdmiservice.mk
+++ b/package/snowball-hdmiservice/snowball-hdmiservice.mk
@@ -22,9 +22,4 @@ define SNOWBALL_HDMISERVICE_INSTALL_TARG
 	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)" DESTDIR=$(TARGET_DIR) install
 endef
 
-define SNOWBALL_HDMISERVICE_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
-
 $(eval $(generic-package))
diff --git a/package/sredird/sredird.mk b/package/sredird/sredird.mk
--- a/package/sredird/sredird.mk
+++ b/package/sredird/sredird.mk
@@ -16,8 +16,4 @@ define SREDIRD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/sredird $(TARGET_DIR)/usr/sbin/sredird
 endef
 
-define SREDIRD_CLEAN_CMDS
-	rm -f $(@D)/sredird
-endef
-
 $(eval $(generic-package))
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -35,8 +35,4 @@ define SYSKLOGD_INSTALL_TARGET_CMDS
 	fi
 endef
 
-define SYSKLOGD_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -42,8 +42,4 @@ define SYSVINIT_INSTALL_TARGET_CMDS
 	ln -sf killall5 $(TARGET_DIR)/sbin/pidof
 endef
 
-define SYSVINIT_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -19,9 +19,4 @@ define TINYHTTPD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/var/www
 endef
 
-define TINYHTTPD_CLEAN_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/tinyhttpd
-	rm -f $(TARGET_DIR)/etc/init.d/S85tinyhttpd
-endef
-
 $(eval $(generic-package))
diff --git a/package/tree/tree.mk b/package/tree/tree.mk
--- a/package/tree/tree.mk
+++ b/package/tree/tree.mk
@@ -20,8 +20,4 @@ define TREE_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/man/man1/tree.1
 endef
 
-define TREE_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -32,9 +32,4 @@ define USB_MODESWITCH_INSTALL_TARGET_CMD
 		-C $(@D) $(USB_MODESWITCH_INSTALL_TARGETS)
 endef
 
-
-define USB_MODESWITCH_CLEAN_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -17,8 +17,4 @@ define USB_MODESWITCH_DATA_INSTALL_TARGE
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
-define USB_MODESWITCH_DATA_CLEAN_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -50,8 +50,4 @@ define VSFTPD_INSTALL_TARGET_CMDS
 	install -d -m 700 $(TARGET_DIR)/usr/share/empty
 endef
 
-define VSFTPD_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/whetstone/whetstone.mk b/package/whetstone/whetstone.mk
--- a/package/whetstone/whetstone.mk
+++ b/package/whetstone/whetstone.mk
@@ -16,10 +16,6 @@ define WHETSTONE_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) LDLIBS="-lm" -C $(@D) whetstone
 endef
 
-define WHETSTONE_CLEAN_CMDS
-	rm -f $(@D)/whetstone
-endef
-
 define WHETSTONE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/whetstone $(TARGET_DIR)/usr/bin/whetstone
 endef
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -31,10 +31,6 @@ define WIRELESS_TOOLS_BUILD_CMDS
 		$(WIRELESS_TOOLS_BUILD_TARGETS)
 endef
 
-define WIRELESS_TOOLS_CLEAN_CMDS
-	$(MAKE) -C $(@D) realclean
-endef
-
 define WIRELESS_TOOLS_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" LDCONFIG=/bin/true $(WIRELESS_TOOLS_INSTALL_TARGETS)
 	$(MAKE) -C $(@D) INSTALL_MAN="$(TARGET_DIR)/usr/share/man" install-man
diff --git a/package/wvdial/wvdial.mk b/package/wvdial/wvdial.mk
--- a/package/wvdial/wvdial.mk
+++ b/package/wvdial/wvdial.mk
@@ -29,8 +29,4 @@ define WVDIAL_INSTALL_TARGET_CMDS
 		install -C $(@D)
 endef
 
-define WVDIAL_CLEAN_CMDS
-	$(TARGET_MAKE_ENV) $(WVDIAL_MAKE_ENV) $(WVDIAL_MAKE) clean -C $(@D)
-endef
-
 $(eval $(generic-package))
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -60,9 +60,5 @@ define HOST_ZLIB_INSTALL_CMDS
 	$(MAKE1) -C $(@D) LDCONFIG=true install
 endef
 
-define ZLIB_CLEAN_CMDS
-	-$(MAKE1) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -36,9 +36,4 @@ define ZMQPP_INSTALL_STAGING_CMDS
 		$(ZMQPP_MAKE_OPT) DESTDIR=$(STAGING_DIR) install -C $(@D)
 endef
 
-define ZMQPP_CLEAN_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) $(ZMQPP_MAKE_OPT) \
-		clean -C $(@D)
-endef
-
 $(eval $(generic-package))
