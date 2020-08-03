From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Aug 2020 16:38:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/sysdig: Fix check-package
In-Reply-To: <1596439874-24550-1-git-send-email-stephane.viau@oss.nxp.com>
References: <1596439874-24550-1-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200803143840.GD2186@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

St?phane, All,

On 2020-08-03 09:31 +0200, Stephane Viau spake thusly:
> This patch fixes a couple of 'check-package' errors:
> 
> 	package/sysdig/sysdig.mk:23: remove trailing backslash
> 	package/sysdig/sysdig.mk:25: consecutive empty lines
> 
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sysdig/sysdig.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
> index 9c8b818..bcbb5ce 100644
> --- a/package/sysdig/sysdig.mk
> +++ b/package/sysdig/sysdig.mk
> @@ -20,8 +20,7 @@ SYSDIG_DEPENDENCIES = \
>  	luainterpreter \
>  	ncurses \
>  	openssl \
> -	zlib \
> -
> +	zlib
>  
>  # sysdig creates the module Makefile from a template, which contains a
>  # single place-holder, KBUILD_FLAGS, wich is only replaced with two
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
