From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 14:21:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/udisks: add UDISKS_CPE_ID_VENDOR
In-Reply-To: <20210515085438.2363053-1-fontaine.fabrice@gmail.com>
References: <20210515085438.2363053-1-fontaine.fabrice@gmail.com>
Message-ID: <20210515122154.GH2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-15 10:54 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:freedesktop:udisks is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreedesktop%3Audisks
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/udisks/udisks.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
> index c6119a8b80..af25c2b8e2 100644
> --- a/package/udisks/udisks.mk
> +++ b/package/udisks/udisks.mk
> @@ -8,6 +8,7 @@ UDISKS_VERSION = 1.0.5
>  UDISKS_SITE = http://hal.freedesktop.org/releases
>  UDISKS_LICENSE = GPL-2.0+
>  UDISKS_LICENSE_FILES = COPYING
> +UDISKS_CPE_ID_VENDOR = freedesktop
>  # For 0002-Fix-systemd-service-file.patch
>  UDISKS_AUTORECONF = YES
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
