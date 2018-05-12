From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 May 2018 17:07:17 +0200
Subject: [Buildroot] [PATCH] support/download/file: remove set -x
In-Reply-To: <1525795109-22746-1-git-send-email-angelo@amarulasolutions.com>
References: <1525795109-22746-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180512150717.GB27677@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2018-05-08 17:58 +0200, Angelo Compagnucci spake thusly:
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  support/download/file | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/support/download/file b/support/download/file
> index 6dd37b0..e52fcf2 100755
> --- a/support/download/file
> +++ b/support/download/file
> @@ -2,7 +2,6 @@
>  
>  # We want to catch any unexpected failure, and exit immediately
>  set -e
> -set -x

Damn, yes! :-)

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  # Download helper for cp, to be called from the download wrapper script
>  #
> -- 
> 2.7.4
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
