From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 22:05:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/uclibc: add CPE variables
In-Reply-To: <20210519195830.49948-1-fontaine.fabrice@gmail.com>
References: <20210519195830.49948-1-fontaine.fabrice@gmail.com>
Message-ID: <20210519200536.GG2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-19 21:58 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:uclibc-ng_project:uclibc-ng is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Auclibc-ng_project%3Auclibc-ng
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/uclibc/uclibc.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 3d253d93bc..a7c96684d0 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -10,6 +10,8 @@ UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
>  UCLIBC_LICENSE = LGPL-2.1+
>  UCLIBC_LICENSE_FILES = COPYING.LIB
>  UCLIBC_INSTALL_STAGING = YES
> +UCLIBC_CPE_ID_VENDOR = uclibc-ng_project
> +UCLIBC_CPE_ID_PRODUCT = uclibc-ng
>  
>  define UCLIBC_HELP_CMDS
>  	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
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
