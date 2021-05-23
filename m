From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 19:58:29 +0200
Subject: [Buildroot] [PATCH 1/2] package/libnids: add
 LIBNIDS_CPE_ID_VENDOR
In-Reply-To: <20210523132938.1520248-1-fontaine.fabrice@gmail.com>
References: <20210523132938.1520248-1-fontaine.fabrice@gmail.com>
Message-ID: <20210523175829.GW3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-23 15:29 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:libnids_project:libnids is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibnids_project%3Alibnids
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libnids/libnids.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
> index fb3df318b4..4a9138b80e 100644
> --- a/package/libnids/libnids.mk
> +++ b/package/libnids/libnids.mk
> @@ -8,6 +8,7 @@ LIBNIDS_VERSION = 1.24
>  LIBNIDS_SITE = https://sourceforge.net/projects/libnids/files/libnids/$(LIBNIDS_VERSION)
>  LIBNIDS_LICENSE = GPL-2.0
>  LIBNIDS_LICENSE_FILES = COPYING
> +LIBNIDS_CPE_ID_VENDOR = libnids_project
>  LIBNIDS_INSTALL_STAGING = YES
>  LIBNIDS_DEPENDENCIES = host-pkgconf libpcap
>  LIBNIDS_AUTORECONF = YES
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
