From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 17:21:12 +0200
Subject: [Buildroot] [PATCH] dependencies.sh: fix typo
In-Reply-To: <1405782916-1500-1-git-send-email-vincent.stehle@laposte.net>
References: <1405782916-1500-1-git-send-email-vincent.stehle@laposte.net>
Message-ID: <20140719152112.GJ3593@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent, All,

On 2014-07-19 17:15 +0200, Vincent Stehl? spake thusly:
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  support/dependencies/dependencies.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index fa50666..88e5ad2 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -206,7 +206,7 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
>  		echo "but your build machine uses the x86-64 architecture without the 32 bits compatibility"
>  		echo "library."
>  		echo "If you're running a Debian/Ubuntu distribution, install the libc6-386,"
> -		echo "lib32stcd++6, and lib32z1 packages (or alternatively libc6:i386,"
> +		echo "lib32stdc++6, and lib32z1 packages (or alternatively libc6:i386,"
>  		echo "libstdc++6:i386, and zlib1g:i386)."
>  		echo "For other distributions, refer to the documentation on how to install the 32 bits"
>  		echo "compatibility libraries."
> -- 
> 2.0.1
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
