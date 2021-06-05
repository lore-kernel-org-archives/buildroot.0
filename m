From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jun 2021 21:41:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/acpid: add CPE variables
In-Reply-To: <20210603163928.346877-1-fontaine.fabrice@gmail.com>
References: <20210603163928.346877-1-fontaine.fabrice@gmail.com>
Message-ID: <20210605194134.GV168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-03 18:39 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:tedfelix:acpid2 is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atedfelix%3Aacpid2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/acpid/acpid.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
> index ff6e62b5cd..3473e7b5f6 100644
> --- a/package/acpid/acpid.mk
> +++ b/package/acpid/acpid.mk
> @@ -9,6 +9,8 @@ ACPID_SOURCE = acpid-$(ACPID_VERSION).tar.xz
>  ACPID_SITE = http://downloads.sourceforge.net/project/acpid2
>  ACPID_LICENSE = GPL-2.0+
>  ACPID_LICENSE_FILES = COPYING
> +ACPID_CPE_ID_VENDOR = tedfelix
> +ACPID_CPE_ID_PRODUCT = acpid2
>  
>  define ACPID_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 0644 package/acpid/acpid.service \
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
