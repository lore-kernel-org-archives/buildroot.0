From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 May 2014 22:16:48 +0200
Subject: [Buildroot] [PATCH v8 18/28] xbmc-addon-xvdr: Version bump to
 xbmc Gotham-compatible addon
In-Reply-To: <1400342276-10303-19-git-send-email-bernd.kuhls@t-online.de>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-19-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140517201648.GI3459@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-17 17:57 +0200, Bernd Kuhls spake thusly:
> - remove upstream applied patch xbmc-addon-xvdr-0001-foreign-automake.patch

Wee-hee! :-)

> diff --git a/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk b/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
> index 28c90f7..601df63 100644
> --- a/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
> +++ b/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
> @@ -4,9 +4,7 @@
>  #
>  ################################################################################
>  
> -# This cset is on the branch 'xbmc-frodo'
> -# When XBMC is updated, then this should be updated to the corresponding branch

Ditto as for xbmc-pvr-addons: just duplicate the comment here.

Regards,
Yann E. MORIN.

> -XBMC_ADDON_XVDR_VERSION = acd4e145fc3220cf708aaf40d895904732dce2c7
> +XBMC_ADDON_XVDR_VERSION = 82b5093ad33847f97a978cb620c9a87d2dbcf7eb
>  XBMC_ADDON_XVDR_SITE = $(call github,pipelka,xbmc-addon-xvdr,$(XBMC_ADDON_XVDR_VERSION))
>  XBMC_ADDON_XVDR_LICENSE = GPLv2+
>  XBMC_ADDON_XVDR_LICENSE_FILES = COPYING
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
