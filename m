From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 18 Mar 2020 15:51:08 +0100
Subject: [Buildroot] [PATCH v3 5/5] DEVELOPERS: add me as a
 co-maintainer for rk3399 based targets
In-Reply-To: <1584539153-12934-6-git-send-email-sunil@amarulasolutions.com>
References: <1581590685-31680-2-git-send-email-sunil@amarulasolutions.com>
 <1584539153-12934-1-git-send-email-sunil@amarulasolutions.com>
 <1584539153-12934-6-git-send-email-sunil@amarulasolutions.com>
Message-ID: <CAEyMn7aO8gmKywpsYxY+cAqsUGiL=oW9CfiZwtVi9L76-6us1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sunil,

Am Mi., 18. M?rz 2020 um 14:46 Uhr schrieb <sunil@amarulasolutions.com>:
>
> From: Suniel Mahesh <sunil@amarulasolutions.com>
>
> Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
> ---
> Changes for v3:
> New patch added to this series. Split one changeset from patch #4 and made
> it patch #5
>
> Changes for v2:
> didn't exist
>
>  DEVELOPERS | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 98220a9..faa72a4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1114,6 +1114,7 @@ N:        Ismael Luceno <ismael@iodev.co.uk>
>  F:     package/axel/
>
>  N:     Jagan Teki <jagan@amarulasolutions.com>
> +N:     Suniel Mahesh <sunil@amarulasolutions.com>

I think what you're are doing here will not work. You have to have
your own list of supported files or pathes. And put your name at the
right position in the DEVELOPERS file (alphabetically sorted).


>  F:     board/amarula/
>  F:     board/asus/
>  F:     board/bananapi/
> @@ -1129,6 +1130,7 @@ F:        board/orangepi/orangepi-prime/
>  F:     board/orangepi/orangepi-win/
>  F:     board/orangepi/orangepi-zero-plus2/
>  F:     board/pine64/
> +F:     board/firefly/
>  F:     configs/amarula_a64_relic_defconfig
>  F:     configs/amarula_vyasa_rk3288_defconfig
>  F:     configs/asus_tinker_rk3288_defconfig
> @@ -1151,6 +1153,7 @@ F:        configs/orangepi_win_defconfig
>  F:     configs/orangepi_zero_plus2_defconfig
>  F:     configs/pine64_defconfig
>  F:     configs/pine64_sopine_defconfig
> +F:     configs/roc_pc_rk3399_defconfig
>
>  N:     James Hilliard <james.hilliard1@gmail.com>
>  F:     package/gensio/
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Heiko
