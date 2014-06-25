From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Jun 2014 21:38:07 +0200
Subject: [Buildroot] [PATCH 17/54] libsvgtiny: add license information
In-Reply-To: <1403636160-11807-17-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-17-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140625193807.GC3489@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

As a side note, there is now a git tree with proper tags for this;
    http://git.netsurf-browser.org/libsvgtiny.git/

I noticed that a lot of the packages have changed home, or have no home
any more, or that we are packaging a very old version... I'll try to get
some time this WE to do a pass on all this (and try to revived the
script to check that...

Regards,
Yann E. MORIN.

> ---
>  package/libsvgtiny/libsvgtiny.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
> index dd40452..a2d494e 100644
> --- a/package/libsvgtiny/libsvgtiny.mk
> +++ b/package/libsvgtiny/libsvgtiny.mk
> @@ -8,6 +8,8 @@ LIBSVGTINY_SITE = svn://svn.netsurf-browser.org/trunk/libsvgtiny
>  LIBSVGTINY_VERSION = 12121
>  LIBSVGTINY_INSTALL_STAGING = YES
>  LIBSVGTINY_DEPENDENCIES = libxml2 host-gperf host-pkgconf
> +LIBSVGTINY_LICENSE = MIT
> +LIBSVGTINY_LICENSE_FILES = README
>  
>  define LIBSVGTINY_BUILD_CMDS
>  	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=/usr
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
