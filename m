From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Jan 2020 22:11:21 +0100
Subject: [Buildroot] [PATCH 1/2] linux: bump CIP kernel to version
 4.19.94-cip18
In-Reply-To: <20200115214105.16033-1-angelo@amarulasolutions.com>
References: <20200115214105.16033-1-angelo@amarulasolutions.com>
Message-ID: <20200117211121.GQ22540@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2020-01-15 22:41 +0100, Angelo Compagnucci spake thusly:
> This patch bumps Linux CIP version to 4.19.94-cip18.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  linux/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 93e89a0702..b9cfcd07f8 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -30,7 +30,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
>  	bool "Latest version (5.4)"
>  
>  config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> -	bool "Latest CIP SLTS version (4.19.88-cip16)"
> +	bool "Latest CIP SLTS version (4.19.94-cip18)"
>  	help
>  	  CIP launched in the spring of 2016 to address the needs of
>  	  organizations in industries such as power generation and
> @@ -129,7 +129,7 @@ endif
>  config BR2_LINUX_KERNEL_VERSION
>  	string
>  	default "5.4.5" if BR2_LINUX_KERNEL_LATEST_VERSION
> -	default "4.19.88-cip16" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> +	default "4.19.94-cip18" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	default "4.19.82-cip14-rt5" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>  	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
>  		if BR2_LINUX_KERNEL_CUSTOM_VERSION
> -- 
> 2.17.1
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
