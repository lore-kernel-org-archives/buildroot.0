From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 20:49:29 +0100
Subject: [Buildroot] [PATCH 07/13] libmodplug: new package
In-Reply-To: <c2eecc3b657fbcad032c74fcb8448d65903c8376.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
 <c2eecc3b657fbcad032c74fcb8448d65903c8376.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <201302212049.30208.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On Thursday 21 February 2013 Maxime Hadjinlian wrote:
> MOD music file decoder.
> This package was originally found at : https://github.com/huceke/buildroot-rbp
> By gimli <ebsi4711@gmail.com>
[--SNIP--]
> diff --git a/package/Config.in b/package/Config.in
> index c6e1fd4..ac021e8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -349,6 +349,7 @@ source "package/alsa-lib/Config.in"
>  source "package/audiofile/Config.in"
>  source "package/celt051/Config.in"
>  source "package/libao/Config.in"
> +source "package/libmodplug/Config.in"

Alphabetical order, please.

> diff --git a/package/libmodplug/libmodplug.mk b/package/libmodplug/libmodplug.mk
> new file mode 100644
> index 0000000..889056e
> --- /dev/null
> +++ b/package/libmodplug/libmodplug.mk
> @@ -0,0 +1,11 @@
> +#############################################################
> +#
> +# libmodplug
> +#
> +#############################################################
> +
> +LIBMODPLUG_VERSION = 0.8.7
> +LIBMODPLUG_SITE = http://downloads.sourceforge.net/project/modplug-xmms/libmodplug/$(LIBMODPLUG_VERSION)
> +LIBMODPLUG_INSTALL_STAGING = YES

Add the license; it is "Public Domain".

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
