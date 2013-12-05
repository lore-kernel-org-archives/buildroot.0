From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 05 Dec 2013 11:54:08 +0100
Subject: [Buildroot] [PATCH 3 of 3] packages: remove uninstall commands
In-Reply-To: <patchbomb.1386240845@argentina>
References: <patchbomb.1386240845@argentina>
Message-ID: <f19524ad7b51579e1008.1386240848@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/acpid/acpid.mk                               |   6 ------
 package/aircrack-ng/aircrack-ng.mk                   |   5 -----
 package/alsa-lib/alsa-lib.mk                         |  12 ------------
 package/alsa-utils/alsa-utils.mk                     |   4 ----
 package/at/at.mk                                     |  14 --------------
 package/axel/axel.mk                                 |   4 ----
 package/bash/bash.mk                                 |  10 ----------
 package/bind/bind.mk                                 |   7 -------
 package/bmon/bmon.mk                                 |   4 ----
 package/boa/boa.mk                                   |  11 -----------
 package/bonnie/bonnie.mk                             |   4 ----
 package/bridge-utils/bridge-utils.mk                 |   5 -----
 package/bsdiff/bsdiff.mk                             |   4 ----
 package/busybox/busybox.mk                           |   4 ----
 package/cgilua/cgilua.mk                             |   5 -----
 package/chrony/chrony.mk                             |   4 ----
 package/cjson/cjson.mk                               |  10 ----------
 package/copas/copas.mk                               |   4 ----
 package/coxpcall/coxpcall.mk                         |   4 ----
 package/cppzmq/cppzmq.mk                             |   4 ----
 package/devmem2/devmem2.mk                           |   4 ----
 package/dhrystone/dhrystone.mk                       |   4 ----
 package/dmraid/dmraid.mk                             |   6 ------
 package/dnsmasq/dnsmasq.mk                           |   5 -----
 package/doom-wad/doom-wad.mk                         |   4 ----
 package/dosfstools/dosfstools.mk                     |   6 ------
 package/dropwatch/dropwatch.mk                       |   4 ----
 package/dsp-tools/dsp-tools.mk                       |   4 ----
 package/ebtables/ebtables.mk                         |   5 -----
 package/eeprog/eeprog.mk                             |   4 ----
 package/explorercanvas/explorercanvas.mk             |   4 ----
 package/ezxml/ezxml.mk                               |  10 ----------
 package/fan-ctrl/fan-ctrl.mk                         |   4 ----
 package/fb-test-app/fb-test-app.mk                   |   7 -------
 package/fbgrab/fbgrab.mk                             |   4 ----
 package/fbset/fbset.mk                               |   4 ----
 package/fconfig/fconfig.mk                           |   4 ----
 package/feh/feh.mk                                   |   5 -----
 package/file/file.mk                                 |   5 -----
 package/fis/fis.mk                                   |   4 ----
 package/flot/flot.mk                                 |   4 ----
 package/gadgetfs-test/gadgetfs-test.mk               |   4 ----
 package/googlefontdirectory/googlefontdirectory.mk   |   4 ----
 package/gptfdisk/gptfdisk.mk                         |   4 ----
 package/gstreamer/gst-dsp/gst-dsp.mk                 |   4 ----
 package/gstreamer/gst-omapfb/gst-omapfb.mk           |   4 ----
 package/hdparm/hdparm.mk                             |   5 -----
 package/hwdata/hwdata.mk                             |   5 -----
 package/input-event-daemon/input-event-daemon.mk     |   5 -----
 package/input-tools/input-tools.mk                   |   4 ----
 package/iostat/iostat.mk                             |   5 -----
 package/iptables/iptables.mk                         |   7 -------
 package/irda-utils/irda-utils.mk                     |   4 ----
 package/iw/iw.mk                                     |   5 -----
 package/jquery-sparkline/jquery-sparkline.mk         |   4 ----
 package/jquery-ui-themes/jquery-ui-themes.mk         |   4 ----
 package/jquery-ui/jquery-ui.mk                       |   5 -----
 package/jquery-validation/jquery-validation.mk       |   4 ----
 package/jquery/jquery.mk                             |   4 ----
 package/jsmin/jsmin.mk                               |   4 ----
 package/json-javascript/json-javascript.mk           |   4 ----
 package/kismet/kismet.mk                             |  17 -----------------
 package/lbase64/lbase64.mk                           |   4 ----
 package/lcdapi/lcdapi.mk                             |  10 ----------
 package/less/less.mk                                 |   4 ----
 package/libidn/libidn.mk                             |   5 -----
 package/libjson/libjson.mk                           |  10 ----------
 package/libroxml/libroxml.mk                         |   8 --------
 package/libsvgtiny/libsvgtiny.mk                     |  10 ----------
 package/lighttpd/lighttpd.mk                         |   6 ------
 package/linenoise/linenoise.mk                       |  12 ------------
 package/linux-fusion/linux-fusion.mk                 |  10 ----------
 package/live555/live555.mk                           |  13 -------------
 package/lm-sensors/lm-sensors.mk                     |   8 --------
 package/lockfile-progs/lockfile-progs.mk             |   4 ----
 package/logrotate/logrotate.mk                       |   8 --------
 package/lsof/lsof.mk                                 |   4 ----
 package/lua-msgpack-native/lua-msgpack-native.mk     |   4 ----
 package/lua/lua.mk                                   |  18 ------------------
 package/luacjson/luacjson.mk                         |   4 ----
 package/luaexpat/luaexpat.mk                         |   5 -----
 package/luaexpatutils/luaexpatutils.mk               |   4 ----
 package/luafilesystem/luafilesystem.mk               |   4 ----
 package/luajit/luajit.mk                             |   8 --------
 package/luasec/luasec.mk                             |   6 ------
 package/luasocket/luasocket.mk                       |   9 ---------
 package/luasql/luasql.mk                             |   4 ----
 package/lvm2/lvm2.mk                                 |  10 ----------
 package/makedevs/makedevs.mk                         |   5 -----
 package/mdadm/mdadm.mk                               |   3 ---
 package/memstat/memstat.mk                           |   5 -----
 package/memtester/memtester.mk                       |   4 ----
 package/mii-diag/mii-diag.mk                         |   4 ----
 package/minidlna/minidlna.mk                         |   4 ----
 package/mongrel2/mongrel2.mk                         |   6 ------
 package/mplayer/mplayer.mk                           |   4 ----
 package/mrouted/mrouted.mk                           |   4 ----
 package/mxml/mxml.mk                                 |   2 --
 package/nano/nano.mk                                 |   4 ----
 package/nanocom/nanocom.mk                           |   4 ----
 package/ncftp/ncftp.mk                               |   4 ----
 package/neard/neard.mk                               |   4 ----
 package/netperf/netperf.mk                           |   5 -----
 package/netplug/netplug.mk                           |   6 ------
 package/netsnmp/netsnmp.mk                           |   7 -------
 package/noip/noip.mk                                 |   4 ----
 package/ntp/ntp.mk                                   |   7 -------
 package/nuttcp/nuttcp.mk                             |   4 ----
 package/openntpd/openntpd.mk                         |   6 ------
 package/openssl/openssl.mk                           |   7 -------
 package/openvpn/openvpn.mk                           |   5 -----
 package/oprofile/oprofile.mk                         |   7 -------
 package/php/php.mk                                   |  12 ------------
 package/portmap/portmap.mk                           |   6 ------
 package/pppd/pppd.mk                                 |  13 -------------
 package/pptp-linux/pptp-linux.mk                     |   5 -----
 package/proftpd/proftpd.mk                           |   6 ------
 package/python-nfc/python-nfc.mk                     |   4 ----
 package/python-pygame/python-pygame.mk               |   4 ----
 package/qt/qt.mk                                     |   6 ------
 package/rapidjson/rapidjson.mk                       |   4 ----
 package/rings/rings.mk                               |   5 -----
 package/rp-pppoe/rp-pppoe.mk                         |   9 ---------
 package/rrdtool/rrdtool.mk                           |   6 ------
 package/rsh-redone/rsh-redone.mk                     |   6 ------
 package/samba/samba.mk                               |   5 -----
 package/schifra/schifra.mk                           |   9 ---------
 package/sdl_sound/sdl_sound.mk                       |   7 -------
 package/slang/slang.mk                               |  16 ----------------
 package/snowball-hdmiservice/snowball-hdmiservice.mk |  12 ------------
 package/sound-theme-borealis/sound-theme-borealis.mk |   4 ----
 package/sqlcipher/sqlcipher.mk                       |  14 --------------
 package/sqlite/sqlite.mk                             |  12 ------------
 package/sredird/sredird.mk                           |   4 ----
 package/sstrip/sstrip.mk                             |   8 --------
 package/thttpd/thttpd.mk                             |  10 ----------
 package/ti-utils/ti-utils.mk                         |   5 -----
 package/tidsp-binaries/tidsp-binaries.mk             |   4 ----
 package/tn5250/tn5250.mk                             |   6 ------
 package/uboot-tools/uboot-tools.mk                   |   5 -----
 package/uemacs/uemacs.mk                             |   4 ----
 package/usb_modeswitch/usb_modeswitch.mk             |   4 ----
 package/usbmount/usbmount.mk                         |   7 -------
 package/vsftpd/vsftpd.mk                             |   7 -------
 package/whetstone/whetstone.mk                       |   4 ----
 package/wipe/wipe.mk                                 |   5 -----
 package/wireless_tools/wireless_tools.mk             |   4 ----
 package/wsapi/wsapi.mk                               |   4 ----
 package/wvdial/wvdial.mk                             |   6 ------
 package/xavante/xavante.mk                           |   6 ------
 package/xfsprogs/xfsprogs.mk                         |   1 -
 package/zlib/zlib.mk                                 |  12 ------------
 package/zmqpp/zmqpp.mk                               |  12 ------------
 package/zxing/zxing.mk                               |   8 --------
 154 files changed, 0 insertions(+), 930 deletions(-)

diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -24,12 +24,6 @@ define ACPID_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 package/acpid/S02acpid $(TARGET_DIR)/etc/init.d/S02acpid
 endef
 
-define ACPID_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/acpid
-	rm -f $(TARGET_DIR)/usr/bin/acpi_listen
-	rm -f $(addprefix $(TARGET_DIR)/usr/share/man/man8/,acpid.8 acpi_listen.8)
-endef
-
 define ACPID_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -39,9 +39,4 @@ define AIRCRACK_NG_INSTALL_TARGET_CMDS
 		prefix=/usr $(AIRCRACK_NG_MAKE_OPTS) install
 endef
 
