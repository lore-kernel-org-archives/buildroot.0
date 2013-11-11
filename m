From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 11 Nov 2013 17:23:23 +0100
Subject: [Buildroot] [PATCH] Config.in files: whitespace cleanup
Message-ID: <b6480e291db7f8b87215.1384187003@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes the following whitespace problems in Config.in files:
- trailing whitespace
- spaces instead of tabs for indentation
- help text not indented with tab + 2 spaces

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Config.in                                        |   2 +-
 boot/at91dataflashboot/Config.in                 |   4 +-
 boot/mxs-bootlets/Config.in                      |  20 ++--
 boot/uboot/Config.in                             |   2 +-
 fs/squashfs/Config.in                            |  14 +-
 linux/Config.ext.in                              |  16 +-
 linux/Config.in                                  |  20 ++--
 package/at/Config.in                             |   6 +-
 package/busybox/Config.in                        |   2 +-
 package/cegui06/Config.in                        |   2 +-
 package/celt051/Config.in                        |   6 +-
 package/cppcms/Config.in                         |   6 +-
 package/cramfs/Config.in                         |  10 +-
 package/cryptsetup/Config.in                     |   2 +-
 package/cups/Config.in                           |   8 +-
 package/dfu-util/Config.in.host                  |   4 +-
 package/divine/Config.in                         |  14 +-
 package/dvb-apps/Config.in                       |   2 +-
 package/dvbsnoop/Config.in                       |   2 +-
 package/e2fsprogs/Config.in.host                 |   2 +-
 package/efl/libevas/Config.in                    |   4 +-
 package/ffmpeg/Config.in                         |  98 ++++++++++----------
 package/flac/Config.in                           |   2 +-
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in |   2 +-
 package/gd/Config.in                             |  38 +++---
 package/genimage/Config.in.host                  |   4 +-
 package/genpart/Config.in.host                   |   2 +-
 package/genromfs/Config.in                       |   8 +-
 package/httping/Config.in                        |  18 +-
 package/input-tools/Config.in                    |  24 ++--
 package/intltool/Config.in                       |  14 +-
 package/keyutils/Config.in                       |   2 +-
 package/libcap/Config.in                         |  10 +-
 package/libdvdnav/Config.in                      |   2 +-
 package/libeXosip2/Config.in                     |   2 +-
 package/libgeotiff/Config.in                     |  12 +-
 package/libiscsi/Config.in                       |   4 +-
 package/libmms/Config.in                         |  10 +-
 package/libseccomp/Config.in                     |   4 +-
 package/libv4l/Config.in                         |   2 +-
 package/libxml-parser-perl/Config.in             |  16 +-
 package/linux-firmware/Config.in                 |  18 +-
 package/lite/Config.in                           |   2 +-
 package/lttng-babeltrace/Config.in               |   2 +-
 package/makedevs/Config.in                       |   8 +-
 package/memtester/Config.in                      |   2 +-
 package/monit/Config.in                          |   2 +-
 package/mtools/Config.in.host                    |   2 +-
 package/php/Config.in                            |  20 ++--
 package/python-pyparsing/Config.in               |   2 +-
 package/sawman/Config.in                         |  12 +-
 package/slirp/Config.in                          |   6 +-
 package/snowball-hdmiservice/Config.in           |   6 +-
 package/speex/Config.in                          |   6 +-
 package/spice-protocol/Config.in                 |   4 +-
 package/spice/Config.in                          |   4 +-
 package/squashfs/Config.in                       |  34 +++---
 package/sysstat/Config.in                        |  62 ++++++------
 package/taglib/Config.in                         |   6 +-
 package/ti-gfx/Config.in                         |   2 +-
 package/tremor/Config.in                         |   6 +-
 package/usbredir/Config.in                       |   6 +-
 package/util-linux/Config.in                     |   2 +-
 package/x11r7/Config.in                          |   2 +-
 package/x11r7/xdriver_xf86-input-evdev/Config.in |   2 +-
 package/x11r7/xserver_xorg-server/Config.in      |  18 +-
 package/xenomai/Config.in                        |  66 ++++++------
 package/xfsprogs/Config.in                       |   2 +-
 system/Config.in                                 |  22 ++--
 toolchain/toolchain-external/Config.in           |  66 ++++++------
 70 files changed, 407 insertions(+), 407 deletions(-)

diff --git a/Config.in b/Config.in
--- a/Config.in
+++ b/Config.in
@@ -410,7 +410,7 @@ config BR2_ENABLE_SSP
 	  -fstack-protector-all option.
 
 	  See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
-          for details.
+	  for details.
 
 	  Note that this requires the toolchain to have SSP
 	  support. This is always the case for glibc and eglibc
diff --git a/boot/at91dataflashboot/Config.in b/boot/at91dataflashboot/Config.in
--- a/boot/at91dataflashboot/Config.in
+++ b/boot/at91dataflashboot/Config.in
@@ -1,3 +1,3 @@
 config BR2_TARGET_AT91DATAFLASHBOOT
-       depends on BR2_arm926t
-       bool "AT91 DataFlashBoot"
+	depends on BR2_arm926t
+	bool "AT91 DataFlashBoot"
diff --git a/boot/mxs-bootlets/Config.in b/boot/mxs-bootlets/Config.in
--- a/boot/mxs-bootlets/Config.in
+++ b/boot/mxs-bootlets/Config.in
@@ -43,16 +43,16 @@ choice
 	  Select which bootstream to generate
 
 config BR2_TARGET_MXS_BOOTLETS_BAREBOX
-       depends on BR2_TARGET_BAREBOX
-       bool "Barebox Bootloader"
+	depends on BR2_TARGET_BAREBOX
+	bool "Barebox Bootloader"
 
 config BR2_TARGET_MXS_BOOTLETS_LINUX
-       depends on BR2_LINUX_KERNEL
-       bool "Linux Kernel"
+	depends on BR2_LINUX_KERNEL
+	bool "Linux Kernel"
 
 config BR2_TARGET_MXS_BOOTLETS_UBOOT
-       depends on BR2_TARGET_UBOOT
-       bool "U-boot bootloader"
+	depends on BR2_TARGET_UBOOT
+	bool "U-boot bootloader"
 
 endchoice
 
@@ -82,9 +82,9 @@ config BR2_TARGET_MXS_BOOTLETS_CUSTOM_BO
 endchoice
 
 config BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD_NAME
-       string "Custom board name"
-       depends on BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD
-       help
-         Name of the board to build the bootlets for
+	string "Custom board name"
+	depends on BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD
+	help
+	  Name of the board to build the bootlets for
 
 endif
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -21,7 +21,7 @@ config BR2_TARGET_UBOOT_LATEST_VERSION
 	bool "2013.10"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
-       bool "Custom version"
+	bool "Custom version"
 	help
 	  This option allows to use a specific official versions
 
diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -12,11 +12,11 @@ choice
 	  root filesystem.
 
 config BR2_TARGET_ROOTFS_SQUASHFS4
-       bool "4.x"
+	bool "4.x"
 
 config BR2_TARGET_ROOTFS_SQUASHFS3
-       depends on BR2_DEPRECATED
-       bool "3.x"
+	depends on BR2_DEPRECATED
+	bool "3.x"
 
 endchoice
 
@@ -29,16 +29,16 @@ choice
 	  generating the filesystem.
 
 config BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
-       bool "gzip"
+	bool "gzip"
 
 config BR2_TARGET_ROOTFS_SQUASHFS4_LZMA
-       bool "lzma"
+	bool "lzma"
 
 config BR2_TARGET_ROOTFS_SQUASHFS4_LZO
-       bool "lzo"
+	bool "lzo"
 
 config BR2_TARGET_ROOTFS_SQUASHFS4_XZ
-       bool "xz"
+	bool "xz"
 
 endchoice
 endif
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -31,15 +31,15 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEO
 
 # RTAI
 config BR2_LINUX_KERNEL_EXT_RTAI
-       bool "RTAI Real-time patch"
-       select BR2_PACKAGE_RTAI
-       help
-         RTAI Kernel part.
+	bool "RTAI Real-time patch"
+	select BR2_PACKAGE_RTAI
+	help
+	  RTAI Kernel part.
 
 config BR2_LINUX_KERNEL_EXT_RTAI_PATCH
