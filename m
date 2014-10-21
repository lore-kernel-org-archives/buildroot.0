From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Oct 2014 19:20:57 +0200
Subject: [Buildroot] [PATCH 2/3] skeleton/root/.bash_profile: don't set
 PATH
In-Reply-To: <1413761457-25565-2-git-send-email-gustavo@zacarias.com.ar>
References: <1413761457-25565-1-git-send-email-gustavo@zacarias.com.ar>
 <1413761457-25565-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141021172057.GC30778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-10-19 20:30 -0300, Gustavo Zacarias spake thusly:
> Even if the main shell is bash /etc/profile is also parsed so it's
> redundant.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Besides, it's really ugly the way it is currently done... :-(

Regards,
Yann E. MORIN.

> ---
>  system/skeleton/root/.bash_profile | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/system/skeleton/root/.bash_profile b/system/skeleton/root/.bash_profile
> index 27bf149..0ee04a3 100644
> --- a/system/skeleton/root/.bash_profile
> +++ b/system/skeleton/root/.bash_profile
> @@ -1,13 +1,5 @@
>  # .bash_profile
>  
> -export PATH=\
> -/bin:\
> -/sbin:\
> -/usr/bin:\
> -/usr/sbin:\
> -/usr/bin/X11:\
> -/usr/local/bin
> -
>  umask 022
>  
>  if [ -f ~/.bashrc ]; then
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
