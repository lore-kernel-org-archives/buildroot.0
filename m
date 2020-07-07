From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jul 2020 21:54:26 +0200
Subject: [Buildroot] [PATCH] package/sunxi-mali-mainline-driver: bump
 version
In-Reply-To: <20200707160857.645197-1-giulio.benetti@benettiengineering.com>
References: <20200707160857.645197-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200707195426.GO2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2020-07-07 18:08 +0200, Giulio Benetti spake thusly:
> For 5.6 and 5.7 support.
> 
> git shortlog --invert-grep --grep=Travis --no-merges ec654ee9caeb0c4348caacd0cf5eb2730d1d70e2..
> Jonathan Liu (2):
>       mali: Fix build for 5.6
>       mali: Fix build for 5.7
> 
> Maxime Ripard (3):
>       Create travis.yml
>       actions: Add feedparser to the host
>       travis: Try to fix the push code
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash  | 2 +-
>  .../sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
> index 7c01d07d20..ff5bc050b1 100644
> --- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
> +++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 98abeb8ff2e7e824ec89c7be9984ff298db1f35e48d79092238799ff5a239e91  sunxi-mali-mainline-driver-ec654ee9caeb0c4348caacd0cf5eb2730d1d70e2.tar.gz
> +sha256 a2bb43ed2e64cb081e3bc814941c4de02e785f9984783061cf486d2b0b92407b  sunxi-mali-mainline-driver-a588b22f6b3d40ad18070c699f90f36ed21c9f7d.tar.gz
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
> index 40ea450b31..3bb899041e 100644
> --- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
> +++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SUNXI_MALI_MAINLINE_DRIVER_VERSION = ec654ee9caeb0c4348caacd0cf5eb2730d1d70e2
> +SUNXI_MALI_MAINLINE_DRIVER_VERSION = a588b22f6b3d40ad18070c699f90f36ed21c9f7d
>  SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
>  SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
>  SUNXI_MALI_MAINLINE_DRIVER_LICENSE = GPL-2.0
> -- 
> 2.25.1
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
