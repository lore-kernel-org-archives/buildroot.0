From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Jun 2014 22:20:13 +0200
Subject: [Buildroot] [PATCH 23/54] netplug: add license information
In-Reply-To: <1403636160-11807-23-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-23-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140625202013.GK3489@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/netplug/netplug.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
> index 5756281..0bd7c78 100644
> --- a/package/netplug/netplug.mk
> +++ b/package/netplug/netplug.mk
> @@ -7,6 +7,8 @@
>  NETPLUG_VERSION = 1.2.9.2
>  NETPLUG_SOURCE = netplug-$(NETPLUG_VERSION).tar.bz2
>  NETPLUG_SITE = http://www.red-bean.com/~bos/netplug
> +NETPLUG_LICENSE = GPLv2
> +NETPLUG_LICENSE_FILES = COPYING
>  
>  define NETPLUG_BUILD_CMDS
>  	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
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