-define AIRCRACK_NG_UNINSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) \
-		$(AIRCRACK_NG_MAKE_OPTS) uninstall
-endef
-
 $(eval $(generic-package))
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -80,16 +80,4 @@ endif
 ALSA_LIB_CONF_ENV = CFLAGS="$(ALSA_LIB_CFLAGS)" \
 		    LDFLAGS="$(TARGET_LDFLAGS) -lm"
 
-define ALSA_LIB_UNINSTALL_TARGET_CMDS
-	-rm -f $(TARGET_DIR)/usr/lib/libasound.so*
-	-rm -rf $(TARGET_DIR)/usr/lib/alsa-lib
-	-rm -rf $(TARGET_DIR)/usr/share/alsa
-endef
-
-define ALSA_LIB_UNINSTALL_STAGING_CMDS
-	-rm -f $(STAGING_DIR)/usr/lib/libasound.*
-	-rm -rf $(STAGING_DIR)/usr/lib/alsa-lib
-	-rm -rf $(STAGING_DIR)/usr/share/alsa
-endef
-
 $(eval $(autotools-package))
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -56,8 +56,4 @@ define ALSA_UTILS_INSTALL_TARGET_CMDS
 	fi
 endef
 
-define ALSA_UTILS_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/,$(ALSA_UTILS_TARGETS_) $(ALSA_UTILS_TARGETS_y))
-endef
-
 $(eval $(autotools-package))
diff --git a/package/at/at.mk b/package/at/at.mk
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -25,18 +25,4 @@ endef
 
 AT_POST_INSTALL_TARGET_HOOKS += AT_INSTALL_INITSCRIPT
 
-define AT_UNINSTALL_TARGET_CMDS
-	rm -rf $(addprefix $(TARGET_DIR),/usr/lib/atspool \
-					 /usr/lib/atjobs \
-					 /etc/at.deny \
-					 /etc/init.d/S99at \
-					 /usr/bin/at \
-					 /usr/bin/atrm \
-					 /usr/bin/atq \
-					 /usr/sbin/atd \
-					 /usr/sbin/atrun)
-	rm -f $(addprefix $(TARGET_DIR)/usr/man/man*/, \
-		at.1 atq.1 atrm.1 batch.1 at_allow.5 at_deny.5 atd.8 atrun.8)
-endef
-
 $(eval $(autotools-package))
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -38,10 +38,6 @@ define AXEL_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-define AXEL_UNINSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
-endef
-
 define AXEL_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -41,14 +41,4 @@ define BASH_INSTALL_TARGET_CMDS
 	ln -sf bash $(TARGET_DIR)/bin/sh
 endef
 
-# Restore the old shell file/link if there was one
-define BASH_UNINSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) \
-		-C $(BASH_DIR) exec_prefix=/ uninstall
-	rm -f $(TARGET_DIR)/bin/sh
-	if [ -e $(TARGET_DIR)/bin/sh.prebash ]; then \
-		mv -f $(TARGET_DIR)/bin/sh.prebash $(TARGET_DIR)/bin/sh; \
-	fi
-endef
-
 $(eval $(autotools-package))
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -63,11 +63,4 @@ ifneq ($(BR2_PACKAGE_BIND_TOOLS),y)
 BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_REMOVE_TOOLS
 endif
 
-define BIND_UNINSTALL_TARGET_CMDS
-	$(BIND_TARGET_REMOVE_SERVER)
-	$(BIND_TARGET_REMOVE_TOOLS)
-	rm -f $(TARGET_DIR)/etc/init.d/S81named
-	rm -rf $(addprefix $(TARGET_DIR)/usr/lib/, $(BIND_TARGET_LIBS))
-endef
-
 $(eval $(autotools-package))
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -24,8 +24,4 @@ ifneq ($(BR2_PREFER_STATIC_LIB),y)
 BMON_CONF_OPT += --disable-static
 endif
 
-define BMON_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/bmon
-endef
-
 $(eval $(autotools-package))
diff --git a/package/boa/boa.mk b/package/boa/boa.mk
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -16,15 +16,4 @@ define BOA_INSTALL_TARGET_CMDS
 	install -D -m 644 package/boa/mime.types $(TARGET_DIR)/etc/mime.types
 endef
 
-define BOA_UNINSTALL_STAGING_CMDS
-	# autotools calls uninstall-staging even if staging install
-	# isn't enabled
-endef
-
-define BOA_UNINSTALL_TARGET_CMDS
-	rm -rf $(TARGET_DIR)/usr/sbin/boa \
-		$(TARGET_DIR)/usr/lib/boa/ \
-		$(TARGET_DIR)/etc/mime.types $(TARGET_DIR)/etc/boa
-endef
-
 $(eval $(autotools-package))
diff --git a/package/bonnie/bonnie.mk b/package/bonnie/bonnie.mk
--- a/package/bonnie/bonnie.mk
+++ b/package/bonnie/bonnie.mk
@@ -13,8 +13,4 @@ define BONNIE_INSTALL_TARGET_CMDS
 	install -D -m 755 $(@D)/zcav $(TARGET_DIR)/usr/sbin/zcav
 endef
 
-define BONNIE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/bonnie++ $(TARGET_DIR)/usr/sbin/zcav
-endef
-
 $(eval $(autotools-package))
diff --git a/package/bridge-utils/bridge-utils.mk b/package/bridge-utils/bridge-utils.mk
--- a/package/bridge-utils/bridge-utils.mk
+++ b/package/bridge-utils/bridge-utils.mk
@@ -11,9 +11,4 @@ BRIDGE_UTILS_CONF_OPT = --with-linux-hea
 BRIDGE_UTILS_LICENSE = GPLv2+
 BRIDGE_UTILS_LICENSE_FILES = COPYING
 
-define BRIDGE_UTILS_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/,lib/libbridge.a \
-		include/libbridge.h share/man/man8/brctl.8 sbin/brctl)
-endef
-
 $(eval $(autotools-package))
diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -20,10 +20,6 @@ define BSDIFF_INSTALL_TARGET_CMDS
 	install -D -m 755 $(@D)/bspatch $(TARGET_DIR)/usr/bin/bspatch
 endef
 
-define BSDIFF_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/bsdiff $(TARGET_DIR)/usr/bin/bspatch
-endef
-
 define BSDIFF_CLEAN_CMDS
 	rm -f $(@D)/bsdiff $(@D)/bspatch
 endef
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -207,10 +207,6 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 endef
 
-define BUSYBOX_UNINSTALL_TARGET_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) uninstall
-endef
-
 define BUSYBOX_CLEAN_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) clean
 endef
diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -12,9 +12,4 @@ define CGILUA_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) install LUA_DIR="$(TARGET_DIR)/usr/share/lua"
 endef
 
-define CGILUA_UNINSTALL_TARGET_CMDS
-	rm -rf "$(TARGET_DIR)/usr/share/lua/cgilua"
-	rm -f "$(TARGET_DIR)/usr/share/lua/cgilua.lua"
-endef
-
 $(eval $(generic-package))
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -39,8 +39,4 @@ define CHRONY_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
 endef
 
-define CHRONY_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/chronyc $(TARGET_DIR)/usr/sbin/chronyd
-endef
-
 $(eval $(generic-package))
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -26,16 +26,6 @@ define CJSON_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/libcJSON.so $(TARGET_DIR)/usr/lib/libcJSON.so
 endef
 
-define CJSON_UNINSTALL_STAGING_CMDS
-	rm -f $(STAGING_DIR)/usr/include/cJSON.h
-	rm -f $(STAGING_DIR)/usr/lib/libcJSON.so
-endef
-
-define CJSON_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/include/cJSON.h
-	rm -f $(TARGET_DIR)/usr/lib/libcJSON.so
-endef
-
 define CJSON_CLEAN_CMDS
 	rm -f $(@D)/libcJSON.so
 endef
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -13,8 +13,4 @@ define COPAS_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/lua/copas.lua
 endef
 
-define COPAS_UNINSTALL_TARGET_CMDS
-	rm -f "$(TARGET_DIR)/usr/share/lua/copas.lua"
-endef
-
 $(eval $(generic-package))
diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -13,8 +13,4 @@ define COXPCALL_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/lua/coxpcall.lua
 endef
 
-define COXPCALL_UNINSTALL_TARGET_CMDS
-	rm -f "$(TARGET_DIR)/usr/share/lua/coxpcall.lua"
-endef
-
 $(eval $(generic-package))
diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -16,8 +16,4 @@ define CPPZMQ_INSTALL_STAGING_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/zmq.hpp $(STAGING_DIR)/usr/include/zmq.hpp
 endef
 
-define CPPZMQ_UNINSTALL_STAGING_CMDS
-	$(RM) $(STAGING_DIR)/usr/include/zmq.hpp
-endef
-
 $(eval $(generic-package))
diff --git a/package/devmem2/devmem2.mk b/package/devmem2/devmem2.mk
--- a/package/devmem2/devmem2.mk
+++ b/package/devmem2/devmem2.mk
@@ -24,8 +24,4 @@ define DEVMEM2_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/devmem2 $(TARGET_DIR)/sbin/devmem2
 endef
 
-define DEVMEM2_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/sbin/devmem2
-endef
-
 $(eval $(generic-package))
diff --git a/package/dhrystone/dhrystone.mk b/package/dhrystone/dhrystone.mk
--- a/package/dhrystone/dhrystone.mk
+++ b/package/dhrystone/dhrystone.mk
@@ -25,8 +25,4 @@ define DHRYSTONE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/dhrystone $(TARGET_DIR)/usr/bin/dhrystone
 endef
 
-define DHRYSTONE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/dhrystone
-endef
-
 $(eval $(generic-package))
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -11,7 +11,6 @@ DMRAID_SUBDIR = $(DMRAID_VERSION)
 # lib and tools race with parallel make
 DMRAID_MAKE = $(MAKE1)
 DMRAID_INSTALL_STAGING = YES
-DMRAID_UNINSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) remove
 DMRAID_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 DMRAID_DEPENDENCIES = lvm2
@@ -22,9 +21,4 @@ endef
 
 DMRAID_POST_INSTALL_TARGET_HOOKS += DMRAID_INSTALL_INITSCRIPT
 
-define DMRAID_UNINSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) remove -C $(@D)/$(DMRAID_SUBDIR)
-	rm -f $(TARGET_DIR)/etc/init.d/S20dmraid
-endef
-
 $(eval $(autotools-package))
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -93,9 +93,4 @@ define DNSMASQ_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/var/lib/misc/
 endef
 
-define DNSMASQ_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/dnsmasq
-	rm -f $(TARGET_DIR)/usr/share/man/man8/dnsmasq.8
-endef
-
 $(eval $(generic-package))
diff --git a/package/doom-wad/doom-wad.mk b/package/doom-wad/doom-wad.mk
--- a/package/doom-wad/doom-wad.mk
+++ b/package/doom-wad/doom-wad.mk
@@ -17,8 +17,4 @@ define DOOM_WAD_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/games/doom/doom1.wad
 endef
 
