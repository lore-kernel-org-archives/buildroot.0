From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 21:23:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/wf111: update the upstream URL
 in Config.in
In-Reply-To: <20191230152421.11701-1-mark@dibsco.co.uk>
References: <20191230152421.11701-1-mark@dibsco.co.uk>
Message-ID: <20191230202349.GR26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark, All,

On 2019-12-30 15:24 +0000, Mark Corbin spake thusly:
> Update the upstream URL in the help text in Config.in. This
> addresses an intermittent 'Invalid(404)' URL status in the
> package stats web page output.
> 
> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
> ---
>  package/wf111/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/wf111/Config.in b/package/wf111/Config.in
> index 7b61ea195f..6aaf1b9edb 100644
> --- a/package/wf111/Config.in
> +++ b/package/wf111/Config.in
> @@ -17,7 +17,7 @@ config BR2_PACKAGE_WF111
>  	    configuration entry that selects them, for example.
>  	  - By enabling another random WiFi driver that select them.
>  
> -	  https://www.silabs.com/products/wireless/wi-fi/wf111-bluegiga-module
> +	  https://www.silabs.com/wireless/wi-fi/bluegiga-legacy-modules

I've changed to an ever more precise home page:
    https://www.silabs.com/wireless/wi-fi/bluegiga-legacy-modules/device.wf111

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  comment "wf111 needs a glibc toolchain"
>  	depends on BR2_LINUX_KERNEL
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
