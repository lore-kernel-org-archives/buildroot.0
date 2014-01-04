From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Jan 2014 10:39:29 +0100
Subject: [Buildroot] [git commit] package: remove the empty trailing line(s)
Message-ID: <20140104094010.17BBD9C35A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3033bc0c6e7cc54b131be7ababa7587ca984ee30
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/Config.in                               |    1 -
 boot/at91bootstrap/Config.in                 |    3 ---
 fs/romfs/Config.in                           |    1 -
 package/aircrack-ng/Config.in                |    1 -
 package/alsa-lib/Config.in                   |    1 -
 package/alsa-utils/Config.in                 |    1 -
 package/avrdude/avrdude.mk                   |    1 -
 package/boost/Config.in                      |    1 -
 package/cairo/Config.in                      |    1 -
 package/ccache/Config.in                     |    1 -
 package/civetweb/civetweb.mk                 |    1 -
 package/fbdump/Config.in                     |    1 -
 package/fis/Config.in                        |    1 -
 package/gdbm/Config.in                       |    1 -
 package/giblib/Config.in                     |    1 -
 package/gstreamer/gst-plugins-bad/Config.in  |    1 -
 package/gstreamer/gst-plugins-base/Config.in |    1 -
 package/gtkperf/Config.in                    |    1 -
 package/ipkg/Config.in                       |    1 -
 package/ktap/Config.in                       |    1 -
 package/libcap/Config.in                     |    1 -
 package/libdnet/Config.in                    |    1 -
 package/libmicrohttpd/Config.in              |    1 -
 package/libnss/Config.in                     |    1 -
 package/libosip2/Config.in                   |    1 -
 package/liburcu/Config.in                    |    1 -
 package/libxml-parser-perl/Config.in         |    1 -
 package/libxslt/Config.in                    |    1 -
 package/linux-pam/Config.in                  |    1 -
 package/lite/Config.in                       |    1 -
 package/logrotate/Config.in                  |    1 -
 package/luaposix/Config.in                   |    1 -
 package/mtd/Config.in                        |    1 -
 package/mtdev/Config.in                      |    1 -
 package/netcat/Config.in                     |    1 -
 package/python-dpkt/Config.in                |    2 --
 package/python-serial/Config.in              |    1 -
 package/qtuio/Config.in                      |    1 -
 package/rpm/Config.in                        |    2 --
 package/sawman/Config.in                     |    1 -
 package/sdl_ttf/Config.in                    |    1 -
 package/speex/Config.in                      |    1 -
 package/tftpd/Config.in                      |    1 -
 package/vsftpd/Config.in                     |    1 -
 package/x11r7/mesa3d/Config.in               |    1 -
 package/x11r7/xcb-proto/Config.in            |    1 -
 package/xfsprogs/Config.in                   |    1 -
 toolchain/toolchain-external/Config.in       |    1 -
 toolchain/toolchain/toolchain.mk             |    1 -
 49 files changed, 0 insertions(+), 53 deletions(-)

diff --git a/boot/Config.in b/boot/Config.in
index eb5f7cd..d23c761 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -13,4 +13,3 @@ source "boot/uboot/Config.in"
 source "boot/xloader/Config.in"
 
 endmenu
-
diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
index 9cbaf81..57fdeda 100644
--- a/boot/at91bootstrap/Config.in
+++ b/boot/at91bootstrap/Config.in
@@ -45,6 +45,3 @@ config BR2_TARGET_AT91BOOTSTRAP_MEMORY
 	default	"nandflash"	if	BR2_TARGET_AT91BOOTSTRAP_NANDFLASH
 
 endif
-
-
-
diff --git a/fs/romfs/Config.in b/fs/romfs/Config.in
index 7a8c663..84944a0 100644
--- a/fs/romfs/Config.in
+++ b/fs/romfs/Config.in
@@ -2,4 +2,3 @@ config BR2_TARGET_ROOTFS_ROMFS
 	bool "romfs root filesystem"
 	help
 	  Build a romfs image of the root filesystem.
-
diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index 0c03456..314184f 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -13,4 +13,3 @@ config BR2_PACKAGE_AIRCRACK_NG
 comment "aircrack-ng needs a toolchain w/ largefile, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
-
diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index df05240..adee5cd 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -80,4 +80,3 @@ config BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS
 endmenu
 
 endif
-
diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index db9f007..12f1020 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -78,4 +78,3 @@ config BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST
 endmenu
 
 endif
-
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 33e010d..b45baaf 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -28,4 +28,3 @@ endef
 AVRDUDE_POST_INSTALL_TARGET_HOOKS += AVRDUDE_REMOVE_BACKUP_FILE
 
 $(eval $(autotools-package))
