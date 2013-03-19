From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Mar 2013 20:52:37 +0100
Subject: [Buildroot] [PATCH] toolchain: update crosstool-NG project URL
In-Reply-To: <1363720538-12992-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1363720538-12992-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <201303192052.37818.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 19 March 2013 Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Obviously:
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  toolchain/Config.in |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 6311349..fa78cf4 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -26,7 +26,7 @@ config BR2_TOOLCHAIN_CTNG
>  	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
>  	help
>  	  Say 'y' if you want to generate the toolchain with crosstool-NG
> -	  ( http://ymorin.is-a-geek.org/projects/crosstool )
> +	  (http://crosstool-ng.org).
>  
>  	  This is considered experimental, and you can expect some breakage.
>  
> -- 
> 1.7.9.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
