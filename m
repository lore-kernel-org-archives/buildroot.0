From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 13 Sep 2013 10:30:20 +0200
Subject: [Buildroot] [PATCH 1/1] package: remove the empty trailing lines
Message-ID: <1379061020-22657-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 fs/initramfs/initramfs.mk                          |    1 -
 package/alsamixergui/alsamixergui.mk               |    1 -
 package/ccache/ccache.mk                           |    1 -
 package/cvs/cvs.mk                                 |    2 --
 package/dfu-util/dfu-util.mk                       |    1 -
 package/directfb-examples/directfb-examples.mk     |    1 -
 package/elftosb/elftosb.mk                         |    1 -
 package/freescale-imx/freescale-imx.mk             |    1 -
 package/gamin/gamin.mk                             |    1 -
 package/gnuchess/gnuchess.mk                       |    1 -
 package/gqview/gqview.mk                           |    1 -
 package/grantlee/grantlee.mk                       |    1 -
 package/gtkperf/gtkperf.mk                         |    1 -
 package/intltool/intltool.mk                       |    1 -
 package/leafpad/leafpad.mk                         |    1 -
 package/libaio/libaio.mk                           |    1 -
 package/libical/libical.mk                         |    1 -
 package/libiqrf/libiqrf.mk                         |    1 -
 package/libv4l/libv4l.mk                           |    1 -
 package/libxml-parser-perl/libxml-parser-perl.mk   |    1 -
 package/libyaml/libyaml.mk                         |    1 -
 package/mongrel2/mongrel2.mk                       |    1 -
 package/pcmanfm/pcmanfm.mk                         |    1 -
 package/pkg-cmake.mk                               |    1 -
 package/polarssl/polarssl.mk                       |    1 -
 package/python-dpkt/python-dpkt.mk                 |    1 -
 package/rt-tests/rt-tests.mk                       |    1 -
 package/rubix/rubix.mk                             |    1 -
 package/squashfs3/squashfs3.mk                     |    1 -
 .../startup-notification/startup-notification.mk   |    1 -
 package/tcpreplay/tcpreplay.mk                     |    1 -
 package/tinymembench/tinymembench.mk               |    1 -
 package/torsmo/torsmo.mk                           |    1 -
 package/weston/weston.mk                           |    1 -
 package/x11r7/libxcb/libxcb.mk                     |    1 -
 package/x11r7/xcb-proto/xcb-proto.mk               |    1 -
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk |    1 -
 package/x11r7/xcb-util/xcb-util.mk                 |    1 -
 .../xfont_font-adobe-100dpi.mk                     |    1 -
 .../xfont_font-adobe-75dpi.mk                      |    1 -
 .../xfont_font-adobe-utopia-100dpi.mk              |    1 -
 .../xfont_font-adobe-utopia-75dpi.mk               |    1 -
 .../xfont_font-adobe-utopia-type1.mk               |    1 -
 package/x11r7/xfont_font-alias/xfont_font-alias.mk |    1 -
 .../xfont_font-arabic-misc.mk                      |    1 -
 .../xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk   |    1 -
 .../xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk     |    1 -
 .../xfont_font-bh-lucidatypewriter-100dpi.mk       |    1 -
 .../xfont_font-bh-lucidatypewriter-75dpi.mk        |    1 -
 .../x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk   |    1 -
 .../xfont_font-bh-type1/xfont_font-bh-type1.mk     |    1 -
 .../xfont_font-bitstream-100dpi.mk                 |    1 -
 .../xfont_font-bitstream-75dpi.mk                  |    1 -
 .../xfont_font-bitstream-type1.mk                  |    1 -
 .../xfont_font-cronyx-cyrillic.mk                  |    1 -
 .../xfont_font-cursor-misc.mk                      |    1 -
 .../xfont_font-daewoo-misc.mk                      |    1 -
 .../xfont_font-dec-misc/xfont_font-dec-misc.mk     |    1 -
 .../xfont_font-ibm-type1/xfont_font-ibm-type1.mk   |    1 -
 .../xfont_font-isas-misc/xfont_font-isas-misc.mk   |    1 -
 .../xfont_font-jis-misc/xfont_font-jis-misc.mk     |    1 -
 .../xfont_font-micro-misc/xfont_font-micro-misc.mk |    1 -
 .../xfont_font-misc-cyrillic.mk                    |    1 -
 .../xfont_font-misc-ethiopic.mk                    |    1 -
 .../xfont_font-misc-meltho.mk                      |    1 -
 .../xfont_font-mutt-misc/xfont_font-mutt-misc.mk   |    1 -
 .../xfont_font-schumacher-misc.mk                  |    1 -
 .../xfont_font-screen-cyrillic.mk                  |    1 -
 .../xfont_font-sony-misc/xfont_font-sony-misc.mk   |    1 -
 .../xfont_font-sun-misc/xfont_font-sun-misc.mk     |    1 -
 .../xfont_font-winitzki-cyrillic.mk                |    1 -
 .../xfont_font-xfree86-type1.mk                    |    1 -
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    1 -
 .../xlib_libpthread-stubs/xlib_libpthread-stubs.mk |    1 -
 package/xstroke/xstroke.mk                         |    1 -
 package/xvkbd/xvkbd.mk                             |    1 -
 support/dependencies/dependencies.mk               |    1 -
 77 files changed, 78 deletions(-)

diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index fe426cc..7820d65 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -20,4 +20,3 @@ rootfs-initramfs-show-depends:
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 TARGETS += rootfs-initramfs
 endif
-
diff --git a/package/alsamixergui/alsamixergui.mk b/package/alsamixergui/alsamixergui.mk
index c61e902..8f05350 100644
--- a/package/alsamixergui/alsamixergui.mk
+++ b/package/alsamixergui/alsamixergui.mk
@@ -16,4 +16,3 @@ ALSAMIXERGUI_CONF_ENV = ac_cv_lib_fltk_numericsort=yes \
 ALSAMIXERGUI_DEPENDENCIES = fltk alsa-lib
 
 $(eval $(autotools-package))
-
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index a2f709e..c5e9385 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -45,4 +45,3 @@ ifeq ($(BR2_CCACHE),y)
 ccache-stats: host-ccache
 	$(Q)$(CCACHE) -s
 endif
-
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index 7371644..d2a1033 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -50,5 +50,3 @@ define CVS_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(autotools-package))
-
-
diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index 2f596b1..eab8c73 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -11,4 +11,3 @@ DFU_UTIL_SITE = http://dfu-util.gnumonks.org/releases/
 HOST_DFU_UTIL_DEPENDENCIES = host-libusb
 
 $(eval $(host-autotools-package))
-
diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index 0a2138e..16d2a86 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -107,4 +107,3 @@ define DIRECTFB_EXAMPLES_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(autotools-package))
-
diff --git a/package/elftosb/elftosb.mk b/package/elftosb/elftosb.mk
index 1e17c5b..b2bd76f 100644
--- a/package/elftosb/elftosb.mk
+++ b/package/elftosb/elftosb.mk
@@ -23,4 +23,3 @@ define HOST_ELFTOSB_CLEAN_CMDS
 endef
 
 $(eval $(host-generic-package))