-       depends on BR2_LINUX_KERNEL_EXT_RTAI
-       string "Path for RTAI patch file"
-       help
-         Optionally, explicitly specify the RTAI patch to use.
+	depends on BR2_LINUX_KERNEL_EXT_RTAI
+	string "Path for RTAI patch file"
+	help
+	  Optionally, explicitly specify the RTAI patch to use.
 
 endmenu
diff --git a/linux/Config.in b/linux/Config.in
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -127,9 +127,9 @@ config BR2_LINUX_KERNEL_DEFCONFIG
 	string "Defconfig name"
 	depends on BR2_LINUX_KERNEL_USE_DEFCONFIG
 	help
-	 Name of the kernel defconfig file to use, without the
-	 trailing _defconfig.  The defconfig is located in
-	 arch/<arch>/configs in the kernel tree.
+	  Name of the kernel defconfig file to use, without the
+	  trailing _defconfig.  The defconfig is located in
+	  arch/<arch>/configs in the kernel tree.
 
 config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
 	string "Configuration file path"
@@ -142,7 +142,7 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FI
 #
 
 config BR2_LINUX_KERNEL_UBOOT_IMAGE
-       bool
+	bool
 
 choice
 	prompt "Kernel binary format"
@@ -274,9 +274,9 @@ choice
 config BR2_LINUX_KERNEL_USE_INTREE_DTS
 	bool "Use a device tree present in the kernel."
 	help
-	   Use a device tree source distributed with
-	   the kernel sources. The dts files are located
-           in the arch/<arch>/boot/dts folder.
+	  Use a device tree source distributed with
+	  the kernel sources. The dts files are located
+	  in the arch/<arch>/boot/dts folder.
 
 config BR2_LINUX_KERNEL_USE_CUSTOM_DTS
 	bool "Use a custom device tree file"
@@ -290,9 +290,9 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
 	string "Device Tree Source file names"
 	depends on BR2_LINUX_KERNEL_USE_INTREE_DTS
 	help
-	 Name of the device tree source file, without
-	 the trailing .dts. You can provide a list of
-	 dts files to build, separated by spaces.
+	  Name of the device tree source file, without
+	  the trailing .dts. You can provide a list of
+	  dts files to build, separated by spaces.
 
 config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	string "Device Tree Source file path"
diff --git a/package/at/Config.in b/package/at/Config.in
--- a/package/at/Config.in
+++ b/package/at/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_AT
 	bool "at"
 	depends on BR2_USE_MMU
 	help
-	 At and batch read shell commands from standard input and
-	 store them as jobs to be scheduled for execution in the
-	 future.
+	  At and batch read shell commands from standard input and
+	  store them as jobs to be scheduled for execution in the
+	  future.
 
 	  at    - run the job at a specified time
 	  batch - run the job when system load levels permit
diff --git a/package/busybox/Config.in b/package/busybox/Config.in
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -81,5 +81,5 @@ if !BR2_PACKAGE_BUSYBOX # kconfig doesn'
 # add dummy config so the stuff with busybox alternatives are shown
 # when busybox is disabled
 config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-       default y
+	default y
 endif
diff --git a/package/cegui06/Config.in b/package/cegui06/Config.in
--- a/package/cegui06/Config.in
+++ b/package/cegui06/Config.in
@@ -15,5 +15,5 @@ config BR2_PACKAGE_CEGUI06
 	  orientated, written in C++, and targeted at games developers who
 	  should be spending their time creating great games, not building
 	  GUI sub-systems!
-	  
+
 	  http://www.cegui.org.uk/
diff --git a/package/celt051/Config.in b/package/celt051/Config.in
--- a/package/celt051/Config.in
+++ b/package/celt051/Config.in
@@ -3,13 +3,13 @@ config BR2_PACKAGE_CELT051
 	select BR2_PACKAGE_LIBOGG
 	help
 	  The CELT ultra-low delay audio codec
-	  
+
 	  The CELT codec is a compression algorithm for audio. Like MP3,
 	  Vorbis, and AAC it is suitable for transmitting music with high
 	  quality. Unlike these formats CELT imposes very little delay on
 	  the signal, even less than is typical for speech centric formats
 	  like Speex, GSM, or G.729.
-	  
+
 	  Note: this is version 0.5.1.3 of celt.
-	  
+
 	  http://www.celt-codec.org/
diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -12,11 +12,11 @@ config BR2_PACKAGE_CPPCMS
 	  differs from most of other web development frameworks like:
 	  Python Django or Java Servlets on  the following aspects:
 
-           - It is designed and tuned to handle extremely high loads.
+	   - It is designed and tuned to handle extremely high loads.
 	   - It uses modern C++ as primary development language in
 	     order to achieve the above goal.
-           - It is aimed on development of both Web Sites and Web
-             Services.
+	   - It is aimed on development of both Web Sites and Web
+	     Services.
 
 	  http://cppcms.com
 
diff --git a/package/cramfs/Config.in b/package/cramfs/Config.in
--- a/package/cramfs/Config.in
+++ b/package/cramfs/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_CRAMFS
-       bool "cramfs"
-       help
-         cramfs is a compressed read-only filesystem. This package
-         contains the tools to generate and check a cramfs filesystem.
+	bool "cramfs"
+	help
+	  cramfs is a compressed read-only filesystem. This package
+	  contains the tools to generate and check a cramfs filesystem.
 
-	 http://sourceforge.net/projects/cramfs/
+	  http://sourceforge.net/projects/cramfs/
diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_E2FSPROGS
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE 
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on BR2_LARGEFILE # lvm2, util-linux
 	depends on BR2_USE_MMU # lvm2
 	depends on BR2_USE_WCHAR # util-linux
diff --git a/package/cups/Config.in b/package/cups/Config.in
--- a/package/cups/Config.in
+++ b/package/cups/Config.in
@@ -10,10 +10,10 @@ config BR2_PACKAGE_CUPS
 if BR2_PACKAGE_CUPS
 
 config BR2_PACKAGE_CUPS_PDFTOPS
-       bool "pdftops support"
-       depends on BR2_INSTALL_LIBSTDCPP
-       help
-         Enable pdftops support
+	bool "pdftops support"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Enable pdftops support
 
 comment "pdftops support needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/dfu-util/Config.in.host b/package/dfu-util/Config.in.host
--- a/package/dfu-util/Config.in.host
+++ b/package/dfu-util/Config.in.host
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_HOST_DFU_UTIL
 	bool "host dfu-util"
 	help
-	  Dfu-util is the host side implementation of the DFU 1.0 
+	  Dfu-util is the host side implementation of the DFU 1.0
 	  specification of the USB forum. DFU is intended to download
-	  and upload firmware to devices connected over USB. 
+	  and upload firmware to devices connected over USB.
 
 	  http://dfu-util.gnumonks.org/
diff --git a/package/divine/Config.in b/package/divine/Config.in
--- a/package/divine/Config.in
+++ b/package/divine/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_DIVINE
-       bool "directfb virtual input extension"
-       depends on BR2_PACKAGE_DIRECTFB
-       help
-         DiVine provides a DirectFB input driver that reads input
-         events from a pipe and dispatches them via a virtual input
-         device. It also installs the tool 'spooky' that allows to
-         send input events to DirectFB applications.
+	bool "directfb virtual input extension"
+	depends on BR2_PACKAGE_DIRECTFB
+	help
+	  DiVine provides a DirectFB input driver that reads input
+	  events from a pipe and dispatches them via a virtual input
+	  device. It also installs the tool 'spooky' that allows to
+	  send input events to DirectFB applications.
diff --git a/package/dvb-apps/Config.in b/package/dvb-apps/Config.in
--- a/package/dvb-apps/Config.in
+++ b/package/dvb-apps/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_DVB_APPS
 	bool "dvb-apps (transponders data)"
 	help
 	  Install the DVB-C, DVB-S, DVB-T and ATSC transponders data.
-	  
+
 	  http://linuxtv.org/projects.php
 	  http://linuxtv.org/hg/dvb-apps
 
