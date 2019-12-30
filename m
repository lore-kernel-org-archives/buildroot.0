From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 13:23:27 +0100
Subject: [Buildroot] [PATCH] support/config-fragments/autobuild: update
 Buildroot toolchains to 2019.11.1
In-Reply-To: <20191230100231.1418837-1-thomas.petazzoni@bootlin.com>
References: <20191230100231.1418837-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191230122327.GM26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

I fixed the title...

On 2019-12-30 11:02 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
[--SNIP--]
>  support/config-fragments/autobuild/br-nios2-glibc.config   | 7 +++----
[--SNIP--]
> diff --git a/support/config-fragments/autobuild/br-nios2-glibc.config b/support/config-fragments/autobuild/br-nios2-glibc.config
> index cbef0bd74d..2f93714fc9 100644
> --- a/support/config-fragments/autobuild/br-nios2-glibc.config
> +++ b/support/config-fragments/autobuild/br-nios2-glibc.config
> @@ -2,9 +2,8 @@ BR2_nios2=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-nios2-full-2019.05.1.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-nios2-full-2019.11.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> -# BR2_TOOLCHAIN_EXTERNAL_HAS_SSP is not set

... and I also mentioned that in the commit log.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/br-openrisc-uclibc.config b/support/config-fragments/autobuild/br-openrisc-uclibc.config
> index a346c83e4c..b3cf2d08ae 100644
> --- a/support/config-fragments/autobuild/br-openrisc-uclibc.config
> +++ b/support/config-fragments/autobuild/br-openrisc-uclibc.config
> @@ -1,9 +1,9 @@
>  BR2_or1k=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-openrisc-full-2018.02-925-gd4158df.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-openrisc-full-2019.11.tar.bz2"
>  BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
>  BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
>  # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
>  BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config b/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
> index dec7b7f681..b8a568e431 100644
> --- a/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
> +++ b/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
> @@ -3,8 +3,8 @@ BR2_powerpc_603e=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-603e-basic-cpp-2019.05.1.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-603e-basic-cpp-2019.11.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
>  # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
>  BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/br-powerpc-e500mc-full.config b/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
> index e116daadee..dc7c7d35fc 100644
> --- a/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
> +++ b/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
> @@ -3,9 +3,9 @@ BR2_powerpc_e500mc=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-e500mc-full-2019.05.1.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-e500mc-full-2019.11.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
>  BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
>  # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
>  BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config b/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
> index 48686bbcf8..e7ff1a4715 100644
> --- a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
> +++ b/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
> @@ -2,8 +2,8 @@ BR2_powerpc64=y
>  BR2_powerpc_power7=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64-power7-glibc-2019.05.1.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64-power7-glibc-2019.11.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
>  BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config b/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
> index c12e06e195..97c7ebdb67 100644
> --- a/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
> +++ b/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
> @@ -2,8 +2,8 @@ BR2_powerpc64le=y
>  BR2_powerpc_power8=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64le-power8-glibc-2019.05.1.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64le-power8-glibc-2019.11.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
>  BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/br-riscv32.config b/support/config-fragments/autobuild/br-riscv32.config
> index e34f7b4aad..4ec6ca9f89 100644
> --- a/support/config-fragments/autobuild/br-riscv32.config
> +++ b/support/config-fragments/autobuild/br-riscv32.config
> @@ -3,8 +3,8 @@ BR2_RISCV_32=y
>  BR2_RISCV_ABI_ILP32=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv32-glibc-2019.05.1.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_0=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv32-glibc-2019.11.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
>  BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/br-riscv64.config b/support/config-fragments/autobuild/br-riscv64.config
> index 7c98512694..0706c7b5da 100644
> --- a/support/config-fragments/autobuild/br-riscv64.config
> +++ b/support/config-fragments/autobuild/br-riscv64.config
> @@ -2,8 +2,8 @@ BR2_riscv=y
>  BR2_RISCV_ABI_LP64=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv64-glibc-2019.05.1.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv64-glibc-2019.11.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
>  BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/br-sh4-full.config b/support/config-fragments/autobuild/br-sh4-full.config
> index a2c7d0fed7..5e358bb82a 100644
> --- a/support/config-fragments/autobuild/br-sh4-full.config
> +++ b/support/config-fragments/autobuild/br-sh4-full.config
> @@ -2,9 +2,9 @@ BR2_sh=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sh4-full-2019.05.1.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sh4-full-2019.11.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
>  BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
>  # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
>  BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/br-sparc-uclibc.config b/support/config-fragments/autobuild/br-sparc-uclibc.config
> index 13e81804a2..74b4bf27eb 100644
> --- a/support/config-fragments/autobuild/br-sparc-uclibc.config
> +++ b/support/config-fragments/autobuild/br-sparc-uclibc.config
> @@ -1,8 +1,8 @@
>  BR2_sparc=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-uclibc-2019.05.1.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-uclibc-2019.11.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
>  BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
>  BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
>  # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> diff --git a/support/config-fragments/autobuild/br-sparc64-glibc.config b/support/config-fragments/autobuild/br-sparc64-glibc.config
> index 293d477c95..75c31ad5cb 100644
> --- a/support/config-fragments/autobuild/br-sparc64-glibc.config
> +++ b/support/config-fragments/autobuild/br-sparc64-glibc.config
> @@ -1,8 +1,8 @@
>  BR2_sparc64=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc64-full-2019.05.1.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc64-full-2019.11.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
>  BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
>  BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/br-x86-64-core2-full.config b/support/config-fragments/autobuild/br-x86-64-core2-full.config
> index 7220244442..8bab1deb17 100644
> --- a/support/config-fragments/autobuild/br-x86-64-core2-full.config
> +++ b/support/config-fragments/autobuild/br-x86-64-core2-full.config
> @@ -3,9 +3,9 @@ BR2_x86_core2=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2019.05.1.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2019.11.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
>  BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
>  # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
>  BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/br-x86-64-musl.config b/support/config-fragments/autobuild/br-x86-64-musl.config
> index 7d673f42ec..c67a524744 100644
> --- a/support/config-fragments/autobuild/br-x86-64-musl.config
> +++ b/support/config-fragments/autobuild/br-x86-64-musl.config
> @@ -3,8 +3,8 @@ BR2_x86_atom=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2019.05.1.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2019.11.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
>  BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/br-xtensa-full.config b/support/config-fragments/autobuild/br-xtensa-full.config
> index 4057e624db..3d57b99c3c 100644
> --- a/support/config-fragments/autobuild/br-xtensa-full.config
> +++ b/support/config-fragments/autobuild/br-xtensa-full.config
> @@ -1,9 +1,9 @@
>  BR2_xtensa=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-xtensa-full-2019.05.1.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-xtensa-full-2019.11.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
>  BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
>  # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
>  BR2_TOOLCHAIN_EXTERNAL_CXX=y
> -- 
> 2.24.1
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