-define DOOM_WAD_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/share/games/doom/doom1.wad
-endef
-
 $(eval $(generic-package))
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -38,12 +38,6 @@ define DOSFSTOOLS_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/sbin/
 endef
 
-define DOSFSTOOLS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/sbin/$(FATLABEL_BINARY)
-	rm -f $(TARGET_DIR)/sbin/$(FSCK_FAT_BINARY)
-	rm -f $(TARGET_DIR)/sbin/$(MKFS_FAT_BINARY)
-endef
-
 define DOSFSTOOLS_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -37,8 +37,4 @@ define DROPWATCH_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/bin/dropwatch
 endef
 
-define DROPWATCH_UNINSTALL_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/dropwatch
-endef
-
 $(eval $(generic-package))
diff --git a/package/dsp-tools/dsp-tools.mk b/package/dsp-tools/dsp-tools.mk
--- a/package/dsp-tools/dsp-tools.mk
+++ b/package/dsp-tools/dsp-tools.mk
@@ -16,8 +16,4 @@ define DSP_TOOLS_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
 endef
 
-define DSP_TOOLS_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/dsp-, load probe test exec)
-endef
-
 $(eval $(generic-package))
diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -36,9 +36,4 @@ define EBTABLES_INSTALL_TARGET_CMDS
 endef
 endif
 
-define EBTABLES_UNINSTALL_TARGET_CMDS
-	rm -rf $(TARGET_DIR)/lib/ebtables
-	rm -f $(TARGET_DIR)/sbin/ebtables
-endef
-
 $(eval $(generic-package))
diff --git a/package/eeprog/eeprog.mk b/package/eeprog/eeprog.mk
--- a/package/eeprog/eeprog.mk
+++ b/package/eeprog/eeprog.mk
@@ -15,8 +15,4 @@ define EEPROG_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/eeprog $(TARGET_DIR)/usr/bin/eeprog
 endef
 
-define EEPROG_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/eeprog
-endef
-
 $(eval $(generic-package))
diff --git a/package/explorercanvas/explorercanvas.mk b/package/explorercanvas/explorercanvas.mk
--- a/package/explorercanvas/explorercanvas.mk
+++ b/package/explorercanvas/explorercanvas.mk
@@ -17,8 +17,4 @@ define EXPLORERCANVAS_INSTALL_TARGET_CMD
 		$(TARGET_DIR)/var/www/excanvas.js
 endef
 
-define EXPLORERCANVAS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/var/www/excanvas.js
-endef
-
 $(eval $(generic-package))
diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -23,16 +23,6 @@ define EZXML_INSTALL_TARGET_CMDS
 	install -D -m 0644 $(@D)/libezxml.a $(TARGET_DIR)/usr/lib/libezxml.a
 endef
 
-define EZXML_UNINSTALL_STAGING_CMDS
-	rm -f $(STAGING_DIR)/usr/include/ezxml.h
-	rm -f $(STAGING_DIR)/usr/lib/libezxml.a
-endef
-
-define EZXML_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/include/ezxml.h
-	rm -f $(TARGET_DIR)/usr/lib/libezxml.a
-endef
-
 define EZXML_CLEAN_CMDS
 	-$(MAKE) -C $(@D) -f GNUmakefile clean
 endef
diff --git a/package/fan-ctrl/fan-ctrl.mk b/package/fan-ctrl/fan-ctrl.mk
--- a/package/fan-ctrl/fan-ctrl.mk
+++ b/package/fan-ctrl/fan-ctrl.mk
@@ -23,8 +23,4 @@ define FAN_CTRL_INSTALL_TARGET_CMDS
 	install -D -m 755 $(@D)/fan-ctrl $(TARGET_DIR)/usr/sbin/fan-ctrl
 endef
 
-define FAN_CTRL_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/fan-ctrl
-endef
-
 $(eval $(generic-package))
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -20,13 +20,6 @@ define FB_TEST_APP_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/offset $(TARGET_DIR)/usr/bin/fb-test-offset
 endef
 
-define FB_TEST_APP_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/fb-test-perf
-	rm -f $(TARGET_DIR)/usr/bin/fb-test-rect
-	rm -f $(TARGET_DIR)/usr/bin/fb-test
-	rm -f $(TARGET_DIR)/usr/bin/fb-test-offset
-endef
-
 define FB_TEST_APP_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
--- a/package/fbgrab/fbgrab.mk
+++ b/package/fbgrab/fbgrab.mk
@@ -18,8 +18,4 @@ define FBGRAB_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/fbgrab $(TARGET_DIR)/usr/bin/fbgrab
 endef
 
-define FBGRAB_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/fbgrab
-endef
-
 $(eval $(generic-package))
diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -22,10 +22,6 @@ define FBSET_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/fbset $(TARGET_DIR)/usr/sbin/fbset
 endef
 
-define FBSET_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/fbset
-endef
-
 define FBSET_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -17,10 +17,6 @@ define FCONFIG_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/fconfig $(TARGET_DIR)/sbin/fconfig
 endef
 
-define FCONFIG_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/sbin/fconfig
-endef
-
 define FCONFIG_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -19,9 +19,4 @@ define FEH_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-define FEH_UNINSTALL_TARGET_CMDS
-	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) " \
-		DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
-endef
-
 $(eval $(generic-package))
diff --git a/package/file/file.mk b/package/file/file.mk
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -11,10 +11,5 @@ FILE_INSTALL_STAGING = YES
 FILE_LICENSE = BSD-2c, one file BSD-4c, one file BSD-3c
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
 
-define FILE_UNINSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(FILE_DIR)
-	rm -f $(TARGET_DIR)/usr/lib/libmagic.*
-endef
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/fis/fis.mk b/package/fis/fis.mk
--- a/package/fis/fis.mk
+++ b/package/fis/fis.mk
@@ -17,8 +17,4 @@ define FIS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/fis $(TARGET_DIR)/sbin/fis
 endef
 
-define FIS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/sbin/fis
-endef
-
 $(eval $(generic-package))
diff --git a/package/flot/flot.mk b/package/flot/flot.mk
--- a/package/flot/flot.mk
+++ b/package/flot/flot.mk
@@ -31,8 +31,4 @@ define FLOT_INSTALL_TARGET_CMDS
 	done
 endef
 
-define FLOT_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/var/www/jquery.flot*
-endef
-
 $(eval $(generic-package))
diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -22,10 +22,6 @@ define GADGETFS_TEST_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) prefix=/usr install
 endef
 
-define GADGETFS_TEST_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/bin/gadgetfs-test
-endef
-
 define GADGETFS_TEST_CLEAN_CMDS
 	-$(MAKE) -C $(@D) $(GADGETFS_TEST_MAKEOPTS) clean
 endef
diff --git a/package/googlefontdirectory/googlefontdirectory.mk b/package/googlefontdirectory/googlefontdirectory.mk
--- a/package/googlefontdirectory/googlefontdirectory.mk
+++ b/package/googlefontdirectory/googlefontdirectory.mk
@@ -20,8 +20,4 @@ define GOOGLEFONTDIRECTORY_INSTALL_TARGE
 	done
 endef
 
-define GOOGLEFONTDIRECTORY_UNINSTALL_TARGET_CMDS
-	rm -rf $(addprefix $(TARGET_DIR)/usr/share/fonts/,$(GOOGLEFONTDIRECTORY_FONTS))
-endef
-
 $(eval $(generic-package))
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -35,8 +35,4 @@ define GPTFDISK_INSTALL_TARGET_CMDS
 	done
 endef
 
-define GPTFDISK_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(GPTFDISK_TARGETS_y))
-endef
-
 $(eval $(generic-package))
diff --git a/package/gstreamer/gst-dsp/gst-dsp.mk b/package/gstreamer/gst-dsp/gst-dsp.mk
--- a/package/gstreamer/gst-dsp/gst-dsp.mk
+++ b/package/gstreamer/gst-dsp/gst-dsp.mk
@@ -15,10 +15,6 @@ define GST_DSP_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
 endef
 
-define GST_DSP_UNINSTALL_TARGET_CMDS
-	$(RM) $(TARGET_DIR)/usr/lib/gstreamer-0.10/libgstdsp.so
-endef
-
 GST_DSP_DEPENDENCIES = gstreamer tidsp-binaries host-pkgconf
 
 $(eval $(generic-package))
diff --git a/package/gstreamer/gst-omapfb/gst-omapfb.mk b/package/gstreamer/gst-omapfb/gst-omapfb.mk
--- a/package/gstreamer/gst-omapfb/gst-omapfb.mk
+++ b/package/gstreamer/gst-omapfb/gst-omapfb.mk
@@ -15,10 +15,6 @@ define GST_OMAPFB_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
 endef
 
-define GST_OMAPFB_UNINSTALL_TARGET_CMDS
-	$(RM) $(TARGET_DIR)/usr/lib/gstreamer-0.10/libgstomapfb.so
-endef
-
 GST_OMAPFB_DEPENDENCIES = gstreamer
 
 $(eval $(generic-package))
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -26,11 +26,6 @@ define HDPARM_INSTALL_TARGET_CMDS
 	$(HDPARM_INSTALL_DOCUMENTATION)
 endef
 
-define HDPARM_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/sbin/hdparm
-	rm -f $(TARGET_DIR)/usr/share/man/man8/hdparm.8
-endef
-
 define HDPARM_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -14,9 +14,4 @@ define HWDATA_INSTALL_TARGET_CMDS
 	install -D -m 644 $(@D)/usb.ids $(TARGET_DIR)/usr/share/hwdata/usb.ids
 endef
 
-define HWDATA_UNINSTALL_TARGET_CMDS
-	rm -rf $(TARGET_DIR)/usr/share/hwdata
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
-endef
-
 $(eval $(generic-package))
diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -30,9 +30,4 @@ define INPUT_EVENT_DAEMON_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-define INPUT_EVENT_DAEMON_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/input-event-daemon
-	rm -f $(TARGET_DIR)/etc/input-event-daemon.conf
-endef
-
 $(eval $(generic-package))
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -39,10 +39,6 @@ define INPUT_TOOLS_INSTALL_TARGET_CMDS
 	done
 endef
 
-define INPUT_TOOLS_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(INPUT_TOOLS_TARGETS_y))
-endef
-
 define INPUT_TOOLS_CLEAN_CMDS
 	rm -f $(addprefix $(@D)/,$(INPUT_TOOLS_TARGETS_y))
 endef
diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -25,9 +25,4 @@ define IOSTAT_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/man/man8/iostat.8
 endef
 
