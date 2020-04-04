From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Apr 2020 16:22:21 +0200
Subject: [Buildroot] [PATCH] package/kmscube: Use the official gitlab URL
In-Reply-To: <20200404135750.29434-1-festevam@gmail.com>
References: <20200404135750.29434-1-festevam@gmail.com>
Message-ID: <20200404142221.GF22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2020-04-04 10:57 -0300, Fabio Estevam spake thusly:
> The cgit URL is a mirror of the gitlab repository.
> 
> The README.md file of the kmscube project also points
> to the gitlab repository, so switch the URL accordingly.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kmscube/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/kmscube/Config.in b/package/kmscube/Config.in
> index b9fe627c87..b6ad305bfb 100644
> --- a/package/kmscube/Config.in
> +++ b/package/kmscube/Config.in
> @@ -6,4 +6,4 @@ config BR2_PACKAGE_KMSCUBE
>  	help
>  	  kmscube is an application to test kms/drm drivers.
>  
> -	  https://cgit.freedesktop.org/mesa/kmscube/
> +	  https://gitlab.freedesktop.org/mesa/kmscube
> -- 
> 2.17.1
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
