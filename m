From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Feb 2021 14:59:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/asterisk: add CPE variables
In-Reply-To: <20210206110554.2000553-1-fontaine.fabrice@gmail.com>
References: <20210206110554.2000553-1-fontaine.fabrice@gmail.com>
Message-ID: <20210206135931.GH2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-02-06 12:05 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:asterisk:open_source is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aasterisk%3Aopen_source
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/asterisk/asterisk.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index fb3eb6ec8a..b220b54189 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -21,6 +21,9 @@ ASTERISK_LICENSE_FILES = \
>  	codecs/speex/speex_resampler.h \
>  	utils/db1-ast/include/db.h
>  
> +ASTERISK_CPE_ID_VENDOR = asterisk
> +ASTERISK_CPE_ID_PRODUCT = open_source
> +
>  # For patches 0002, 0003 and 0005
>  ASTERISK_AUTORECONF = YES
>  ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject -Ithird-party/jansson
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
