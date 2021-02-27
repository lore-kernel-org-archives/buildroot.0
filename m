From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Feb 2021 16:56:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/openntpd: add
 OPENNTPD_CPE_ID_VENDOR
In-Reply-To: <20210227093241.483647-1-fontaine.fabrice@gmail.com>
References: <20210227093241.483647-1-fontaine.fabrice@gmail.com>
Message-ID: <20210227155620.GH2390841@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-02-27 10:32 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:openntpd:openntpd is a valid CPE identifier for this package:
> 
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenntpd%3Aopenntpd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/openntpd/openntpd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
> index 9076f3ddda..30c39e45ed 100644
> --- a/package/openntpd/openntpd.mk
> +++ b/package/openntpd/openntpd.mk
> @@ -8,6 +8,7 @@ OPENNTPD_VERSION = 6.2p3
>  OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
>  OPENNTPD_LICENSE = MIT-like, BSD-2-Clause, BSD-3-Clause
>  OPENNTPD_LICENSE_FILES = COPYING
> +OPENNTPD_CPE_ID_VENDOR = openntpd
>  OPENNTPD_DEPENDENCIES = host-bison
>  # Need to autoreconf for our libtool patch to apply properly
>  OPENNTPD_AUTORECONF = YES
> -- 
> 2.30.0
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
