From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Apr 2015 20:01:04 +0200
Subject: [Buildroot] [PATCH 2/2] bmon: drop stray AUTORECONF from last
 bump
In-Reply-To: <1429266405-9217-2-git-send-email-gustavo@zacarias.com.ar>
References: <1429266405-9217-1-git-send-email-gustavo@zacarias.com.ar>
 <1429266405-9217-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150417180104.GE5271@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-04-17 07:26 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/bmon/bmon.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
> index b1dc399..e430bf6 100644
> --- a/package/bmon/bmon.mk
> +++ b/package/bmon/bmon.mk
> @@ -9,8 +9,6 @@ BMON_SITE = https://github.com/tgraf/bmon/releases/download/v$(BMON_VERSION)
>  BMON_DEPENDENCIES = host-pkgconf libconfuse libnl ncurses
>  BMON_LICENSE = BSD-2c, MIT
>  BMON_LICENSE_FILES = LICENSE.BSD LICENSE.MIT
> -# For 0001-build-uclinux-is-also-linux.patch
> -BMON_AUTORECONF = YES
>  
>  # link dynamically unless explicitly requested otherwise
>  ifeq ($(BR2_STATIC_LIBS),)
> -- 
> 2.0.5
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
