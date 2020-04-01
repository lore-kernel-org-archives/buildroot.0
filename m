From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Apr 2020 22:14:55 +0200
Subject: [Buildroot] [PATCH 1/2] kmscube: Change repository to gitlab
In-Reply-To: <20200401170504.9307-1-festevam@gmail.com>
References: <20200401170504.9307-1-festevam@gmail.com>
Message-ID: <20200401201455.GX22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2020-04-01 14:05 -0300, Fabio Estevam spake thusly:
> The https://cgit.freedesktop.org/mesa/kmscube repository
> is mirrored from https://gitlab.freedesktop.org/mesa/kmscube, so
> switch to the gitlab one. 
> 
> The other advantage of using the gitlab repository is that it can handle
> archive downloads, so switch to it.
> 
> Suggested-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kmscube/kmscube.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
> index 37983b1a78..73d290c88b 100644
> --- a/package/kmscube/kmscube.mk
> +++ b/package/kmscube/kmscube.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  KMSCUBE_VERSION = 6cbd03ab94066dddbba7bedfde87c7c4319c18d5
> -KMSCUBE_SITE = https://cgit.freedesktop.org/mesa/kmscube/snapshot
> +KMSCUBE_SITE = https://gitlab.freedesktop.org/mesa/kmscube/-/archive/$(KMSCUBE_VERSION)
>  KMSCUBE_LICENSE = MIT
>  KMSCUBE_DEPENDENCIES = host-pkgconf mesa3d libdrm
>  KMSCUBE_AUTORECONF = YES
> -- 
> 2.17.1
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
