From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 19:47:04 +0100
Subject: [Buildroot] [PATCH 04/13] libcdio: new package
In-Reply-To: <e06bb5510036fde83350074e66d17f52d314ee2c.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
 <e06bb5510036fde83350074e66d17f52d314ee2c.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <201302211947.04788.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On Thursday 21 February 2013 Maxime Hadjinlian wrote:
> The GNU Compact Disc Input and Control library.
> This package was originally found at : https://github.com/huceke/buildroot-rbp
> By gimli <ebsi4711@gmail.com>
[--SNIP--]
> diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
> new file mode 100644
> index 0000000..71ffe91
> --- /dev/null
> +++ b/package/libcdio/libcdio.mk
> @@ -0,0 +1,18 @@
> +#############################################################
> +#
> +# libcdio
> +#
> +#############################################################
> +
> +LIBCDIO_VERSION = 0.82
> +LIBCDIO_SITE = $(BR2_GNU_MIRROR)/libcdio
> +LIBCDIO_INSTALL_STAGING = YES
> +LIBCDIO_LICENSE = GPLv3

It is GPLv3+.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
