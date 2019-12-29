From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2019 10:26:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/fbterm: update the upstream URL
 in Config.in
In-Reply-To: <20191227174749.12906-1-mark@dibsco.co.uk>
References: <20191227174749.12906-1-mark@dibsco.co.uk>
Message-ID: <20191229092634.GU26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark, All,

On 2019-12-27 17:47 +0000, Mark Corbin spake thusly:
> Update the upstream URL in the help text in Config.in. This
> addresses the 'Invalid(405)' URL status in the package stats
> web page output.
> 
> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>

Applied to master, along with the uboot, zd1211-fw, and ympd ones.
Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  package/fbterm/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/fbterm/Config.in b/package/fbterm/Config.in
> index 3ab8bdb4d4..083167088a 100644
> --- a/package/fbterm/Config.in
> +++ b/package/fbterm/Config.in
> @@ -10,7 +10,7 @@ config BR2_PACKAGE_FBTERM
>  	  fbterm is a fast terminal emulator for Linux with frame buffer
>  	  device or VESA video card.
>  
> -	  http://code.google.com/p/fbterm/
> +	  https://code.google.com/archive/p/fbterm/
>  
>  comment "fbterm needs a toolchain w/ C++, wchar, locale"
>  	depends on BR2_USE_MMU
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
