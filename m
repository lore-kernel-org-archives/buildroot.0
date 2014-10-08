From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Oct 2014 22:50:28 +0200
Subject: [Buildroot] [PATCH 1/2] docs/manual: slightly improve faq entry
 about compiler on target
In-Reply-To: <1412799410-19667-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1412799410-19667-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141008205028.GE4718@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-08 22:16 +0200, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I agree with your reply to my previous comment, so:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/faq-troubleshooting.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
> index 7195234..693028c 100644
> --- a/docs/manual/faq-troubleshooting.txt
> +++ b/docs/manual/faq-troubleshooting.txt
> @@ -35,7 +35,9 @@ target_ would be stopped from the Buildroot-2012.11 release because:
>  * this feature was only available for Buildroot toolchains;
>  * Buildroot mostly targets _small_ or _very small_ target hardware
>    with limited resource onboard (CPU, ram, mass-storage), for which
> -  compiling does not make much sense.
> +  compiling on the target does not make much sense;
> +* Buildroot aims at easing the cross-compilation, making native
> +  compilation on the target unnecessary.
>  
>  If you need a compiler on your target anyway, then Buildroot is not
>  suitable for your purpose. In such case, you need a _real
> -- 
> 2.0.0
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
