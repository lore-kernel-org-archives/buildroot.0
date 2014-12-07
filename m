From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Dec 2014 00:18:45 +0100
Subject: [Buildroot] [PATCH v2] xbmc-pvr-addons: Bump version
In-Reply-To: <1414356597-27279-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414356597-27279-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141207231845.GN10809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-10-26 21:49 +0100, Maxime Hadjinlian spake thusly:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> v1 -> v2:
>    - The correct cset is the HEAD of the Gotham branch.
> ---
>  package/xbmc-pvr-addons/xbmc-pvr-addons.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
> index bfcb7ed..a20af85 100644
> --- a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
> +++ b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
> @@ -6,7 +6,7 @@
>  
>  # This cset is on the branch 'gotham'
>  # When XBMC is updated, then this should be updated to the corresponding branch
> -XBMC_PVR_ADDONS_VERSION = be12a8da2072e9c3ddad54892df2f85b759d4e9a
> +XBMC_PVR_ADDONS_VERSION = f7d9b42b2f1795a467093acb9c120b9c361ffbc4

There is a newer cset now:
    b43305e30f92c6dedb602a5a5d2212f8ccfbc260

Regards,
Yann E. MORIN.

>  XBMC_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(XBMC_PVR_ADDONS_VERSION))
>  XBMC_PVR_ADDONS_LICENSE = GPLv3+
>  XBMC_PVR_ADDONS_LICENSE_FILES = COPYING
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