-
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 17390c0..515b2cd 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -88,4 +88,3 @@ config BR2_PACKAGE_BOOST_WAVE
 	bool "boost-wave"
 
 endif
-
diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 9a177a7..0c87a29 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -46,4 +46,3 @@ config BR2_PACKAGE_CAIRO_XML
 	select BR2_PACKAGE_CAIRO_PNG
 
 endif
-
diff --git a/package/ccache/Config.in b/package/ccache/Config.in
index 41ace52..accebf5 100644
--- a/package/ccache/Config.in
+++ b/package/ccache/Config.in
@@ -10,4 +10,3 @@ config BR2_PACKAGE_CCACHE
 	  compilation is being done again
 
 	  http://ccache.samba.org
-
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index b950890..be7620a 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -56,4 +56,3 @@ define CIVETWEB_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
-
diff --git a/package/fbdump/Config.in b/package/fbdump/Config.in
index fb4aee6..7910713 100644
--- a/package/fbdump/Config.in
+++ b/package/fbdump/Config.in
@@ -5,4 +5,3 @@ config BR2_PACKAGE_FBDUMP
 	  framebuffer  device and write them out as a PPM file. Currently,
 	  most packed-pixel framebuffer formats and the vga16 framebuffer
 	  are supported.
-
diff --git a/package/fis/Config.in b/package/fis/Config.in
index 83bbdd3..c5bfbb8 100644
--- a/package/fis/Config.in
+++ b/package/fis/Config.in
@@ -2,4 +2,3 @@ config BR2_PACKAGE_FIS
 	bool "fis"
 	help
 	  fis - manipulate RedBoot partition table from Linux.
-
diff --git a/package/gdbm/Config.in b/package/gdbm/Config.in
index d5aae83..8ad0fc6 100644
--- a/package/gdbm/Config.in
+++ b/package/gdbm/Config.in
@@ -5,4 +5,3 @@ config BR2_PACKAGE_GDBM
 	  It works similar to the standard UNIX dbm routines.
 
 	  http://www.gnu.org/software/gdbm/gdbm.html
-
diff --git a/package/giblib/Config.in b/package/giblib/Config.in
index 7153bd5..7eb3da8 100644
--- a/package/giblib/Config.in
+++ b/package/giblib/Config.in
@@ -7,4 +7,3 @@ config BR2_PACKAGE_GIBLIB
 	  Giblib is a simple library which wraps imlib2.
 
 	  http://linuxbrit.co.uk/giblib/
-
diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index 047bf7e..f69c71b 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -322,4 +322,3 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD
 	bool "vcd"
 
 endif
-
diff --git a/package/gstreamer/gst-plugins-base/Config.in b/package/gstreamer/gst-plugins-base/Config.in
index fce68c1..95f84d3 100644
--- a/package/gstreamer/gst-plugins-base/Config.in
+++ b/package/gstreamer/gst-plugins-base/Config.in
@@ -106,4 +106,3 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VORBIS
 	select BR2_PACKAGE_LIBVORBIS
 
 endif
-
diff --git a/package/gtkperf/Config.in b/package/gtkperf/Config.in
index 0122b52..1089dbf 100644
--- a/package/gtkperf/Config.in
+++ b/package/gtkperf/Config.in
@@ -7,4 +7,3 @@ config BR2_PACKAGE_GTKPERF
 	  predefined GTK+ widgets
 	  e.g. (opening comboboxes, toggling buttons, scrolling text yms.)
 	  and this way define the speed of device/platform.
-
diff --git a/package/ipkg/Config.in b/package/ipkg/Config.in
index ef65ca0..4b2078d 100644
--- a/package/ipkg/Config.in
+++ b/package/ipkg/Config.in
@@ -4,4 +4,3 @@ config BR2_PACKAGE_IPKG
 	  The Itsy Package Installer from handhelds.org
 
 	  http://www.handhelds.org
-
diff --git a/package/ktap/Config.in b/package/ktap/Config.in
index e665211..c855228 100644
--- a/package/ktap/Config.in
+++ b/package/ktap/Config.in
@@ -28,4 +28,3 @@ comment "ktap needs a Linux kernel to be built"
 
 comment "ktap needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
diff --git a/package/libcap/Config.in b/package/libcap/Config.in
index 59300af..7bf6c58 100644
--- a/package/libcap/Config.in
+++ b/package/libcap/Config.in
@@ -7,4 +7,3 @@ config BR2_PACKAGE_LIBCAP
 	  privilege into a set of distinct privileges.
 
 	  http://sites.google.com/site/fullycapable/
