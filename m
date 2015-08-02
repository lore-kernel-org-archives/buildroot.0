From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Aug 2015 17:00:58 +0200
Subject: [Buildroot] [PATCH] configs/raspberry2_defconfig: Fix typo
In-Reply-To: <1438527391-31932-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1438527391-31932-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150802150058.GB3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2015-08-02 16:56 +0200, Maxime Hadjinlian spake thusly:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  configs/raspberrypi2_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
> index 7b12040..02603a2 100644
> --- a/configs/raspberrypi2_defconfig
> +++ b/configs/raspberrypi2_defconfig
> @@ -18,7 +18,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="f90f981770e3ac8506dc84c9cd01471faaa0b0c2"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
> -BR2_LINUX_KERNEL_ZIMAGE=yo
> +BR2_LINUX_KERNEL_ZIMAGE=y
>  
>  # Build the DTB from the kernel sources
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -- 
> 2.4.6
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
