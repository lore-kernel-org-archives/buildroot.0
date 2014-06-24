From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Jun 2014 00:18:13 +0200
Subject: [Buildroot] [PATCHv2] libevent: add license information
In-Reply-To: <1403647830-11924-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403647830-11924-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140624221813.GO31767@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 19:10 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libevent/libevent.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
> index 14ebf72..73be502 100644
> --- a/package/libevent/libevent.mk
> +++ b/package/libevent/libevent.mk
> @@ -8,6 +8,8 @@ LIBEVENT_VERSION = 2.0.21
>  LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
>  LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
>  LIBEVENT_INSTALL_STAGING = YES
> +LIBEVENT_LICENSE = BSD-3c, OpenBSD

I was going to say: Sorry, but you forgot "MIT".
But it looks like it applies only to Windows builds, so not used on
Linux.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +LIBEVENT_LICENSE_FILES = LICENSE
>  
>  define LIBEVENT_REMOVE_PYSCRIPT
>  	rm $(TARGET_DIR)/usr/bin/event_rpcgen.py
> -- 
> 1.8.5.5
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