-
diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index c8f99b6..d35a62e 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -10,4 +10,3 @@ FREESCALE_IMX_VERSION = 1.1.0
 FREESCALE_IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source
 
 include $(sort $(wildcard package/freescale-imx/*/*.mk))
-
diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index c7ec531..9f6ec96 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -25,4 +25,3 @@ endif
 GAMIN_DEPENDENCIES = libglib2
 
 $(eval $(autotools-package))
-
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 9d7dd79..e91046d 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -14,4 +14,3 @@ GNUCHESS_DEPENDENCIES = host-flex flex
 GNUCHESS_DEPENDENCIES += $(if $(BR2_PACKAGE_READLINE),readline)
 
 $(eval $(autotools-package))
-
diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
index c5131a4..bffda59 100644
--- a/package/gqview/gqview.mk
+++ b/package/gqview/gqview.mk
@@ -11,4 +11,3 @@ GQVIEW_DEPENDENCIES = host-pkgconf libgtk2
 GQVIEW_CONF_ENV = LIBS="-lm"
 
 $(eval $(autotools-package))
-
diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
index edaab2b..2ad5888 100644
--- a/package/grantlee/grantlee.mk
+++ b/package/grantlee/grantlee.mk
@@ -10,4 +10,3 @@ GRANTLEE_INSTALL_STAGING = YES
 GRANTLEE_DEPENDENCIES =  qt
 
 $(eval $(cmake-package))
-
diff --git a/package/gtkperf/gtkperf.mk b/package/gtkperf/gtkperf.mk
index 27403ab..fa9531d 100644
--- a/package/gtkperf/gtkperf.mk
+++ b/package/gtkperf/gtkperf.mk
@@ -10,4 +10,3 @@ GTKPERF_SITE = http://downloads.sourceforge.net/project/gtkperf/gtkperf/$(GTKPER
 GTKPERF_DEPENDENCIES = libgtk2
 
 $(eval $(autotools-package))
-
diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index f3c1e67..3772960 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -16,4 +16,3 @@ HOST_INTLTOOL_CONF_OPT = \
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-
diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index a34a2d7..8a04ebf 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -10,4 +10,3 @@ LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
 LEAFPAD_DEPENDENCIES = libgtk2 host-intltool
 
 $(eval $(autotools-package))
-
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index a046157..b66c9f5 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -22,4 +22,3 @@ define LIBAIO_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
-
diff --git a/package/libical/libical.mk b/package/libical/libical.mk
index dd2fff7..cdee006 100644
--- a/package/libical/libical.mk
+++ b/package/libical/libical.mk
@@ -9,4 +9,3 @@ LIBICAL_SITE = http://downloads.sourceforge.net/project/freeassociation/libical/
 LIBICAL_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
index df4bb42..6c33654 100644
--- a/package/libiqrf/libiqrf.mk
+++ b/package/libiqrf/libiqrf.mk
@@ -11,4 +11,3 @@ LIBIQRF_INSTALL_STAGING = YES
 LIBIQRF_DEPENDENCIES = libusb
 
 $(eval $(cmake-package))
-
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 9362404..f62a4b6 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -41,4 +41,3 @@ define LIBV4L_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
-
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index a863f48..53f3bcf 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -33,4 +33,3 @@ endef
 
 $(eval $(generic-package))
 $(eval $(host-generic-package))
-
diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
index ef006dd..17945b2 100644
--- a/package/libyaml/libyaml.mk
+++ b/package/libyaml/libyaml.mk
@@ -10,4 +10,3 @@ LIBYAML_SITE = http://pyyaml.org/download/libyaml/
 LIBYAML_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-
diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
index c068107..116754c 100644
--- a/package/mongrel2/mongrel2.mk
+++ b/package/mongrel2/mongrel2.mk
@@ -28,4 +28,3 @@ define MONGREL2_UNINSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
-
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 90b3959..edc970e 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -12,4 +12,3 @@ PCMANFM_DEPENDENCIES = host-pkgconf libgtk2 gamin startup-notification xlib_libX
 PCMANFM_AUTORECONF = YES
 
 $(eval $(autotools-package))
-
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 626a0b0..0e08722 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -202,4 +202,3 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 	set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
 	set(ENV{PKG_CONFIG_SYSROOT_DIR} \"$(STAGING_DIR)\")\n\
 	" > $@
-
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index f3bc421..781b6bc 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -18,4 +18,3 @@ POLARSSL_LICENSE = GPLv2
 POLARSSL_LICENSE_FILES = LICENSE
 
 $(eval $(cmake-package))
-
diff --git a/package/python-dpkt/python-dpkt.mk b/package/python-dpkt/python-dpkt.mk
index 7518ee0..314415c 100644
--- a/package/python-dpkt/python-dpkt.mk
+++ b/package/python-dpkt/python-dpkt.mk
@@ -19,4 +19,3 @@ define PYTHON_DPKT_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
-
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index f574d3a..e6455d5 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -28,4 +28,3 @@ define RT_TESTS_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
-
diff --git a/package/rubix/rubix.mk b/package/rubix/rubix.mk
index 1e10c64..732f807 100644
--- a/package/rubix/rubix.mk
+++ b/package/rubix/rubix.mk
@@ -14,4 +14,3 @@ RUBIX_MAKE_OPT = CC="$(TARGET_CC)" XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB=
 RUBIX_DEPENDENCIES = xlib_libX11
 
 $(eval $(autotools-package))
-
diff --git a/package/squashfs3/squashfs3.mk b/package/squashfs3/squashfs3.mk
index 4df1af6..fbcc8a4 100644
--- a/package/squashfs3/squashfs3.mk
+++ b/package/squashfs3/squashfs3.mk
@@ -32,4 +32,3 @@ endef
 
 $(eval $(generic-package))
 $(eval $(host-generic-package))
-
diff --git a/package/startup-notification/startup-notification.mk b/package/startup-notification/startup-notification.mk
index 1ce607f..7ebebdd 100644
--- a/package/startup-notification/startup-notification.mk
+++ b/package/startup-notification/startup-notification.mk
@@ -15,4 +15,3 @@ STARTUP_NOTIFICATION_CONF_OPT = --with-x \
 	--x-libraries="$(STAGING_DIR)/usr/lib"
 
 $(eval $(autotools-package))
-
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index f74b9f4..f2b1991 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -16,4 +16,3 @@ TCPREPLAY_LIBS = -lpcap $(if $(BR2_PACKAGE_LIBUSB),-lusb-1.0)
 TCPREPLAY_CONF_ENV += ac_cv_search_pcap_close='$(TCPREPLAY_LIBS)'
 
 $(eval $(autotools-package))
-
diff --git a/package/tinymembench/tinymembench.mk b/package/tinymembench/tinymembench.mk
index 285d1fd..732616f 100644
--- a/package/tinymembench/tinymembench.mk
+++ b/package/tinymembench/tinymembench.mk
@@ -19,4 +19,3 @@ define TINYMEMBENCH_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
-
diff --git a/package/torsmo/torsmo.mk b/package/torsmo/torsmo.mk
index 505ae09..a09013a 100644
--- a/package/torsmo/torsmo.mk
+++ b/package/torsmo/torsmo.mk
@@ -15,4 +15,3 @@ TORSMO_CONF_OPT = --x-includes="-I$(STAGING_DIR)/usr/include/X11" --x-libraries=
 TORSMO_DEPENDENCIES = xlib_libX11 xlib_libXext
 
 $(eval $(autotools-package))
-
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 3e9f3c9..6f7703e 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -30,4 +30,3 @@ WESTON_CONF_OPT += --disable-fbdev-compositor
 endif
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 0f87ba9..dfcf6fa 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -24,4 +24,3 @@ HOST_LIBXCB_CONF_OPT = --disable-build-docs
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 782238f..98d0f02 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -16,4 +16,3 @@ XCB_PROTO_DEPENDENCIES = host-python
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-
diff --git a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
index 45a4c68..8598b20 100644
--- a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
+++ b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
@@ -14,4 +14,3 @@ XCB_UTIL_KEYSYMS_LICENSE = MIT
 XCB_UTIL_KEYSYMS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index 29fa013..a3531d0 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -15,4 +15,3 @@ XCB_UTIL_INSTALL_STAGING = YES
 XCB_UTIL_DEPENDENCIES = host-gperf libxcb
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
index 2bc2c79..5f109a1 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
@@ -15,4 +15,3 @@ XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$
 XFONT_FONT_ADOBE_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
index 15d0b6b..51813e4 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
@@ -15,4 +15,3 @@ XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(
 XFONT_FONT_ADOBE_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
index ec14c53..88b6d73 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
@@ -15,4 +15,3 @@ XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONT
 XFONT_FONT_ADOBE_UTOPIA_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
index ce190db..7ff2ef9 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
@@ -15,4 +15,3 @@ XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTS
 XFONT_FONT_ADOBE_UTOPIA_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
index a356f03..647ef57 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
@@ -15,4 +15,3 @@ XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTS
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.mk b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
index ad04882..43ed253 100644
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.mk
+++ b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
@@ -15,4 +15,3 @@ XFONT_FONT_ALIAS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_D
 XFONT_FONT_ALIAS_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
index 7c296b6..3b000a3 100644
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
@@ -15,4 +15,3 @@ XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(
 XFONT_FONT_ARABIC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
index 37a9af3..dc15371 100644
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
@@ -15,4 +15,3 @@ XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HO
 XFONT_FONT_BH_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
index e525ce9..f86c1d1 100644
--- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
@@ -15,4 +15,3 @@ XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOS
 XFONT_FONT_BH_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
index 1b3b66f..c2be048 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
@@ -15,4 +15,3 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR)
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
index 390f1f2..c22d22f 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
@@ -15,4 +15,3 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR)
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
index 7213ebc..cbf46c6 100644
--- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
+++ b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
@@ -15,4 +15,3 @@ XFONT_FONT_BH_TTF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_
 XFONT_FONT_BH_TTF_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
index dc5829b..bf8b65e 100644
--- a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
+++ b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
@@ -15,4 +15,3 @@ XFONT_FONT_BH_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOS
 XFONT_FONT_BH_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
index c6c08c5..4126263 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
@@ -15,4 +15,3 @@ XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCA
 XFONT_FONT_BITSTREAM_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
index d6c2ee3..330d551 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
@@ -15,4 +15,3 @@ XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCAL
 XFONT_FONT_BITSTREAM_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
index 5bcc31a..7b1a588 100644
--- a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
+++ b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
@@ -15,4 +15,3 @@ XFONT_FONT_BITSTREAM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCAL
 XFONT_FONT_BITSTREAM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
index 93bdafe..aa23086 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
@@ -15,4 +15,3 @@ XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCAL
 XFONT_FONT_CRONYX_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
index efce6bd..f84124a 100644
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
+++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
@@ -15,4 +15,3 @@ XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(
 XFONT_FONT_CURSOR_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
index fc6ecbf..576f760 100644
--- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
+++ b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
@@ -14,4 +14,3 @@ XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(
 XFONT_FONT_DAEWOO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
index f2f71f1..d4c7984 100644
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
@@ -15,4 +15,3 @@ XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOS
 XFONT_FONT_DEC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
index 42df33a..da0ebb6 100644
--- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
+++ b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
@@ -15,4 +15,3 @@ XFONT_FONT_IBM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HO
 XFONT_FONT_IBM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
index 84dbf7d..d4b2c6b 100644
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
+++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
@@ -15,4 +15,3 @@ XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HO
 XFONT_FONT_ISAS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
index a65990b..d19e5bc 100644
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
+++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
@@ -14,4 +14,3 @@ XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOS
 XFONT_FONT_JIS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
index 2ea5dd3..e60b230 100644
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
@@ -15,4 +15,3 @@ XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(H
 XFONT_FONT_MICRO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
index ae54a8b..3cc529b 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
@@ -15,4 +15,3 @@ XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=
 XFONT_FONT_MISC_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
index b05b572..7e42b71 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
+++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
@@ -15,4 +15,3 @@ XFONT_FONT_MISC_ETHIOPIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=
 XFONT_FONT_MISC_ETHIOPIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
index b71275d..1004694 100644
--- a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
+++ b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
@@ -15,4 +15,3 @@ XFONT_FONT_MISC_MELTHO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(
 XFONT_FONT_MISC_MELTHO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
index 2333f76..65aa995 100644
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
+++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
@@ -15,4 +15,3 @@ XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HO
 XFONT_FONT_MUTT_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
index 45cc249..4544940 100644
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
+++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
@@ -15,4 +15,3 @@ XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCAL
 XFONT_FONT_SCHUMACHER_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
index 91cc3a0..030d418 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
@@ -15,4 +15,3 @@ XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCAL
 XFONT_FONT_SCREEN_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
index db7155d..ff77d7a 100644
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
+++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
@@ -15,4 +15,3 @@ XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HO
 XFONT_FONT_SONY_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
index 09e17c3..f335735 100644
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
+++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
@@ -15,4 +15,3 @@ XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOS
 XFONT_FONT_SUN_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
index c214446..0df49ca 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
@@ -15,4 +15,3 @@ XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSC
 XFONT_FONT_WINITZKI_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
index 4a9fea0..946e409 100644
--- a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
+++ b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
@@ -15,4 +15,3 @@ XFONT_FONT_XFREE86_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=
 XFONT_FONT_XFREE86_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 0451d15..49540df 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -14,4 +14,3 @@ XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-intltool host-xapp_xkbcomp
 XKEYBOARD_CONFIG_CONF_OPT += --disable-runtime-deps
 
 $(eval $(autotools-package))
-
diff --git a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk b/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
index 082cc4d..5ea02e9 100644
--- a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
+++ b/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
@@ -14,4 +14,3 @@ XLIB_LIBPTHREAD_STUBS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-
diff --git a/package/xstroke/xstroke.mk b/package/xstroke/xstroke.mk
index a4b04ac..5440495 100644
--- a/package/xstroke/xstroke.mk
+++ b/package/xstroke/xstroke.mk
@@ -12,4 +12,3 @@ XSTROKE_DEPENDENCIES = xlib_libXft xlib_libXtst xlib_libXpm xlib_libXrender xlib
 XSTROKE_AUTORECONF = YES
 
 $(eval $(autotools-package))
-
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index a28751b..c7d40a1 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -31,4 +31,3 @@ XVKBD_DEPENDENCIES = \
 	xlib_libXtst
 
 $(eval $(generic-package))
-
diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 149b8e5..97f85e6 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -47,4 +47,3 @@ dependencies-dirclean:
 #
 ################################################################################
 .PHONY: dependencies core-dependencies
-
-- 
1.7.9.5
