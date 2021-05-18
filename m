From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 13:06:13 +0200
Subject: [Buildroot] [PATCH 1/1] libtirpc: bump version to 1.3.2
In-Reply-To: <20210517174340.13697-1-petr.vorel@gmail.com>
References: <20210517174340.13697-1-petr.vorel@gmail.com>
Message-ID: <20210518110613.GP2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2021-05-17 19:43 +0200, Petr Vorel spake thusly:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Tested:
>                     bootlin-armv5-uclibc [1/6]: OK
>                      bootlin-armv7-glibc [2/6]: OK
>                    bootlin-armv7m-uclibc [3/6]: OK
>                      bootlin-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                             sourcery-arm [6/6]: OK
> 6 builds, 0 skipped, 0 build failed, 0 legal-info failed
> 
>  package/libtirpc/libtirpc.hash | 4 ++--
>  package/libtirpc/libtirpc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
> index 337593bbe2..56c1d9de3f 100644
> --- a/package/libtirpc/libtirpc.hash
> +++ b/package/libtirpc/libtirpc.hash
> @@ -1,5 +1,5 @@
>  # From sourceforge's info on download page:
> -sha1  882eaf4c13f0cafb83afd96cd2855638f978d755  libtirpc-1.3.1.tar.bz2
> +sha1  51d75be0e5acc094a888f40042b23e128d163cb5  libtirpc-1.3.2.tar.bz2
>  # Locally computed
> -sha256  245895caf066bec5e3d4375942c8cb4366adad184c29c618d97f724ea309ee17  libtirpc-1.3.1.tar.bz2
> +sha256  e24eb88b8ce7db3b7ca6eb80115dd1284abc5ec32a8deccfed2224fc2532b9fd  libtirpc-1.3.2.tar.bz2
>  sha256  17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
> diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
> index 0f44aaffb6..2678c144e9 100644
> --- a/package/libtirpc/libtirpc.mk
> +++ b/package/libtirpc/libtirpc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBTIRPC_VERSION = 1.3.1
> +LIBTIRPC_VERSION = 1.3.2

This is a bug-fix release, so I applied to master, thanks (and I fixed
the title as you already pointed out, thanks).

Regards,
Yann E. MORIN.

>  LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
>  LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
>  LIBTIRPC_LICENSE = BSD-3-Clause
> -- 
> 2.31.1
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
