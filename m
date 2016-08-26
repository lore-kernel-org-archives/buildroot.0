From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 21:47:40 +0200
Subject: [Buildroot] [PATCH/next v5 6/6] package/vlc: add support for
 ffmpeg 3.0
In-Reply-To: <1471273421-12076-6-git-send-email-bernd.kuhls@t-online.de>
References: <1471273421-12076-1-git-send-email-bernd.kuhls@t-online.de>
 <1471273421-12076-6-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160826214740.2bd4dfee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Aug 2016 17:03:41 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v5: first release
>     instead of bumping vlc to git master (no vlc 3.x release yet) we use
>     a patch from deb-multimedia.org which provides the necessary changes
>     for ffmpeg 3.x support to vlc 2.2, compile-tested using this
>     defconfig:
> 
>     BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
>     BR2_TOOLCHAIN_BUILDROOT_CXX=y
>     BR2_PACKAGE_FFMPEG=y
>     BR2_PACKAGE_FFMPEG_GPL=y
>     BR2_PACKAGE_FFMPEG_POSTPROC=y
>     BR2_PACKAGE_FFMPEG_SWSCALE=y
>     BR2_PACKAGE_VLC=y
> 
>     This patch can be removed when vlc is bumped to 3.x.

Why is this very useful explanation below the "---" and the commit log
empty? It's a bit sad to write such a useful explanation, and lose it
when the patch is applied.

So I've moved this explanation up in the commit log, and applied to
next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
