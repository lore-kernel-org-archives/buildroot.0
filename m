From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 11:02:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/pwgen: add PWGEN_CPE_ID_VENDOR
In-Reply-To: <20210522202522.283239-1-fontaine.fabrice@gmail.com>
References: <20210522202522.283239-1-fontaine.fabrice@gmail.com>
Message-ID: <20210523090254.GL3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-22 22:25 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:pwgen_project:pwgen is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apwgen_project%3Apwgen
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pwgen/pwgen.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pwgen/pwgen.mk b/package/pwgen/pwgen.mk
> index ad9465b82c..89925bb300 100644
> --- a/package/pwgen/pwgen.mk
> +++ b/package/pwgen/pwgen.mk
> @@ -8,6 +8,7 @@ PWGEN_VERSION = 2.08
>  PWGEN_SITE = http://downloads.sourceforge.net/project/pwgen/pwgen/$(PWGEN_VERSION)
>  PWGEN_LICENSE = GPL-2.0
>  PWGEN_LICENSE_FILES = debian/copyright
> +PWGEN_CPE_ID_VENDOR = pwgen_project
>  
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
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
