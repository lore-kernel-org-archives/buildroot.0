From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 10:02:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/civetweb: set
 CIVETWEB_CPE_ID_VALID
In-Reply-To: <20210116232040.213196-1-fontaine.fabrice@gmail.com>
References: <20210116232040.213196-1-fontaine.fabrice@gmail.com>
Message-ID: <20210117090201.GX2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-17 00:20 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:civetweb_project:civetweb is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acivetweb_project%3Acivetweb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/civetweb/civetweb.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
> index 448f979b41..afc9cb1703 100644
> --- a/package/civetweb/civetweb.mk
> +++ b/package/civetweb/civetweb.mk
> @@ -8,6 +8,7 @@ CIVETWEB_VERSION = 1.13
>  CIVETWEB_SITE = $(call github,civetweb,civetweb,v$(CIVETWEB_VERSION))
>  CIVETWEB_LICENSE = MIT
>  CIVETWEB_LICENSE_FILES = LICENSE.md
> +CIVETWEB_CPE_ID_VALID = YES
>  
>  CIVETWEB_CONF_OPTS = TARGET_OS=LINUX WITH_IPV6=1 \
>  	$(if $(BR2_INSTALL_LIBSTDCPP),WITH_CPP=1)
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
