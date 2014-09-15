From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Sep 2014 23:08:53 +0200
Subject: [Buildroot] [PATCH 1/4] arch: remove BR2_arm920 reference
In-Reply-To: <1410814919-11523-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1410814919-11523-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1410814919-11523-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140915210853.GA3878@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-15 23:01 +0200, Thomas Petazzoni spake thusly:
> The BR2_GCC_TARGET_CPU defines a value for the BR2_arm920 case, but
> this option does not exist. Therefore, this commit removes one line of
> dead code.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Obviously:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  arch/Config.in.arm | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index e404a50..5ae2378 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -344,7 +344,6 @@ config BR2_ARCH_HAS_ATOMICS
>  	default y
>  
>  config BR2_GCC_TARGET_CPU
> -	default "arm920"	if BR2_arm920
>  	default "arm920t"	if BR2_arm920t
>  	default "arm922t"	if BR2_arm922t
>  	default "arm926ej-s"	if BR2_arm926t
> -- 
> 2.0.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
