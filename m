From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 08:41:26 +0200
Subject: [Buildroot] [PATCH 1/2] Config.in.legacy: update iostat title
In-Reply-To: <20210517211857.1130768-1-fontaine.fabrice@gmail.com>
References: <20210517211857.1130768-1-fontaine.fabrice@gmail.com>
Message-ID: <20210518064126.GK2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-17 23:18 +0200, Fabrice Fontaine spake thusly:
> Specify that iostat 'package' has been removed to be consistent with
> other entries
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Both applied to master, thanks for fixing my mess. ;-)

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index bc7cb8e32a..7bd2eb1429 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -182,7 +182,7 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
>  	  The package was renamed to containerd accordingly.
>  
>  config BR2_PACKAGE_IOSTAT
> -	bool "iostat removed"
> +	bool "iostat package removed"
>  	select BR2_LEGACY
>  	help
>  	  This package has been removed, use sysstat instead.
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
