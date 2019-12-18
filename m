From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 21:57:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/w_scan: update the upstream URL
 in Config.in
In-Reply-To: <20191218142416.16195-1-mark@dibsco.co.uk>
References: <20191218142416.16195-1-mark@dibsco.co.uk>
Message-ID: <20191218205737.GB26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark, All,

On 2019-12-18 14:24 +0000, Mark Corbin spake thusly:
> Update the upstream URL in the help text in Config.in. This
> addresses the 'Invalid(Err)' URL status in the package stats
> web page output.
> 
> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
> ---
>  package/w_scan/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/w_scan/Config.in b/package/w_scan/Config.in
> index 01dbbae122..b41bc546d5 100644
> --- a/package/w_scan/Config.in
> +++ b/package/w_scan/Config.in
> @@ -11,4 +11,4 @@ config BR2_PACKAGE_W_SCAN
>  	  capable of creating channels.conf files (in different output
>  	  formats !) as well as initial tuning data for scan.
>  
> -	  http://wirbel.htpc-forum.de/w_scan/index_en.html
> +	  https://www.gen2vdr.de/wirbel/w_scan/index_en.html

I've switched it to the german home page, which stays on the official
site, while the english page redirects to a Google auto-translate.

Applied to master, thanks!

Regards,
Yann E. MORIN.

> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
