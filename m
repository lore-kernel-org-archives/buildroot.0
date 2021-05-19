From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 22:27:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/synergy: add
 SYNERGY_CPE_ID_VENDOR
In-Reply-To: <20210519201257.50570-1-fontaine.fabrice@gmail.com>
References: <20210519201257.50570-1-fontaine.fabrice@gmail.com>
Message-ID: <20210519202715.GJ2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-19 22:12 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:symless:synergy is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asymless%3Asynergy
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/synergy/synergy.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
> index 63c6e5cbc1..bc7ebea070 100644
> --- a/package/synergy/synergy.mk
> +++ b/package/synergy/synergy.mk
> @@ -8,6 +8,7 @@ SYNERGY_VERSION = 2.0.12-beta
>  SYNERGY_SITE = $(call github,symless,synergy-core,v$(SYNERGY_VERSION))
>  SYNERGY_LICENSE = GPL-2.0
>  SYNERGY_LICENSE_FILES = LICENSE
> +SYNERGY_CPE_ID_VENDOR = symless
>  SYNERGY_DEPENDENCIES = xlib_libX11 xlib_libXtst
>  
>  # Avoid using buildroot commit hash inside cmake/Version.cmake
> -- 
> 2.30.2
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
