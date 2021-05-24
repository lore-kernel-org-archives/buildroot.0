From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 13:45:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/perl: add PERL_CPE_ID_VENDOR
In-Reply-To: <20210523205934.1530579-1-fontaine.fabrice@gmail.com>
References: <20210523205934.1530579-1-fontaine.fabrice@gmail.com>
Message-ID: <20210524114513.GM3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-23 22:59 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:perl:perl is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aperl%3Aperl
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/perl/perl.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index a77686f951..f661fef013 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -11,6 +11,7 @@ PERL_SITE = https://www.cpan.org/src/5.0
>  PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
>  PERL_LICENSE = Artistic or GPL-1.0+
>  PERL_LICENSE_FILES = Artistic Copying README
> +PERL_CPE_ID_VENDOR = perl
>  PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  PERL_INSTALL_STAGING = YES
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
