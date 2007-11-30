From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 30 Nov 2007 13:40:51 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libosip2
In-Reply-To: <20071130102837.4DBEBA6AB6@busybox.net>
References: <20071130102837.4DBEBA6AB6@busybox.net>
Message-ID: <474FF6C3.8020107@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> 
> Changeset:
> Modified: trunk/buildroot/package/Config.in
> ===================================================================
> --- trunk/buildroot/package/Config.in	2007-11-30 09:12:09 UTC (rev 20593)
> +++ trunk/buildroot/package/Config.in	2007-11-30 10:28:36 UTC (rev 20594)
> @@ -153,6 +153,7 @@
>  source "package/l2tp/Config.in"
>  source "package/libcgi/Config.in"
>  source "package/libcgicc/Config.in"
> +source "package/libosip2/Config.in"
>  source "package/libpcap/Config.in"
>  source "package/links/Config.in"
>  source "package/lrzsz/Config.in"
> @@ -415,4 +416,14 @@
>  source "package/php/Config.in"
>  endif
>  
> +menuconfig BR2_GAMES
> +	bool "Games"
> +	default y
> +	help
> +	  Support for games
> +
> +if BR2_GAMES
> +source "package/lxdoom/Config.in"
> +endif
> +
>  endmenu
> 

Hi Ulf,

Did you intentionally commit BR2_GAMES?
You mentioned only libosip2 package in your commit log.

Regards,
Ivan
-- 

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