-
diff --git a/package/libdnet/Config.in b/package/libdnet/Config.in
index 81163f5..e78bded 100644
--- a/package/libdnet/Config.in
+++ b/package/libdnet/Config.in
@@ -17,4 +17,3 @@ comment "dnet module for python requires python package"
 	depends on !BR2_PACKAGE_PYTHON
 
 endif
-
diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index 7ab3532..ec0b715 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -24,4 +24,3 @@ endif
 
 comment "libmicrohttpd needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index 77128f6..690f928 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -18,4 +18,3 @@ config BR2_PACKAGE_LIBNSS
 comment "libnss needs a toolchain w/ largefile, threads"
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
-
diff --git a/package/libosip2/Config.in b/package/libosip2/Config.in
index be5de2d..5b1d3d2 100644
--- a/package/libosip2/Config.in
+++ b/package/libosip2/Config.in
@@ -8,4 +8,3 @@ config BR2_PACKAGE_LIBOSIP2
 	  SIP is a open standard replacement from IETF for H323.
 
 	  http://www.gnu.org/software/osip/
-
diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index de53495..15ad5bd 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -13,4 +13,3 @@ config BR2_PACKAGE_LIBURCU
 comment "liburcu needs a toolchain w/ threads"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
diff --git a/package/libxml-parser-perl/Config.in b/package/libxml-parser-perl/Config.in
index 2a81086..bdda236 100644
--- a/package/libxml-parser-perl/Config.in
+++ b/package/libxml-parser-perl/Config.in
@@ -8,4 +8,3 @@ config BR2_PACKAGE_LIBXML_PARSER_PERL
 	  The Perl XML::Parser module.
 
 	  http://www.cpan.org/modules/by-module/XML/
-
diff --git a/package/libxslt/Config.in b/package/libxslt/Config.in
index 1dca1f0..ee2f66c 100644
--- a/package/libxslt/Config.in
+++ b/package/libxslt/Config.in
@@ -14,4 +14,3 @@ config BR2_PACKAGE_LIBXSLT
 	  XML document that uses the formatting vocabulary.
 
 	  http://www.w3.org/TR/xslt
-
diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index aff1b86..88bdd4f 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -10,4 +10,3 @@ config BR2_PACKAGE_LINUX_PAM
 
 comment "linux-pam needs a toolchain w/ wchar, locale"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
-
diff --git a/package/lite/Config.in b/package/lite/Config.in
index 398b9e1..2f05279 100644
--- a/package/lite/Config.in
+++ b/package/lite/Config.in
@@ -9,4 +9,3 @@ config BR2_PACKAGE_LITE
 	   event systems.
 
 	   See http://www.directfb.org/wiki/index.php/LiTE:Architecture
-
diff --git a/package/logrotate/Config.in b/package/logrotate/Config.in
index 07a2da5..8528361 100644
--- a/package/logrotate/Config.in
+++ b/package/logrotate/Config.in
@@ -11,4 +11,3 @@ config BR2_PACKAGE_LOGROTATE
 comment "logrotate needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
-
diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index 922fd9e..598bf11 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -11,4 +11,3 @@ config BR2_PACKAGE_LUAPOSIX
 	  APIs
 
 	  https://github.com/luaposix/luaposix
-
diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 839ee97..affcfe5 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -156,4 +156,3 @@ config BR2_PACKAGE_MTD_UBIUPDATEVOL
 	default y
 
 endif
-
diff --git a/package/mtdev/Config.in b/package/mtdev/Config.in
index 3419903..afdd7dc 100644
--- a/package/mtdev/Config.in
+++ b/package/mtdev/Config.in
@@ -5,4 +5,3 @@ config BR2_PACKAGE_MTDEV
 	  variants of kernel MT events to the slotted type B protocol.
 
 	  http://bitmath.org/code/mtdev/
-
diff --git a/package/netcat/Config.in b/package/netcat/Config.in
index 54aac76..88273ff 100644
--- a/package/netcat/Config.in
+++ b/package/netcat/Config.in
@@ -10,4 +10,3 @@ config BR2_PACKAGE_NETCAT
 	  need and has several interesting built-in capabilities.
 
 	  http://netcat.sourceforge.net/download.php
-
diff --git a/package/python-dpkt/Config.in b/package/python-dpkt/Config.in
index aac9f09..f1e4ddf 100644
--- a/package/python-dpkt/Config.in
+++ b/package/python-dpkt/Config.in
@@ -7,5 +7,3 @@ config BR2_PACKAGE_PYTHON_DPKT
 	  for the basic TCP/IP protocols.
 
 	  http://code.google.com/p/dpkt/
