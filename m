From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Nov 2019 22:01:30 +0100
Subject: [Buildroot] [PATCH 1/1] Config.in.legacy: fix small typo
In-Reply-To: <20191110204151.32640-1-fontaine.fabrice@gmail.com>
References: <20191110204151.32640-1-fontaine.fabrice@gmail.com>
Message-ID: <20191110210130.GF3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-11-10 21:41 +0100, Fabrice Fontaine spake thusly:
> Fix small typo: oenvmtools -> openvmtools
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

(and now I shall really take a break away from keyboard. ;-) )

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 848551cfce..aa66a564a9 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -147,7 +147,7 @@ endif
>  comment "Legacy options removed in 2019.11"
>  
>  config BR2_PACKAGE_OPENVMTOOLS_PROCPS
> -	bool "oenvmtools' procps support was removed"
> +	bool "openvmtools' procps support was removed"
>  	select BR2_LEGACY
>  	help
>  	  Upstream stopped supporting this option a while ago.
> -- 
> 2.23.0
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
