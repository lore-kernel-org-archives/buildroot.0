From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 18:07:21 +0200
Subject: [Buildroot] [PATCH 14/14] toolchain-common: drop BR2_INET_IPV6
In-Reply-To: <1428754662-27829-14-git-send-email-gustavo@zacarias.com.ar>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
 <1428754662-27829-14-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150412160721.GC19416@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-04-11 09:17 -0300, Gustavo Zacarias spake thusly:
> It's now unused so farewell.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-common.in | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> index dfb7394..478315b 100644
> --- a/toolchain/toolchain-common.in
> +++ b/toolchain/toolchain-common.in
> @@ -5,10 +5,6 @@
>  # so put it here instead
>  source "package/gdb/Config.in.host"
>  
> -config BR2_INET_IPV6
> -	bool
> -	default y
> -
>  config BR2_TOOLCHAIN_HAS_GCC_BUG_58595
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
