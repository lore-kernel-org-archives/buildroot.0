From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 16:29:44 +0200
Subject: [Buildroot] [PATCH 07/14] configs: drop redundant IPv6 option
In-Reply-To: <1428754662-27829-7-git-send-email-gustavo@zacarias.com.ar>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
 <1428754662-27829-7-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150412142944.GI21018@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-04-11 09:17 -0300, Gustavo Zacarias spake thusly:
> Drop the buildroot toolchain IPv6 option from the only config that's got
> it since it's now a non-option.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  configs/armadeus_apf9328_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
> index 3ad8feb..d6388db 100644
> --- a/configs/armadeus_apf9328_defconfig
> +++ b/configs/armadeus_apf9328_defconfig
> @@ -6,7 +6,6 @@ BR2_arm920t=y
>  BR2_PACKAGE_GDB=y
>  BR2_PACKAGE_HOST_GDB=y
>  BR2_ENABLE_LOCALE_PURGE=y
> -BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
>  BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
>  BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
>  BR2_TOOLCHAIN_BUILDROOT_CXX=y
> -- 
> 2.0.5
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
