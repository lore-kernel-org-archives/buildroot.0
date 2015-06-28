From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Jun 2015 20:17:40 +0200
Subject: [Buildroot] [PATCH 2/5] defconfig: update raspberry pi 2 to
 linux 3.18.14
In-Reply-To: <1432838510-1848-2-git-send-email-pmjdebruijn@pcode.nl>
References: <1432838510-1848-1-git-send-email-pmjdebruijn@pcode.nl>
 <1432838510-1848-2-git-send-email-pmjdebruijn@pcode.nl>
Message-ID: <20150628181740.GD3950@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pascal, All,

On 2015-05-28 20:41 +0200, Pascal de Bruijn spake thusly:
> Signed-off-by: Pascal de Bruijn <pmjdebruijn@pcode.nl>
> ---
>  configs/raspberrypi2_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
> index 5859749..3fe3fe9 100644
> --- a/configs/raspberrypi2_defconfig
> +++ b/configs/raspberrypi2_defconfig
> @@ -9,13 +9,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
>  
>  # Lock to 3.18 headers as the RPi2 kernel is based off the 3.18 branch
>  BR2_KERNEL_HEADERS_VERSION=y
> -BR2_DEFAULT_KERNEL_VERSION="3.18"
> +BR2_DEFAULT_KERNEL_VERSION="3.18.14"
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="2747cc0bde4ca441691260fae1e34c9ef954ccae"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7d54f1754fd89bc11b27ca249ec148695f2eed06"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  BR2_LINUX_KERNEL_ZIMAGE=y

I have a series that further updates all our RPi defconfigs to use the
nos-considered stable rpi-4.0.y branch, update rpi-firmware and
rpi-userland, and finally enhance rpi-firmware to only install DTBs
conditionally, and install DTB overlays.

I'll submit that series a bit later tonight, when I finally test it on
the real hardware.

In the meantime, I'm marking those rpi-related patches as Changes
Requested in our Patchwork.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
