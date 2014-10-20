From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 20 Oct 2014 10:35:44 +0200
Subject: [Buildroot] [PATCH 02/31] libplayer: fix typo on BR2_nios2
In-Reply-To: <1413749285-1108-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1413749285-1108-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMKHn0Rf6YMoU5+E2YWKncBgOpWiHuDMozuLb668mVQzjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 19, 2014 at 10:07 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> libplayer is using BR2_nios, but it should be BR2_nios2.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Samuel Martin <s.martin49@gmail.com>

> ---
>  package/libplayer/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
> index 4f5404c..703b96d 100644
> --- a/package/libplayer/Config.in
> +++ b/package/libplayer/Config.in
> @@ -14,7 +14,7 @@ config BR2_PACKAGE_LIBPLAYER_MPLAYER
>         bool "mplayer backend"
>         # mplayer
>         depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb || \
> -                  BR2_microblaze || BR2_aarch64 || BR2_nios)
> +                  BR2_microblaze || BR2_aarch64 || BR2_nios2)
>         # mplayer
>         depends on BR2_LARGEFILE
>         # mplayer
> --
> 2.0.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Samuel
