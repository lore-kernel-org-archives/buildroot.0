From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Jul 2015 22:17:47 +0200
Subject: [Buildroot] [PATCH 1/1] kmod: remove unnecessary autoreconf
In-Reply-To: <1437162283-20292-1-git-send-email-patrickdepinguin@gmail.com>
References: <1437162283-20292-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150717201747.GD3637@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-07-17 21:44 +0200, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Commit 047fea1d4fa33c4c934272a05649907a59186015 removed a patch on kmod that
> was the reason for autoreconfiguring kmod, but autoreconf itself was not
> removed.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/kmod/kmod.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
> index ae09330..e07e601 100644
> --- a/package/kmod/kmod.mk
> +++ b/package/kmod/kmod.mk
> @@ -8,8 +8,6 @@ KMOD_VERSION = 20
>  KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
>  KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
>  KMOD_INSTALL_STAGING = YES
> -# For kmod-0002-add-backup-implementation-of-be32toh.patch
> -KMOD_AUTORECONF = YES
>  KMOD_DEPENDENCIES = host-pkgconf
>  HOST_KMOD_DEPENDENCIES = host-pkgconf
>  
> -- 
> 1.8.5.1
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
