From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Dec 2019 19:05:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/tcllib: update the upstream URL
 in Config.in
In-Reply-To: <20191218131441.7151-1-mark@dibsco.co.uk>
References: <20191218131441.7151-1-mark@dibsco.co.uk>
Message-ID: <20191219180509.GL26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark, All,

On 2019-12-18 13:14 +0000, Mark Corbin spake thusly:
> Update the upstream URL in the help text in Config.in. This
> addresses the 'Invalid(Err)' URL status in the package stats
> web page output.
> 
> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tcllib/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/tcllib/Config.in b/package/tcllib/Config.in
> index b0a4ad060e..3a307b9aee 100644
> --- a/package/tcllib/Config.in
> +++ b/package/tcllib/Config.in
> @@ -8,4 +8,4 @@ config BR2_PACKAGE_TCLLIB
>  	  is to collect commonly used function into a single library,
>  	  which users can rely on to be available and stable
>  
> -	  http://tcl.activestate.com/software/tcllib/
> +	  https://www.tcl.tk/software/tcllib/
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
