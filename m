From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Jul 2013 11:58:57 +0200
Subject: [Buildroot] [PATCH v3 1/2] ext-toolchain-wrapper: fix typo on
 s/BR2_FPU/BR_FPU/
In-Reply-To: <1374276718-14000-1-git-send-email-spenser@gillilanding.com>
References: <1374276718-14000-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20130720095857.GA3507@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-07-19 18:31 -0500, Spenser Gilliland spake thusly:
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  toolchain/toolchain-external/ext-toolchain-wrapper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> index 460f255..dc473be 100644
> --- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
> +++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> @@ -41,7 +41,7 @@ static char *predef_args[] = {
>  #ifdef BR_FLOAT_ABI
>  	"-mfloat-abi=" BR_FLOAT_ABI,
>  #endif
> -#ifdef BR2_FPU
> +#ifdef BR_FPU
>  	"-mfpu=" BR_FPU,
>  #endif
>  #ifdef BR_SOFTFLOAT
> -- 
> 1.8.1.2
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
