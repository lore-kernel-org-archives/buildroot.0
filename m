From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Nov 2015 23:14:09 +0100
Subject: [Buildroot] [PATCH] sqlite: add license file
In-Reply-To: <1448454551-31095-1-git-send-email-peda@lysator.liu.se>
References: <1448454551-31095-1-git-send-email-peda@lysator.liu.se>
Message-ID: <20151125221409.GB3987@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015-11-25 13:29 +0100, Peter Rosin spake thusly:
> From: Peter Rosin <peda@axentia.se>
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/sqlite/sqlite.mk |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
> index d08e933..0758fe9 100644
> --- a/package/sqlite/sqlite.mk
> +++ b/package/sqlite/sqlite.mk
> @@ -8,6 +8,7 @@ SQLITE_VERSION = 3090200
>  SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
>  SQLITE_SITE = http://www.sqlite.org/2015
>  SQLITE_LICENSE = Public domain
> +SQLITE_LICENSE_FILES = tea/license.terms
>  SQLITE_INSTALL_STAGING = YES
>  
>  # Patching Makefile.am:
> -- 
> 1.7.10.4
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
