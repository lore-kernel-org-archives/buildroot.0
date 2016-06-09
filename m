From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 22:32:40 +0200
Subject: [Buildroot] [PATCH v4 next 2/2] openblas: new package
In-Reply-To: <1463742061-56758-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1463742061-56758-1-git-send-email-Vincent.Riera@imgtec.com>
 <1463742061-56758-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160609223240.287d63ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 May 2016 12:01:01 +0100, Vicente Olivert Riera wrote:

> +config BR2_PACKAGE_OPENBLAS_TARGET_P2
> +	bool "P2"
> +	depends on BR2_x86_pentium2
> +config BR2_PACKAGE_OPENBLAS_TARGET_KATMAI
> +	bool "KATMAI"
> +	depends on BR2_x86_pentium3
> +config BR2_PACKAGE_OPENBLAS_TARGET_COPPERMINE
> +	bool "COPPERMINE"
> +	depends on BR2_x86_pentium3
> +config BR2_PACKAGE_OPENBLAS_TARGET_NORTHWOOD
> +	bool "NORTHWOOD"
> +	depends on BR2_x86_pentium4
> +config BR2_PACKAGE_OPENBLAS_TARGET_PRESCOTT
> +	bool "PRESCOTT"
> +	depends on BR2_x86_prescott
> +config BR2_PACKAGE_OPENBLAS_TARGET_BANIAS
> +	bool "BANIAS"
> +	depends on BR2_x86_pentium_m
> +config BR2_PACKAGE_OPENBLAS_TARGET_YONAH
> +	bool "YONAH"
> +	depends on BR2_x86_pentium_m
> +config BR2_PACKAGE_OPENBLAS_TARGET_CORE2
> +	bool "CORE2"
> +	depends on BR2_x86_core2
> +config BR2_PACKAGE_OPENBLAS_TARGET_PENRYN
> +	bool "PENRYN"
> +	depends on BR2_x86_core2
> +config BR2_PACKAGE_OPENBLAS_TARGET_DUNNINGTON
> +	bool "DUNNINGTON"
> +	depends on BR2_x86_core2
> +config BR2_PACKAGE_OPENBLAS_TARGET_NEHALEM
> +	bool "NEHALEM"
> +	depends on BR2_x86_corei7
> +config BR2_PACKAGE_OPENBLAS_TARGET_SANDYBRIDGE
> +	bool "SANDYBRIDGE"
> +	depends on BR2_x86_corei7_avx
> +config BR2_PACKAGE_OPENBLAS_TARGET_HASWELL
> +	bool "HASWELL"
> +	depends on BR2_x86_core_avx2
> +config BR2_PACKAGE_OPENBLAS_TARGET_ATOM
> +	bool "ATOM"
> +	depends on BR2_x86_atom
> +config BR2_PACKAGE_OPENBLAS_TARGET_ATHLON
> +	bool "ATHLON"
> +	depends on BR2_x86_athlon || BR2_x86_athlon_4
> +config BR2_PACKAGE_OPENBLAS_TARGET_OPTERON
> +	bool "OPTERON"
> +	depends on BR2_x86_opteron
> +config BR2_PACKAGE_OPENBLAS_TARGET_OPTERON_SSE3
> +	bool "OPTERON_SSE3"
> +	depends on BR2_x86_opteron_sse3
> +config BR2_PACKAGE_OPENBLAS_TARGET_BARCELONA
> +	bool "BARCELONA"
> +	depends on BR2_x86_barcelona
> +config BR2_PACKAGE_OPENBLAS_TARGET_STEAMROLLER
> +	bool "STEAMROLLER"
> +	depends on BR2_x86_steamroller
> +config BR2_PACKAGE_OPENBLAS_TARGET_SSE_GENERIC
> +	bool "SSE_GENERIC"
> +	depends on BR2_i386 || BR2_x86_64
> +config BR2_PACKAGE_OPENBLAS_TARGET_VIAC3
> +	bool "VIAC3"
> +	depends on BR2_x86_c3 || BR2_x86_c32
> +config BR2_PACKAGE_OPENBLAS_TARGET_POWER4
> +	bool "POWER4"
> +	depends on BR2_powerpc_power4
> +config BR2_PACKAGE_OPENBLAS_TARGET_POWER5
> +	bool "POWER5"
> +	depends on BR2_powerpc_power5
> +config BR2_PACKAGE_OPENBLAS_TARGET_POWER6
> +	bool "POWER6"
> +	depends on BR2_powerpc_power6
> +config BR2_PACKAGE_OPENBLAS_TARGET_POWER7
> +	bool "POWER7"
> +	depends on BR2_powerpc_power7
> +config BR2_PACKAGE_OPENBLAS_TARGET_POWER8
> +	bool "POWER8"
> +	depends on BR2_powerpc_power8
> +config BR2_PACKAGE_OPENBLAS_TARGET_PPCG4
> +	bool "PPCG4"
> +	depends on BR2_powerpc_7400 || BR2_powerpc_7450
> +config BR2_PACKAGE_OPENBLAS_TARGET_PPC970
> +	bool "PPC970"
> +	depends on BR2_powerpc_970
> +config BR2_PACKAGE_OPENBLAS_TARGET_PPC440
> +	bool "PPC440"
> +	depends on BR2_powerpc_440
> +config BR2_PACKAGE_OPENBLAS_TARGET_PPC440FP2
> +	bool "PPC440FP2"
> +	depends on BR2_powerpc_440fp
> +config BR2_PACKAGE_OPENBLAS_TARGET_P5600
> +	bool "P5600"
> +	depends on BR2_mips_32r2
> +config BR2_PACKAGE_OPENBLAS_TARGET_SICORTEX
> +	bool "SICORTEX"
> +	depends on BR2_mips_64
> +config BR2_PACKAGE_OPENBLAS_TARGET_LOONGSON3A
> +	bool "LOONGSON3A"
> +	depends on BR2_mips_64
> +config BR2_PACKAGE_OPENBLAS_TARGET_LOONGSON3B
> +	bool "LOONGSON3B"
> +	depends on BR2_mips_64
> +config BR2_PACKAGE_OPENBLAS_TARGET_I6400
> +	bool "I6400"
> +	depends on BR2_mips_64r6
> +config BR2_PACKAGE_OPENBLAS_TARGET_SPARC
> +	bool "SPARC"
> +	depends on BR2_sparc
> +config BR2_PACKAGE_OPENBLAS_TARGET_SPARCV7
> +	bool "SPARCV7"
> +	depends on BR2_sparc
> +config BR2_PACKAGE_OPENBLAS_TARGET_CORTEXA15
> +	bool "CORTEXA15"
> +	depends on BR2_cortex_a15
> +config BR2_PACKAGE_OPENBLAS_TARGET_CORTEXA9
> +	bool "CORTEXA9"
> +	depends on BR2_cortex_a9
> +config BR2_PACKAGE_OPENBLAS_TARGET_ARMV7
> +	bool "ARMV7"
> +	depends on BR2_cortex_a5 || BR2_cortex_a7 || BR2_cortex_a8 || \
> +		BR2_cortex_a9 || BR2_cortex_a12 || BR2_cortex_a15 || \
> +		BR2_cortex_a17
> +config BR2_PACKAGE_OPENBLAS_TARGET_ARMV8
> +	bool "ARMV8"
> +	depends on BR2_aarch64 || BR2_aarch64_be
> +config BR2_PACKAGE_OPENBLAS_TARGET_CORTEXA57
> +	bool "CORTEXA57"
> +	depends on BR2_aarch64 || BR2_aarch64_be

As discussed on IRC with Yann, we really don't want this additional
choice. Just use the existing options in arch/Config.in* instead. When
there is no direct match, just don't support the platform, or use a
lower common denominator.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