diff --git a/package/dvbsnoop/Config.in b/package/dvbsnoop/Config.in
--- a/package/dvbsnoop/Config.in
+++ b/package/dvbsnoop/Config.in
@@ -22,4 +22,4 @@ config BR2_PACKAGE_DVBSNOOP
 	  http://en.wikipedia.org/wiki/DBox2
 
 comment "dvbsnoop needs a toolchain w/ largefile"
-        depends on !BR2_LARGEFILE
+	depends on !BR2_LARGEFILE
diff --git a/package/e2fsprogs/Config.in.host b/package/e2fsprogs/Config.in.host
--- a/package/e2fsprogs/Config.in.host
+++ b/package/e2fsprogs/Config.in.host
@@ -2,5 +2,5 @@ config BR2_PACKAGE_HOST_E2FSPROGS
 	bool "host e2fsprogs"
 	help
 	  The EXT2/3/4 file system utilities.
-	  
+
 	  http://e2fsprogs.sf.net
diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -142,10 +142,10 @@ config BR2_PACKAGE_LIBEVAS_GL
 	select BR2_PACKAGE_LIBEET
 
 config BR2_PACKAGE_LIBEVAS_GLES_SGX
-       bool "OpenGL-ES SGX"
+	bool "OpenGL-ES SGX"
 
 config BR2_PACKAGE_LIBEVAS_GLES_S3C6410
-       bool "OpenGL-ES S3C6410"
+	bool "OpenGL-ES S3C6410"
 endchoice
 
 
diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -6,48 +6,48 @@ menuconfig BR2_PACKAGE_FFMPEG
 	depends on BR2_LARGEFILE
 	depends on BR2_INET_IPV6
 	help
-         FFmpeg is a complete, cross-platform solution to record, convert
-         and stream audio and video.
+	  FFmpeg is a complete, cross-platform solution to record, convert
+	  and stream audio and video.
 
-	 http://www.ffmpeg.org
+	  http://www.ffmpeg.org
 
 if BR2_PACKAGE_FFMPEG
 
 config BR2_PACKAGE_FFMPEG_GPL
 	bool "Enable GPL code"
 	help
-         allow use of GPL code, the resulting libs and binaries will
-         be under GPL
+	  allow use of GPL code, the resulting libs and binaries will
+	  be under GPL
 
 config BR2_PACKAGE_FFMPEG_NONFREE
 	bool "Enable nonfree code"
 	help
-         allow use of nonfree code, the resulting libs and binaries
-         will be unredistributable
+	  allow use of nonfree code, the resulting libs and binaries
+	  will be unredistributable
 
 config BR2_PACKAGE_FFMPEG_FFMPEG
 	bool "Build ffmpeg (the command line application)"
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	default y
 	help
-         FFmpeg is a very fast video and audio converter.
-         It can also grab from a live audio/video source.
+	  FFmpeg is a very fast video and audio converter.
+	  It can also grab from a live audio/video source.
 
-         It is not needed if you want to link the FFmpeg libraries
-         to your application.
+	  It is not needed if you want to link the FFmpeg libraries
+	  to your application.
 
 config BR2_PACKAGE_FFMPEG_FFPLAY
 	bool "Build ffplay"
 	select BR2_PACKAGE_SDL
 	help
-         FFplay is a very simple and portable media player using the
-         FFmpeg libraries and the SDL library.
-         It is mostly used as a testbed for the various FFmpeg APIs.
+	  FFplay is a very simple and portable media player using the
+	  FFmpeg libraries and the SDL library.
+	  It is mostly used as a testbed for the various FFmpeg APIs.
 
 config BR2_PACKAGE_FFMPEG_FFSERVER
 	bool "Build ffserver"
 	help
-         FFserver is a streaming server for both audio and video.
+	  FFserver is a streaming server for both audio and video.
 
 config BR2_PACKAGE_FFMPEG_POSTPROC
 	bool "Build libpostproc"
@@ -64,81 +64,81 @@ config BR2_PACKAGE_FFMPEG_ENCODERS
 	string "Enabled encoders"
 	default "all"
 	help
-	 Space-separated list of encoders to build in FFmpeg,
-	 or "all" to build all of them.
+	  Space-separated list of encoders to build in FFmpeg,
+	  or "all" to build all of them.
 
-	 Run ./configure --list-encoders in the ffmpeg sources
-	 directory to know the available options.
+	  Run ./configure --list-encoders in the ffmpeg sources
+	  directory to know the available options.
 
 config BR2_PACKAGE_FFMPEG_DECODERS
 	string "Enabled decoders"
 	default "all"
 	help
-	 Space-separated list of decoders to build in FFmpeg,
-	 or "all" to build all of them.
+	  Space-separated list of decoders to build in FFmpeg,
+	  or "all" to build all of them.
 
-	 Run ./configure --list-decoders in the ffmpeg sources
-	 directory to know the available options.
+	  Run ./configure --list-decoders in the ffmpeg sources
+	  directory to know the available options.
 
 config BR2_PACKAGE_FFMPEG_MUXERS
 	string "Enabled muxers"
 	default "all"
 	help
-	 Space-separated list of muxers to build in FFmpeg,
-	 or "all" to build all of them.
+	  Space-separated list of muxers to build in FFmpeg,
+	  or "all" to build all of them.
 
-	 Run ./configure --list-muxers in the ffmpeg sources
-	 directory to know the available options.
+	  Run ./configure --list-muxers in the ffmpeg sources
+	  directory to know the available options.
 
 config BR2_PACKAGE_FFMPEG_DEMUXERS
 	string "Enabled demuxers"
 	default "all"
 	help
-	 Space-separated list of demuxers to build in FFmpeg,
-	 or "all" to build all of them.
+	  Space-separated list of demuxers to build in FFmpeg,
+	  or "all" to build all of them.
 
-	 Run ./configure --list-demuxers in the ffmpeg sources
-	 directory to know the available options.
+	  Run ./configure --list-demuxers in the ffmpeg sources
+	  directory to know the available options.
 
 config BR2_PACKAGE_FFMPEG_PARSERS
 	string "Enabled parsers"
 	default "all"
 	help
-	 Space-separated list of parsers to build in FFmpeg,
-	 or "all" to build all of them.
+	  Space-separated list of parsers to build in FFmpeg,
+	  or "all" to build all of them.
 
-	 Run ./configure --list-parsers in the ffmpeg sources
-	 directory to know the available options.
+	  Run ./configure --list-parsers in the ffmpeg sources
+	  directory to know the available options.
 
 config BR2_PACKAGE_FFMPEG_BSFS
 	string "Enabled bitstreams"
 	default "all"
 	help
-	 Space-separated list of bitstream filters to build in FFmpeg,
-	 or "all" to build all of them.
+	  Space-separated list of bitstream filters to build in FFmpeg,
+	  or "all" to build all of them.
 
-	 Run ./configure --list-bsfs in the ffmpeg sources
-	 directory to know the available options.
+	  Run ./configure --list-bsfs in the ffmpeg sources
+	  directory to know the available options.
 
 config BR2_PACKAGE_FFMPEG_PROTOCOLS
 	string "Enabled protocols"
 	default "all"
 	help
-	 Space-separated list of protocols to build in FFmpeg,
-	 or "all" to build all of them.
+	  Space-separated list of protocols to build in FFmpeg,
+	  or "all" to build all of them.
 
-	 Run ./configure --list-protocols in the ffmpeg sources
-	 directory to know the available options.
+	  Run ./configure --list-protocols in the ffmpeg sources
+	  directory to know the available options.
 
 config BR2_PACKAGE_FFMPEG_FILTERS
 	string "Enabled filters"
 	default "all"
 	help
-	 Space-separated list of filters to build in FFmpeg,
-	 or "all" to build all of them.
+	  Space-separated list of filters to build in FFmpeg,
+	  or "all" to build all of them.
 
-	 Run ./configure --list-filters in the ffmpeg sources
-	 directory to know the available options.
+	  Run ./configure --list-filters in the ffmpeg sources
+	  directory to know the available options.
 
 config BR2_PACKAGE_FFMPEG_INDEVS
 	bool "Enable input devices"
