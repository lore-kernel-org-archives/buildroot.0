From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jun 2016 22:39:00 +0200
Subject: [Buildroot] [PATCH 3/6] glibc: remove additional occurrences of
 eglibc
In-Reply-To: <1465422059-22254-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1465422059-22254-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160613203900.GD3786@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-06-08 23:40 +0200, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/glibc/glibc.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 7adfa94..2c32e65 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -1,6 +1,6 @@
>  ################################################################################
>  #
> -# glibc/eglibc
> +# glibc
>  #
>  ################################################################################
>  
> @@ -64,7 +64,7 @@ endif
>  #  2. We have to execute the configure script with bash and not sh.
>  #
>  # Note that as mentionned in
> -# http://patches.openembedded.org/patch/38849/, eglibc/glibc must be
> +# http://patches.openembedded.org/patch/38849/, glibc must be
>  # built with -O2, so we pass our own CFLAGS and CXXFLAGS below.
>  define GLIBC_CONFIGURE_CMDS
>  	mkdir -p $(@D)/build
> -- 
> 2.7.4
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
