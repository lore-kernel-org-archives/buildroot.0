From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Mar 2021 11:27:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/gutenprint: add
 GUTENPRINT_CPE_ID_VENDOR
In-Reply-To: <20210321092706.533564-1-fontaine.fabrice@gmail.com>
References: <20210321092706.533564-1-fontaine.fabrice@gmail.com>
Message-ID: <20210321102717.GB3443324@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-03-21 10:27 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:gutenprint_project:gutenprint is a valid CPE identifier for
> this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agutenprint_project%3Agutenprint
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gutenprint/gutenprint.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
> index 9cb80c3e95..b0fcd5a598 100644
> --- a/package/gutenprint/gutenprint.mk
> +++ b/package/gutenprint/gutenprint.mk
> @@ -10,6 +10,7 @@ GUTENPRINT_SITE = http://downloads.sourceforge.net/project/gimp-print/gutenprint
>  GUTENPRINT_SOURCE = gutenprint-$(GUTENPRINT_VERSION).tar.bz2
>  GUTENPRINT_LICENSE = GPL-2.0+
>  GUTENPRINT_LICENSE_FILES = COPYING
> +GUTENPRINT_CPE_ID_VENDOR = gutenprint_project
>  
>  # Needed, as we touch Makefile.am
>  GUTENPRINT_AUTORECONF = YES
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
