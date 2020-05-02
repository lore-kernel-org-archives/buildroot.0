From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2020 18:14:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfm-extra: fix dependency
 comment
In-Reply-To: <20200502095407.3519757-1-bernd.kuhls@t-online.de>
References: <20200502095407.3519757-1-bernd.kuhls@t-online.de>
Message-ID: <20200502161450.GH15673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-05-02 11:54 +0200, Bernd Kuhls spake thusly:
> According to the depends used the package does not need C++.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libfm-extra/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libfm-extra/Config.in b/package/libfm-extra/Config.in
> index eefc022c4e..60e6fda30f 100644
> --- a/package/libfm-extra/Config.in
> +++ b/package/libfm-extra/Config.in
> @@ -10,6 +10,6 @@ config BR2_PACKAGE_LIBFM_EXTRA
>  
>  	  http://wiki.lxde.org/en/Libfm
>  
> -comment "libfm-extra needs a toolchain w/ wchar, threads, C++"
> +comment "libfm-extra needs a toolchain w/ wchar, threads"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> -- 
> 2.26.2
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