@@ -152,7 +152,7 @@ config BR2_PACKAGE_FFMPEG_EXTRACONF
 	string "Additional parameters for ./configure"
 	default ""
 	help
-	 Extra parameters that will be appended to FFmpeg's
-	 ./configure commandline.
+	  Extra parameters that will be appended to FFmpeg's
+	  ./configure commandline.
 
 endif
diff --git a/package/flac/Config.in b/package/flac/Config.in
--- a/package/flac/Config.in
+++ b/package/flac/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_FLAC
 	bool "flac"
 	help
-          FLAC is an Open Source lossless audio codec.
+	  FLAC is an Open Source lossless audio codec.
 
 	  http://flac.sourceforge.net/
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
--- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	depends on BR2_arm # Only relevant for i.MX6
-	 # Library binaries are linked against libc.so.6
+	# Library binaries are linked against libc.so.6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Userspace libraries for Vivante GPU on i.MX6 platforms
diff --git a/package/gd/Config.in b/package/gd/Config.in
--- a/package/gd/Config.in
+++ b/package/gd/Config.in
@@ -15,47 +15,47 @@ if BR2_PACKAGE_GD
 menu "gd tools"
 
 config BR2_PACKAGE_GD_ANNOTATE
-       bool "annotate"
+	bool "annotate"
 
 config BR2_PACKAGE_GD_BDFTOGD
-       bool "bdftogd"
-       depends on BR2_PACKAGE_PERL
+	bool "bdftogd"
+	depends on BR2_PACKAGE_PERL
 
 config BR2_PACKAGE_GD_GD2COPYPAL
-       bool "gd2copypal"
+	bool "gd2copypal"
 
 config BR2_PACKAGE_GD_GD2TOGIF
-       bool "gd2togif"
+	bool "gd2togif"
 
 config BR2_PACKAGE_GD_GD2TOPNG
-       bool "gd2topng"
-       select BR2_PACKAGE_LIBPNG
+	bool "gd2topng"
+	select BR2_PACKAGE_LIBPNG
 
 config BR2_PACKAGE_GD_GDCMPGIF
-       bool "gdcmpgif"
+	bool "gdcmpgif"
 
 config BR2_PACKAGE_GD_GDPARTTOPNG
-       bool "gdparttopng"
-       select BR2_PACKAGE_LIBPNG
+	bool "gdparttopng"
+	select BR2_PACKAGE_LIBPNG
 
 config BR2_PACKAGE_GD_GDTOPNG
-       bool "gdtopng"
-       select BR2_PACKAGE_LIBPNG
+	bool "gdtopng"
+	select BR2_PACKAGE_LIBPNG
 
 config BR2_PACKAGE_GD_GIFTOGD2
-       bool "giftogd2"
+	bool "giftogd2"
 
 config BR2_PACKAGE_GD_PNGTOGD
-       bool "pngtogd"
-       select BR2_PACKAGE_LIBPNG
+	bool "pngtogd"
+	select BR2_PACKAGE_LIBPNG
 
 config BR2_PACKAGE_GD_PNGTOGD2
-       bool "pngtogd2"
-       select BR2_PACKAGE_LIBPNG
+	bool "pngtogd2"
+	select BR2_PACKAGE_LIBPNG
 
 config BR2_PACKAGE_GD_WEBPNG
-       bool "webpng"
-       select BR2_PACKAGE_LIBPNG
+	bool "webpng"
+	select BR2_PACKAGE_LIBPNG
 
 endmenu
 
diff --git a/package/genimage/Config.in.host b/package/genimage/Config.in.host
--- a/package/genimage/Config.in.host
+++ b/package/genimage/Config.in.host
@@ -4,10 +4,10 @@ config BR2_PACKAGE_HOST_GENIMAGE
 	  genimage is a tool to generate multiple filesystem and flash
 	  images from a given root filesystem tree. genimage is
 	  intended to be run in a fakeroot environment.
-	  
+
 	  Configuration is done is a config file parsed by
 	  libconfuse. Options like the path to tools can be given in
 	  environment variables, the config file or commandline
 	  switches.
-	  
+
 	  http://www.pengutronix.de/software/genimage/
diff --git a/package/genpart/Config.in.host b/package/genpart/Config.in.host
--- a/package/genpart/Config.in.host
+++ b/package/genpart/Config.in.host
@@ -4,5 +4,5 @@ config BR2_PACKAGE_HOST_GENPART
 	  Generate a 16 byte partition table entry defined by command line
 	  arguments and dump it to stdout. No CHS magic is done, only lba
 	  entries are filled out.
-	  
+
 	  http://www.pengutronix.de/software/genpart/index_en.html
diff --git a/package/genromfs/Config.in b/package/genromfs/Config.in
--- a/package/genromfs/Config.in
+++ b/package/genromfs/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GENROMFS
-       bool "genromfs"
-       help
-         Tool to generate a ROMFS filesystem.
+	bool "genromfs"
+	help
+	  Tool to generate a ROMFS filesystem.
 
-	 http://romfs.sourceforge.net/
\ No newline at end of file
+	  http://romfs.sourceforge.net/
diff --git a/package/httping/Config.in b/package/httping/Config.in
--- a/package/httping/Config.in
+++ b/package/httping/Config.in
@@ -1,17 +1,17 @@
 config BR2_PACKAGE_HTTPING
-       bool "httping"
-       help
-         Httping is like 'ping' but for http-requests.
-         Give it an url, and it'll show you how long it takes to connect,
-         send a request and retrieve the reply (only the headers).
-         Be aware that the transmission across the network also takes time!
-         So it measures the latency of the webserver + network.
+	bool "httping"
+	help
+	  Httping is like 'ping' but for http-requests.
+	  Give it an url, and it'll show you how long it takes to connect,
+	  send a request and retrieve the reply (only the headers).
+	  Be aware that the transmission across the network also takes time!
+	  So it measures the latency of the webserver + network.
 
-         http://www.vanheusden.com/httping/
+	  http://www.vanheusden.com/httping/
 
 if BR2_PACKAGE_HTTPING
 
 config BR2_PACKAGE_HTTPING_TFO
-       bool "TCP Fast Open (TFO) support"
+	bool "TCP Fast Open (TFO) support"
 
 endif
diff --git a/package/input-tools/Config.in b/package/input-tools/Config.in
--- a/package/input-tools/Config.in
+++ b/package/input-tools/Config.in
@@ -5,22 +5,22 @@ config BR2_PACKAGE_INPUT_TOOLS
 	  http://linuxconsole.sourceforge.net/
 
 config BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH
-        bool "inputattach"
-        depends on BR2_PACKAGE_INPUT_TOOLS
-        default y
-        help
+	bool "inputattach"
+	depends on BR2_PACKAGE_INPUT_TOOLS
+	default y
+	help
 	  Inputattach is used for attaching a serial line to the input layer.
 
 config BR2_PACKAGE_INPUT_TOOLS_JSCAL
-        bool "jscal"
-        depends on BR2_PACKAGE_INPUT_TOOLS
-        default y
-        help
+	bool "jscal"
+	depends on BR2_PACKAGE_INPUT_TOOLS
+	default y
+	help
 	  Joystick calibration program.
 
 config BR2_PACKAGE_INPUT_TOOLS_JSTEST
-        bool "jstest"
-        depends on BR2_PACKAGE_INPUT_TOOLS
-        default y
-        help
+	bool "jstest"
+	depends on BR2_PACKAGE_INPUT_TOOLS
+	default y
+	help
 	  Joystick test program.
diff --git a/package/intltool/Config.in b/package/intltool/Config.in
--- a/package/intltool/Config.in
+++ b/package/intltool/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_INTLTOOL
-       bool "intltool"
-       # Hide from configuration as we only support the host package
-       # for the moment
-       depends on BR2_HOST_ONLY
-       help
-         Utility scripts for internationalizing XML
+	bool "intltool"
+	# Hide from configuration as we only support the host package
+	# for the moment
+	depends on BR2_HOST_ONLY
+	help
+	  Utility scripts for internationalizing XML
 
