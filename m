From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jun 2021 21:41:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/apcupsd: add
 APCUPSD_CPE_ID_VENDOR
In-Reply-To: <20210603164658.347564-1-fontaine.fabrice@gmail.com>
References: <20210603164658.347564-1-fontaine.fabrice@gmail.com>
Message-ID: <20210605194121.GU168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-03 18:46 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:apcupsd:apcupsd is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aapcupsd%3Aapcupsd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/apcupsd/apcupsd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
> index 410bce9aec..9e707e1a5a 100644
> --- a/package/apcupsd/apcupsd.mk
> +++ b/package/apcupsd/apcupsd.mk
> @@ -8,6 +8,7 @@ APCUPSD_VERSION = 3.14.14
>  APCUPSD_SITE = http://downloads.sourceforge.net/project/apcupsd/apcupsd%20-%20Stable/$(APCUPSD_VERSION)
>  APCUPSD_LICENSE = GPL-2.0
>  APCUPSD_LICENSE_FILES = COPYING
> +APCUPSD_CPE_ID_VENDOR = apcupsd
>  APCUPSD_CONF_OPTS = --disable-test
>  
>  ifneq ($(BR2_PACKAGE_APCUPSD_MODBUS_USB)$(BR2_PACKAGE_APCUPSD_USB),)
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
