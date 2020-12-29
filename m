From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 21:50:12 +0100
Subject: [Buildroot] [PATCH 2/2] package/libtirpc: bump version to 1.3.1
In-Reply-To: <20201202184954.19808-2-petr.vorel@gmail.com>
References: <20201202184954.19808-1-petr.vorel@gmail.com>
 <20201202184954.19808-2-petr.vorel@gmail.com>
Message-ID: <20201229205012.GY1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2020-12-02 19:49 +0100, Petr Vorel spake thusly:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/libtirpc/libtirpc.hash | 4 ++--
>  package/libtirpc/libtirpc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
> index e437554285..0e77f23947 100644
> --- a/package/libtirpc/libtirpc.hash
> +++ b/package/libtirpc/libtirpc.hash
> @@ -1,5 +1,5 @@
>  # From sourceforge's info on download page:
> -sha1 f182235e32942fc0ac6b9b5b6fe7e32f69362659  libtirpc-1.2.6.tar.bz2
> +sha1 882eaf4c13f0cafb83afd96cd2855638f978d755  libtirpc-1.3.1.tar.bz2
>  # Locally computed
> -sha256 4278e9a5181d5af9cd7885322fdecebc444f9a3da87c526e7d47f7a12a37d1cc  libtirpc-1.2.6.tar.bz2
> +sha256 245895caf066bec5e3d4375942c8cb4366adad184c29c618d97f724ea309ee17  dl/libtirpc/libtirpc-1.3.1.tar.bz2
___________________________________________________________________________,^^^^^^^^^^^^

Hmmm... bad copy-paste. ;-)

Fixed, and applied to master, thanks.

Regards,
Yann E. MORIN.

>  sha256 17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
> diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
> index f1bdc32eba..5371d20488 100644
> --- a/package/libtirpc/libtirpc.mk
> +++ b/package/libtirpc/libtirpc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBTIRPC_VERSION = 1.2.6
> +LIBTIRPC_VERSION = 1.3.1
>  LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
>  LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
>  LIBTIRPC_LICENSE = BSD-3-Clause
> -- 
> 2.29.2
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
