From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Feb 2020 20:02:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: don't select kmsro for
 iris driver
In-Reply-To: <20200208074528.39326-1-james.hilliard1@gmail.com>
References: <20200208074528.39326-1-james.hilliard1@gmail.com>
Message-ID: <20200208190232.GD5156@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-02-08 00:45 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Once again, we need explanations about such a change. Please write
commit logs that explains the problem, not describe it.

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 94e3f2cb9e..850d306add 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -116,7 +116,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
>  	bool "Gallium iris driver"
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> -	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
>  	help
>  	  Mesa driver for iris-based Intel GPUs.
>  
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
