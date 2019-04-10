From: Trent Piepho <tpiepho@impinj.com>
Date: Wed, 10 Apr 2019 19:35:04 +0000
Subject: [Buildroot] [PATCH] package/libp11: fix help text
In-Reply-To: <20190407063944.22260-1-yann.morin.1998@free.fr>
References: <20190407063944.22260-1-yann.morin.1998@free.fr>
Message-ID: <1554924903.2142.45.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2019-04-07 at 08:39 +0200, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Trent Piepho <tpiepho@impinj.com>

Thanks for fixing this.

Acked-by: Trent Piepho <tpiepho@impinj.com>

> ---
>  package/libp11/Config.in.host | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libp11/Config.in.host
> b/package/libp11/Config.in.host
> index ccc171025a..8da081f868 100644
> --- a/package/libp11/Config.in.host
> +++ b/package/libp11/Config.in.host
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_HOST_LIBP11
>  	bool "host libp11"
>  	help
> -	  OpenSSL engine for PKCS#11 modules.  Part of the OpenSC
> project.
> +	  OpenSSL engine for PKCS#11 modules. Part of the OpenSC
> +	  project.
>  
> 
