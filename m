From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 08:31:31 +0100
Subject: [Buildroot] [PATCH] configs:nitrogen{6sx, 6x, 7,
 8m}: fix typo in kernel headers version
In-Reply-To: <20200229224546.234851-1-romain.naour@smile.fr>
References: <20200229224546.234851-1-romain.naour@smile.fr>
Message-ID: <20200301073131.GZ8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-02-29 23:45 +0100, Romain Naour spake thusly:
> A typo has been introduced during the last version bump [1].
> 
> [1] 00252b101a86ef136fc4afc045ba16324cbccb3b
> 
> Fixes:
> [nitrogen6sx]
> https://gitlab.com/buildroot.org/buildroot/-/jobs/454255632
> [nitrogen6x]
> https://gitlab.com/buildroot.org/buildroot/-/jobs/454255635
> [nitrogen7]
> https://gitlab.com/buildroot.org/buildroot/-/jobs/454255638
> [nitrogen6m8]
> https://gitlab.com/buildroot.org/buildroot/-/jobs/454255640
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Gary Bisson <bisson.gary@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/nitrogen6sx_defconfig | 2 +-
>  configs/nitrogen6x_defconfig  | 2 +-
>  configs/nitrogen7_defconfig   | 2 +-
>  configs/nitrogen8m_defconfig  | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
> index e8a375fe7c..29fa4dff61 100644
> --- a/configs/nitrogen6sx_defconfig
> +++ b/configs/nitrogen6sx_defconfig
> @@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  
>  # Linux headers same as kernel, a 4.14 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4.14=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
>  
>  # bootloader
>  BR2_TARGET_UBOOT=y
> diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
> index 9dc47439cd..5a53caed99 100644
> --- a/configs/nitrogen6x_defconfig
> +++ b/configs/nitrogen6x_defconfig
> @@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  
>  # Linux headers same as kernel, a 4.14 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4.14=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
>  
>  # bootloader
>  BR2_TARGET_UBOOT=y
> diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
> index f64f011b86..a7cd8a10e1 100644
> --- a/configs/nitrogen7_defconfig
> +++ b/configs/nitrogen7_defconfig
> @@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  
>  # Linux headers same as kernel, a 4.14 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4.14=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
>  
>  # bootloader
>  BR2_TARGET_UBOOT=y
> diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
> index 4c99e566b7..21402162f5 100644
> --- a/configs/nitrogen8m_defconfig
> +++ b/configs/nitrogen8m_defconfig
> @@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  
>  # Linux headers same as kernel, a 4.14 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4.14=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
>  
>  # DDR training binaries
>  BR2_PACKAGE_FREESCALE_IMX=y
> -- 
> 2.24.1
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
