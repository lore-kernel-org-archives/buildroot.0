From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 22 Jul 2013 07:30:22 +0200
Subject: [Buildroot] [PATCH 1/1] fix header package name
Message-ID: <1374471023-10115-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/bcusdk/bcusdk.mk                           |    2 +-
 package/bonnie/bonnie.mk                           |    2 +-
 package/ccid/ccid.mk                               |    2 +-
 package/cegui06/cegui06.mk                         |    2 +-
 package/celt051/celt.mk                            |    2 +-
 package/cryptodev/cryptodev.mk                     |    2 +-
 package/directfb-examples/directfb-examples.mk     |    2 +-
 package/foomatic-filters/foomatic-filters.mk       |    2 +-
 package/freerdp/freerdp.mk                         |    2 +-
 package/glibmm/glibmm.mk                           |    2 +-
 package/gtest/gtest.mk                             |    2 +-
 package/gtk2-engines/gtk2-engines.mk               |    2 +-
 .../gtk2-theme-hicolor/gtk2-theme-hicolor.mk       |    2 +-
 package/gtkperf/gtkperf.mk                         |    2 +-
 package/icu/icu.mk                                 |    2 +-
 package/inotify-tools/inotify-tools.mk             |    2 +-
 package/jpeg/jpeg.mk                               |    2 +-
 package/libatomic_ops/libatomic_ops.mk             |    2 +-
 package/libdvbsi/libdvbsi.mk                       |    2 +-
 package/libgtk2/libgtk2.mk                         |    2 +-
 package/liblog4c-localtime/liblog4c-localtime.mk   |    2 +-
 package/libsigc/libsigc.mk                         |    2 +-
 package/liburcu/liburcu.mk                         |    2 +-
 package/libxmlpp/libxmlpp.mk                       |    2 +-
 package/lite/lite.mk                               |    2 +-
 package/lttng-libust/lttng-libust.mk               |    2 +-
 package/lttng-modules/lttng-modules.mk             |    2 +-
 package/lttng-tools/lttng-tools.mk                 |    2 +-
 .../matchbox/matchbox-common/matchbox-common.mk    |    2 +-
 .../matchbox/matchbox-desktop/matchbox-desktop.mk  |    2 +-
 .../matchbox/matchbox-fakekey/matchbox-fakekey.mk  |    2 +-
 .../matchbox-keyboard/matchbox-keyboard.mk         |    2 +-
 package/matchbox/matchbox-lib/matchbox-lib.mk      |    2 +-
 package/matchbox/matchbox-panel/matchbox-panel.mk  |    2 +-
 .../matchbox-startup-monitor.mk                    |    2 +-
 package/matchbox/matchbox-wm/matchbox-wm.mk        |    2 +-
 .../mobile_broadband_provider_info.mk              |    2 +-
 .../multimedia/gst-plugin-x170/gst-plugin-x170.mk  |    2 +-
 package/mysql_client/mysql_client.mk               |    2 +-
 package/network-manager/network-manager.mk         |    2 +-
 package/nss-mdns/nss-mdns.mk                       |    2 +-
 package/opengl/libegl/libegl.mk                    |    2 +-
 package/opengl/libgles/libgles.mk                  |    2 +-
 package/opengl/libopenmax/libopenmax.mk            |    2 +-
 package/opengl/libopenvg/libopenvg.mk              |    2 +-
 package/pkg-config/pkg-config.mk                   |    2 +-
 package/powervr/powervr.mk                         |    2 +-
 package/python-pygame/python-pygame.mk             |    2 +-
 package/sdl/sdl.mk                                 |    2 +-
 package/sdl_gfx/sdl_gfx.mk                         |    2 +-
 package/sdl_image/sdl_image.mk                     |    2 +-
 package/sdl_mixer/sdl_mixer.mk                     |    2 +-
 package/sdl_net/sdl_net.mk                         |    2 +-
 package/sdl_sound/sdl_sound.mk                     |    2 +-
 package/sdl_ttf/sdl_ttf.mk                         |    2 +-
 package/slirp/slirp.mk                             |    2 +-
 package/supervisor/supervisor.mk                   |    2 +-
 package/tcl/tcl.mk                                 |    2 +-
 package/tremor/tremor.mk                           |    2 +-
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk   |    2 +-
 .../xdriver_xf86-video-openchrome.mk               |    2 +-
 .../xfont_font-adobe-100dpi.mk                     |    2 +-
 .../xfont_font-adobe-75dpi.mk                      |    2 +-
 .../xfont_font-adobe-utopia-100dpi.mk              |    2 +-
 .../xfont_font-adobe-utopia-75dpi.mk               |    2 +-
 .../xfont_font-adobe-utopia-type1.mk               |    2 +-
 package/x11r7/xfont_font-alias/xfont_font-alias.mk |    2 +-
 .../xfont_font-arabic-misc.mk                      |    2 +-
 .../xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk   |    2 +-
 .../xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk     |    2 +-
 .../xfont_font-bh-lucidatypewriter-100dpi.mk       |    2 +-
 .../xfont_font-bh-lucidatypewriter-75dpi.mk        |    2 +-
 .../x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk   |    2 +-
 .../xfont_font-bh-type1/xfont_font-bh-type1.mk     |    2 +-
 .../xfont_font-bitstream-100dpi.mk                 |    2 +-
 .../xfont_font-bitstream-75dpi.mk                  |    2 +-
 .../xfont_font-bitstream-type1.mk                  |    2 +-
 .../xfont_font-cronyx-cyrillic.mk                  |    2 +-
 .../xfont_font-cursor-misc.mk                      |    2 +-
 .../xfont_font-daewoo-misc.mk                      |    2 +-
 .../xfont_font-dec-misc/xfont_font-dec-misc.mk     |    2 +-
 .../xfont_font-ibm-type1/xfont_font-ibm-type1.mk   |    2 +-
 .../xfont_font-isas-misc/xfont_font-isas-misc.mk   |    2 +-
 .../xfont_font-jis-misc/xfont_font-jis-misc.mk     |    2 +-
 .../xfont_font-micro-misc/xfont_font-micro-misc.mk |    2 +-
 .../xfont_font-misc-cyrillic.mk                    |    2 +-
 .../xfont_font-misc-ethiopic.mk                    |    2 +-
 .../xfont_font-misc-meltho.mk                      |    2 +-
 .../xfont_font-misc-misc/xfont_font-misc-misc.mk   |    2 +-
 .../xfont_font-mutt-misc/xfont_font-mutt-misc.mk   |    2 +-
 .../xfont_font-schumacher-misc.mk                  |    2 +-
 .../xfont_font-screen-cyrillic.mk                  |    2 +-
 .../xfont_font-sony-misc/xfont_font-sony-misc.mk   |    2 +-
 .../xfont_font-sun-misc/xfont_font-sun-misc.mk     |    2 +-
 package/x11r7/xfont_font-util/xfont_font-util.mk   |    2 +-
 .../xfont_font-winitzki-cyrillic.mk                |    2 +-
 .../xfont_font-xfree86-type1.mk                    |    2 +-
 package/xenomai/xenomai.mk                         |    2 +-
 package/xz/xz.mk                                   |    2 +-
 99 files changed, 99 insertions(+), 99 deletions(-)

diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
index 31cbf90..880b7d9 100644
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# bcusck
+# bcusdk
 #
 ################################################################################
 
diff --git a/package/bonnie/bonnie.mk b/package/bonnie/bonnie.mk
index a901986..75cb155 100644
--- a/package/bonnie/bonnie.mk
+++ b/package/bonnie/bonnie.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# bonnie++
+# bonnie
 #
 ################################################################################
 
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index 6604bc1..a246ddd 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# CCID
+# ccid
 #
 ################################################################################
 
diff --git a/package/cegui06/cegui06.mk b/package/cegui06/cegui06.mk
index d44b8c4..8dd1a37 100644
--- a/package/cegui06/cegui06.mk
+++ b/package/cegui06/cegui06.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# libcegui
+# cegui06
 #
 ################################################################################
 
diff --git a/package/celt051/celt.mk b/package/celt051/celt.mk
index b2fa951..528dfce 100644
--- a/package/celt051/celt.mk
+++ b/package/celt051/celt.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# celt051
+# celt
 #
 ################################################################################
 
diff --git a/package/cryptodev/cryptodev.mk b/package/cryptodev/cryptodev.mk
index 1e0cbde..ad5adf0 100644
--- a/package/cryptodev/cryptodev.mk
+++ b/package/cryptodev/cryptodev.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# virtual cryptodev package
+# cryptodev
 #
 ################################################################################
 
diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index c39d411..fcf7ed3 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# directfb examples
+# directfb-examples
 #
 ################################################################################
 
diff --git a/package/foomatic-filters/foomatic-filters.mk b/package/foomatic-filters/foomatic-filters.mk
index 80daea5..950f2f9 100644
--- a/package/foomatic-filters/foomatic-filters.mk
+++ b/package/foomatic-filters/foomatic-filters.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# foomatic_filters
+# foomatic-filters
 #
 ################################################################################
 
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index efb6fc9..c06aac9 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# FreeRDP
+# freerdp
 #
 ################################################################################
 
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index d1619a1..9eaa197 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# Glibmm
+# glibmm
 #
 ################################################################################
 
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 63a2360..52028f5 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# googletest
+# gtest
 #
 ################################################################################
 
diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
index ad48ddd..402b3c9 100644
--- a/package/gtk2-engines/gtk2-engines.mk
+++ b/package/gtk2-engines/gtk2-engines.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# gtk2-engines.0
+# gtk2-engines
 #
 ################################################################################
 
diff --git a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
index a250d57..ae677f7 100644
--- a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
+++ b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# GTK Theme - Hicolour
+# gtk2-theme-hicolor
 #
 ################################################################################
 
diff --git a/package/gtkperf/gtkperf.mk b/package/gtkperf/gtkperf.mk
index a69fc76..27403ab 100644
--- a/package/gtkperf/gtkperf.mk
+++ b/package/gtkperf/gtkperf.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# GtkPerf
+# gtkperf
 #
 ################################################################################
 
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 7954eb0..f93eab1 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# International Components for Unicode
+# icu
 #
 ################################################################################
 
diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index 9d10b94..1a988a3 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# inotify-utils
+# inotify-tools
 #
 ################################################################################
 
diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index caea98c..eaa2394 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# virtual jpeg package
+# jpeg
 #
 ################################################################################
 
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index d3e4f66..cf2146e 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# atomic_ops library
+# libatomic_ops
 #
 ################################################################################
 
diff --git a/package/libdvbsi/libdvbsi.mk b/package/libdvbsi/libdvbsi.mk
index 2151691..c67bdbd 100644
--- a/package/libdvbsi/libdvbsi.mk
+++ b/package/libdvbsi/libdvbsi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# libdvbsi++
+# libdvbsi
 #
 ################################################################################
 
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 8ac455b..94cfd4c 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# libgtk2.0
+# libgtk2
 #
 ################################################################################
 
diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
index 0b5bac2..f68fb53 100644
--- a/package/liblog4c-localtime/liblog4c-localtime.mk
+++ b/package/liblog4c-localtime/liblog4c-localtime.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# liblog4c
+# liblog4c-localtime
 #
 ################################################################################
 
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index 86a3a61..d3e0135 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# libsigc++
+# libsigc
 #
 ################################################################################
 
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 7a32e7f..a586382 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# liburc
+# liburcu
 #
 ################################################################################
 
