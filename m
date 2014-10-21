From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Oct 2014 19:21:23 +0200
Subject: [Buildroot] [PATCH 3/3] skeleton/etc/profile: drop aliases
In-Reply-To: <1413761457-25565-3-git-send-email-gustavo@zacarias.com.ar>
References: <1413761457-25565-1-git-send-email-gustavo@zacarias.com.ar>
 <1413761457-25565-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141021172123.GD30778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-10-19 20:30 -0300, Gustavo Zacarias spake thusly:
> They all depend on having a custom busybox config and/or fully featured
> utilities which depend on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  system/skeleton/etc/profile | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
> index 640f6f1..3812dda 100644
> --- a/system/skeleton/etc/profile
> +++ b/system/skeleton/etc/profile
> @@ -33,17 +33,6 @@ if [ "$PS1" ]; then
>      export INPUTRC=/etc/inputrc
>      export DMALLOC_OPTIONS=debug=0x34f47d83,inter=100,log=logfile
>  
> -    ### Some aliases
> -    alias ps2='ps facux '
> -    alias ps1='ps faxo "%U %t %p %a" '
> -    alias af='ps af'
> -    alias cls='clear'
> -    alias df='df -h'
> -    alias indent='indent -bad -bap -bbo -nbc -br -brs -c33 -cd33 -ncdb -ce -ci4 -cli0 -cp33 -cs -d0 -di1 -nfc1 -nfca -hnl -i4 -ip0 -l75 -lp -npcs -npsl -nsc -nsob -nss -ts4 '
> -    #alias bc='bc -l'
> -    alias minicom='minicom -c on'
> -    alias calc='calc -Cd '
> -    alias bc='calc -Cd '
>  fi;
>  
>  # Source configuration files from /etc/profile.d
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
