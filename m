From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 19:44:52 +0100
Subject: [Buildroot] [PATCH 03/13] libbluray: new package
In-Reply-To: <687bab14d1ef9d217df22d2875e5ccc03b924e0e.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
 <687bab14d1ef9d217df22d2875e5ccc03b924e0e.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <201302211944.52590.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On Thursday 21 February 2013 Maxime Hadjinlian wrote:
> LIBBLURAY is a client library for accessing bluray disks.
> This package was originally found at : https://github.com/huceke/buildroot-rbp
> By gimli <ebsi4711@gmail.com>
[--SNIP--]
> diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
> new file mode 100644
> index 0000000..a1fc69b
> --- /dev/null
> +++ b/package/libbluray/libbluray.mk
> @@ -0,0 +1,14 @@
> +#############################################################
> +#
> +# libbluray
> +#
> +#############################################################
> +
> +LIBBLURAY_VERSION = 0.2.2
> +LIBBLURAY_SITE = ftp://ftp.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
> +LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
> +LIBBLURAY_INSTALL_STAGING = YES
> +LIBBLURAY_LICENSE = LGPLv2.1

It is LGPLv2.1+.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