diff --git a/package/libxmlpp/libxmlpp.mk b/package/libxmlpp/libxmlpp.mk
index 9194274..cc26d94 100644
--- a/package/libxmlpp/libxmlpp.mk
+++ b/package/libxmlpp/libxmlpp.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# LibXML++
+# libxmlpp
 #
 ################################################################################
 
diff --git a/package/lite/lite.mk b/package/lite/lite.mk
index 262b2d4..1784d1f 100644
--- a/package/lite/lite.mk
+++ b/package/lite/lite.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# LiTE
+# lite
 #
 ################################################################################
 
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index c3137aa..b0ebd3f 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# LTTng-UST
+# lttng-libust
 #
 ################################################################################
 
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 66faa1f..baa421e 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# LTTng-modules
+# lttng-modules
 #
 ################################################################################
 
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 0eb5fdc..f6eff96 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# LTTng-Tools
+# lttng-tools
 #
 ################################################################################
 
diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox/matchbox-common/matchbox-common.mk
index 0a169d7..730635f 100644
--- a/package/matchbox/matchbox-common/matchbox-common.mk
+++ b/package/matchbox/matchbox-common/matchbox-common.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# MatchBox Common
+# matchbox-common
 #
 ################################################################################
 
diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.mk b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
index 7780bb6..9989e14 100644
--- a/package/matchbox/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# MatchBox Desktop
+# matchbox-desktop
 #
 ################################################################################
 
diff --git a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
index ebae9d2..47de4a0 100644
--- a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# MatchBox Fakekey
+# matchbox-fakekey
 #
 ################################################################################
 
diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
index 5b0f691..ff85370 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# MatchBox Keyboard
+# matchbox-keyboard
 #
 ################################################################################
 
diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
index b4c378c..a04b971 100644
--- a/package/matchbox/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# MatchBox LIB
+# matchbox-lib
 #
 ################################################################################
 
diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
index 655b20f..7579d49 100644
--- a/package/matchbox/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# MatchBox Panel
+# matchbox-panel
 #
 ################################################################################
 
diff --git a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
index 561cac9..316893e 100644
--- a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
+++ b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# MatchBox Applet Startup monitor
+# matchbox-startup-monitor
 #
 ################################################################################
 
diff --git a/package/matchbox/matchbox-wm/matchbox-wm.mk b/package/matchbox/matchbox-wm/matchbox-wm.mk
index 0f10c89..696e9cc 100644
--- a/package/matchbox/matchbox-wm/matchbox-wm.mk
+++ b/package/matchbox/matchbox-wm/matchbox-wm.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# MatchBox WM
+# matchbox-wm
 #
 ################################################################################
 
diff --git a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
index 035b948..77f8cba 100644
--- a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
+++ b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# mobile broadband provider info
+# mobile_broadband_provider_info
 #
 ################################################################################
 
diff --git a/package/multimedia/gst-plugin-x170/gst-plugin-x170.mk b/package/multimedia/gst-plugin-x170/gst-plugin-x170.mk
index a6143ed..e14d460 100644
--- a/package/multimedia/gst-plugin-x170/gst-plugin-x170.mk
+++ b/package/multimedia/gst-plugin-x170/gst-plugin-x170.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# gst-plugins-x170
+# gst-plugin-x170
 #
 ################################################################################
 
diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index ade4822..00c72b7 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# MySQL 5.1 Client
+# mysql_client
 #
 ################################################################################
 
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index b4d3408..7c9cc88 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# NetworkManager
+# network-manager
 #
 ################################################################################
 
diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index 9887256..30a0a73 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# nss_mdns
+# nss-mdns
 #
 ################################################################################
 
diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/libegl/libegl.mk
index 00e1f19..84ee28c 100644
--- a/package/opengl/libegl/libegl.mk
+++ b/package/opengl/libegl/libegl.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# Virtual package for libEGL
+# libegl
 #
 ################################################################################
 
