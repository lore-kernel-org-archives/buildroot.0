From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2020 09:15:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/dropwatch: remove license
 comment
In-Reply-To: <20200313205616.1132768-1-fontaine.fabrice@gmail.com>
References: <20200313205616.1132768-1-fontaine.fabrice@gmail.com>
Message-ID: <20200314081527.GM705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-03-13 21:56 +0100, Fabrice Fontaine spake thusly:
> This comment is not needed since bump to version 1.5.2 and
> https://github.com/nhorman/dropwatch/commit/83a2b4e9bfe5ad26f59c15da5f77e86fbc0a6701
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dropwatch/dropwatch.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
> index 0ee9e5e0f6..4cebe041db 100644
> --- a/package/dropwatch/dropwatch.mk
> +++ b/package/dropwatch/dropwatch.mk
> @@ -7,8 +7,6 @@
>  DROPWATCH_VERSION = 1.5.2
>  DROPWATCH_SITE = $(call github,nhorman,dropwatch,v$(DROPWATCH_VERSION))
>  DROPWATCH_DEPENDENCIES = libnl readline libpcap host-pkgconf $(TARGET_NLS_DEPENDENCIES)
> -# Until upstream updates their tree with a proper license
> -# blurb: https://github.com/nhorman/dropwatch/issues/14
>  DROPWATCH_LICENSE = GPL-2.0+
>  DROPWATCH_LICENSE_FILES = COPYING
>  # From git
> -- 
> 2.25.1
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
