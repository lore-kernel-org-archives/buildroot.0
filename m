From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 21:40:18 +0100
Subject: [Buildroot] [PATCH 12/13] tinyxml: new package
In-Reply-To: <ad24f17c066c0f28873e76aaf0f69b08ca205e36.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
 <ad24f17c066c0f28873e76aaf0f69b08ca205e36.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <201302212140.19064.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On Thursday 21 February 2013 Maxime Hadjinlian wrote:
> Tiny XML Parser.
> This package was originally found at : https://github.com/huceke/buildroot-rbp
> By gimli <ebsi4711@gmail.com>
[--SNIP--]
> diff --git a/package/tinyxml/Config.in b/package/tinyxml/Config.in
> new file mode 100644
> index 0000000..b549d00
> --- /dev/null
> +++ b/package/tinyxml/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_TINYXML
> +	bool "tinyxml"
> +        depends on BR2_INSTALL_LIBSTDCPP

Indent-damage. Leading tabs, please.

> diff --git a/package/tinyxml/tinyxml.mk b/package/tinyxml/tinyxml.mk
> new file mode 100644
> index 0000000..f4f042b
> --- /dev/null
> +++ b/package/tinyxml/tinyxml.mk
> @@ -0,0 +1,12 @@
> +#############################################################
> +#
> +# tinyxml
> +#
> +#############################################################
> +
> +TINYXML_VERSION = 2.6.2_2
> +TINYXML_SITE = http://mirrors.xbmc.org/build-deps/sources
> +TINYXML_AUTORECONF = YES
> +TINYXML_INSTALL_STAGING = YES

License is the Zlib license:
    https://github.com/leethomason/tinyxml2/blob/master/tinyxml2.cpp
    https://spdx.org/licenses/Zlib

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
