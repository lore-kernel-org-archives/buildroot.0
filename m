From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2020 19:20:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/janus-gateway: remove wrong
 REST comment
In-Reply-To: <20200329164423.4097287-1-fontaine.fabrice@gmail.com>
References: <20200329164423.4097287-1-fontaine.fabrice@gmail.com>
Message-ID: <20200329172058.GK22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-03-29 18:44 +0200, Fabrice Fontaine spake thusly:
> Commit 80f3622bc78d7d2c404a5e4d960686bd03c82450 removed
> BR2_TOOLCHAIN_HAS_THREADS dependency from BR2_PACKAGE_JANUS_GATEWAY_REST
> but forgot to remove comment
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/janus-gateway/Config.in | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
> index 989ae26055..fc32546717 100644
> --- a/package/janus-gateway/Config.in
> +++ b/package/janus-gateway/Config.in
> @@ -79,9 +79,6 @@ config BR2_PACKAGE_JANUS_GATEWAY_REST
>  	bool "REST (HTTP/HTTPS)"
>  	select BR2_PACKAGE_LIBMICROHTTPD
>  
> -comment "REST transport needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> -
>  config BR2_PACKAGE_JANUS_GATEWAY_UNIX_SOCKETS
>  	bool "Unix Sockets"
>  	default y
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
