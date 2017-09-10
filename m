From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Sep 2017 11:55:38 +0200
Subject: [Buildroot] [PATCH] aiccu: remove package
In-Reply-To: <20170910094317.1146-1-alexander.i.mukhin@gmail.com>
References: <20170909153834.GA2850@scaer>
 <20170910094317.1146-1-alexander.i.mukhin@gmail.com>
Message-ID: <20170910095538.GE3536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander, All,

On 2017-09-10 12:43 +0300, Alexander Mukhin spake thusly:
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>

Thanks! :-)

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Yet, a little nit-pick: why did you not add Michael in Cc of this patch,
since he's (was!) declared as developper for aiccu?

Also, I would have kept the reason in the commit log itself, because for
once, duplicating the info in the commit log and the help text does make
sense.

But no need to respin. If the committer sees fit, they'll add it back.

[--SNIP--]
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 44303a42b..d4befa864 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,16 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2017.11"
>  
> +config BR2_PACKAGE_AICCU
> +	bool "aiccu utility removed"
> +	select BR2_LEGACY
> +	help
> +	  As the SixXS project has ceased its operation on 2017-06-06,
> +	  the AICCU utility has no use anymore and has been removed.
> +
> +	  https://www.sixxs.net/sunset/

It's a bit sad they're not considering releasing the server part... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