diff --git a/package/opengl/libgles/libgles.mk b/package/opengl/libgles/libgles.mk
index d2fe11b..1b62a19 100644
--- a/package/opengl/libgles/libgles.mk
+++ b/package/opengl/libgles/libgles.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# Virtual package for libGLES
+# libgles
 #
 ################################################################################
 
diff --git a/package/opengl/libopenmax/libopenmax.mk b/package/opengl/libopenmax/libopenmax.mk
index 9175c6e..9e6f89a 100644
--- a/package/opengl/libopenmax/libopenmax.mk
+++ b/package/opengl/libopenmax/libopenmax.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# Virtual package for libopenmax
+# libopenmax
 #
 ################################################################################
 
diff --git a/package/opengl/libopenvg/libopenvg.mk b/package/opengl/libopenvg/libopenvg.mk
index 03f59ba..3296f63 100644
--- a/package/opengl/libopenvg/libopenvg.mk
+++ b/package/opengl/libopenvg/libopenvg.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# Virtual package for libOpenVG
+# libopenvg
 #
 ################################################################################
 
diff --git a/package/pkg-config/pkg-config.mk b/package/pkg-config/pkg-config.mk
index 4a3d66d..1f859b5 100644
--- a/package/pkg-config/pkg-config.mk
+++ b/package/pkg-config/pkg-config.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# pkgconfig
+# pkg-config
 #
 ################################################################################
 
diff --git a/package/powervr/powervr.mk b/package/powervr/powervr.mk
index b63b0e6..83392fd 100644
--- a/package/powervr/powervr.mk
+++ b/package/powervr/powervr.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# Virtual package for PowerVR driver
+# powervr
 #
 ################################################################################
 
diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
index 4a87db7..739ba45 100644
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# pygame
+# python-pygame
 #
 ################################################################################
 
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 716bb62..ef723dd 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# SDL
+# sdl
 #
 ################################################################################
 
diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
index 04f1d8b..c6b9451 100644
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# SDL_gfx addon for SDL
+# sdl_gfx
 #
 ################################################################################
 
diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index 3945505..ba9751d 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# SDL_image addon for SDL
+# sdl_image
 #
 ################################################################################
 
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index 73743eb..a192b5a 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# SDL_mixer
+# sdl_mixer
 #
 ################################################################################
 
diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
index 8039da4..dc8f25f 100644
--- a/package/sdl_net/sdl_net.mk
+++ b/package/sdl_net/sdl_net.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# SDL_net: network addon for SDL
+# sdl_net
 #
 ################################################################################
 
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index cd1ed3e..ae351dc 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# sdl_sound addon for SDL
+# sdl_sound
 #
 ################################################################################
 
diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index 1310287..23fb335 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# SDL_ttf
+# sdl_ttf
 #
 ################################################################################
 
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index 9ed3424..0e20843 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# spice-slirp
+# slirp
 #
 ################################################################################
 
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index edd2efd..516065b 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# python-supervisor
+# supervisor
 #
 ################################################################################
 
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 0c8fa33..4528d54 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# tcl8.4
+# tcl
 #
 ################################################################################
 
