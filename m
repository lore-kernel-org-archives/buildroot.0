From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2015 23:53:02 +0100
Subject: [Buildroot] [PATCH 13/15] toolchain-common: drop BR2_LARGEFILE
In-Reply-To: <1426270934-15499-14-git-send-email-gustavo@zacarias.com.ar>
References: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
 <1426270934-15499-14-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150314225302.GP4009@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015-03-13 15:22 -0300, Gustavo Zacarias spake thusly:
> It's now unused so remove it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-common.in | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> index 7eb22ce..13c684d 100644
> --- a/toolchain/toolchain-common.in
> +++ b/toolchain/toolchain-common.in
> @@ -5,10 +5,6 @@
>  # so put it here instead
>  source "package/gdb/Config.in.host"
>  
> -config BR2_LARGEFILE
> -	bool
> -	default y
> -
>  config BR2_INET_IPV6
>  	bool
>  
> -- 
> 2.0.5
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
