From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jul 2021 09:47:33 +0200
Subject: [Buildroot] [PATCH 1/2] package/libuci: add LIBUCI_CPE_ID_VENDOR
In-Reply-To: <20210717214854.1150900-1-fontaine.fabrice@gmail.com>
References: <20210717214854.1150900-1-fontaine.fabrice@gmail.com>
Message-ID: <20210718074733.GZ12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fabrice, All,

On 2021-07-17 23:48 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:openwrt:libuci is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenwrt%3Alibuci
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libuci/libuci.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
> index b7fd2ddb66..ae70b6f2af 100644
> --- a/package/libuci/libuci.mk
> +++ b/package/libuci/libuci.mk
> @@ -9,6 +9,7 @@ LIBUCI_SITE = https://git.openwrt.org/project/uci.git
>  LIBUCI_SITE_METHOD = git
>  LIBUCI_LICENSE = LGPL-2.1, GPL-2.0 (tools)
>  LIBUCI_LICENSE_FILES = cli.c libuci.c

This is not in master yet, so there was a conflict when applying. I
fixed that. Can you send a patch adding those license files, then? ;-)

> +LIBUCI_CPE_ID_VENDOR = openwrt

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  LIBUCI_INSTALL_STAGING = YES
>  LIBUCI_DEPENDENCIES = libubox
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