-
-
diff --git a/package/python-serial/Config.in b/package/python-serial/Config.in
index ea090bd..df26af1 100644
--- a/package/python-serial/Config.in
+++ b/package/python-serial/Config.in
@@ -5,4 +5,3 @@ config BR2_PACKAGE_PYTHON_SERIAL
 	  python-serial is a Python library to access serial ports.
 
 	  http://pyserial.sf.net
-
diff --git a/package/qtuio/Config.in b/package/qtuio/Config.in
index a4be1f6..f3f5e3c 100644
--- a/package/qtuio/Config.in
+++ b/package/qtuio/Config.in
@@ -18,4 +18,3 @@ endif
 
 comment "qtuio depends on QT gui module"
 	depends on !BR2_PACKAGE_QT_GUI_MODULE
-
diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 567871b..de06141 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -34,5 +34,3 @@ comment "xz payload support needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 endif
-
-
diff --git a/package/sawman/Config.in b/package/sawman/Config.in
index 2c53dc4..2f847db 100644
--- a/package/sawman/Config.in
+++ b/package/sawman/Config.in
@@ -9,4 +9,3 @@ config BR2_PACKAGE_SAWMAN
 	  working horse.
 
 	  See http://www.directfb.org/downloads/Extras/README.SaWMan
-
diff --git a/package/sdl_ttf/Config.in b/package/sdl_ttf/Config.in
index 9f78b90..efc92e5 100644
--- a/package/sdl_ttf/Config.in
+++ b/package/sdl_ttf/Config.in
@@ -7,4 +7,3 @@ config BR2_PACKAGE_SDL_TTF
 	  use TrueType fonts in your SDL applications.
 
 	  http://www.libsdl.org/projects/SDL_ttf/
-
diff --git a/package/speex/Config.in b/package/speex/Config.in
index e1f7c68..3f8d6c3 100644
--- a/package/speex/Config.in
+++ b/package/speex/Config.in
@@ -21,4 +21,3 @@ config BR2_PACKAGE_SPEEX_ARM5E
 	depends on BR2_arm && !BR2_PACKAGE_SPEEX_ARM4
 
 endif
-
diff --git a/package/tftpd/Config.in b/package/tftpd/Config.in
index 52e23a3..6f5916d 100644
--- a/package/tftpd/Config.in
+++ b/package/tftpd/Config.in
@@ -2,4 +2,3 @@ config BR2_PACKAGE_TFTPD
 	bool "tftpd"
 	help
 	  HPA's Trivial File Transfer Protocol (tftp) server.
-
diff --git a/package/vsftpd/Config.in b/package/vsftpd/Config.in
index 54ef7bd..0cc8880 100644
--- a/package/vsftpd/Config.in
+++ b/package/vsftpd/Config.in
@@ -4,4 +4,3 @@ config BR2_PACKAGE_VSFTPD
 	help
 	  vsftpd is an ftp daemon written with security in mind.
 	  http://vsftpd.beasts.org/
-
diff --git a/package/x11r7/mesa3d/Config.in b/package/x11r7/mesa3d/Config.in
index 080f56a..0ce168e 100644
--- a/package/x11r7/mesa3d/Config.in
+++ b/package/x11r7/mesa3d/Config.in
@@ -12,4 +12,3 @@ config BR2_PACKAGE_MESA3D
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Mesa 3D, an open-source implementation of the OpenGL specification.
-
diff --git a/package/x11r7/xcb-proto/Config.in b/package/x11r7/xcb-proto/Config.in
index 4a6dfe4..1d66372 100644
--- a/package/x11r7/xcb-proto/Config.in
+++ b/package/x11r7/xcb-proto/Config.in
@@ -4,4 +4,3 @@ config BR2_PACKAGE_XCB_PROTO
 		The protocol headers that define XCB.
 
 		http://xcb.freedesktop.org/
-
diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 2df72ad..3a31dd2 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -15,4 +15,3 @@ config BR2_PACKAGE_XFSPROGS
 	  The XFS file system utilities and libraries
 
 	  http://oss.sgi.com/projects/xfs/
-
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 0f25db3..f5a5c0f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1077,4 +1077,3 @@ config BR2_BFIN_INSTALL_FLAT_SHARED
 	  shared FLAT.
 
 endif # BR2_TOOLCHAIN_EXTERNAL
-
diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index 44ed629..1152e25 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -15,4 +15,3 @@ endif
 $(eval $(generic-package))
 
 toolchain-source: prepare dirs dependencies $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
-