-	 http://www.freedesktop.org/wiki/Software/intltool
\ No newline at end of file
+	  http://www.freedesktop.org/wiki/Software/intltool
diff --git a/package/keyutils/Config.in b/package/keyutils/Config.in
--- a/package/keyutils/Config.in
+++ b/package/keyutils/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_KEYUTILS
 	help
 	  These tools are used to control the key management system
 	  built into the Linux kernel.
-	  
+
 	  http://people.redhat.com/~dhowells/keyutils/
diff --git a/package/libcap/Config.in b/package/libcap/Config.in
--- a/package/libcap/Config.in
+++ b/package/libcap/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_LIBCAP
 	bool "libcap"
 	help
-	 This library implements the user-space interfaces to the
-	 POSIX 1003.1e capabilities available in Linux kernels. These
-	 capabilities are a partitioning of the all powerful root
-	 privilege into a set of distinct privileges.
+	  This library implements the user-space interfaces to the
+	  POSIX 1003.1e capabilities available in Linux kernels. These
+	  capabilities are a partitioning of the all powerful root
+	  privilege into a set of distinct privileges.
 
-	 http://sites.google.com/site/fullycapable/
+	  http://sites.google.com/site/fullycapable/
 
diff --git a/package/libdvdnav/Config.in b/package/libdvdnav/Config.in
--- a/package/libdvdnav/Config.in
+++ b/package/libdvdnav/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBDVDNAV
 	bool "libdvdnav"
 	depends on BR2_LARGEFILE # libdvdread
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-        select BR2_PACKAGE_LIBDVDREAD
+	select BR2_PACKAGE_LIBDVDREAD
 	help
 	  libdvdnav is a library that allows easy use of sophisticated
 	  DVD navigation features such as DVD menus, multiangle
diff --git a/package/libeXosip2/Config.in b/package/libeXosip2/Config.in
--- a/package/libeXosip2/Config.in
+++ b/package/libeXosip2/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_LIBEXOSIP2
 	  This protocol is mainly to be used by VoIP telephony
 	  applications (endpoints or conference server) but might be
 	  also usefull for any application that wish to establish
-	  sessions like multiplayer games. 
+	  sessions like multiplayer games.
 	  eXosip is based in libosip.
 
 	  http://savannah.nongnu.org/projects/exosip/
diff --git a/package/libgeotiff/Config.in b/package/libgeotiff/Config.in
--- a/package/libgeotiff/Config.in
+++ b/package/libgeotiff/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LIBGEOTIFF
-       bool "libgeotiff"
-       select BR2_PACKAGE_TIFF
-       help
-         Libgeotiff is an open source library normally hosted on top of
-         libtiff for reading, and writing GeoTIFF information tags.
+	bool "libgeotiff"
+	select BR2_PACKAGE_TIFF
+	help
+	  Libgeotiff is an open source library normally hosted on top of
+	  libtiff for reading, and writing GeoTIFF information tags.
 
-         http://geotiff.osgeo.org
+	  http://geotiff.osgeo.org
diff --git a/package/libiscsi/Config.in b/package/libiscsi/Config.in
--- a/package/libiscsi/Config.in
+++ b/package/libiscsi/Config.in
@@ -4,9 +4,9 @@ config BR2_PACKAGE_LIBISCSI
 	help
 	  Libiscsi is a client-side library to implement the iSCSI protocol
 	  that can be used to access resource of an iSCSI Target.
-	  
+
 	  The library is fully async with regards to iscsi commands and scsi
 	  tasks, but a sync layer is also provided for ease of use for simpler
 	  applications.
-	  
+
 	  https://github.com/sahlberg/libiscsi  (no proper homepage)
diff --git a/package/libmms/Config.in b/package/libmms/Config.in
--- a/package/libmms/Config.in
+++ b/package/libmms/Config.in
@@ -4,11 +4,11 @@ config BR2_PACKAGE_LIBMMS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
-          LibMMS is a common library for parsing mms:// and mmsh://
-          type network streams. These are commonly used to stream
-          Windows Media Video content over the web. LibMMS itself is
-          only for receiving MMS stream, it doesn't handle sending at
-          all.
+	  LibMMS is a common library for parsing mms:// and mmsh://
+	  type network streams. These are commonly used to stream
+	  Windows Media Video content over the web. LibMMS itself is
+	  only for receiving MMS stream, it doesn't handle sending at
+	  all.
 
 	  http://launchpad.net/libmms
 
diff --git a/package/libseccomp/Config.in b/package/libseccomp/Config.in
--- a/package/libseccomp/Config.in
+++ b/package/libseccomp/Config.in
@@ -3,12 +3,12 @@ config BR2_PACKAGE_LIBSECCOMP
 	depends on BR2_i386 || BR2_x86_64
 	help
 	  High level interface to the Linux Kernel's seccomp filter
-	  
+
 	  The libseccomp library provides an easy to use, platform independent,
 	  interface to the Linux Kernel's syscall filtering mechanism: seccomp.
 	  The libseccomp API is designed to abstract away the underlying BPF
 	  based syscall filter language and present a more conventional
 	  function-call based filtering interface that should be familiar to,
 	  and easily adopted by application developers.
-	  
+
 	  http://sourceforge.net/projects/libseccomp/
diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -60,4 +60,4 @@ comment "v4l2-dbg needs a toolchain w/ C
 endif
 
 comment "libv4l needs a toolchain w/ largefile, threads"
-        depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libxml-parser-perl/Config.in b/package/libxml-parser-perl/Config.in
--- a/package/libxml-parser-perl/Config.in
+++ b/package/libxml-parser-perl/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LIBXML_PARSER_PERL
-       bool "libxml-parser-perl"
-       select BR2_PACKAGE_EXPAT
-       # Hide from configuration as we only support the host package
-       # for the moment
-       depends on BR2_HOST_ONLY
-       help
-         The Perl XML::Parser module.
+	bool "libxml-parser-perl"
+	select BR2_PACKAGE_EXPAT
+	# Hide from configuration as we only support the host package
+	# for the moment
+	depends on BR2_HOST_ONLY
+	help
+	  The Perl XML::Parser module.
 
-	 http://www.cpan.org/modules/by-module/XML/
+	  http://www.cpan.org/modules/by-module/XML/
 
diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -32,19 +32,19 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIF
 	  the iwlwifi kernel driver.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8
-       bool "Libertas SD 8686 v8"
-       help
-         Firmware files (version 8) for the Marvell SD8686 module
+	bool "Libertas SD 8686 v8"
+	help
+	  Firmware files (version 8) for the Marvell SD8686 module
 
 config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V9
-       bool "Libertas SD 8686 v9"
-       help
-         Firmware files (version 9) for the Marvell SD8686 module
+	bool "Libertas SD 8686 v9"
+	help
+	  Firmware files (version 9) for the Marvell SD8686 module
 
 config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8688
-       bool "Libertas SD 8688"
-       help
-         Firmware files for the Marvell SD8688 module
+	bool "Libertas SD 8688"
+	help
+	  Firmware files for the Marvell SD8688 module
 
 config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787
 	bool "Marvell Wifi-Ex SD 8787"
diff --git a/package/lite/Config.in b/package/lite/Config.in
--- a/package/lite/Config.in
+++ b/package/lite/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LITE
 	bool "LiTE (toolbox engine)"
 	depends on BR2_PACKAGE_DIRECTFB
 	help
-	   LiTE stands for LiTE is a Toolbox Engine. 
+	   LiTE stands for LiTE is a Toolbox Engine.
 	   Its role is to facilitate the functions of DirectFB so that a
 	   toolbox could be written on top of DirectFB with less effort.
 	   As such LiTE has abstractions for the underlying graphics and
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_LIBGLIB2
-	# libglib2 needs thread support and gettext which needs wchar support, and 
+	# libglib2 needs thread support and gettext which needs wchar support, and
 	# we also depends on util-linux which needs wchar
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/makedevs/Config.in b/package/makedevs/Config.in
--- a/package/makedevs/Config.in
+++ b/package/makedevs/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_MAKEDEVS
-       bool "makedevs"
-       help
-         The makedevs utility allows to create a set of device files
-         according to a configuration file.
\ No newline at end of file
+	bool "makedevs"
+	help
+	  The makedevs utility allows to create a set of device files
+	  according to a configuration file.
diff --git a/package/memtester/Config.in b/package/memtester/Config.in
--- a/package/memtester/Config.in
+++ b/package/memtester/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_MEMTESTER
 	  http://pyropus.ca/software/memtester/
 
 comment "memtester needs a toolchain w/ largefile"
