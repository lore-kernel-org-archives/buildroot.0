From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Jul 2015 00:04:34 +0200
Subject: [Buildroot] [PATCH] bootutils: update website URL
In-Reply-To: <958e161f6db21f2f5c374079f23860e969e9eb46.1436522099.git.baruch@tkos.co.il>
References: <958e161f6db21f2f5c374079f23860e969e9eb46.1436522099.git.baruch@tkos.co.il>
Message-ID: <20150710220434.GB5469@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-07-10 12:54 +0300, Baruch Siach spake thusly:
> The original homepage seems to be down. Use the sourceforge intro page
> instead.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/bootutils/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/bootutils/Config.in b/package/bootutils/Config.in
> index 308db248b215..370da0d1eb2c 100644
> --- a/package/bootutils/Config.in
> +++ b/package/bootutils/Config.in
> @@ -6,4 +6,4 @@ config BR2_PACKAGE_BOOTUTILS
>  	  either by label or explicit label= on the kernel command line,
>  	  mounting it, and 'switchroot'ing is automated.
>  
> -	  http://bootutils.pr.linuxrulz.org/
> +	  http://bootutils.sourceforge.net/
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
