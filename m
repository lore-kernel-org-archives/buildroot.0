From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Feb 2021 15:00:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/p11-kit: set
 P11_KIT_CPE_ID_VALID
In-Reply-To: <20210206112244.2002144-1-fontaine.fabrice@gmail.com>
References: <20210206112244.2002144-1-fontaine.fabrice@gmail.com>
Message-ID: <20210206140006.GJ2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-02-06 12:22 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:p11-kit_project:p11-kit is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ap11-kit_project%3Ap11-kit
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/p11-kit/p11-kit.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
> index 81972f811b..977150f571 100644
> --- a/package/p11-kit/p11-kit.mk
> +++ b/package/p11-kit/p11-kit.mk
> @@ -13,6 +13,7 @@ P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
>  	ac_cv_have_decl___progname=no
>  P11_KIT_LICENSE = BSD-3-Clause
>  P11_KIT_LICENSE_FILES = COPYING
> +P11_KIT_CPE_ID_VALID = YES
>  
>  ifeq ($(BR2_PACKAGE_LIBFFI),y)
>  P11_KIT_DEPENDENCIES += host-pkgconf libffi
> -- 
> 2.29.2
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
