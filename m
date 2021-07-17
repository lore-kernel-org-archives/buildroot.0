From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Jul 2021 11:54:31 +0200
Subject: [Buildroot] [PATCH v3,
 1/1] package/pcre2: add PCRE2_CPE_ID_VENDOR
In-Reply-To: <20210717093914.954546-1-fontaine.fabrice@gmail.com>
References: <20210717093914.954546-1-fontaine.fabrice@gmail.com>
Message-ID: <20210717095431.GM12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fabrice, All,

On 2021-07-17 11:39 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:pcre:pcre2 is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apcre%3Apcre2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

> ---
> Changes v2 -> v3:
>  - Fix title again (pcre -> pcre2)
> Changes v1 -> v2:
>  - Fix title (PCRE -> PCRE2)

Someone needs some coffee... ;-)

Regards,
Yann E. MORIN.

>  package/pcre2/pcre2.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
> index 858ef59703..d02772650f 100644
> --- a/package/pcre2/pcre2.mk
> +++ b/package/pcre2/pcre2.mk
> @@ -9,6 +9,7 @@ PCRE2_SITE = https://ftp.pcre.org/pub/pcre
>  PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
>  PCRE2_LICENSE = BSD-3-Clause
>  PCRE2_LICENSE_FILES = LICENCE
> +PCRE2_CPE_ID_VENDOR = pcre
>  PCRE2_INSTALL_STAGING = YES
>  PCRE2_CONFIG_SCRIPTS = pcre2-config
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
