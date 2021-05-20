From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 21:44:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfuse: add
 LIBFUSE_CPE_ID_VENDOR
In-Reply-To: <20210520193124.183263-1-fontaine.fabrice@gmail.com>
References: <20210520193124.183263-1-fontaine.fabrice@gmail.com>
Message-ID: <20210520194435.GA3208066@scaer>
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
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asupervisord%3Asupervisor

I suspect a bad copy-paste here. ;-)

I replaced with the same URL as for libfuse3.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, with the URL fixed, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libfuse/libfuse.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
> index 074dc59886..2677e46853 100644
> --- a/package/libfuse/libfuse.mk
> +++ b/package/libfuse/libfuse.mk
> @@ -9,6 +9,7 @@ LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
>  LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse-$(LIBFUSE_VERSION)
>  LIBFUSE_LICENSE = GPL-2.0, LGPL-2.1
>  LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
> +LIBFUSE_CPE_ID_VENDOR = libfuse_project
>  LIBFUSE_INSTALL_STAGING = YES
>  LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
>  LIBFUSE_CONF_OPTS = \
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
