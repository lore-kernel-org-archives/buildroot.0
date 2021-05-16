From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 18:41:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: add CPE variables
In-Reply-To: <20210515214142.3668498-1-fontaine.fabrice@gmail.com>
References: <20210515214142.3668498-1-fontaine.fabrice@gmail.com>
Message-ID: <20210516164158.GL2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-05-15 23:41 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:mesa3d:mesa is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amesa3d%3Amesa
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mesa3d/mesa3d.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index b18faeb2ce..ca44a66e54 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -10,6 +10,8 @@ MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>  MESA3D_SITE = https://mesa.freedesktop.org/archive
>  MESA3D_LICENSE = MIT, SGI, Khronos
>  MESA3D_LICENSE_FILES = docs/license.rst
> +MESA3D_CPE_ID_VENDOR = mesa3d
> +MESA3D_CPE_ID_PRODUCT = mesa

I've also added those for mesa3d-headers while at it.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  MESA3D_INSTALL_STAGING = YES
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
