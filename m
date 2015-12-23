From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 23 Dec 2015 19:27:58 +0100
Subject: [Buildroot] [PATCH v2 1/2] Enabling mesa3d radeon driver for
 all architectures
In-Reply-To: <1450874992-15627-2-git-send-email-ltrimas@synopsys.com>
References: <1450874992-15627-1-git-send-email-ltrimas@synopsys.com>
 <1450874992-15627-2-git-send-email-ltrimas@synopsys.com>
Message-ID: <20151223182758.GC3426@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lada, All,

On 2015-12-23 15:49 +0300, Lada Trimasova spake thusly:
> Mesa32 radeon driver doesn't depend on x86 and can be built for all architectures.
> 
> Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 40af2ef..fcfd3c3 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -122,7 +122,6 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
>  
>  config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
>  	bool "DRI radeon driver"
> -	depends on BR2_i386 || BR2_x86_64
>  	select BR2_PACKAGE_MESA3D_DRI_DRIVER
>  	select BR2_PACKAGE_LIBDRM_RADEON
>  	help
> -- 
> 2.5.0
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
