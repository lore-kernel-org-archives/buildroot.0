From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 23 Jun 2020 23:32:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/nginx: fix typo in stream split
 clients
In-Reply-To: <20200623212726.1039911-1-fontaine.fabrice@gmail.com>
References: <20200623212726.1039911-1-fontaine.fabrice@gmail.com>
Message-ID: <20200623213212.GE2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-06-23 23:27 +0200, Fabrice Fontaine spake thusly:
> Commit 3e6b35900f4f4aed4fd11e0187a36a7f374271aa forgot to add a 's' to
> ngx_stream_split_client_module
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nginx/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/nginx/Config.in b/package/nginx/Config.in
> index 1cf6d41248..714ab2431d 100644
> --- a/package/nginx/Config.in
> +++ b/package/nginx/Config.in
> @@ -381,7 +381,7 @@ config BR2_PACKAGE_NGINX_STREAM_MAP_MODULE
>  	  Enable ngx_stream_map_module
>  
>  config BR2_PACKAGE_NGINX_STREAM_SPLIT_CLIENTS_MODULE
> -	bool "ngx_stream_split_client_module"
> +	bool "ngx_stream_split_clients_module"
>  	default y
>  	help
>  	  Enable ngx_stream_split_clients_module
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