diff --git a/package/tremor/tremor.mk b/package/tremor/tremor.mk
index c0ce5ef..291a413 100644
--- a/package/tremor/tremor.mk
+++ b/package/tremor/tremor.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# Tremor
+# tremor
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
index 96bffe7..d4325aa 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_backlight
+# xapp_xbacklight
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
index 7104719..dda18fc 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# openchrome
+# xdriver_xf86-video-openchrome
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
index 58a9fd7..2bc2c79 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-adobe-100dpi
+# xfont_font-adobe-100dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
index 02e6714..15d0b6b 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-adobe-75dpi
+# xfont_font-adobe-75dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
index 6692c24..ec14c53 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-adobe-utopia-100dpi
+# xfont_font-adobe-utopia-100dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
index 7af3bd0..ce190db 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-adobe-utopia-75dpi
+# xfont_font-adobe-utopia-75dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
index 5826db8..a356f03 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-adobe-utopia-type1
+# xfont_font-adobe-utopia-type1
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.mk b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
index 2e8792a..ad04882 100644
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.mk
+++ b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-alias
+# xfont_font-alias
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
index e24c834..7c296b6 100644
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-arabic-misc
+# xfont_font-arabic-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
index 8baa0cb..37a9af3 100644
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-bh-100dpi
+# xfont_font-bh-100dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
index ae55fd3..e525ce9 100644
--- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-bh-75dpi
+# xfont_font-bh-75dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
index b652a37..1b3b66f 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-bh-lucidatypewriter-100dpi
+# xfont_font-bh-lucidatypewriter-100dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
index 12c71e1..390f1f2 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-bh-lucidatypewriter-75dpi
+# xfont_font-bh-lucidatypewriter-75dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
index fac6434..7213ebc 100644
--- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
+++ b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-bh-ttf
+# xfont_font-bh-ttf
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
index 1244cc9..dc5829b 100644
--- a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
+++ b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-bh-type1
+# xfont_font-bh-type1
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
index a1c89aa..c6c08c5 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-bitstream-100dpi
+# xfont_font-bitstream-100dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
index 335f660..d6c2ee3 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-bitstream-75dpi
+# xfont_font-bitstream-75dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
index c68db7e..5bcc31a 100644
--- a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
+++ b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-bitstream-type1
+# xfont_font-bitstream-type1
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
index c41f0db..93bdafe 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-cronyx-cyrillic
+# xfont_font-cronyx-cyrillic
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
index 5cd312d..efce6bd 100644
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
+++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-cursor-misc
+# xfont_font-cursor-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
index 8c267bc..fc6ecbf 100644
--- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
+++ b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-daewoo-misc
+# xfont_font-daewoo-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
index 77242fe..f2f71f1 100644
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-dec-misc
+# xfont_font-dec-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
index 094781e..42df33a 100644
--- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
+++ b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-ibm-type1
+# xfont_font-ibm-type1
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
index 967303d..84dbf7d 100644
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
+++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-isas-misc
+# xfont_font-isas-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
index eabb969..a65990b 100644
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
+++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-jis-misc
+# xfont_font-jis-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
index 1f82f26..2ea5dd3 100644
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-micro-misc
+# xfont_font-micro-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
index 464f0be..ae54a8b 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-misc-cyrillic
+# xfont_font-misc-cyrillic
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
index 0378907..b05b572 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
+++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-misc-ethiopic
+# xfont_font-misc-ethiopic
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
index acc4338..b71275d 100644
--- a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
+++ b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-misc-meltho
+# xfont_font-misc-meltho
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
index a249edf..81cf320 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-misc-misc
+# xfont_font-misc-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
index f89a63d..2333f76 100644
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
+++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-mutt-misc
+# xfont_font-mutt-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
index 04b662c..45cc249 100644
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
+++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-schumacher-misc
+# xfont_font-schumacher-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
index 9196cd8..91cc3a0 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-screen-cyrillic
+# xfont_font-screen-cyrillic
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
index 5a69dbc..db7155d 100644
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
+++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-sony-misc
+# xfont_font-sony-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
index fb8ee4a..09e17c3 100644
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
+++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-sun-misc
+# xfont_font-sun-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index b359f82..946bb02 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-util
+# xfont_font-util
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
index aec5a90..c214446 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-winitzki-cyrillic
+# xfont_font-winitzki-cyrillic
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
index 88da7aa..4a9fea0 100644
--- a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
+++ b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-xfree86-type1
+# xfont_font-xfree86-type1
 #
 ################################################################################
 
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 8598953..f10dec0 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# Xenomai
+# xenomai
 #
 ################################################################################
 
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index de746ad..98fca3a 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xz-utils
+# xz
 #
 ################################################################################
 
-- 
1.7.9.5
