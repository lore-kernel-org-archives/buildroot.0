From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 May 2020 21:25:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/wlroots: add license file
 information
In-Reply-To: <20200503144356.275259-2-gilles.talis@gmail.com>
References: <20200503144356.275259-1-gilles.talis@gmail.com>
 <20200503144356.275259-2-gilles.talis@gmail.com>
Message-ID: <20200503192502.GC12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2020-05-03 16:43 +0200, Gilles Talis spake thusly:
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wlroots/wlroots.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
> index 136dc2bfcd..988643485f 100644
> --- a/package/wlroots/wlroots.mk
> +++ b/package/wlroots/wlroots.mk
> @@ -7,6 +7,7 @@
>  WLROOTS_VERSION = 0.10.1
>  WLROOTS_SITE = https://github.com/swaywm/wlroots/releases/download/$(WLROOTS_VERSION)
>  WLROOTS_LICENSE = MIT
> +WLROOTS_LICENSE_FILES = LICENSE
>  WLROOTS_INSTALL_STAGING = YES
>  
>  WLROOTS_DEPENDENCIES = \
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
