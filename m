From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Oct 2019 20:59:30 +0200
Subject: [Buildroot] [PATCH v2,
 1/2] package/nbd: add host-pkgconf to dependencies
In-Reply-To: <20191006180431.19759-1-fontaine.fabrice@gmail.com>
References: <20191006180431.19759-1-fontaine.fabrice@gmail.com>
Message-ID: <20191006185930.GO10860@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-10-06 20:04 +0200, Fabrice Fontaine spake thusly:
> pkg-config is used to find libglib2 since version 3.17 and
> https://github.com/NetworkBlockDevice/nbd/commit/ef86bbd9da2e2116ec0da6f9c130fb52e89fc310
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

You forgot to propagate my:

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/nbd/nbd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
> index 484f3e695b..fa569f3224 100644
> --- a/package/nbd/nbd.mk
> +++ b/package/nbd/nbd.mk
> @@ -8,7 +8,7 @@ NBD_VERSION = 3.19
>  NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
>  NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
>  NBD_CONF_OPTS = --enable-lfs
> -NBD_DEPENDENCIES = libglib2
> +NBD_DEPENDENCIES = host-pkgconf libglib2
>  NBD_LICENSE = GPL-2.0
>  NBD_LICENSE_FILES = COPYING
>  
> -- 
> 2.23.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
