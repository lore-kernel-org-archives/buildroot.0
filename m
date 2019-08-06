From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  6 Aug 2019 23:03:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 4.2
Message-ID: <20190806210337.14319-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated license hash after three upstream commits:
http://git.videolan.org/?p=ffmpeg.git;a=history;f=LICENSE.md;h=c7d6bf7121d8811b36ee2a4ae6b810c072ed70e4;hb=refs/heads/release/4.2

Build-tested using this defconfig:
BR2_x86_64=y
BR2_x86_core2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2019.05.1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_FFMPEG_NONFREE=y
BR2_PACKAGE_FFMPEG_FFPLAY=y
BR2_PACKAGE_FFMPEG_FFPROBE=y
BR2_PACKAGE_FFMPEG_POSTPROC=y
BR2_PACKAGE_GSTREAMER=y
BR2_PACKAGE_GST_FFMPEG=y
BR2_PACKAGE_GST_FFMPEG_GPL=y
BR2_PACKAGE_GSTREAMER1=y
BR2_PACKAGE_GST1_LIBAV=y
BR2_PACKAGE_LAME=y
BR2_PACKAGE_MOTION=y
BR2_PACKAGE_MPD=y
BR2_PACKAGE_MPD_FFMPEG=y
BR2_PACKAGE_MPV=y
BR2_PACKAGE_SQUEEZELITE=y
BR2_PACKAGE_VLC=y
BR2_PACKAGE_WAVPACK=y
BR2_PACKAGE_FREERDP=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_AUBIO=y
BR2_PACKAGE_FDK_AAC=y
BR2_PACKAGE_LIBMODPLUG=y
BR2_PACKAGE_LIBSOXR=y
BR2_PACKAGE_OPUS=y
BR2_PACKAGE_FONTCONFIG=y
BR2_PACKAGE_LIBDRM=y
BR2_PACKAGE_OPENCV3=y
BR2_PACKAGE_OPENCV3_WITH_FFMPEG=y
BR2_PACKAGE_OPENJPEG=y
BR2_PACKAGE_DAV1D=y
BR2_PACKAGE_LIBASS=y
BR2_PACKAGE_LIBBLURAY=y
BR2_PACKAGE_LIBOPENH264=y
BR2_PACKAGE_LIBTHEORA=y
BR2_PACKAGE_LIBYUV=y
BR2_PACKAGE_MEDIASTREAMER=y
BR2_PACKAGE_X265=y
BR2_PACKAGE_RTMPDUMP=y
BR2_PACKAGE_FETCHMAIL=y
BR2_PACKAGE_FREESWITCH=y
BR2_PACKAGE_GERBERA=y
BR2_PACKAGE_MINIDLNA=y
BR2_PACKAGE_TVHEADEND=y
BR2_PACKAGE_TVHEADEND_TRANSCODING=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.hash | 4 ++--
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index f27eaa5706..e648bbf0b0 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 f1f049a82fcfbf156564e73a3935d7e750891fab2abf302e735104fd4050a7e1  ffmpeg-4.1.4.tar.xz
+sha256 023f10831a97ad93d798f53a3640e55cd564abfeba807ecbe8524dac4fedecd5  ffmpeg-4.2.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256 b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
-sha256 73d99bc83313fff665b426d6672b4e0479102bc402fe22314ac9ce94a38aa5ff  LICENSE.md
+sha256 cad1218c22121b169fb1380178ab7a0b33cb38a3ff6d3915b8533d1d954f3ce7  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 21fb24e597..b1eb29dfd7 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 4.1.4
+FFMPEG_VERSION = 4.2
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.20.1
