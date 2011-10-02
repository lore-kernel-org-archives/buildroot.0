From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 3 Oct 2011 00:35:48 +0200
Subject: [Buildroot] [PATCH 7/9] ext-toolchain: Take into account Mentor
	Graphics acquisition of CodeSoucery
In-Reply-To: <de84b78e0b7414259bfc24d789a9f1408e7bac3d.1317583191.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317583191.git.thomas.petazzoni@free-electrons.com>
 <de84b78e0b7414259bfc24d789a9f1408e7bac3d.1317583191.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201110030035.48993.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 02 October 2011 21:20:15 Thomas Petazzoni wrote:
> Now that CodeSourcery has been bought by Mentor Graphics, the
> toolchains are named "Sourcery CodeBench". We rename the config short
> description and adjust the help text, but we keep the option name in
> order not to break existing configurations.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

> ---
>  toolchain/toolchain-external/Config.in |  130 ++++++++++++++++----------------
>  1 files changed, 65 insertions(+), 65 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 9fbc224..0a4b922 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -4,85 +4,85 @@ choice
>  	prompt "Toolchain"
>  
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
> -	bool "CodeSourcery ARM 2011.03"
> +	bool "Sourcery CodeBench ARM 2011.03"
>  	depends on BR2_arm
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_INSTALL_LIBSTDCPP
>  	help
> -	  Toolchain for the ARM architecture, from CodeSourcery. It
> -	  uses gcc 4.5.2, binutils 2.20.51, glibc 2.13 and gdb 7.2.50,
> -	  kernel headers 2.6.38. It has support for the following
> -	  variants:
> +	  Sourcery CodeBench toolchain for the ARM architecture, from
> +	  Mentor Graphics. It uses gcc 4.5.2, binutils 2.20.51, glibc
> +	  2.13 and gdb 7.2.50, kernel headers 2.6.38. It has support
> +	  for the following variants:
>              - ARMv5TE, little endian, soft-float, glibc
>              - ARMv4T, little endian, soft-float, glibc
>              - ARMv7-A, Thumb 2, little endian, soft-float, glibc
>  
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
> -	bool "CodeSourcery ARM 2010.09"
> +	bool "Sourcery CodeBench ARM 2010.09"
>  	depends on BR2_arm
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_INSTALL_LIBSTDCPP
>  	help
> -	  Toolchain for the ARM architecture, from CodeSourcery. It
> -	  uses gcc 4.5.1, binutils 2.20, glibc 2.11 and gdb 7.2.50,
> -	  kernel headers 2.6.35.2. It has support for the following
> -	  variants:
> +	  Sourcery CodeBench toolchain for the ARM architecture, from
> +	  Mentor Graphics. It uses gcc 4.5.1, binutils 2.20, glibc
> +	  2.11 and gdb 7.2.50, kernel headers 2.6.35.2. It has support
> +	  for the following variants:
>              - ARMv5TE, little endian, soft-float, glibc
>              - ARMv4T, little endian, soft-float, glibc
>              - ARMv7-A, Thumb 2, little endian, soft-float, glibc
>  
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
> -	bool "CodeSourcery ARM 2010q1"
> +	bool "Sourcery CodeBench ARM 2010q1"
>  	depends on BR2_arm
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_INSTALL_LIBSTDCPP
>  	help
> -	  Toolchain for the ARM architecture, from CodeSourcery. It
> -	  uses gcc 4.4.1, binutils 2.19, glibc 2.11, gdb 7.0.50 and
> -	  kernel headers 2.6.32. It has support for the following
> -	  variants:
> +	  Sourcery CodeBench toolchain for the ARM architecture, from
> +	  Mentor Graphics. It uses gcc 4.4.1, binutils 2.19, glibc
> +	  2.11, gdb 7.0.50 and kernel headers 2.6.32. It has support
> +	  for the following variants:
>               - ARMv5T, little endian, soft-float, glibc
>               - ARMv4T, little endian, soft-float, glibc
>               - ARMv7-A, Thumb 2, little endian, soft-float, glibc
>  
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3
> -	bool "CodeSourcery ARM 2009q3"
> +	bool "Sourcery CodeBench ARM 2009q3"
>  	depends on BR2_arm
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_INSTALL_LIBSTDCPP
>  	help
> -	  Toolchain for the ARM architecture, from CodeSourcery. It
> -	  uses gcc 4.4.1, binutils 2.19, glibc 2.10 and gdb 6.8 and
> -	  kernel headers 2.6.30. It has support for the following
> -	  variants:
> +	  Sourcery CodeBench toolchain for the ARM architecture, from
> +	  Mentor Graphics. It uses gcc 4.4.1, binutils 2.19, glibc
> +	  2.10 and gdb 6.8 and kernel headers 2.6.30. It has support
> +	  for the following variants:
>              - ARMv5T, little endian, soft-float, glibc
>              - ARMv4T, little endian, soft-float, glibc
>              - ARMv7-A, Thumb 2, little endian, soft-float, glibc
>  
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q1
> -	bool "CodeSourcery ARM 2009q1"
> +	bool "Sourcery CodeBench ARM 2009q1"
>  	depends on BR2_arm
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_INSTALL_LIBSTDCPP
>  	help
> -	  Toolchain for the ARM architecture, from CodeSourcery. It
> -	  uses gcc 4.3.3, binutils 2.19, glibc 2.8 and gdb 6.8 and
> -	  kernel headers 2.6.30. It has support for the following
> -	  variants:
> +	  Sourcery CodeBench toolchain for the ARM architecture, from
> +	  Mentor Graphics. It uses gcc 4.3.3, binutils 2.19, glibc 2.8
> +	  and gdb 6.8 and kernel headers 2.6.30. It has support for
> +	  the following variants:
>              - ARMv5T, little endian, soft-float, glibc
>              - ARMv4T, little endian, soft-float, glibc
>              - ARMv7-A, Thumb 2, little endian, soft-float, glibc
>  
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
> -	bool "CodeSourcery MIPS 2011.03"
> +	bool "Sourcery CodeBench MIPS 2011.03"
>  	depends on BR2_mips || BR2_mipsel
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_INSTALL_LIBSTDCPP
>  	help
> -	  Toolchain for the MIPS architecture, from CodeSourcery. It
> -	  uses gcc 4.5.2, binutils 2.20.51, glibc 2.13, uClibc 0.9.30
> -	  and gdb 7.2.50, kernel headers 2.6.38. It has support for
> -	  the following variants:
> +	  Sourcery CodeBench toolchain for the MIPS architecture, from
> +	  Mentor Graphics. It uses gcc 4.5.2, binutils 2.20.51, glibc
> +	  2.13, uClibc 0.9.30 and gdb 7.2.50, kernel headers
> +	  2.6.38. It has support for the following variants:
>              - MIPS32 O32 big endian glibc
>              - MIPS32 O32 little endian glibc
>              - MIPS32 big endian soft float glibc
> @@ -97,15 +97,15 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
>              - MIPS32 little endian soft float uclibc
>  
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
> -	bool "CodeSourcery MIPS 4.4"
> +	bool "Sourcery CodeBench MIPS 4.4"
>  	depends on BR2_mips || BR2_mipsel
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_INSTALL_LIBSTDCPP
>  	help
> -	  Toolchain for the MIPS architecture, from CodeSourcery. It
> -	  uses gcc 4.4.1, binutils 2.19, glibc 2.11, uClibc 0.9.30 and
> -	  gdb 7.0, kernel headers 2.6.32. It has support for the
> -	  following variants:
> +	  Sourcery CodeBench toolchain for the MIPS architecture, from
> +	  Mentor Graphics. It uses gcc 4.4.1, binutils 2.19, glibc
> +	  2.11, uClibc 0.9.30 and gdb 7.0, kernel headers 2.6.32. It
> +	  has support for the following variants:
>              - MIPS32 O32 big endian glibc
>              - MIPS32 O32 little endian glibc
>              - MIPS32 big endian soft float glibc
> @@ -120,15 +120,15 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
>              - MIPS32 little endian soft float uclibc
>  
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
> -	bool "CodeSourcery PowerPC 2010.09"
> +	bool "Sourcery CodeBench PowerPC 2010.09"
>  	depends on BR2_powerpc
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_INSTALL_LIBSTDCPP
>  	help
> -	  Toolchain for the PowerPC architecture, from
> -	  CodeSourcery. It uses gcc 4.5.1, binutils 2.20, glibc 2.11,
> -	  gdb 7.2.50 and kernel headers 2.6.35.2. It has support for
> -	  the following variants:
> +	  Sourcery CodeBench toolchain for the PowerPC architecture,
> +	  from Sourcery CodeBench. It uses gcc 4.5.1, binutils 2.20,
> +	  glibc 2.11, gdb 7.2.50 and kernel headers 2.6.35.2. It has
> +	  support for the following variants:
>              - 603 glibc, 32 bits
>              - 603 soft float glibc, 32 bits
>              - e600 altivec glibc, 32 bits
> @@ -138,37 +138,37 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
>              - 970 glibc hard-float, 64 bits
>  
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
> -	bool "CodeSourcery SH 2011.03"
> +	bool "Sourcery CodeBench SH 2011.03"
>  	depends on BR2_sh4a || BR2_sh4aeb
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_INSTALL_LIBSTDCPP
>  	help
> -	  Toolchain for the SuperH architecture, from CodeSourcery. It
> -	  uses gcc 4.5.2, binutils 2.20, glibc 2.13, uClibc 0.9.30,
> -	  gdb 7.2.50 and kernel headers 2.6.38. It has support for
> -	  the following variants:
> +	  Sourcery CodeBench toolchain for the SuperH architecture,
> +	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20,
> +	  glibc 2.13, uClibc 0.9.30, gdb 7.2.50 and kernel headers
> +	  2.6.38. It has support for the following variants:
>              - SH4A, glibc, little endian
>              - SH4A, glibc, big endian
>              - SH4A, uClibc, little endian
>              - SH4A, uClibc, big endian
>  
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
> -	bool "CodeSourcery SH 2010.09"
> +	bool "Sourcery CodeBench SH 2010.09"
>  	depends on BR2_sh4a || BR2_sh4aeb
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_INSTALL_LIBSTDCPP
>  	help
> -	  Toolchain for the SuperH architecture, from CodeSourcery. It
> -	  uses gcc 4.5.1, binutils 2.20, glibc 2.11, uClibc 0.9.30,
> -	  gdb 7.2.50 and kernel headers 2.6.35.2. It has support for
> -	  the following variants:
> +	  Sourcery CodeBench toolchain for the SuperH architecture,
> +	  from Mentor Graphics. It uses gcc 4.5.1, binutils 2.20,
> +	  glibc 2.11, uClibc 0.9.30, gdb 7.2.50 and kernel headers
> +	  2.6.35.2. It has support for the following variants:
>              - SH4A, glibc, little endian
>              - SH4A, glibc, big endian
>              - SH4A, uClibc, little endian
>              - SH4A, uClibc, big endian
>  
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
> -	bool "CodeSourcery SH 2011.03"
> +	bool "Sourcery CodeBench SH 2011.03"
>  	depends on BR2_sh2a
>  	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
>  	select BR2_LARGEFILE
> @@ -177,14 +177,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_INSTALL_LIBSTDCPP
>  	help
> -	  Toolchain for the SuperH architecture, from CodeSourcery. It
> -	  uses gcc 4.5.2, binutils 2.20, uClibc 0.9.30, gdb 7.2.50 and
> -	  kernel headers 2.6.38. It has support for
> -	  the following variants:
> +	  Sourcery CodeBench toolchain for the SuperH architecture,
> +	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20,
> +	  uClibc 0.9.30, gdb 7.2.50 and kernel headers 2.6.38. It has
> +	  support for the following variants:
>              - SH2A, uClibc, big endian
>  
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
> -	bool "CodeSourcery SH 2010.09"
> +	bool "Sourcery CodeBench SH 2010.09"
>  	depends on BR2_sh2a
>  	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
>  	select BR2_LARGEFILE
> @@ -193,22 +193,22 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_INSTALL_LIBSTDCPP
>  	help
> -	  Toolchain for the SuperH architecture, from CodeSourcery. It
> -	  uses gcc 4.5.1, binutils 2.20, uClibc 0.9.30, gdb 7.2.50 and
> -	  kernel headers 2.6.35.2. It has support for
> -	  the following variants:
> +	  Sourcery CodeBench toolchain for the SuperH architecture,
> +	  from Mentor Graphics. It uses gcc 4.5.1, binutils 2.20,
> +	  uClibc 0.9.30, gdb 7.2.50 and kernel headers 2.6.35.2. It
> +	  has support for the following variants:
>              - SH2A, uClibc, big endian
>  
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOUCERY_X86_201009
> -	bool "CodeSourcery x86/x86_64 2010.09"
> +	bool "Sourcery CodeBench x86/x86_64 2010.09"
>  	depends on BR2_i386 || BR2_x86_64
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_INSTALL_LIBSTDCPP
>  	help
> -	  Toolchain for the x86/x86_64 architectures, from
> -	  CodeSourcery. It uses gcc 4.5.1, binutils 2.20, glibc 2.11,
> -	  gdb 7.2.50 and kernel headers 2.6.35.2. It has support for
> -	  the following variants:
> +	  Sourcery CodeBench toolchain for the x86/x86_64
> +	  architectures, from Mentor Graphics. It uses gcc 4.5.1,
> +	  binutils 2.20, glibc 2.11, gdb 7.2.50 and kernel headers
> +	  2.6.35.2. It has support for the following variants:
>  	    - Intel Pentium 4, glibc, 32 bits
>              - Intel Atom, glibc, 32 bits
>              - Intel Xeon, glibc, 64 bits
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
