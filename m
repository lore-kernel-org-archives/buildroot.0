From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 20:00:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/mini-snmpd: add CPE variables
In-Reply-To: <20210523143058.1523958-1-fontaine.fabrice@gmail.com>
References: <20210523143058.1523958-1-fontaine.fabrice@gmail.com>
Message-ID: <20210523180057.GD3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-23 16:30 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:minisnmpd_project:minisnmpd is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aminisnmpd_project%3Aminisnmpd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mini-snmpd/mini-snmpd.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/mini-snmpd/mini-snmpd.mk b/package/mini-snmpd/mini-snmpd.mk
> index 570241c256..1f6e5c1919 100644
> --- a/package/mini-snmpd/mini-snmpd.mk
> +++ b/package/mini-snmpd/mini-snmpd.mk
> @@ -8,6 +8,8 @@ MINI_SNMPD_VERSION = 1.6
>  MINI_SNMPD_SITE = $(call github,troglobit,mini-snmpd,v$(MINI_SNMPD_VERSION))
>  MINI_SNMPD_LICENSE = GPL-2.0
>  MINI_SNMPD_LICENSE_FILES = COPYING
> +MINI_SNMPD_CPE_ID_VENDOR = minisnmpd_project
> +MINI_SNMPD_CPE_ID_PRODUCT = minisnmpd
>  MINI_SNMPD_AUTORECONF = YES
>  MINI_SNMPD_DEPENDENCIES = host-pkgconf
>  
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
