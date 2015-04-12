From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 16:36:08 +0200
Subject: [Buildroot] [PATCH 10/14] docs/manual: remove references to IPv6
In-Reply-To: <1428754662-27829-10-git-send-email-gustavo@zacarias.com.ar>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
 <1428754662-27829-10-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150412143608.GL21018@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-04-11 09:17 -0300, Gustavo Zacarias spake thusly:
> It's no longer an option so remove all references to it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/adding-packages-directory.txt | 11 +++--------
>  docs/manual/configure.txt                 | 10 +++++-----
>  2 files changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index f536a0c..639003f 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -207,10 +207,9 @@ coding style].
>  ==== Dependencies on target and toolchain options
>  
>  Many packages depend on certain options of the toolchain: the choice of
> -C library, C++ support, thread support, RPC support, IPv6 support,
> -wchar support, or dynamic library support. Some packages can only be
> -built on certain target architectures, or if an MMU is available in the
> -processor.
> +C library, C++ support, thread support, RPC support, wchar support,
> +or dynamic library support. Some packages can only be built on certain
> +target architectures, or if an MMU is available in the processor.
>  
>  These dependencies have to be expressed with the appropriate 'depends
>  on' statements in the Config.in file. Additionally, for dependencies on
> @@ -301,10 +300,6 @@ use in the comment.
>  ** Dependency symbol: +BR2_TOOLCHAIN_HAS_NATIVE_RPC+
>  ** Comment string: +RPC+
>  
> -* IPv6 support
> -** Dependency symbol: +BR2_INET_IPV6+
> -** Comment string: +IPv6+ (lowercase v)
> -
>  * wchar support
>  ** Dependency symbol: +BR2_USE_WCHAR+
>  ** Comment string: +wchar+
> diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
> index c06182b..dd34eef 100644
> --- a/docs/manual/configure.txt
> +++ b/docs/manual/configure.txt
> @@ -109,8 +109,8 @@ most important ones allow to:
>   * Change the version of the GCC compiler, binutils and the C library.
>  
>   * Select a number of toolchain options (uClibc only): whether the
> -   toolchain should have IPv6 support, RPC support (used mainly for
> -   NFS), wide-char support, locale support (for internationalization),
> +   toolchain should have RPC support (used mainly for NFS),
> +   wide-char support, locale support (for internationalization),
>     C++ support or thread support. Depending on which options you choose,
>     the number of userspace applications and libraries visible in
>     Buildroot menus will change: many applications and libraries require
> @@ -177,9 +177,9 @@ Then, you have three solutions to use an external toolchain:
>    external toolchain uses the 'glibc' library, you only have to tell
>    whether your toolchain supports C\++ or not and whether it has
>    built-in RPC support. If your external toolchain uses the 'uClibc'
> -  library, then you have to tell Buildroot if it supports IPv6,
> -  RPC, wide-char, locale, program invocation, threads and
> -  C++. At the beginning of the execution, Buildroot will tell you if
> +  library, then you have to tell Buildroot if it supports RPC,
> +  wide-char, locale, program invocation, threads and C++.
> +  At the beginning of the execution, Buildroot will tell you if
>    the selected options do not match the toolchain configuration.
>  
>  Our external toolchain support has been tested with toolchains from
> -- 
> 2.0.5
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
