From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jul 2016 17:39:50 +0200
Subject: [Buildroot] [PATCH 1/6] gnutls: update legal info
In-Reply-To: <1467636386-6759-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1467636386-6759-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160704153950.GB3549@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rahul, All,

On 2016-07-04 18:16 +0530, Rahul Bedarkar spake thusly:
> GnuTLS core library is licensed under LGPLv2.1+ while gnutls-openssl
> library is licensed under GPLv3+. Annotate the license with components.

What do you call "core library" and "gnutls-openssl library"?

Do you consider libdane to be that "gnutls-openssl library" you talk
about?

I've looked at the source, and libdane is (at least partially) LGPLv3:

    libdane/errors.c:
    [--SNIP--]
     * libdane is free software; you can redistribute it and/or
     * modify it under the terms of the GNU Lesser General Public License
     * as published by the Free Software Foundation; either version 3 of
     * the License, or (at your option) any later version.
    [--SNIP--]

Could you please review the situation and provide a bit more
explanations as to what is what, please?

Regards,
Yann E. MORIN.

> Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/gnutls/gnutls.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index 76d2ca2..c063f8f 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -8,7 +8,7 @@ GNUTLS_VERSION_MAJOR = 3.4
>  GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
>  GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
>  GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
> -GNUTLS_LICENSE = GPLv3+, LGPLv2.1+
> +GNUTLS_LICENSE = GPLv3+ (gnutls-openssl library), LGPLv2.1+ (core library)
>  GNUTLS_LICENSE_FILES = COPYING COPYING.LESSER
>  GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle pcre
>  GNUTLS_CONF_OPTS = \
> -- 
> 2.6.2
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
