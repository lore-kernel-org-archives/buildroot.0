From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 23:12:45 +0200
Subject: [Buildroot] [PATCH 1/2] configs/beaglebone_defconfig: bump
 U-Boot to 2020.04
In-Reply-To: <20200621141454.31391-1-heiko.thiery@gmail.com>
References: <20200621141454.31391-1-heiko.thiery@gmail.com>
Message-ID: <20200621211245.GO2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-06-21 16:14 +0200, Heiko Thiery spake thusly:
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Both applied to master, thanks.

Hopefully, the upgrade does not bring a dependency on host-python3...
But the gitlab-ci will tell us sooner or later! ;-)

Regards,
Yann E. MORIN.

> ---
>  configs/beaglebone_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index 5d6b680d29..9a4be13ec5 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  # BR2_TARGET_UBOOT_FORMAT_BIN is not set
> -- 
> 2.20.1
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
