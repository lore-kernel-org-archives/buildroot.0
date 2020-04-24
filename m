From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2020 13:37:30 +0200
Subject: [Buildroot] [PATCH] configs/olpc_xo175: needs host-openssl for
 kernel build
In-Reply-To: <20200423221833.26434-1-lkundrak@v3.sk>
References: <20200423221833.26434-1-lkundrak@v3.sk>
Message-ID: <20200424113730.GF5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lubomir, all,

On 2020-04-24 00:18 +0200, Lubomir Rintel spake thusly:
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/517918177
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/olpc_xo175_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/olpc_xo175_defconfig b/configs/olpc_xo175_defconfig
> index 4317e72a78..6e31ecf92c 100644
> --- a/configs/olpc_xo175_defconfig
> +++ b/configs/olpc_xo175_defconfig
> @@ -11,6 +11,7 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olpc/xo-1.75/linux.config"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olpc/linux.config"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_PACKAGE_LINUX_FIRMWARE=y
>  BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8=y
>  BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V9=y
> -- 
> 2.26.0
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
