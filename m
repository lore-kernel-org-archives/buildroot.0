From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 May 2021 22:31:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/proxychains-ng: add
 PROXYCHAINS_NG_CPE_ID_VENDOR
In-Reply-To: <20210522201136.280482-1-fontaine.fabrice@gmail.com>
References: <20210522201136.280482-1-fontaine.fabrice@gmail.com>
Message-ID: <20210522203100.GH3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-22 22:11 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:proxychains-ng_project:proxychains-ng is a valid CPE
> identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aproxychains-ng_project%3Aproxychains-ng
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/proxychains-ng/proxychains-ng.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
> index a9f3fc9561..0437f7d911 100644
> --- a/package/proxychains-ng/proxychains-ng.mk
> +++ b/package/proxychains-ng/proxychains-ng.mk
> @@ -9,6 +9,7 @@ PROXYCHAINS_NG_SOURCE = proxychains-ng-$(PROXYCHAINS_NG_VERSION).tar.bz2
>  PROXYCHAINS_NG_SITE = http://downloads.sourceforge.net/project/proxychains-ng
>  PROXYCHAINS_NG_LICENSE = GPL-2.0+
>  PROXYCHAINS_NG_LICENSE_FILES = COPYING
> +PROXYCHAINS_NG_CPE_ID_VENDOR = proxychains-ng_project
>  
>  define PROXYCHAINS_NG_CONFIGURE_CMDS
>  	cd $(@D) && \
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
