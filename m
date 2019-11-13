From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Nov 2019 20:00:54 +0100
Subject: [Buildroot] [PATCH 03/11] package/dropwatch: license is GPL-2.0+
In-Reply-To: <20191113151724.12155-4-peter@korsgaard.com>
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-4-peter@korsgaard.com>
Message-ID: <20191113190054.GL3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-11-13 16:17 +0100, Peter Korsgaard spake thusly:
> Dropwatch links with readline, which is GPL-3.0+, so not compatible with
> GPL-2.0.  When asked about this, upstream has clarified that the license
> really is GPL-2.0+:
> 
> https://github.com/nhorman/dropwatch/issues/14
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, after adding a comment as suggested by Baruch,
thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dropwatch/dropwatch.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
> index 1af61458e0..53d3683c5a 100644
> --- a/package/dropwatch/dropwatch.mk
> +++ b/package/dropwatch/dropwatch.mk
> @@ -7,7 +7,7 @@
>  DROPWATCH_VERSION = 1.5.1
>  DROPWATCH_SITE = $(call github,nhorman,dropwatch,v$(DROPWATCH_VERSION))
>  DROPWATCH_DEPENDENCIES = libnl readline host-pkgconf $(TARGET_NLS_DEPENDENCIES)
> -DROPWATCH_LICENSE = GPL-2.0
> +DROPWATCH_LICENSE = GPL-2.0+
>  DROPWATCH_LICENSE_FILES = COPYING
>  # From git
>  DROPWATCH_AUTORECONF = YES
> -- 
> 2.20.1
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
