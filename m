From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 10:56:28 +0200
Subject: [Buildroot] [PATCH] mrouted: Use github call
In-Reply-To: <1413136693-30255-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413136693-30255-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141019085628.GE4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-10-12 19:58 +0200, Maxime Hadjinlian spake thusly:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/mrouted/mrouted.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
> index 67bb8a1..78fe98a 100644
> --- a/package/mrouted/mrouted.mk
> +++ b/package/mrouted/mrouted.mk
> @@ -5,8 +5,7 @@
>  ################################################################################
>  
>  MROUTED_VERSION = 3.9.6
> -MROUTED_SOURCE = mrouted-$(MROUTED_VERSION).tar.bz2
> -MROUTED_SITE = http://cloud.github.com/downloads/troglobit/mrouted
> +MROUTED_SITE = $(call github,troglobit,mrouted,$(MROUTED_VERSION))
>  MROUTED_DEPENDENCIES = host-bison
>  
>  define MROUTED_BUILD_CMDS
> -- 
> 2.1.1
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