-       depends on !BR2_LARGEFILE
+	depends on !BR2_LARGEFILE
diff --git a/package/monit/Config.in b/package/monit/Config.in
--- a/package/monit/Config.in
+++ b/package/monit/Config.in
@@ -11,4 +11,4 @@ config BR2_PACKAGE_MONIT
 	  http://mmonit.com/monit/
 
 comment "monit needs a toolchain w/ threads"
-       depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mtools/Config.in.host b/package/mtools/Config.in.host
--- a/package/mtools/Config.in.host
+++ b/package/mtools/Config.in.host
@@ -5,5 +5,5 @@ config BR2_PACKAGE_HOST_MTOOLS
 	  Unix without mounting them. It supports Win'95 style long file
 	  names, OS/2 Xdf disks and 2m disks (store up to 1992k on a high
 	  density 3 1/2 disk).
-	  
+
 	  http://www.tux.org/pub/tux/mtools/
diff --git a/package/php/Config.in b/package/php/Config.in
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -12,16 +12,16 @@ if BR2_PACKAGE_PHP
 source "package/php/Config.ext"
 
 config BR2_PACKAGE_PHP_CLI
-       bool
+	bool
 
 config BR2_PACKAGE_PHP_CGI
-       bool
+	bool
 
 choice
-        prompt "Interface"
-        default BR2_PACKAGE_PHP_SAPI_CGI
-        help
-          Select the PHP interface(s).
+	prompt "Interface"
+	default BR2_PACKAGE_PHP_SAPI_CGI
+	help
+	  Select the PHP interface(s).
 
 config BR2_PACKAGE_PHP_SAPI_CGI
 	bool "CGI"
@@ -32,13 +32,13 @@ config BR2_PACKAGE_PHP_SAPI_CGI
 	  Common Gateway Interface
 
 config BR2_PACKAGE_PHP_SAPI_CLI
-        bool "CLI"
+	bool "CLI"
 	select BR2_PACKAGE_PHP_CLI
-        help
-          Command Line Interface
+	help
+	  Command Line Interface
 
 config BR2_PACKAGE_PHP_SAPI_CLI_CGI
-        bool "CGI and CLI"
+	bool "CGI and CLI"
 	# CGI uses fork()
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_PHP_CLI
diff --git a/package/python-pyparsing/Config.in b/package/python-pyparsing/Config.in
--- a/package/python-pyparsing/Config.in
+++ b/package/python-pyparsing/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_PYTHON_PYPARSING
 	  or the use of regular expressions. The pyparsing module provides
 	  a library of classes that client code uses to construct the grammar
 	  directly in Python code.
-	  
+
 	  http://pyparsing.wikispaces.com/
diff --git a/package/sawman/Config.in b/package/sawman/Config.in
--- a/package/sawman/Config.in
+++ b/package/sawman/Config.in
@@ -2,11 +2,11 @@ config BR2_PACKAGE_SAWMAN
 	bool "SawMan (Window Manager)"
 	depends on BR2_PACKAGE_DIRECTFB
 	help
-	  SaWMan is a new window manager module for use with DirectFB. 
-          Its main difference to the default module is that it allows 
-          one process to be an application and window manager, 
-          implementing all kinds of diversity, while SaWMan is only the 
-          working horse.
+	  SaWMan is a new window manager module for use with DirectFB.
+	  Its main difference to the default module is that it allows
+	  one process to be an application and window manager,
+	  implementing all kinds of diversity, while SaWMan is only the
+	  working horse.
 
-	   See http://www.directfb.org/downloads/Extras/README.SaWMan
+	  See http://www.directfb.org/downloads/Extras/README.SaWMan
 
diff --git a/package/slirp/Config.in b/package/slirp/Config.in
--- a/package/slirp/Config.in
+++ b/package/slirp/Config.in
@@ -6,12 +6,12 @@ config BR2_PACKAGE_SLIRP
 	  The Spice project deals with both the virtualized devices
 	  and the front-end. Interaction between front-end and
 	  back-end is done using VD-Interfaces.
-	  
+
 	  This package implements the slirp-part for Spice.
 	  Slirp emulates a PPP or SLIP connection over a normal terminal.
-	  
+
 	  http://www.spice-space.org/
-	  
+
 	  NOTE:
 	  This package has some history of a unique kind:
 	    - originally developped as 'slirp' by Danny Gasparovski, and
diff --git a/package/snowball-hdmiservice/Config.in b/package/snowball-hdmiservice/Config.in
--- a/package/snowball-hdmiservice/Config.in
+++ b/package/snowball-hdmiservice/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_SNOWBALL_HDMISERVICE
 	bool "snowball-hdmiservice"
-	depends on BR2_TOOLCHAIN_HAS_THREADS	
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  HDMI userspace control daemon
 
-	  This package contains the HDMI userspace control daemon for the 
+	  This package contains the HDMI userspace control daemon for the
 	  snowball board
-	  
+
 	  http://www.igloocommunity.org
diff --git a/package/speex/Config.in b/package/speex/Config.in
--- a/package/speex/Config.in
+++ b/package/speex/Config.in
@@ -9,9 +9,9 @@ config BR2_PACKAGE_SPEEX
 	  http://www.speex.org/
 
 config BR2_PACKAGE_SPEEX_ARM4
-       bool
-       default y
-       depends on BR2_PACKAGE_SPEEX && (BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_strongarm || BR2_fa526)
+	bool
+	default y
+	depends on BR2_PACKAGE_SPEEX && (BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_strongarm || BR2_fa526)
 
 config BR2_PACKAGE_SPEEX_ARM5E
 	default y
diff --git a/package/spice-protocol/Config.in b/package/spice-protocol/Config.in
--- a/package/spice-protocol/Config.in
+++ b/package/spice-protocol/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_SPICE_PROTOCOL
 	  The Spice project deals with both the virtualized devices
 	  and the front-end. Interaction between front-end and
 	  back-end is done using VD-Interfaces.
-	  
+
 	  This package implements the protocol-part of Spice.
-	  
+
 	  http://www.spice-space.org/
diff --git a/package/spice/Config.in b/package/spice/Config.in
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -19,9 +19,9 @@ config BR2_PACKAGE_SPICE
 	  The Spice project deals with both the virtualized devices
 	  and the front-end. Interaction between front-end and
 	  back-end is done using VD-Interfaces.
-	  
+
 	  This package implements the server-part of Spice.
-	  
+
 	  http://www.spice-space.org/
 
 if BR2_PACKAGE_SPICE
diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -11,29 +11,29 @@ config BR2_PACKAGE_SQUASHFS
 if BR2_PACKAGE_SQUASHFS
 
 config BR2_PACKAGE_SQUASHFS_GZIP
-       bool "gzip support"
-       default y
-       select BR2_PACKAGE_ZLIB
-       help
-         Support GZIP compression algorithm
+	bool "gzip support"
+	default y
+	select BR2_PACKAGE_ZLIB
+	help
+	  Support GZIP compression algorithm
 
 config BR2_PACKAGE_SQUASHFS_LZMA
-       bool "lzma support"
-       select BR2_PACKAGE_XZ
-       help
-         Support LZMA compression algorithm
+	bool "lzma support"
+	select BR2_PACKAGE_XZ
+	help
+	  Support LZMA compression algorithm
 
 config BR2_PACKAGE_SQUASHFS_LZO
-       bool "lzo support"
-       select BR2_PACKAGE_LZO
-       help
-         Support LZO compression algorithm
+	bool "lzo support"
+	select BR2_PACKAGE_LZO
+	help
+	  Support LZO compression algorithm
 
 config BR2_PACKAGE_SQUASHFS_XZ
-       bool "xz support"
-       select BR2_PACKAGE_XZ
-       help
-         Support XZ compression algorithm
+	bool "xz support"
+	select BR2_PACKAGE_XZ
+	help
+	  Support XZ compression algorithm
 
 endif
 
