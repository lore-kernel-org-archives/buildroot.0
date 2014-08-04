From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Aug 2014 23:25:03 +0200
Subject: [Buildroot] [PATCH 1/1] configs: bump kernel used for the RPi
In-Reply-To: <1407181598-15423-1-git-send-email-bernd.kuhls@t-online.de>
References: <1407181598-15423-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140804212503.GA6638@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-08-04 21:46 +0200, Bernd Kuhls spake thusly:
> The rpi-3.12.y branch has now been merged with the 3.12.26 upstream.
> 
> Bump kernel headers used for the toolchain at the same time.
> 
> Fixes
> http://jenkins.free-electrons.com/job/buildroot/config=raspberrypi_defconfig/320/console
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  configs/raspberrypi_defconfig |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
> index c12d473..0a32fd3 100644
> --- a/configs/raspberrypi_defconfig
> +++ b/configs/raspberrypi_defconfig
> @@ -10,13 +10,13 @@ BR2_PACKAGE_RPI_FIRMWARE=y
>  
>  # Lock to 3.12 headers as the RPi kernel is based off the 3.12 branch
>  BR2_KERNEL_HEADERS_VERSION=y
> -BR2_DEFAULT_KERNEL_VERSION="3.12.25"
> +BR2_DEFAULT_KERNEL_VERSION="3.12.26"
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="353043394c99ed37a4075da228af64468fdf6c06"
>  BR2_LINUX_KERNEL_USE_DEFCONFIG=y
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
>  BR2_LINUX_KERNEL_ZIMAGE=y
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
