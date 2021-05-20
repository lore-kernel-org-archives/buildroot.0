From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 21:45:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfuse3: add CPE variables
In-Reply-To: <20210520193154.183344-1-fontaine.fabrice@gmail.com>
References: <20210520193154.183344-1-fontaine.fabrice@gmail.com>
Message-ID: <20210520194546.GE3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-20 21:31 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:libfuse_project:libfuse is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibfuse_project%3Alibfuse
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libfuse3/libfuse3.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
> index d61e313391..b1624ba887 100644
> --- a/package/libfuse3/libfuse3.mk
> +++ b/package/libfuse3/libfuse3.mk
> @@ -8,6 +8,8 @@ LIBFUSE3_VERSION = 3.10.3
>  LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
>  LIBFUSE3_LICENSE = LGPL-2.1
>  LIBFUSE3_LICENSE_FILES = LICENSE
> +LIBFUSE3_CPE_ID_VENDOR = libfuse_project
> +LIBFUSE3_CPE_ID_PRODUCT = libfuse
>  LIBFUSE3_INSTALL_STAGING = YES
>  LIBFUSE3_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
>  LIBFUSE3_CONF_OPTS = \
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
