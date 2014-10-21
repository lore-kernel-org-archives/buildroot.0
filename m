From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Oct 2014 19:20:18 +0200
Subject: [Buildroot] [PATCH 1/3] skeleton/etc/profile: remove
 /usr/bin/X11 from PATH
In-Reply-To: <1413761457-25565-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413761457-25565-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141021172018.GB30778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-10-19 20:30 -0300, Gustavo Zacarias spake thusly:
> That directory has been unused for ages so remove it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  system/skeleton/etc/profile | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
> index 31d3180..640f6f1 100644
> --- a/system/skeleton/etc/profile
> +++ b/system/skeleton/etc/profile
> @@ -5,7 +5,6 @@ export PATH=\
>  /sbin:\
>  /usr/bin:\
>  /usr/sbin:\
> -/usr/bin/X11:\
>  /usr/local/bin
>  
>  # If running interactively, then:
> -- 
> 2.0.4
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
