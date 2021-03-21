From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Mar 2021 11:26:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/gettext-gnu: add CPE variables
In-Reply-To: <20210321090913.532331-1-fontaine.fabrice@gmail.com>
References: <20210321090913.532331-1-fontaine.fabrice@gmail.com>
Message-ID: <20210321102640.GZ3443324@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-03-21 10:09 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:gnu:gettext is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Agettext
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gettext-gnu/gettext-gnu.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
> index ee7e97baf7..9a1eabd0df 100644
> --- a/package/gettext-gnu/gettext-gnu.mk
> +++ b/package/gettext-gnu/gettext-gnu.mk
> @@ -11,6 +11,8 @@ GETTEXT_GNU_SOURCE = gettext-$(GETTEXT_GNU_VERSION).tar.xz
>  GETTEXT_GNU_INSTALL_STAGING = YES
>  GETTEXT_GNU_LICENSE = LGPL-2.1+ (libintl), GPL-3.0+ (the rest)
>  GETTEXT_GNU_LICENSE_FILES = COPYING gettext-runtime/intl/COPYING.LIB
> +GETTEXT_GNU_CPE_ID_VENDOR = gnu
> +GETTEXT_GNU_CPE_ID_PRODUCT = gettext
>  # 0002-restore-the-ability-to-buld-gettext-tools-seperately-part1.patch
>  GETTEXT_GNU_AUTORECONF = YES
>  GETTEXT_GNU_PROVIDES = gettext
> -- 
> 2.30.1
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