diff --git a/package/sysstat/Config.in b/package/sysstat/Config.in
--- a/package/sysstat/Config.in
+++ b/package/sysstat/Config.in
@@ -4,38 +4,38 @@ config BR2_PACKAGE_SYSSTAT
 	# Uses fork()
 	depends on BR2_USE_MMU
 	help
-          The sysstat utilities are a collection of performance
-          monitoring tools for Linux. These include sar, sadf, mpstat,
-          iostat, pidstat and sa tools.
+	  The sysstat utilities are a collection of performance
+	  monitoring tools for Linux. These include sar, sadf, mpstat,
+	  iostat, pidstat and sa tools.
 
-          Some Features :
+	  Some Features :
 
-           * Input / Output and transfer rate statistics (global, per
-             device, per partition, per network filesystem and per
-             Linux task / PID)
-           * CPU statistics (global, per CPU and per Linux task /
-             PID), including support for virtualization architectures
-           * Memory and swap space utilization statistics
-           * Virtual memory, paging and fault statistics
-           * Per-task (per-PID) memory and page fault statistics
-           * Global CPU and page fault statistics for tasks and all
-             their children
-           * Process creation activity
-           * Interrupt statistics (global, per CPU and per interrupt,
-             including potential APIC interrupt sources)
-           * Extensive network statistics: network interface activity
-             (number of packets and kB received and transmitted per
-             second, etc.) including failures from network devices;
-             network traffic statistics for IP, TCP, ICMP and UDP
-             protocols based on SNMPv2 standards; support for
-             IPv6-related protocols.
-           * NFS server and client activity
-           * Socket statistics
-           * Run queue and system load statistics
-           * Kernel internal tables utilization statistics
-           * System and per Linux task switching activity
-           * Swapping statistics
-           * TTY device activity
-           * Power management statistics
+	   * Input / Output and transfer rate statistics (global, per
+	     device, per partition, per network filesystem and per
+	     Linux task / PID)
+	   * CPU statistics (global, per CPU and per Linux task /
+	     PID), including support for virtualization architectures
+	   * Memory and swap space utilization statistics
+	   * Virtual memory, paging and fault statistics
+	   * Per-task (per-PID) memory and page fault statistics
+	   * Global CPU and page fault statistics for tasks and all
+	     their children
+	   * Process creation activity
+	   * Interrupt statistics (global, per CPU and per interrupt,
+	     including potential APIC interrupt sources)
+	   * Extensive network statistics: network interface activity
+	     (number of packets and kB received and transmitted per
+	     second, etc.) including failures from network devices;
+	     network traffic statistics for IP, TCP, ICMP and UDP
+	     protocols based on SNMPv2 standards; support for
+	     IPv6-related protocols.
+	   * NFS server and client activity
+	   * Socket statistics
+	   * Run queue and system load statistics
+	   * Kernel internal tables utilization statistics
+	   * System and per Linux task switching activity
+	   * Swapping statistics
+	   * TTY device activity
+	   * Power management statistics
 
 	  http://pagesperso-orange.fr/sebastien.godard/
diff --git a/package/taglib/Config.in b/package/taglib/Config.in
--- a/package/taglib/Config.in
+++ b/package/taglib/Config.in
@@ -4,9 +4,9 @@ config BR2_PACKAGE_TAGLIB
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  TagLib is a library for reading and editing the meta-data of
-          several popular audio formats. Currently it supports both ID3v1
-          and ID3v2 for MP3 files, Ogg Vorbis comments and ID3 tags and
-          Vorbis comments in FLAC, MPC, Speex, WavPack and TrueAudio files.
+	  several popular audio formats. Currently it supports both ID3v1
+	  and ID3v2 for MP3 files, Ogg Vorbis comments and ID3 tags and
+	  Vorbis comments in FLAC, MPC, Speex, WavPack and TrueAudio files.
 
 	  http://taglib.github.com
 
diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -39,7 +39,7 @@ choice
 config BR2_PACKAGE_TI_GFX_ES3
 	bool "es3.x (OMAP35xx, AM35xx Rev 3.1+)"
 	help
-	 OMAP35xx, AM35xx Rev 3.1+
+	  OMAP35xx, AM35xx Rev 3.1+
 
 config BR2_PACKAGE_TI_GFX_ES5
 	bool "es5.x (AM37xx, DM37xx)"
diff --git a/package/tremor/Config.in b/package/tremor/Config.in
--- a/package/tremor/Config.in
+++ b/package/tremor/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_TREMOR
 	bool "tremor (fixed point vorbis decoder)"
 	help
 	  Tremor is a fixed point implementation of an Ogg Vorbis
-          decoder. It provides a decoding API similar to libvorbis,
-          but gives much better performance on systems without a
-          floating-point unit.
+	  decoder. It provides a decoding API similar to libvorbis,
+	  but gives much better performance on systems without a
+	  floating-point unit.
diff --git a/package/usbredir/Config.in b/package/usbredir/Config.in
--- a/package/usbredir/Config.in
+++ b/package/usbredir/Config.in
@@ -10,10 +10,10 @@ config BR2_PACKAGE_USBREDIR
 	  traffic over a network connection. It is also the name of the
 	  software package offering a parsing library, a usbredirhost library
 	  and several utilities implementing this protocol.
-	  
+
 	  Note: only the library is installed, not the utilities. Say 'y'
 	  below if you want the server too.
-	  
+
 	  http://www.spice-space.org/page/UsbRedir
 
 if BR2_PACKAGE_USBREDIR
@@ -23,7 +23,7 @@ config BR2_PACKAGE_USBREDIR_SERVER
 	help
 	  If you want to serve usbredir requests on your target, say 'y'
 	  here to have the usbredir server on the target.
-	  
+
 	  Note: the server is not required to use the library.
 
 endif
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -154,7 +154,7 @@ config BR2_PACKAGE_UTIL_LINUX_UTMPDUMP
 config BR2_PACKAGE_UTIL_LINUX_UUIDD
 	bool "uuidd"
 	help
-	 UUID generation daemon
+	  UUID generation daemon
 
 config BR2_PACKAGE_UTIL_LINUX_WALL
 	bool "wall"
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -263,4 +263,4 @@ if BR2_PACKAGE_XORG7
 endif
 
 comment "X.org needs a toolchain w/ wchar, threads"
-        depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/x11r7/xdriver_xf86-input-evdev/Config.in b/package/x11r7/xdriver_xf86-input-evdev/Config.in
--- a/package/x11r7/xdriver_xf86-input-evdev/Config.in
+++ b/package/x11r7/xdriver_xf86-input-evdev/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_EV
 	  Generic Linux input driver
 
 comment "xf86-input-evdev requires udev to be enabled"
-        depends on !BR2_PACKAGE_UDEV
+	depends on !BR2_PACKAGE_UDEV
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -90,14 +90,14 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_K
 endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_NULL_CURSOR
-    bool "Null root cursor"
-    help
-        Don't display root cursor.
+	bool "Null root cursor"
+	help
+	  Don't display root cursor.
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX
-    bool "Enable AIGLX Extension"
-    help
-        Enable/Use AIGLX extension.
+	bool "Enable AIGLX Extension"
+	help
+	  Enable/Use AIGLX extension.
 
 if BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
 
@@ -131,8 +131,8 @@ endif
 comment "Optional Servers"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB
-    bool "Xvfb server"
-    help
-        Virtual frame buffer X server.
+	bool "Xvfb server"
+	help
+	  Virtual frame buffer X server.
 
 endif
diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -46,56 +46,56 @@ config BR2_PACKAGE_XENOMAI_VERSION
 	  Kernel -> Linux Kernel Extensions menu.
 
 config BR2_PACKAGE_XENOMAI_TESTSUITE
-       bool "Install testsuite"
-       help
-         This option allows to install the Xenomai test programs.
+	bool "Install testsuite"
+	help
+	  This option allows to install the Xenomai test programs.
 
 config BR2_PACKAGE_XENOMAI_RTCAN
-       bool "RTCan utilities"
-       help
-         This option allows to install the Xenomai RT-CAN utilities.
+	bool "RTCan utilities"
+	help
+	  This option allows to install the Xenomai RT-CAN utilities.
 
 config BR2_PACKAGE_XENOMAI_ANALOGY
