From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 21:59:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/usbmount: update the upstream
 URL in Config.in
In-Reply-To: <20191218140255.18913-1-mark@dibsco.co.uk>
References: <20191218140255.18913-1-mark@dibsco.co.uk>
Message-ID: <20191218205921.GC26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark, All,

On 2019-12-18 14:02 +0000, Mark Corbin spake thusly:
> Update the upstream URL in the help text in Config.in. This
> addresses the 'Invalid(Err)' URL status in the package stats
> web page output.

Applied to master, thanks!

Regards,
Yann E. MORIN.

> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
> ---
>  package/usbmount/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/usbmount/Config.in b/package/usbmount/Config.in
> index f87bd911f2..8ce0ce7613 100644
> --- a/package/usbmount/Config.in
> +++ b/package/usbmount/Config.in
> @@ -7,7 +7,7 @@ config BR2_PACKAGE_USBMOUNT
>  	  devices when they are plugged in, and unmounts them when
>  	  they are removed.
>  
> -	  http://usbmount.alioth.debian.org/
> +	  https://wiki.debian.org/usbmount
>  
>  comment "usbmount requires udev to be enabled"
>  	depends on !BR2_PACKAGE_HAS_UDEV
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