-define IOSTAT_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/iostat
-	rm -f $(TARGET_DIR)/usr/share/man/man8/iostat.8
-endef
-
 $(eval $(generic-package))
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -50,11 +50,4 @@ else
 IPTABLES_POST_INSTALL_TARGET_HOOKS += IPTABLES_TARGET_IPV6_REMOVE
 endif
 
-define IPTABLES_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/iptables-xml
-	rm -f $(TARGET_DIR)/usr/sbin/iptables* $(TARGET_DIR)/usr/sbin/ip6tables*
-	rm -f $(TARGET_DIR)/usr/sbin/xtables-multi
-	rm -rf $(TARGET_DIR)/usr/lib/xtables
-endef
-
 $(eval $(autotools-package))
diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -38,8 +38,4 @@ define IRDA_UTILS_INSTALL_TARGET_CMDS
 	done
 endef
 
-define IRDA_UTILS_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(IRDA_UTILS_SBINS-))
-endef
-
 $(eval $(generic-package))
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -28,9 +28,4 @@ define IW_INSTALL_TARGET_CMDS
 	$(IW_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
-define IW_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/iw
-	rm -f $(TARGET_DIR)/usr/share/man/man8/iw.8*
-endef
-
 $(eval $(generic-package))
diff --git a/package/jquery-sparkline/jquery-sparkline.mk b/package/jquery-sparkline/jquery-sparkline.mk
--- a/package/jquery-sparkline/jquery-sparkline.mk
+++ b/package/jquery-sparkline/jquery-sparkline.mk
@@ -18,8 +18,4 @@ define JQUERY_SPARKLINE_INSTALL_TARGET_C
 		$(TARGET_DIR)/var/www/jquery.sparkline.js
 endef
 
-define JQUERY_SPARKLINE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/var/www/jquery.sparkline.js
-endef
-
 $(eval $(generic-package))
diff --git a/package/jquery-ui-themes/jquery-ui-themes.mk b/package/jquery-ui-themes/jquery-ui-themes.mk
--- a/package/jquery-ui-themes/jquery-ui-themes.mk
+++ b/package/jquery-ui-themes/jquery-ui-themes.mk
@@ -27,8 +27,4 @@ define JQUERY_UI_THEMES_INSTALL_TARGET_C
 	chmod 0644 $(TARGET_DIR)/var/www/images/*.png
 endef
 
-define JQUERY_UI_THEMES_UNINSTALL_TARGET_CMDS
-	$(RM) $(TARGET_DIR)/var/www/jquery-ui.css
-endef
-
 $(eval $(generic-package))
diff --git a/package/jquery-ui/jquery-ui.mk b/package/jquery-ui/jquery-ui.mk
--- a/package/jquery-ui/jquery-ui.mk
+++ b/package/jquery-ui/jquery-ui.mk
@@ -29,9 +29,4 @@ define JQUERY_UI_INSTALL_TARGET_CMDS
 	chmod 0644 $(TARGET_DIR)/var/www/images/*.png
 endef
 
-define JQUERY_UI_UNINSTALL_TARGET_CMDS
-	$(RM) $(addprefix $(TARGET_DIR)/var/www/,\
-		jquery-ui.js jquery-ui-i18n.js jquery-ui.css)
-endef
-
 $(eval $(generic-package))
diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -18,8 +18,4 @@ define JQUERY_VALIDATION_INSTALL_TARGET_
 		$(TARGET_DIR)/var/www/jquery.validate.js
 endef
 
-define JQUERY_VALIDATION_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/var/www/jquery.validate.js
-endef
-
 $(eval $(generic-package))
diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -18,8 +18,4 @@ define JQUERY_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/var/www/jquery.js
 endef
 
-define JQUERY_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/var/www/jquery.js
-endef
-
 $(eval $(generic-package))
diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -15,10 +15,6 @@ define JSMIN_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/jsmin $(TARGET_DIR)/usr/bin/jsmin
 endef
 
-define JSMIN_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/jsmin
-endef
-
 define HOST_JSMIN_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) jsmin
 endef
diff --git a/package/json-javascript/json-javascript.mk b/package/json-javascript/json-javascript.mk
--- a/package/json-javascript/json-javascript.mk
+++ b/package/json-javascript/json-javascript.mk
@@ -13,8 +13,4 @@ define JSON_JAVASCRIPT_INSTALL_TARGET_CM
 	$(INSTALL) -m 0644 -D $(@D)/json2.js $(TARGET_DIR)/var/www/json2.js
 endef
 
-define JSON_JAVASCRIPT_UNINSTALL_TARGET_CMDS
-	$(RM) $(TARGET_DIR)/var/www/json2.js
-endef
-
 $(eval $(generic-package))
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -47,21 +47,4 @@ define KISMET_INSTALL_TARGET_CMDS
 	$(KISMET_INSTALL_TARGET_CONFIGS)
 endef
 
-ifdef KISMET_TARGET_BINARIES
-define KISMET_UNINSTALL_TARGET_BINARIES
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(KISMET_TARGET_BINARIES))
-endef
-endif
-
-ifdef KISMET_TARGET_CONFIGS
-define KISMET_UNINSTALL_TARGET_CONFIGS
-	rm -f $(addprefix $(TARGET_DIR)/etc/, $(KISMET_TARGET_CONFIGS))
-endef
-endif
-
-define KISMET_UNINSTALL_TARGET_CMDS
-	$(KISMET_UNINSTALL_TARGET_BINARIES)
-	$(KISMET_UNINSTALL_TARGET_CONFIGS)
-endef
-
 $(eval $(autotools-package))
diff --git a/package/lbase64/lbase64.mk b/package/lbase64/lbase64.mk
--- a/package/lbase64/lbase64.mk
+++ b/package/lbase64/lbase64.mk
@@ -21,10 +21,6 @@ define LBASE64_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/lib/lua/base64.so
 endef
 
-define LBASE64_UNINSTALL_TARGET_CMDS
-       rm -f $(TARGET_DIR)/usr/lib/lua/base64.so
-endef
-
 define LBASE64_CLEAN_CMDS
        $(MAKE) -C $(@D) clean
 endef
diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
--- a/package/lcdapi/lcdapi.mk
+++ b/package/lcdapi/lcdapi.mk
@@ -25,16 +25,6 @@ define LCDAPI_INSTALL_TARGET_CMDS
 		DESTDIR="$(TARGET_DIR)" install
 endef
 
-define LCDAPI_UNINSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		DESTDIR="$(STAGING_DIR)" uninstall
-endef
-
-define LCDAPI_UNINSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		DESTDIR="$(TARGET_DIR)" uninstall
-endef
-
 define LCDAPI_CLEAN_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) clean
 endef
diff --git a/package/less/less.mk b/package/less/less.mk
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -15,8 +15,4 @@ define LESS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/less $(TARGET_DIR)/usr/bin/less
 endef
 
-define LESS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/less
-endef
-
 $(eval $(autotools-package))
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -27,9 +27,4 @@ endef
 
 LIBIDN_POST_INSTALL_TARGET_HOOKS += LIBIDN_REMOVE_EMACS_STUFF
 
-define LIBIDN_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/libidn*
-	rm -f $(TARGET_DIR)/usr/bin/idn
-endef
-
 $(eval $(autotools-package))
diff --git a/package/libjson/libjson.mk b/package/libjson/libjson.mk
--- a/package/libjson/libjson.mk
+++ b/package/libjson/libjson.mk
@@ -41,21 +41,11 @@ define LIBJSON_INSTALL_TARGET_CMDS
 		$(LIBJSON_MAKE_OPT) prefix=$(TARGET_DIR)/usr install -C $(@D)
 endef
 
-define LIBJSON_UNINSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		$(LIBJSON_MAKE_OPT) prefix=$(TARGET_DIR)/usr uninstall -C $(@D)
-endef
-
 define LIBJSON_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		$(LIBJSON_MAKE_OPT) prefix=$(STAGING_DIR)/usr install -C $(@D)
 endef
 
-define LIBJSON_UNINSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		$(LIBJSON_MAKE_OPT) prefix=$(STAGING_DIR)/usr uninstall -C $(@D)
-endef
-
 define LIBJSON_CLEAN_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) $(LIBJSON_MAKE_OPT) \
 		clean -C $(@D)
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -20,14 +20,6 @@ define LIBROXML_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR)/usr/ -C $(@D) install
 endef
 
-define LIBROXML_UNINSTALL_STAGING_CMDS
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) uninstall
-endef
-
-define LIBROXML_UNINSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
-endef
-
 define LIBROXML_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -18,21 +18,11 @@ define LIBSVGTINY_INSTALL_STAGING_CMDS
 		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) install
 endef
 
-define LIBSVGTINY_UNINSTALL_STAGING_CMDS
-	$(TARGET_CONFIGURE_OPTS) \
-		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) uninstall
-endef
-
 define LIBSVGTINY_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
 endef
 
-define LIBSVGTINY_UNINSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) \
-		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) uninstall
-endef
-
 define LIBSVGTINY_CLEAN_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) clean
 endef
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -107,10 +107,4 @@ define LIGHTTPD_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/lighttpd.service
 endef
 
-define LIGHTTPD_UNINSTALL_TARGET_CMDS
-	$(RM) $(TARGET_DIR)/usr/sbin/lighttpd
-	$(RM) $(TARGET_DIR)/usr/sbin/lighttpd-angel
-	$(RM) -r $(TARGET_DIR)/usr/lib/lighttpd
-endef
-
 $(eval $(autotools-package))
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -21,24 +21,12 @@ define LINENOISE_INSTALL_STAGING_CMDS
 	$(INSTALL) -m 755 -D $(@D)/linenoise_example    $(STAGING_DIR)/usr/bin/linenoise_example
 endef
 
-define LINENOISE_UNINSTALL_STAGING_CMDS
-	rm -f   $(STAGING_DIR)/usr/include/linenoise.h
-	rm -f   $(STAGING_DIR)/usr/lib/liblinenoise.a
-	rm -f   $(STAGING_DIR)/usr/bin/linenoise_example
-endef
-
 define LINENOISE_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 644 -D $(@D)/linenoise.h          $(TARGET_DIR)/usr/include/linenoise.h
 	$(INSTALL) -m 644 -D $(@D)/liblinenoise.a       $(TARGET_DIR)/usr/lib/liblinenoise.a
 	$(INSTALL) -m 755 -D $(@D)/linenoise_example    $(TARGET_DIR)/usr/bin/linenoise_example
 endef
 
-define LINENOISE_UNINSTALL_TARGET_CMDS
-	rm -f   $(TARGET_DIR)/usr/include/linenoise.h
-	rm -f   $(TARGET_DIR)/usr/lib/liblinenoise.a
-	rm -f   $(TARGET_DIR)/usr/bin/linenoise_example
-endef
-
 define LINENOISE_CLEAN_CMDS
 	rm -f $(@D)/*.o $(@D)/*.a $(@D)/linenoise_example
 endef
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -38,14 +38,4 @@ define LINUX_FUSION_INSTALL_TARGET_CMDS
 	cp -dpf package/linux-fusion/40-fusion.rules $(LINUX_FUSION_ETC_DIR)
 endef
 
-define LINUX_FUSION_UNINSTALL_STAGING_CMDS
-	rm -f $(STAGING_DIR)/usr/include/linux/fusion.h
-endef
-
-define LINUX_FUSION_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/include/linux/fusion.h
-	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX_FOR_FUSION)/kernel/drivers/char/fusion
-	rm -f $(LINUX_FUSION_ETC_DIR)/40-fusion.rules
-endef
-
 $(eval $(generic-package))
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -61,17 +61,4 @@ define LIVE555_INSTALL_TARGET_CMDS
 	done
 endef
 
-define LIVE555_UNINSTALL_STAGING_CMDS
-	rm -rf $(STAGING_DIR)/usr/include/live
-	for i in $(LIVE555_LIBS_TO_INSTALL); do \
-		rm -f $(addprefix $(STAGING_DIR)/usr/lib/, `basename $$i`); \
-	done
-endef
-
-define LIVE555_UNINSTALL_TARGET_CMDS
-	for i in $(LIVE555_FILES_TO_INSTALL-); do \
-		rm -f $(addprefix $(TARGET_DIR)/usr/bin/, `basename $$i`); \
-	done
-endef
-
 $(eval $(generic-package))
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -30,19 +30,11 @@ define LM_SENSORS_INSTALL_STAGING_CMDS
 	rm -f $(addprefix $(STAGING_DIR)/usr/,$(LM_SENSORS_BINS_) $(LM_SENSORS_BINS_y))
 endef
 
-define LM_SENSORS_UNINSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) uninstall
-endef
-
 define LM_SENSORS_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
 	rm -f $(addprefix $(TARGET_DIR)/usr/,$(LM_SENSORS_BINS_))
 endef
 
-define LM_SENSORS_UNINSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) uninstall
-endef
-
 define LM_SENSORS_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -25,10 +25,6 @@ define LOCKFILE_PROGS_INSTALL_TARGET_CMD
 	done
 endef
 
-define LOCKFILE_PROGS_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(LOCKFILE_BINS))
-endef
-
 define LOCKFILE_PROGS_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -23,14 +23,6 @@ define LOGROTATE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/logrotate.d
 endef
 
-define LOGROTATE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/logrotate
-	rm -f $(TARGET_DIR)/etc/logrotate.conf
-	rm -f $(TARGET_DIR)/usr/man/man5/logrotate.conf.5
-	rm -f $(TARGET_DIR)/usr/man/man8/logrotate.8
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/etc/logrotate.d
-endef
-
 define LOGROTATE_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -62,10 +62,6 @@ define LSOF_INSTALL_TARGET_CMDS
 	install -D -m 755 $(@D)/lsof $(TARGET_DIR)/bin/lsof
 endef
 
-define LSOF_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/bin/lsof
-endef
-
 define LSOF_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -18,10 +18,6 @@ define LUA_MSGPACK_NATIVE_INSTALL_TARGET
 	$(INSTALL) -m 755 -D $(@D)/msgpack.so $(TARGET_DIR)/usr/lib/lua/msgpack.so
 endef
 
-define LUA_MSGPACK_NATIVE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/lua/msgpack.so
-endef
-
 define LUA_MSGPACK_NATIVE_CLEAN_CMDS
 	rm -f $(@D)/msgpack.so
 endef
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -99,24 +99,6 @@ LUA_INSTALLED_FILES = \
 	/usr/lib/liblua.a \
 	/usr/lib/liblua.so*
 
-define LUA_UNINSTALL_STAGING_CMDS
-	for i in $(LUA_INSTALLED_FILES); do \
-		rm -f $(STAGING_DIR)$$i; \
-	done
-endef
-
-define LUA_UNINSTALL_TARGET_CMDS
-	for i in $(LUA_INSTALLED_FILES); do \
-		rm -f $(TARGET_DIR)$$i; \
-	done
-endef
-
-define HOST_LUA_UNINSTALL_TARGET_CMDS
-	for i in $(LUA_INSTALLED_FILES); do \
-		rm -f $(HOST_DIR)$$i; \
-	done
-endef
-
 define LUA_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
diff --git a/package/luacjson/luacjson.mk b/package/luacjson/luacjson.mk
--- a/package/luacjson/luacjson.mk
+++ b/package/luacjson/luacjson.mk
@@ -28,8 +28,4 @@ define LUACJSON_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-define LUACJSON_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/lua/cjson.so
-endef
-
 $(eval $(generic-package))
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -27,11 +27,6 @@ define LUAEXPAT_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/src/lxp/lom.lua $(TARGET_DIR)/usr/share/lua/lxp/lom.lua
 endef
 
-define LUAEXPAT_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/lua/lxp.so
-	rm -f $(TARGET_DIR)/usr/share/lua/lxp/lom.lua
-endef
-
 define LUAEXPAT_CLEAN_CMDS
 	$(MAKE) -C $(@D) $(LUAEXPAT_MFLAGS) clean
 endef
diff --git a/package/luaexpatutils/luaexpatutils.mk b/package/luaexpatutils/luaexpatutils.mk
--- a/package/luaexpatutils/luaexpatutils.mk
+++ b/package/luaexpatutils/luaexpatutils.mk
@@ -14,8 +14,4 @@ define LUAEXPATUTILS_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/lua/lxp/doc.lua
 endef
 
-define LUAEXPATUTILS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/share/lua/lxp/doc.lua
-endef
-
 $(eval $(generic-package))
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -21,10 +21,6 @@ define LUAFILESYSTEM_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/src/lfs.so $(TARGET_DIR)/usr/lib/lua/lfs.so
 endef
 
-define LUAFILESYSTEM_UNINSTALL_TARGET_CMDS
-	rm -f "$(TARGET_DIR)/usr/lib/lua/lfs.so"
-endef
-
 define LUAFILESYSTEM_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -55,14 +55,6 @@ define LUAJIT_INSTALL_TARGET_CMDS
 	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" -C $(@D) install
 endef
 
-define LUAJIT_UNINSTALL_STAGING_CMDS
-	$(MAKE) PREFIX="/usr" DESTDIR="$(STAGING_DIR)" -C $(@D) uninstall
-endef
-
-define LUAJIT_UNINSTALL_TARGET_CMDS
-	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" -C $(@D) uninstall
-endef
-
 define LUAJIT_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -24,10 +24,4 @@ define LUASEC_INSTALL_TARGET_CMDS
 		LUACPATH="$(TARGET_DIR)/usr/lib/lua" install
 endef
 
-define LUASEC_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/lua/ssl.so
-	rm -rf $(TARGET_DIR)/usr/share/lua/ssl
-	rm -f $(TARGET_DIR)/usr/share/lua/ssl.lua
-endef
-
 $(eval $(generic-package))
diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -22,15 +22,6 @@ define LUASOCKET_INSTALL_TARGET_CMDS
 		INSTALL_TOP_LIB="$(TARGET_DIR)/usr/lib/lua" install
 endef
 
-define LUASOCKET_UNINSTALL_TARGET_CMDS
-	rm -rf "$(TARGET_DIR)/usr/lib/lua/mime"
-	rm -rf "$(TARGET_DIR)/usr/lib/lua/socket"
-	rm -rf "$(TARGET_DIR)/usr/share/lua/socket"
-	rm -f "$(TARGET_DIR)/usr/share/lua/socket.lua"
-	rm -f "$(TARGET_DIR)/usr/share/lua/mime.lua"
-	rm -f "$(TARGET_DIR)/usr/share/lua/ltn12.lua"
-endef
-
 define LUASOCKET_CLEAN_CMDS
 	$(MAKE) -C $(@D) -f makefile clean
 endef
diff --git a/package/luasql/luasql.mk b/package/luasql/luasql.mk
--- a/package/luasql/luasql.mk
+++ b/package/luasql/luasql.mk
@@ -32,8 +32,4 @@ define LUASQL_INSTALL_TARGET_CMDS
 		LUA_LIBDIR="$(TARGET_DIR)/usr/lib/lua" install
 endef
 
-define LUASQL_UNINSTALL_TARGET_CMDS
-	rm -rf $(TARGET_DIR)/usr/lib/lua/luasql
-endef
-
 $(eval $(generic-package))
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -50,14 +50,4 @@ else
 LVM2_CONF_OPT += --disable-applib
 endif
 
-define LVM2_UNINSTALL_STAGING_CMDS
-	rm -f $(addprefix $(STAGING_DIR)/usr/sbin/,$(LVM2_BINS))
-	rm -f $(addprefix $(STAGING_DIR)/usr/lib/,libdevmapper.so*)
-endef
-
-define LVM2_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(LVM2_BINS))
-	rm -f $(addprefix $(TARGET_DIR)/usr/lib/,libdevmapper.so*)
-endef
-
 $(eval $(autotools-package))
diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -17,11 +17,6 @@ define MAKEDEVS_INSTALL_TARGET_CMDS
 	install -D -m 755 $(@D)/makedevs $(TARGET_DIR)/usr/sbin/makedevs
 endef
 
-define MAKEDEVS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/makedevs
-endef
-
-
 define HOST_MAKEDEVS_BUILD_CMDS
 	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
 		package/makedevs/makedevs.c -o $(@D)/makedevs
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -16,9 +16,6 @@ MDADM_MAKE_OPT = \
 MDADM_INSTALL_TARGET_OPT = \
 	DESTDIR=$(TARGET_DIR)/usr -C $(MDADM_DIR) install-mdadm
 
-MDADM_UNINSTALL_TARGET_OPT = \
-	DESTDIR=$(TARGET_DIR)/usr -C $(MDADM_DIR) uninstall
-
 define MDADM_CONFIGURE_CMDS
 	# Do nothing
 endef
diff --git a/package/memstat/memstat.mk b/package/memstat/memstat.mk
--- a/package/memstat/memstat.mk
+++ b/package/memstat/memstat.mk
@@ -19,9 +19,4 @@ define MEMSTAT_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/memstat $(TARGET_DIR)/usr/bin/memstat
 endef
 
-define MEMSTAT_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/etc/memstat.conf
-	rm -f $(TARGET_DIR)/usr/bin/memstat
-endef
-
 $(eval $(generic-package))
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -20,10 +20,6 @@ define MEMTESTER_INSTALL_TARGET_CMDS
 	$(MAKE) $(MEMTESTER_TARGET_INSTALL_OPTS) -C $(@D) install
 endef
 
-define MEMTESTER_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/memtester
-endef
-
 define MEMTESTER_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -29,10 +29,6 @@ define MII_DIAG_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install-mii-diag
 endef
 
-define MII_DIAG_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/mii-diag
-endef
-
 define MII_DIAG_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -53,10 +53,6 @@ define MINIDLNA_INSTALL_TARGET_CMDS
 		-C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
-define MINIDLNA_UNINSTALL_TARGET_CMDS
-	$(RM) $(TARGET_DIR)/usr/sbin/minidlna
-endef
-
 define MINIDLNA_CLEAN_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) clean
 endef
diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
--- a/package/mongrel2/mongrel2.mk
+++ b/package/mongrel2/mongrel2.mk
@@ -20,10 +20,4 @@ define MONGREL2_INSTALL_TARGET_CMDS
 		PREFIX=/usr DESTDIR=$(TARGET_DIR) install
 endef
 
-define MONGREL2_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/mongrel2
-	rm -f $(TARGET_DIR)/usr/bin/m2sh
-	rm -f $(TARGET_DIR)/usr/bin/procer
-endef
-
 $(eval $(generic-package))
diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -167,10 +167,6 @@ define MPLAYER_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-define MPLAYER_UNINSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
-endef
-
 define MPLAYER_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -17,10 +17,6 @@ define MROUTED_INSTALL_TARGET_CMDS
 	$(MAKE) prefix=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-define MROUTED_UNINSTALL_TARGET_CMDS
-	$(MAKE) prefix=/usr DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
-endef
-
 define MROUTED_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -12,7 +12,5 @@ MXML_INSTALL_STAGING = YES
 
 MXML_INSTALL_STAGING_OPT = DSTROOT=$(STAGING_DIR) install
 MXML_INSTALL_TARGET_OPT = DSTROOT=$(TARGET_DIR) install
-MXML_UNINSTALL_STAGING_OPT = DSTROOT=$(STAGING_DIR) uninstall
-MXML_UNINSTALL_TARGET_OPT = DSTROOT=$(TARGET_DIR) uninstall
 
 $(eval $(autotools-package))
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -27,8 +27,4 @@ define NANO_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/src/nano $(TARGET_DIR)/usr/bin/nano
 endef
 
-define NANO_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/nano
-endef
-
 $(eval $(autotools-package))
diff --git a/package/nanocom/nanocom.mk b/package/nanocom/nanocom.mk
--- a/package/nanocom/nanocom.mk
+++ b/package/nanocom/nanocom.mk
@@ -23,8 +23,4 @@ define NANOCOM_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/nanocom $(TARGET_DIR)/usr/bin/nanocom
 endef
 
-define NANOCOM_UNINSTALL_TARGET_CMDS
-	$(RM) $(TARGET_DIR)/usr/bin/nanocom
-endef
-
 $(eval $(generic-package))
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -39,8 +39,4 @@ define NCFTP_INSTALL_TARGET_CMDS
 	$(NCFTP_INSTALL_NCFTP_BATCH)
 endef
 
-define NCFTP_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS) ncftpspooler)
-endef
-
 $(eval $(autotools-package))
diff --git a/package/neard/neard.mk b/package/neard/neard.mk
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -23,8 +23,4 @@ define NEARD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S53neard
 endef
 
-define NEARD_UNINSTALL_INIT_SYSV
-	$(RM) $(TARGET_DIR)/etc/init.d/S53neard
-endef
-
 $(eval $(autotools-package))
diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
--- a/package/netperf/netperf.mk
+++ b/package/netperf/netperf.mk
@@ -18,9 +18,4 @@ define NETPERF_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/bin/netserver
 endef
 
-define NETPERF_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/netperf
-	rm -f $(TARGET_DIR)/usr/bin/netserver
-endef
-
 $(eval $(autotools-package))
diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -21,12 +21,6 @@ define NETPLUG_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S29netplug
 endef
 
-define NETPLUG_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/sbin/netplugd
-	rm -rf $(TARGET_DIR)/etc/netplug*
-	rm -f $(TARGET_DIR)/etc/init.d/S29netplug
-endef
-
 define NETPLUG_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -75,13 +75,6 @@ define NETSNMP_INSTALL_TARGET_CMDS
 	$(NETSNMP_REMOVE_MIBS_IPV6)
 endef
 
-define NETSNMP_UNINSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) uninstall
-	rm -f $(TARGET_DIR)/etc/init.d/S59snmpd
-	rm -f $(TARGET_DIR)/usr/lib/libnetsnmp*
-endef
-
 define NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
 	$(SED) 	"s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" \
 		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
diff --git a/package/noip/noip.mk b/package/noip/noip.mk
--- a/package/noip/noip.mk
+++ b/package/noip/noip.mk
@@ -21,10 +21,6 @@ define NOIP_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/noip2 $(TARGET_DIR)/usr/sbin/noip2
 endef
 
-define NOIP_UNINSTALL_TARGET_CMDS
-	rm -f "$(TARGET_DIR)/usr/sbin/noip2"
-endef
-
 define NOIP_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -58,13 +58,6 @@ define NTP_INSTALL_TARGET_CMDS
 	fi
 endef
 
-define NTP_UNINSTALL_TARGET_CMDS
-	rm $(TARGET_DIR)/usr/sbin/ntpd
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(NTP_INSTALL_FILES_y))
-	rm $(TARGET_DIR)/etc/init.d/S49ntp
-	rm $(TARGET_DIR)/etc/default/ntpd
-endef
-
 NTP_POST_PATCH_HOOKS += NTP_PATCH_FIXUPS
 
 $(eval $(autotools-package))
diff --git a/package/nuttcp/nuttcp.mk b/package/nuttcp/nuttcp.mk
--- a/package/nuttcp/nuttcp.mk
+++ b/package/nuttcp/nuttcp.mk
@@ -20,8 +20,4 @@ define NUTTCP_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/bin/nuttcp
 endef
 
-define NUTTCP_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/nuttcp
-endef
-
 $(eval $(generic-package))
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -10,10 +10,4 @@ OPENNTPD_CONF_OPT = --with-builtin-arc4r
 OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3c
 OPENNTPD_LICENSE_FILES = LICENCE
 
-define OPENNTPD_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/ntpd
-	rm -f $(TARGET_DIR)/etc/ntpd.conf
-	rm -f $(TARGET_DIR)/usr/share/man/man?/ntpd*
-endef
-
 $(eval $(autotools-package))
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -131,12 +131,5 @@ ifneq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
 OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_OPENSSL_ENGINES
 endif
 
-define OPENSSL_UNINSTALL_CMDS
-	rm -rf $(addprefix $(TARGET_DIR)/,etc/ssl usr/bin/openssl usr/include/openssl)
-	rm -rf $(addprefix $(TARGET_DIR)/usr/lib/,ssl engines libcrypto* libssl* pkgconfig/libcrypto.pc)
-	rm -rf $(addprefix $(STAGING_DIR)/,etc/ssl usr/bin/openssl usr/include/openssl)
-	rm -rf $(addprefix $(STAGING_DIR)/usr/lib/,ssl engines libcrypto* libssl* pkgconfig/libcrypto.pc)
-endef
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -53,9 +53,4 @@ define OPENVPN_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/init.d/S60openvpn
 endef
 
-define OPENVPN_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/openvpn
-	rm -f $(TARGET_DIR)/etc/init.d/S60openvpn
-endef
-
 $(eval $(autotools-package))
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -60,11 +60,4 @@ define OPROFILE_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 $(@D)/libopagent/.libs/*.so* $(TARGET_DIR)/usr/lib/oprofile
 endef
 
-define OPROFILE_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(notdir $(OPROFILE_BINARIES)))
-	rm -f $(TARGET_DIR)/usr/bin/opcontrol
-	rm -rf $(TARGET_DIR)/usr/share/oprofile
-	rm -rf $(TARGET_DIR)/usr/lib/oprofile
-endef
-
 $(eval $(autotools-package))
diff --git a/package/php/php.mk b/package/php/php.mk
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -218,18 +218,6 @@ endef
 
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
 
-define PHP_UNINSTALL_STAGING_CMDS
-	rm -rf $(STAGING_DIR)/usr/include/php
-	rm -rf $(STAGING_DIR)/usr/lib/php
-	rm -f $(STAGING_DIR)/usr/bin/php*
-	rm -f $(STAGING_DIR)/usr/share/man/man1/php*.1
-endef
-
-define PHP_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/etc/php.ini
-	rm -f $(TARGET_DIR)/usr/bin/php*
-endef
-
 PHP_CONF_ENV += CFLAGS="$(PHP_CFLAGS)"
 
 $(eval $(autotools-package))
diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -37,10 +37,4 @@ define PORTMAP_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/init.d
 endef
 
-define PORTMAP_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/sbin/,$(PORTMAP_SBINS))
-	rm -f $(addprefix $(TARGET_DIR)/usr/share/man/man8/, \
-		$(addsuffix .8,$(PORTMAP_SBINS)))
-endef
-
 $(eval $(generic-package))
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -47,19 +47,6 @@ define PPPD_BUILD_CMDS
 		-C $(@D) $(PPPD_MAKE_OPT)
 endef
 
-define PPPD_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/, $(PPPD_TARGET_BINS))
-	rm -f $(TARGET_DIR)/usr/sbin/pppoe-discovery
-	rm -rf $(TARGET_DIR)/usr/lib/pppd
-	rm -rf $(TARGET_DIR)/etc/ppp/radius
-	for m in $(PPPD_MANPAGES); do \
-		rm -f $(TARGET_DIR)/usr/share/man/man8/$$m.8; \
-	done
-	for m in $(PPPD_RADIUS_MANPAGES); do \
-		rm -f $(TARGET_DIR)/usr/share/man/man8/$$m.8; \
-	done
-endef
-
 ifeq ($(BR2_PACKAGE_PPPD_RADIUS),y)
 define PPPD_INSTALL_RADIUS
 	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radattr.so \
diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -23,9 +23,4 @@ define PPTP_LINUX_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/pptp.8 $(TARGET_DIR)/usr/share/man/man8/pptp.8
 endef
 
-define PPTP_LINUX_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/pptp
-	rm -f $(TARGET_DIR)/usr/share/man/man8/pptp.8
-endef
-
 $(eval $(generic-package))
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -43,10 +43,4 @@ define PROFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 package/proftpd/S50proftpd $(TARGET_DIR)/etc/init.d
 endef
 
-define PROFTPD_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/$(PROFTPD_TARGET_BINARY)
-	rm -f $(TARGET_DIR)/etc/init.d/S50proftpd
-	rm -f $(TARGET_DIR)/etc/proftpd.conf
-endef
-
 $(eval $(autotools-package))
diff --git a/package/python-nfc/python-nfc.mk b/package/python-nfc/python-nfc.mk
--- a/package/python-nfc/python-nfc.mk
+++ b/package/python-nfc/python-nfc.mk
@@ -17,8 +17,4 @@ define PYTHON_NFC_INSTALL_TARGET_CMDS
 	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
-define PYTHON_NFC_UNINSTALL_TARGET_CMDS
-	$(RM) -r $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/nfc/
-endef
-
 $(eval $(generic-package))
diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -105,8 +105,4 @@ define PYTHON_PYGAME_INSTALL_TARGET_CMDS
 	$(PYTHON_PYGAME_REMOVE_DOC)
 endef
 
-define PYTHON_PYGAME_UNINSTALL_TARGET_CMDS
-	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame*
-endef
-
 $(eval $(generic-package))
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -686,10 +686,4 @@ define QT_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-define QT_UNINSTALL_TARGET_CMDS
-	-rm -rf $(TARGET_DIR)/usr/lib/fonts
-	-rm $(TARGET_DIR)/usr/lib/libQt*.so.*
-	-rm $(TARGET_DIR)/usr/lib/libphonon.so.*
-endef
-
 $(eval $(generic-package))
diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
--- a/package/rapidjson/rapidjson.mk
+++ b/package/rapidjson/rapidjson.mk
@@ -27,8 +27,4 @@ define RAPIDJSON_INSTALL_STAGING_CMDS
 		$(STAGING_DIR)/usr/include/rapidjson/internal
 endef
 
-define RAPIDJSON_UNINSTALL_STAGING_CMDS
-	$(RM) -r $(STAGING_DIR)/usr/include/rapidjson
-endef
-
 $(eval $(generic-package))
diff --git a/package/rings/rings.mk b/package/rings/rings.mk
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -18,11 +18,6 @@ define RINGS_INSTALL_TARGET_CMDS
 		LUA_DIR="$(TARGET_DIR)/usr/share/lua" install
 endef
 
-define RINGS_UNINSTALL_TARGET_CMDS
-	rm -f "$(TARGET_DIR)/usr/lib/lua/rings.so"
-	rm -f "$(TARGET_DIR)/usr/share/lua/stable.lua"
-endef
-
 define RINGS_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -26,13 +26,4 @@ define RP_PPPOE_INSTALL_TARGET_CMDS
 	done
 endef
 
-define RP_PPPOE_UNINSTALL_TARGET_CMDS
-	for ff in $(RP_PPPOE_TARGET_FILES); do \
-		rm -f $(TARGET_DIR)/usr/sbin/$$ff; \
-	done
-	for ff in $(RP_PPPOE_TARGET_FILES); do \
-		rm -f $(TARGET_DIR)/usr/share/man/man8/$$ff.8; \
-	done
-endef
-
 $(eval $(autotools-package))
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -25,10 +25,4 @@ endef
 
 RRDTOOL_POST_INSTALL_TARGET_HOOKS += RRDTOOL_REMOVE_EXAMPLES
 
-define RRDTOOL_UNINSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
-	rm -rf $(TARGET_DIR)/usr/share/rrdtool
-	rm -f $(TARGET_DIR)/usr/lib/librrd*
-endef
-
 $(eval $(autotools-package))
diff --git a/package/rsh-redone/rsh-redone.mk b/package/rsh-redone/rsh-redone.mk
--- a/package/rsh-redone/rsh-redone.mk
+++ b/package/rsh-redone/rsh-redone.mk
@@ -27,10 +27,4 @@ define RSH_REDONE_INSTALL_TARGET_CMDS
 			$(if $(rsh-redone-sbin-y),install-sbin))
 endef
 
-define RSH_REDONE_UNINSTALL_TARGET_CMDS
-	rm -f \
-		$(addprefix $(TARGET_DIR)/usr/bin/,$(rsh-redone-bin-y)) \
-		$(addprefix $(TARGET_DIR)/usr/sbin/,$(rsh-redone-sbin-y))
-endef
-
 $(eval $(generic-package))
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -65,11 +65,6 @@ SAMBA_INSTALL_TARGET_OPT = \
 	installlibs installservers installbin installscripts \
 	$(if $(BR2_PACKAGE_SAMBA_SWAT),installswat)
 
-SAMBA_UNINSTALL_TARGET_OPT = \
-	DESTDIR=$(TARGET_DIR) -C $(SAMBA_DIR)/$(SAMBA_SUBDIR) \
-	uninstalllibs uninstallservers uninstallbin uninstallscripts \
-	$(if $(BR2_PACKAGE_SAMBA_SWAT),uninstallswat)
-
 # binaries to keep
 SAMBA_BINTARGETS_y = \
 	usr/sbin/smbd \
diff --git a/package/schifra/schifra.mk b/package/schifra/schifra.mk
--- a/package/schifra/schifra.mk
+++ b/package/schifra/schifra.mk
@@ -40,15 +40,6 @@ define SCHIFRA_INSTALL_STAGING_CMDS
 		$(INSTALL) -m 0644 -D $$i $(STAGING_DIR)/usr/include/$$i; done
 endef
 
-define SCHIFRA_UNINSTALL_TARGET_CMDS
-	$(RM) $(TARGET_DIR)/usr/include/schifra_*.hpp
-	$(RM) $(TARGET_DIR)/usr/bin/schifra_*
-endef
-
-define SCHIFRA_UNINSTALL_STAGING_CMDS
-	$(RM) $(STAGING_DIR)/usr/include/schifra_*.hpp
-endef
-
 define SCHIFRA_CLEAN_CMDS
 	$(MAKE) -C $(@D) $(SCHIFRA_MAKE_OPT) clean
 endef
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -49,11 +49,4 @@ ifneq ($(BR2_PACKAGE_SDL_SOUND_PLAYSOUND
 SDL_SOUND_POST_INSTALL_TARGET_HOOKS += SDL_SOUND_REMOVE_PLAYSOUND
 endif
 
-# target shared libs doesn't get removed by make uninstall if the .la
-# files are removed
-define SDL_SOUND_UNINSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(@D)
-	rm -f $(TARGET_DIR)/usr/lib/libSDL_sound*so*
-endef
-
 $(eval $(autotools-package))
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -32,22 +32,6 @@ define SLANG_INSTALL_TARGET_CMDS
 	(cd $(TARGET_DIR)/usr/lib; ln -fs libslang.so libslang.so.1)
 endef
 
-define SLANG_UNINSTALL_STAGING_CMDS
-	rm -f $(STAGING_DIR)/usr/lib/libslang.a
-	rm -f $(STAGING_DIR)/usr/lib/libslang.so
-	rm -f $(STAGING_DIR)/usr/lib/libslang.so.1
-	rm -f $(STAGING_DIR)/usr/include/slang.h
-	rm -f $(STAGING_DIR)/usr/include/slcurses.h
-endef
-
-define SLANG_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/libslang.a
-	rm -f $(TARGET_DIR)/usr/lib/libslang.so
-	rm -f $(TARGET_DIR)/usr/lib/libslang.so.1
-	rm -f $(TARGET_DIR)/usr/include/slang.h
-	rm -f $(TARGET_DIR)/usr/include/slcurses.h
-endef
-
 define SLANG_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
diff --git a/package/snowball-hdmiservice/snowball-hdmiservice.mk b/package/snowball-hdmiservice/snowball-hdmiservice.mk
--- a/package/snowball-hdmiservice/snowball-hdmiservice.mk
+++ b/package/snowball-hdmiservice/snowball-hdmiservice.mk
@@ -22,18 +22,6 @@ define SNOWBALL_HDMISERVICE_INSTALL_TARG
 	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)" DESTDIR=$(TARGET_DIR) install
 endef
 
-define SNOWBALL_HDMISERVICE_UNINSTALL_STAGING_CMDS
-	rm -f $(STAGING_DIR)/usr/lib/hdmiservice.so
-	rm -f $(STAGING_DIR)/usr/bin/hdmistart
-	rm -f $(STAGING_DIR)/usr/include/hdmi_service_api.h
-	rm -f $(STAGING_DIR)/usr/include/hdmi_service_local.h
-endef
-
-define SNOWBALL_HDMISERVICE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/hdmiservice.so
-	rm -f $(TARGET_DIR)/usr/bin/hdmistart
-endef
-
 define SNOWBALL_HDMISERVICE_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
diff --git a/package/sound-theme-borealis/sound-theme-borealis.mk b/package/sound-theme-borealis/sound-theme-borealis.mk
--- a/package/sound-theme-borealis/sound-theme-borealis.mk
+++ b/package/sound-theme-borealis/sound-theme-borealis.mk
@@ -15,8 +15,4 @@ define SOUND_THEME_BOREALIS_INSTALL_TARG
 	done
 endef
 
-define SOUND_THEME_BOREALIS_UNINSTALL_TARGET_CMDS
-	$(RM) -r $(TARGET_DIR)/usr/share/sounds/borealis
-endef
-
 $(eval $(generic-package))
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -39,18 +39,4 @@ else
 SQLCIPHER_CONF_OPT += --disable-readline
 endif
 
-define SQLCIPHER_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/sqlite3
-	rm -f $(TARGET_DIR)/usr/lib/libsqlite3*
-	rm -f $(TARGET_DIR)/usr/lib/pkgconfig/sqlite3.pc
-	rm -f $(TARGET_DIR)/usr/include/sqlite3*.h
-endef
-
-define SQLCIPHER_UNINSTALL_STAGING_CMDS
-	rm -f $(STAGING_DIR)/usr/bin/sqlite3
-	rm -f $(STAGING_DIR)/usr/lib/libsqlite3*
-	rm -f $(STAGING_DIR)/usr/lib/pkgconfig/sqlite3.pc
-	rm -f $(STAGING_DIR)/usr/include/sqlite3*.h
-endef
-
 $(eval $(autotools-package))
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -59,16 +59,4 @@ else
 SQLITE_CONF_OPT += --disable-readline
 endif
 
-define SQLITE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/sqlite3
-	rm -f $(TARGET_DIR)/usr/lib/libsqlite3*
-endef
-
-define SQLITE_UNINSTALL_STAGING_CMDS
-	rm -f $(STAGING_DIR)/usr/bin/sqlite3
-	rm -f $(STAGING_DIR)/usr/lib/libsqlite3*
-	rm -f $(STAGING_DIR)/usr/lib/pkgconfig/sqlite3.pc
-	rm -f $(STAGING_DIR)/usr/include/sqlite3*.h
-endef
-
 $(eval $(autotools-package))
diff --git a/package/sredird/sredird.mk b/package/sredird/sredird.mk
--- a/package/sredird/sredird.mk
+++ b/package/sredird/sredird.mk
@@ -16,10 +16,6 @@ define SREDIRD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/sredird $(TARGET_DIR)/usr/sbin/sredird
 endef
 
-define SREDIRD_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/sredird
-endef
-
 define SREDIRD_CLEAN_CMDS
 	rm -f $(@D)/sredird
 endef
diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
--- a/package/sstrip/sstrip.mk
+++ b/package/sstrip/sstrip.mk
@@ -18,10 +18,6 @@ define SSTRIP_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/sstrip $(TARGET_DIR)/usr/bin/sstrip
 endef
 
-define SSTRIP_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/sstrip
-endef
-
 define HOST_SSTRIP_BUILD_CMDS
 	cd $(@D) ; \
 	$(HOSTCC) $(HOST_CFLAGS) -include endian.h -include byteswap.h \
@@ -32,9 +28,5 @@ define HOST_SSTRIP_INSTALL_CMDS
 	$(INSTALL) -D $(@D)/sstrip $(HOST_DIR)/usr/bin/$(HOST_SSTRIP_BINARY)
 endef
 
-define HOST_SSTRIP_UNINSTALL_CMDS
-	rm -f $(HOST_DIR)/usr/bin/$(HOST_SSTRIP_BINARY)
-endef
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -39,14 +39,4 @@ define THTTPD_INSTALL_TARGET_CMDS
 	echo "pidfile=/var/run/thttpd.pid" >> $(TARGET_DIR)/var/www/thttpd_config
 endef
 
-define THTTPD_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/thttpd
-	rm -f $(TARGET_DIR)/usr/sbin/thttpd_wrapper
-	rm -rf $(TARGET_DIR)/var/www
-	rm -f $(TARGET_DIR)/etc/init.d/S90thttpd
-	rm -f $(TARGET_DIR)/usr/bin/htpasswd
-	rm -f $(TARGET_DIR)/usr/bin/makeweb
-	rm -f $(TARGET_DIR)/usr/bin/syslogtocern
-endef
-
 $(eval $(autotools-package))
diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -23,9 +23,4 @@ define TI_UTILS_INSTALL_TARGET_CMDS
 	cp -r $(@D)/ini_files $(TARGET_DIR)/usr/share/ti-utils
 endef
 
-define TI_UTILS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/calibrator
-	rm -fr $(TARGET_DIR)/usr/share/ti-utils
-endef
-
 $(eval $(generic-package))
diff --git a/package/tidsp-binaries/tidsp-binaries.mk b/package/tidsp-binaries/tidsp-binaries.mk
--- a/package/tidsp-binaries/tidsp-binaries.mk
+++ b/package/tidsp-binaries/tidsp-binaries.mk
@@ -11,8 +11,4 @@ define TIDSP_BINARIES_INSTALL_TARGET_CMD
 	$(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
 endef
 
-define TIDSP_BINARIES_UNINSTALL_TARGET_CMDS
-	$(RM) -r $(TARGET_DIR)/lib/dsp
-endef
-
 $(eval $(generic-package))
diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -25,10 +25,4 @@ endef
 
 TN5250_POST_INSTALL_TARGET_HOOKS += TN5250_INSTALL_FIXES
 
-define TN5250_UNINSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(TN5250_DIR)
-	rm -f $(TARGET_DIR)/usr/lib/lib5250.*
-	rm -rf $(TARGET_DIR)/usr/share/tn5250
-endef
-
 $(eval $(autotools-package))
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -44,11 +44,6 @@ define UBOOT_TOOLS_INSTALL_TARGET_CMDS
 	$(UBOOT_TOOLS_INSTALL_FWPRINTENV)
 endef
 
-define UBOOT_TOOLS_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/,\
-		usr/bin/mkimage usr/sbin/fw_printenv usr/sbin/fw_setenv)
-endef
-
 define HOST_UBOOT_TOOLS_BUILD_CMDS
 	$(MAKE1) -C $(@D) 			\
 		HOSTCC="$(HOSTCC)"		\
diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
--- a/package/uemacs/uemacs.mk
+++ b/package/uemacs/uemacs.mk
@@ -19,8 +19,4 @@ define UEMACS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/em $(TARGET_DIR)/usr/bin/em
 endef
 
-define UEMACS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/em
-endef
-
 $(eval $(generic-package))
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -37,8 +37,4 @@ define USB_MODESWITCH_CLEAN_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) clean
 endef
 
-define USB_MODESWITCH_UNINSTALL_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) uninstall
-endef
-
 $(eval $(generic-package))
diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -25,11 +25,4 @@ define USBMOUNT_INSTALL_TARGET_CMDS
 	mkdir -p $(addprefix $(TARGET_DIR)/media/usb,0 1 2 3 4 5 6 7)
 endef
 
-define USBMOUNT_UNINSTALL_TARGET_CMDS
-	rm -rf $(TARGET_DIR)/etc/usbmount			\
-		$(TARGET_DIR)/usr/share/usbmount/usbmount	\
-		$(TARGET_DIR)/lib/udev/rules.d/usbmount.rules	\
-		$(TARGET_DIR)/media/usb?
-endef
-
 $(eval $(generic-package))
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -50,13 +50,6 @@ define VSFTPD_INSTALL_TARGET_CMDS
 	install -d -m 700 $(TARGET_DIR)/usr/share/empty
 endef
 
-define VSFTPD_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/vsftpd
-	rm -f $(TARGET_DIR)/usr/share/man/man8/vsftpd.8
-	rm -f $(TARGET_DIR)/usr/share/man/man5/vsftpd.conf.5
-	rm -f $(TARGET_DIR)/etc/init.d/S70vsftpd
-endef
-
 define VSFTPD_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
diff --git a/package/whetstone/whetstone.mk b/package/whetstone/whetstone.mk
--- a/package/whetstone/whetstone.mk
+++ b/package/whetstone/whetstone.mk
@@ -24,8 +24,4 @@ define WHETSTONE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/whetstone $(TARGET_DIR)/usr/bin/whetstone
 endef
 
-define WHETSTONE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/whetstone
-endef
-
 $(eval $(generic-package))
diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -16,9 +16,4 @@ define WIPE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/wipe.1 $(TARGET_DIR)/usr/share/man/man1/wipe.1
 endef
 
-define WIPE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/wipe
-	rm -f $(TARGET_DIR)/usr/share/man/man1/wipe.1
-endef
-
 $(eval $(autotools-package))
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -40,8 +40,4 @@ define WIRELESS_TOOLS_INSTALL_TARGET_CMD
 	$(MAKE) -C $(@D) INSTALL_MAN="$(TARGET_DIR)/usr/share/man" install-man
 endef
 
-define WIRELESS_TOOLS_UNINSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" uninstall
-endef
-
 $(eval $(generic-package))
diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -14,8 +14,4 @@ define WSAPI_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/lua/wsapi
 endef
 
-define WSAPI_UNINSTALL_TARGET_CMDS
-	rm -rf "$(TARGET_DIR)/usr/share/lua/wsapi"
-endef
-
 $(eval $(generic-package))
diff --git a/package/wvdial/wvdial.mk b/package/wvdial/wvdial.mk
--- a/package/wvdial/wvdial.mk
+++ b/package/wvdial/wvdial.mk
@@ -29,12 +29,6 @@ define WVDIAL_INSTALL_TARGET_CMDS
 		install -C $(@D)
 endef
 
-define WVDIAL_UNINSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(WVDIAL_MAKE_ENV) $(WVDIAL_MAKE) \
-		prefix="$(TARGET_DIR)/usr" PPPDIR="$(TARGET_DIR)/etc/ppp/peers" \
-		uninstall -C $(@D)
-endef
-
 define WVDIAL_CLEAN_CMDS
 	$(TARGET_MAKE_ENV) $(WVDIAL_MAKE_ENV) $(WVDIAL_MAKE) clean -C $(@D)
 endef
diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -14,10 +14,4 @@ define XAVANTE_INSTALL_TARGET_CMDS
 		LUA_LIBDIR="$(TARGET_DIR)/usr/lib/lua" install
 endef
 
-define XAVANTE_UNINSTALL_TARGET_CMDS
-	rm -rf "$(TARGET_DIR)/usr/share/xavante"
-	rm -f "$(TARGET_DIR)/usr/share/xavante.lua"
-	rm -f "$(TARGET_DIR)/usr/share/sajax.lua"
-endef
-
 $(eval $(generic-package))
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -17,6 +17,5 @@ XFSPROGS_CONF_OPT = \
 	INSTALL_GROUP=root
 
 XFSPROGS_INSTALL_TARGET_OPT = DIST_ROOT=$(TARGET_DIR) install
-XFSPROGS_UNINSTALL_TARGET_OPT = DIST_ROOT=$(TARGET_DIR) uninstall
 
 $(eval $(autotools-package))
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -64,17 +64,5 @@ define ZLIB_CLEAN_CMDS
 	-$(MAKE1) -C $(@D) clean
 endef
 
-define ZLIB_UNINSTALL_STAGING_CMDS
-	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) uninstall
-endef
-
-define ZLIB_UNINSTALL_TARGET_CMDS
-	$(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) uninstall
-endef
-
-define HOST_ZLIB_UNINSTALL_TARGET_CMDS
-	$(MAKE1) -C $(@D) uninstall
-endef
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -30,24 +30,12 @@ define ZMQPP_INSTALL_TARGET_CMDS
 		$(ZMQPP_MAKE_OPT) DESTDIR=$(TARGET_DIR) install -C $(@D)
 endef
 
-define ZMQPP_UNINSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		$(ZMQPP_MAKE_OPT) DESTDIR=$(TARGET_DIR) uninstall -C $(@D)
-	$(RM) $(TARGET_DIR)/usr/include/zmqpp
-endef
-
 define ZMQPP_INSTALL_STAGING_CMDS
 	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/zmqpp
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		$(ZMQPP_MAKE_OPT) DESTDIR=$(STAGING_DIR) install -C $(@D)
 endef
 
-define ZMQPP_UNINSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		$(ZMQPP_MAKE_OPT) DESTDIR=$(STAGING_DIR) uninstall -C $(@D)
-	$(RM) $(STAGING_DIR)/usr/include/zmqpp
-endef
-
 define ZMQPP_CLEAN_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) $(ZMQPP_MAKE_OPT) \
 		clean -C $(@D)
diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
--- a/package/zxing/zxing.mk
+++ b/package/zxing/zxing.mk
@@ -27,16 +27,8 @@ define ZXING_INSTALL_STAGING_CMDS
 	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(STAGING_DIR) install
 endef
 
-define ZXING_UNINSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(STAGING_DIR) uninstall
-endef
-
 define ZXING_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(TARGET_DIR) install
 endef
 
-define ZXING_UNINSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(TARGET_DIR) uninstall
-endef
-
 $(eval $(generic-package))
