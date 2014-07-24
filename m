From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Jul 2014 20:12:57 +0200
Subject: [Buildroot] [PATCH] trivial: fix typo 'informations'
In-Reply-To: <37734712403055c8a791.1406225222@localhost>
References: <37734712403055c8a791.1406225222@localhost>
Message-ID: <20140724181257.GA4065@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-24 20:07 +0200, Thomas De Schampheleire spake thusly:
> In English, unlike in French, almost all usages of the word 'information'
> are uncountable, meaning that 'informations' is invalid.

Indeed.

But I really wonder why you would even mention French? :-]
/me hides... ;-)

> This patch fixes this typo throughout the tree, except in CHANGES and
> docs/news.html (historic text).
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  board/minnowboard/readme.txt |  2 +-
>  package/pkg-autotools.mk     |  2 +-
>  package/pkg-cmake.mk         |  2 +-
>  package/pkg-generic.mk       |  4 ++--
>  package/pkg-luarocks.mk      |  2 +-
>  package/pkg-python.mk        |  2 +-
>  support/scripts/xorg-release |  4 ++--
>  7 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff -r e79d6f3e1d9c -r 377347124030 board/minnowboard/readme.txt
> --- a/board/minnowboard/readme.txt	Tue Mar 04 14:50:03 2014 +0000
> +++ b/board/minnowboard/readme.txt	Thu Jul 24 20:01:15 2014 +0200
> @@ -36,5 +36,5 @@
>  
>   4. Enjoy
>  
> -Additional informations about this board can be found at
> +Additional information about this board can be found at
>  http://www.minnowboard.org/.
> diff -r e79d6f3e1d9c -r 377347124030 package/pkg-autotools.mk
> --- a/package/pkg-autotools.mk	Tue Mar 04 14:50:03 2014 +0000
> +++ b/package/pkg-autotools.mk	Thu Jul 24 20:01:15 2014 +0200
> @@ -9,7 +9,7 @@
>  # infrastructure
>  #
>  # In terms of implementation, this autotools infrastructure requires
> -# the .mk file to only specify metadata informations about the
> +# the .mk file to only specify metadata information about the
>  # package: name, version, download URL, etc.
>  #
>  # We still allow the package .mk file to override what the different
> diff -r e79d6f3e1d9c -r 377347124030 package/pkg-cmake.mk
> --- a/package/pkg-cmake.mk	Tue Mar 04 14:50:03 2014 +0000
> +++ b/package/pkg-cmake.mk	Thu Jul 24 20:01:15 2014 +0200
> @@ -9,7 +9,7 @@
>  # infrastructure
>  #
>  # In terms of implementation, this CMake infrastructure requires
> -# the .mk file to only specify metadata informations about the
> +# the .mk file to only specify metadata information about the
>  # package: name, version, download URL, etc.
>  #
>  # We still allow the package .mk file to override what the different
> diff -r e79d6f3e1d9c -r 377347124030 package/pkg-generic.mk
> --- a/package/pkg-generic.mk	Tue Mar 04 14:50:03 2014 +0000
> +++ b/package/pkg-generic.mk	Thu Jul 24 20:01:15 2014 +0200
> @@ -13,7 +13,7 @@
>  # In terms of implementation, this generic infrastructure requires the
>  # .mk file to specify:
>  #
> -#   1. Metadata informations about the package: name, version,
> +#   1. Metadata information about the package: name, version,
>  #      download URL, etc.
>  #
>  #   2. Description of the commands to be executed to configure, build
> @@ -304,7 +304,7 @@
>  # already defined. For some variables (version, source, site and
>  # subdir), if they are undefined, we try to see if a variable without
>  # the HOST_ prefix is defined. If so, we use such a variable, so that
> -# these informations have only to be specified once, for both the
> +# this information has only to be specified once, for both the
>  # target and host packages of a given .mk file.
>  
>  $(2)_TYPE                       =  $(4)
> diff -r e79d6f3e1d9c -r 377347124030 package/pkg-luarocks.mk
> --- a/package/pkg-luarocks.mk	Tue Mar 04 14:50:03 2014 +0000
> +++ b/package/pkg-luarocks.mk	Thu Jul 24 20:01:15 2014 +0200
> @@ -12,7 +12,7 @@
>  # infrastructure
>  #
>  # In terms of implementation, this LuaRocks infrastructure requires
> -# the .mk file to only specify metadata informations about the
> +# the .mk file to only specify metadata information about the
>  # package: name, version, etc.
>  #
>  ################################################################################
> diff -r e79d6f3e1d9c -r 377347124030 package/pkg-python.mk
> --- a/package/pkg-python.mk	Tue Mar 04 14:50:03 2014 +0000
> +++ b/package/pkg-python.mk	Thu Jul 24 20:01:15 2014 +0200
> @@ -9,7 +9,7 @@
>  # infrastructure
>  #
>  # In terms of implementation, this Python infrastructure requires the
> -# .mk file to only specify metadata informations about the package:
> +# .mk file to only specify metadata information about the package:
>  # name, version, download URL, etc.
>  #
>  # We still allow the package .mk file to override what the different
> diff -r e79d6f3e1d9c -r 377347124030 support/scripts/xorg-release
> --- a/support/scripts/xorg-release	Tue Mar 04 14:50:03 2014 +0000
> +++ b/support/scripts/xorg-release	Thu Jul 24 20:01:15 2014 +0200
> @@ -101,7 +101,7 @@
>              return m.group(2)
>      return None
>  
> -# Augment the informations of the X.org list of packages (given as
> +# Augment the information of the X.org list of packages (given as
>  # argument) by details about their packaging in Buildroot. Those
>  # details are found by looking at the contents of package/x11r7/.
>  def get_buildroot_pkgs(packages):
> @@ -114,7 +114,7 @@
>          version = buildroot_get_version(d)
>          if packages.has_key(pkgname):
>              # There is a X.org package of the same name, so we just
> -            # add informations to the existing dict entry.
> +            # add information to the existing dict entry.
>              packages[pkgname]['br-version'] = version
>              packages[pkgname]['br-name'] = d
>          else:
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
