From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2019 10:41:29 +0100
Subject: [Buildroot] [PATCH] package/ecryptfs-utils: fix typo in
 Config.in comment
In-Reply-To: <20191227143548.83674-1-giulio.benetti@benettiengineering.com>
References: <20191227143548.83674-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191229094129.GV26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2019-12-27 15:35 +0100, Giulio Benetti spake thusly:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ecryptfs-utils/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
> index 68a659d33d..0c39f48d08 100644
> --- a/package/ecryptfs-utils/Config.in
> +++ b/package/ecryptfs-utils/Config.in
> @@ -28,7 +28,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
>  
>  	  http://ecryptfs.org
>  
> -comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynami library"
> +comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynamic library"
>  	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
>  	depends on BR2_USE_MMU
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
> -- 
> 2.20.1
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
