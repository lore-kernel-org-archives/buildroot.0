From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Jun 2014 23:49:40 +0200
Subject: [Buildroot] [PATCH 07/54] libevent: add license information
In-Reply-To: <1403636160-11807-7-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-7-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140624214940.GF31767@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libevent/libevent.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
> index 14ebf72..ec1ec5a 100644
> --- a/package/libevent/libevent.mk
> +++ b/package/libevent/libevent.mk
> @@ -8,6 +8,8 @@ LIBEVENT_VERSION = 2.0.21
>  LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
>  LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
>  LIBEVENT_INSTALL_STAGING = YES
> +LIBEVENT_LICENSE = BSD-3c

The LICENSE file refer to at least those three licenses:
  - the BSD-3c license
  - the "OpenBSD" license
  - the MIT license

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
