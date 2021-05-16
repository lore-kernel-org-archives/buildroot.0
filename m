From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 18:42:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/lvm2: add LVM2_CPE_ID_VENDOR
In-Reply-To: <20210515213606.3668135-1-fontaine.fabrice@gmail.com>
References: <20210515213606.3668135-1-fontaine.fabrice@gmail.com>
Message-ID: <20210516164230.GM2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-15 23:36 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:redhat:lvm2 is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aredhat%3Alvm2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This one, and the 20 following patches: applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lvm2/lvm2.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
> index dc4e938697..1194044537 100644
> --- a/package/lvm2/lvm2.mk
> +++ b/package/lvm2/lvm2.mk
> @@ -10,6 +10,7 @@ LVM2_SITE = http://sources.redhat.com/pub/lvm2
>  LVM2_INSTALL_STAGING = YES
>  LVM2_LICENSE = GPL-2.0, LGPL-2.1
>  LVM2_LICENSE_FILES = COPYING COPYING.LIB
> +LVM2_CPE_ID_PRODUCT = redhat
>  
>  # Make sure that binaries and libraries are installed with write
>  # permissions for the owner. We disable NLS because it's broken, and
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
