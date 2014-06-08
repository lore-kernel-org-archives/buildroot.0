From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Jun 2014 13:15:20 +0200
Subject: [Buildroot] [PATCH v12 08/32] xbmc-pvr-addons: bump to a
 version compatible with XBMC Gotham
In-Reply-To: <1402144292-27837-9-git-send-email-bernd.kuhls@t-online.de>
References: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
 <1402144292-27837-9-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140608111520.GA3266@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-06-07 14:31 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/xbmc-pvr-addons/xbmc-pvr-addons.mk |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
> index b6d061b..97628e2 100644
> --- a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
> +++ b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
> @@ -4,9 +4,10 @@
>  #
>  ################################################################################
>  
> -# This cset is on the branch 'frodo'
> -# When XBMC is updated, then this should be updated to the corresponding branch
> -XBMC_PVR_ADDONS_VERSION = 319351af7f3b546a5a56cdf6492f6ba1aec1cd2f
> +# This cset in on master. When a Gotham branch is made, we should
> +# follow it, as incompatible changes in the plugins API can happen
> +# on the master branch.
> +XBMC_PVR_ADDONS_VERSION = f38b2ebdc6f96244d5e4bc584315f4a2c24bc787

Oh, I just updated my local clone, and a new branch for Gotham was made,
with a few fixes already.

Regards,
Yann E. MORIN.

>  XBMC_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(XBMC_PVR_ADDONS_VERSION))
>  XBMC_PVR_ADDONS_LICENSE = GPLv3+
>  XBMC_PVR_ADDONS_LICENSE_FILES = COPYING
> -- 
> 1.7.10.4
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
