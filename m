From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Mar 2021 23:22:10 +0100
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove myself for aufs
In-Reply-To: <20210312220814.1318426-1-christian@paral.in>
References: <20210312220814.1318426-1-christian@paral.in>
Message-ID: <20210312222210.GI2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2021-03-12 14:08 -0800, Christian Stewart spake thusly:
> Aufs has been deprecated for the purposes of Docker/containers since overlay2
> became the mainline kernel module of choice.

Sure, that makes sense.

> Signed-off-by: Christian Stewart <christian@paral.in>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f6d6e4aa06..ad6bd1f241 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -509,9 +509,6 @@ N:	Christian Kellermann <christian.kellermann@solectrix.de>
>  F:	package/python-pylibftdi/
>  
>  N:	Christian Stewart <christian@paral.in>
> -F:	linux/linux-ext-aufs.mk
> -F:	package/aufs/
> -F:	package/aufs-util/
>  F:	package/batman-adv/
>  F:	package/delve/
>  F:	package/docker-cli/
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
