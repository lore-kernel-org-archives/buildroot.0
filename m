From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Jul 2014 22:30:52 +0200
Subject: [Buildroot] [PATCH] libconfuse: needs host-flex
In-Reply-To: <1405628280-21661-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405628280-21661-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140717203052.GF3737@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-07-17 17:18 -0300, Gustavo Zacarias spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/63f/63f6f6204058932b02f79eaaa44eb4555c5bbb1f/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libconfuse/libconfuse.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
> index e9a1114..6450270 100644
> --- a/package/libconfuse/libconfuse.mk
> +++ b/package/libconfuse/libconfuse.mk
> @@ -8,6 +8,7 @@ LIBCONFUSE_VERSION = V2_7
>  LIBCONFUSE_SITE = $(call github,martinh,libconfuse,$(LIBCONFUSE_VERSION))
>  LIBCONFUSE_INSTALL_STAGING = YES
>  LIBCONFUSE_CONF_OPT = --disable-rpath
> +LIBCONFUSE_DEPENDENCIES = host-flex
>  LIBCONFUSE_LICENSE = ISC
>  LIBCONFUSE_LICENSE_FILES = src/confuse.c
>  
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
