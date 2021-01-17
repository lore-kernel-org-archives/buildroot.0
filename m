From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 10:01:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/bsdiff: add BSDIFF_CPE_ID_VENDOR
In-Reply-To: <20210116231330.212511-1-fontaine.fabrice@gmail.com>
References: <20210116231330.212511-1-fontaine.fabrice@gmail.com>
Message-ID: <20210117090144.GW2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-17 00:13 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:daemonology:bsdiff is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adaemonology%3Absdiff
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/bsdiff/bsdiff.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
> index 9030284a0a..97a1b3921d 100644
> --- a/package/bsdiff/bsdiff.mk
> +++ b/package/bsdiff/bsdiff.mk
> @@ -9,6 +9,7 @@ BSDIFF_SITE = http://www.daemonology.net/bsdiff
>  BSDIFF_DEPENDENCIES = bzip2
>  BSDIFF_LICENSE = BSD-2-Clause
>  BSDIFF_LICENSE_FILES = bsdiff.c
> +BSDIFF_CPE_ID_VENDOR = daemonology
>  
>  define BSDIFF_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
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
