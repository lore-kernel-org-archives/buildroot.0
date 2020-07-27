From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 18:19:27 +0200
Subject: [Buildroot] [PATCHv3 1/6] configs/imx6ullevk_defconfig: remove
 typo
In-Reply-To: <20200727155127.2703286-1-romain.naour@gmail.com>
References: <20200727155127.2703286-1-romain.naour@gmail.com>
Message-ID: <20200727161927.GF19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-07-27 17:51 +0200, Romain Naour spake thusly:
> Reported by check-dotconfig.py.
> 
> Fixes:
> https://gitlab.com/kubu93/buildroot/-/jobs/657885169
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Whole series applied to master, thanks.

Please see my reply to patch 4 for specific comments on that one.

Regards,
Yann E. MORIN.

> ---
>  configs/imx6ullevk_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/imx6ullevk_defconfig b/configs/imx6ullevk_defconfig
> index 4a5558dd6c..81db66268a 100644
> --- a/configs/imx6ullevk_defconfig
> +++ b/configs/imx6ullevk_defconfig
> @@ -23,7 +23,7 @@ BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
> -BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y"
> +BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  
>  # required tools to create the SD card image
> -- 
> 2.25.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
