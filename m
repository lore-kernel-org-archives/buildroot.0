From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Aug 2019 16:28:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 4.2
In-Reply-To: <20190806210337.14319-1-bernd.kuhls@t-online.de>
References: <20190806210337.14319-1-bernd.kuhls@t-online.de>
Message-ID: <20190807162856.29fe55c0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  6 Aug 2019 23:03:37 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Updated license hash after three upstream commits:
> http://git.videolan.org/?p=ffmpeg.git;a=history;f=LICENSE.md;h=c7d6bf7121d8811b36ee2a4ae6b810c072ed70e4;hb=refs/heads/release/4.2
> 
> Build-tested using this defconfig:
> BR2_x86_64=y
> BR2_x86_core2=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2019.05.1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_PACKAGE_FFMPEG_NONFREE=y
> BR2_PACKAGE_FFMPEG_FFPLAY=y
> BR2_PACKAGE_FFMPEG_FFPROBE=y
> BR2_PACKAGE_FFMPEG_POSTPROC=y
> BR2_PACKAGE_GSTREAMER=y
> BR2_PACKAGE_GST_FFMPEG=y
> BR2_PACKAGE_GST_FFMPEG_GPL=y
> BR2_PACKAGE_GSTREAMER1=y
> BR2_PACKAGE_GST1_LIBAV=y
> BR2_PACKAGE_LAME=y
> BR2_PACKAGE_MOTION=y
> BR2_PACKAGE_MPD=y
> BR2_PACKAGE_MPD_FFMPEG=y
> BR2_PACKAGE_MPV=y
> BR2_PACKAGE_SQUEEZELITE=y
> BR2_PACKAGE_VLC=y
> BR2_PACKAGE_WAVPACK=y
> BR2_PACKAGE_FREERDP=y
> BR2_PACKAGE_QT5=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_AUBIO=y
> BR2_PACKAGE_FDK_AAC=y
> BR2_PACKAGE_LIBMODPLUG=y
> BR2_PACKAGE_LIBSOXR=y
> BR2_PACKAGE_OPUS=y
> BR2_PACKAGE_FONTCONFIG=y
> BR2_PACKAGE_LIBDRM=y
> BR2_PACKAGE_OPENCV3=y
> BR2_PACKAGE_OPENCV3_WITH_FFMPEG=y
> BR2_PACKAGE_OPENJPEG=y
> BR2_PACKAGE_DAV1D=y
> BR2_PACKAGE_LIBASS=y
> BR2_PACKAGE_LIBBLURAY=y
> BR2_PACKAGE_LIBOPENH264=y
> BR2_PACKAGE_LIBTHEORA=y
> BR2_PACKAGE_LIBYUV=y
> BR2_PACKAGE_MEDIASTREAMER=y
> BR2_PACKAGE_X265=y
> BR2_PACKAGE_RTMPDUMP=y
> BR2_PACKAGE_FETCHMAIL=y
> BR2_PACKAGE_FREESWITCH=y
> BR2_PACKAGE_GERBERA=y
> BR2_PACKAGE_MINIDLNA=y
> BR2_PACKAGE_TVHEADEND=y
> BR2_PACKAGE_TVHEADEND_TRANSCODING=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/ffmpeg.hash | 4 ++--
>  package/ffmpeg/ffmpeg.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
