From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Sep 2014 21:56:55 +0200
Subject: [Buildroot] [PATCH 1/1] Unexports MACHINE variable. Fixes bug
 7448
In-Reply-To: <1411533438-1415-1-git-send-email-risto.avila@digia.com>
References: <1411533438-1415-1-git-send-email-risto.avila@digia.com>
Message-ID: <20140924195655.GA3750@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avila, All,

On 2014-09-24 04:37 +0000, Avila Risto spake thusly:
> Signed-off-by: Risto Avila <risto.avila@digia.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index e788f1b..53f8ad5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -292,6 +292,7 @@ unexport TAR_OPTIONS
>  unexport CONFIG_SITE
>  unexport QMAKESPEC
>  unexport TERMINFO
> +unexport MACHINE
>  
>  GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
>  
> -- 
> 1.9.1
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
