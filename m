From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 19 Jan 2016 10:20:58 +0100
Subject: [Buildroot] [PATCH 76/80 v1] boot/barebox: use 'menuconfig'
In-Reply-To: <e94d00fc8b99d734b696db083f51e356d0623a91.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
 <e94d00fc8b99d734b696db083f51e356d0623a91.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <CAGm1_ksvPvg4qcE87dnp38mSWTb9tpyC+nPiEFzD_nGAUiGyoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 16, 2016 at 11:38 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> barebox has more than 5 options, so use a 'menuconfig' to
> group the options in an sub-menu.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  boot/barebox/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
> index 39cb5d2..f27afb6 100644
> --- a/boot/barebox/Config.in
> +++ b/boot/barebox/Config.in
> @@ -1,4 +1,4 @@
> -config BR2_TARGET_BAREBOX
> +menuconfig BR2_TARGET_BAREBOX
>         bool "Barebox"
>         help
>           The Barebox bootloader, formerly known as U-Boot v2.
> @@ -6,6 +6,7 @@ config BR2_TARGET_BAREBOX
>           http://www.barebox.org
>
>  if BR2_TARGET_BAREBOX
> +
>  choice
>         prompt "version"
>         help
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