-       bool "Analogy libs and utils"
-       help
-         This option allows to install the Xenomai Analogy utilities
-         and libraries
+	bool "Analogy libs and utils"
+	help
+	  This option allows to install the Xenomai Analogy utilities
+	  and libraries
 
 config BR2_PACKAGE_XENOMAI_NATIVE_SKIN
-       bool "Native skin library"
-       default y
-       help
-	 This option allows to install the Native Xenomai skin
+	bool "Native skin library"
+	default y
+	help
+	  This option allows to install the Native Xenomai skin
 
 config BR2_PACKAGE_XENOMAI_POSIX_SKIN
-       bool "POSIX skin library"
-       default y
-       help
-	 This option allows to install the POSIX Xenomai skin
+	bool "POSIX skin library"
+	default y
+	help
+	  This option allows to install the POSIX Xenomai skin
 
 config BR2_PACKAGE_XENOMAI_VXWORKS_SKIN
-       bool "VX-Works skin library"
-       help
-	 This option allows to install the VX-Works Xenomai skin
+	bool "VX-Works skin library"
+	help
+	  This option allows to install the VX-Works Xenomai skin
 
 config BR2_PACKAGE_XENOMAI_PSOS_SKIN
-       bool "PSOS skin library"
-       help
-	 This option allows to install the PSOS Xenomai skin
+	bool "PSOS skin library"
+	help
+	  This option allows to install the PSOS Xenomai skin
 
 config BR2_PACKAGE_XENOMAI_RTAI_SKIN
-       bool "RTAI skin library"
-       help
-	 This option allows to install the RTAI Xenomai skin
+	bool "RTAI skin library"
+	help
+	  This option allows to install the RTAI Xenomai skin
 
 config BR2_PACKAGE_XENOMAI_UITRON_SKIN
-       bool "uiTron skin library"
-       help
-	 This option allows to install the uiTron Xenomai skin
+	bool "uiTron skin library"
+	help
+	  This option allows to install the uiTron Xenomai skin
 
 config BR2_PACKAGE_XENOMAI_VRTX_SKIN
-       bool "VRTX skin library"
-       help
-	 This option allows to install the VRTX Xenomai skin
+	bool "VRTX skin library"
+	help
+	  This option allows to install the VRTX Xenomai skin
 
 endif
diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -3,7 +3,7 @@ comment "Note that xfsprogs needs a tool
 	depends on BR2_PACKAGE_XFSPROGS
 
 comment "xfsprogs needs a toolchain w/ largefile, wchar"
-        depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
 
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
diff --git a/system/Config.in b/system/Config.in
--- a/system/Config.in
+++ b/system/Config.in
@@ -1,16 +1,16 @@
 menu "System configuration"
 
 config BR2_TARGET_GENERIC_HOSTNAME
-       string "System hostname"
-       default "buildroot"
-       help
-         Select system hostname to be stored in /etc/hostname.
+	string "System hostname"
+	default "buildroot"
+	help
+	  Select system hostname to be stored in /etc/hostname.
 
 config BR2_TARGET_GENERIC_ISSUE
-       string "System banner"
-       default "Welcome to Buildroot"
-       help
-         Select system banner (/etc/issue) to be displayed at login.
+	string "System banner"
+	default "Welcome to Buildroot"
+	help
+	  Select system banner (/etc/issue) to be displayed at login.
 
 choice
 	bool "Passwords encoding"
@@ -200,8 +200,8 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
 	  .config file or the build log may be distributed!
 
 config BR2_TARGET_GENERIC_GETTY
-       bool "Run a getty (login prompt) after boot"
-       default y
+	bool "Run a getty (login prompt) after boot"
+	default y
 
 if BR2_TARGET_GENERIC_GETTY
 menu "getty options"
@@ -218,7 +218,7 @@ choice
 	  Select a baudrate to use.
 
 config BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP
-       bool "keep kernel default"
+	bool "keep kernel default"
 config BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600
 	bool "9600"
 config BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -478,14 +478,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCE
 	  from Mentor Graphics. It uses gcc 4.7.2, binutils 2.23.51,
 	  glibc 2.16, uClibc 0.9.30, gdb 7.4.50 and kernel headers
 	  3.5.4. It has support for the following variants:
-            - SH4A, glibc, little endian
-              Default.
-            - SH4A, glibc, big endian
-              Add -mb to BR2_TARGET_OPTIMIZATION
-            - SH4A, uClibc, little endian
-              Not usable in Buildroot yet.
-            - SH4A, uClibc, big endian
-              Not usable in Buildroot yet.
+	    - SH4A, glibc, little endian
+	      Default.
+	    - SH4A, glibc, big endian
+	      Add -mb to BR2_TARGET_OPTIMIZATION
+	    - SH4A, uClibc, little endian
+	      Not usable in Buildroot yet.
+	    - SH4A, uClibc, big endian
+	      Not usable in Buildroot yet.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
 	bool "Sourcery CodeBench SH 2012.03"
@@ -499,14 +499,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCE
 	  from Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53,
 	  glibc 2.15, uClibc 0.9.30, gdb 7.2.50 and kernel headers
 	  3.2.10. It has support for the following variants:
-            - SH4A, glibc, little endian
-              Default.
-            - SH4A, glibc, big endian
-              Add -mb to BR2_TARGET_OPTIMIZATION
-            - SH4A, uClibc, little endian
-              Not usable in Buildroot yet.
-            - SH4A, uClibc, big endian
-              Not usable in Buildroot yet.
+	    - SH4A, glibc, little endian
+	      Default.
+	    - SH4A, glibc, big endian
+	      Add -mb to BR2_TARGET_OPTIMIZATION
+	    - SH4A, uClibc, little endian
+	      Not usable in Buildroot yet.
+	    - SH4A, uClibc, big endian
+	      Not usable in Buildroot yet.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	bool "Sourcery CodeBench SH 2011.03"
@@ -993,28 +993,28 @@ config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER
 # always installed. When a different binary format is used, we offer the option
 # of installing the FDPIC shared libraries.
 config BR2_BFIN_INSTALL_FDPIC_SHARED
-       bool "Install FDPIC shared libraries"
-       depends on BR2_bfin && !BR2_BINFMT_FDPIC
-       help
-         The Linux kernel supports running both FDPIC and FLAT applications
-         concurrently if the binary format specific libraries are installed
-         properly. This option allows developer to install FDPIC libraries
-         into a buildroot rootfs image built with binary format that is not
-         FDPIC.
+	bool "Install FDPIC shared libraries"
+	depends on BR2_bfin && !BR2_BINFMT_FDPIC
+	help
+	  The Linux kernel supports running both FDPIC and FLAT applications
+	  concurrently if the binary format specific libraries are installed
+	  properly. This option allows developer to install FDPIC libraries
+	  into a buildroot rootfs image built with binary format that is not
+	  FDPIC.
 
 # When the FLAT shared binary format is used, we force the installation
 # of the corresponding libraries. When a different binary format is
 # used, we offer the option of installing the FLAT shared libraries.
 config BR2_BFIN_INSTALL_FLAT_SHARED
-       bool "Install FLAT shared libraries" if !BR2_BINFMT_FLAT_SHARED
-       depends on BR2_bfin
-       default y if BR2_BINFMT_FLAT_SHARED
-       help
-         The Linux kernel supports running both FDPIC and FLAT applications
-         concurrently if the binary format specific libraries are installed
-         properly. This option allows developer to install FLAT libraries
-         into a buildroot rootfs image built with binary format that is not
-         shared FLAT.
+	bool "Install FLAT shared libraries" if !BR2_BINFMT_FLAT_SHARED
+	depends on BR2_bfin
+	default y if BR2_BINFMT_FLAT_SHARED
+	help
+	  The Linux kernel supports running both FDPIC and FLAT applications
+	  concurrently if the binary format specific libraries are installed
+	  properly. This option allows developer to install FLAT libraries
+	  into a buildroot rootfs image built with binary format that is not
+	  shared FLAT.
 
 endif # BR2_TOOLCHAIN_EXTERNAL
 
