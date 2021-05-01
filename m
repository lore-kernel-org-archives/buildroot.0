From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 May 2021 21:48:15 +0200
Subject: [Buildroot] [PATCH 1/1] Config.in.legacy: fix
 BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE
In-Reply-To: <20210501165037.1570879-1-fontaine.fabrice@gmail.com>
References: <20210501165037.1570879-1-fontaine.fabrice@gmail.com>
Message-ID: <20210501194815.GG2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-01 18:50 +0200, Fabrice Fontaine spake thusly:
> Commit fdb6fc2b4a5be747e7695f594cbbb1a941ceb05b forgot to select
> BR2_LEGACY
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 0387967311..629d02dbf2 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -148,6 +148,7 @@ comment "Legacy options removed in 2021.05"
>  
>  config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE
>  	bool "sconeserver http::sconesite::image removed"
> +	select BR2_LEGACY
>  	help
>  	  Sconeserver cannot be built with ImageMagick - it uses the
>  	  "transofrm" function which is removed from public API.
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
