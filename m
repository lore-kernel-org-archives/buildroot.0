From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Jul 2021 22:33:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: bump to version 2.5.4
In-Reply-To: <20210713034926.2981657-1-james.hilliard1@gmail.com>
References: <20210713034926.2981657-1-james.hilliard1@gmail.com>
Message-ID: <20210715203311.GD12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

James, All,

On 2021-07-12 21:49 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nfs-utils/nfs-utils.hash | 4 ++--
>  package/nfs-utils/nfs-utils.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
> index 25c11cb686..2073bebd8a 100644
> --- a/package/nfs-utils/nfs-utils.hash
> +++ b/package/nfs-utils/nfs-utils.hash
> @@ -1,4 +1,4 @@
> -# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.5.3/sha256sums.asc
> -sha256  b54d6d8ea2ee62d64111278301ba4631b7bb19174e7f717a724fe5d463900c80  nfs-utils-2.5.3.tar.xz
> +# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.5.4/sha256sums.asc
> +sha256  51997d94e4c8bcef5456dd36a9ccc38e231207c4e9b6a9a2c108841e6aebe3dd  nfs-utils-2.5.4.tar.xz
>  # Locally computed
>  sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index c384e939d8..d6408ee8f7 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NFS_UTILS_VERSION = 2.5.3
> +NFS_UTILS_VERSION = 2.5.4
>  NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
>  NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
>  NFS_UTILS_LICENSE = GPL-2.0+
> -- 
> 2.25.1
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
