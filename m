From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 19:52:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/beecrypt: set
 BEECRYPT_CPE_ID_VALID
In-Reply-To: <20210125224219.1358226-1-fontaine.fabrice@gmail.com>
References: <20210125224219.1358226-1-fontaine.fabrice@gmail.com>
Message-ID: <20210126185211.GB2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-25 23:42 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:beecrypt_project:beecrypt is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Abeecrypt_project%3Abeecrypt
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/beecrypt/beecrypt.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
> index f13f72c8ac..20e1a122d0 100644
> --- a/package/beecrypt/beecrypt.mk
> +++ b/package/beecrypt/beecrypt.mk
> @@ -10,6 +10,7 @@ BEECRYPT_AUTORECONF = YES
>  BEECRYPT_INSTALL_STAGING = YES
>  BEECRYPT_LICENSE = LGPL-2.1+
>  BEECRYPT_LICENSE_FILES = COPYING.LIB
> +BEECRYPT_CPE_ID_VALID = YES
>  
>  BEECRYPT_CONF_OPTS = \
>  	--disable-expert-mode \
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
