From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 29 Mar 2014 10:49:32 +0100
Subject: [Buildroot] [PATCH 1/1] xbmc: needs host-gawk
In-Reply-To: <1396068232-9273-1-git-send-email-bluemrp9@gmail.com>
References: <1396068232-9273-1-git-send-email-bluemrp9@gmail.com>
Message-ID: <CAGduivyEy3Zy-wD5R6Ts3eOUfXtdmaqoJD9pCHhV-42V2y7T9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan, all
On Sat, Mar 29, 2014 at 5:43 AM, Ryan Coe <bluemrp9@gmail.com> wrote:
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>  package/xbmc/xbmc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index 6dbbb7d..1aa823c 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -12,7 +12,7 @@ XBMC_LICENSE_FILES = LICENSE.GPL
>  # called TexturePacker. It is responsible to take all the images used in the
>  # GUI and pack them in a blob.
>  # http://wiki.xbmc.org/index.php?title=TexturePacker
> -XBMC_DEPENDENCIES = host-gperf host-lzo host-sdl_image host-swig
> +XBMC_DEPENDENCIES = host-gperf host-lzo host-sdl_image host-swig host-gawk
>  XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
>         libass libcdio libcurl libfribidi libgcrypt libmad libmodplug libmpeg2 \
>         libogg libplist libpng libsamplerate libungif libvorbis libxml2 lzo ncurses \
> --
> 1.9.1
>
Just to nitpick, but could you keep the dependencies sorted ?
Thanks
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
