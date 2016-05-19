From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 19 May 2016 14:42:46 +0100
Subject: [Buildroot] [PATCH v3 next] openblas: new package
In-Reply-To: <20160519142103.507c1395@free-electrons.com>
References: <1463652602-3276-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160519142103.507c1395@free-electrons.com>
Message-ID: <573DC2D6.5090003@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 19/05/16 13:21, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 19 May 2016 11:10:02 +0100, Vicente Olivert Riera wrote:
> 
>> +choice
>> +	prompt "OpenBLAS target CPU"
>> +	help
>> +	  OpenBLAS target CPU
>> +
>> +config BR2_PACKAGE_OPENBLAS_TARGET_P2
>> +	bool "P2"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_KATMAI
>> +	bool "KATMAI"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_COPPERMINE
>> +	bool "COPPERMINE"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_NORTHWOOD
>> +	bool "NORTHWOOD"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_PRESCOTT
>> +	bool "PRESCOTT"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_BANIAS
>> +	bool "BANIAS"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_YONAH
>> +	bool "YONAH"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_CORE2
>> +	bool "CORE2"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_PENRYN
>> +	bool "PENRYN"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_DUNNINGTON
>> +	bool "DUNNINGTON"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_NEHALEM
>> +	bool "NEHALEM"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_SANDYBRIDGE
>> +	bool "SANDYBRIDGE"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_HASWELL
>> +	bool "HASWELL"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_ATOM
>> +	bool "ATOM"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_ATHLON
>> +	bool "ATHLON"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_OPTERON
>> +	bool "OPTERON"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_OPTERON_SSE3
>> +	bool "OPTERON_SSE3"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_BARCELONA
>> +	bool "BARCELONA"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_SHANGHAI
>> +	bool "SHANGHAI"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_ISTANBUL
>> +	bool "ISTANBUL"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_BOBCAT
>> +	bool "BOBCAT"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_BULLDOZER
>> +	bool "BULLDOZER"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_PILEDRIVER
>> +	bool "PILEDRIVER"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_STEAMROLLER
>> +	bool "STEAMROLLER"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_EXCAVATOR
>> +	bool "EXCAVATOR"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_SSE_GENERIC
>> +	bool "SSE_GENERIC"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_VIAC3
>> +	bool "VIAC3"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_NANO
>> +	bool "NANO"
>> +	depends on BR2_i386 || BR2_x86_64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_POWER4
>> +	bool "POWER4"
>> +	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>> +config BR2_PACKAGE_OPENBLAS_TARGET_POWER5
>> +	bool "POWER5"
>> +	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>> +config BR2_PACKAGE_OPENBLAS_TARGET_POWER6
>> +	bool "POWER6"
>> +	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>> +config BR2_PACKAGE_OPENBLAS_TARGET_POWER7
>> +	bool "POWER7"
>> +	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>> +config BR2_PACKAGE_OPENBLAS_TARGET_POWER8
>> +	bool "POWER8"
>> +	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>> +config BR2_PACKAGE_OPENBLAS_TARGET_PPCG4
>> +	bool "PPCG4"
>> +	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>> +config BR2_PACKAGE_OPENBLAS_TARGET_PPC970
>> +	bool "PPC970"
>> +	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>> +config BR2_PACKAGE_OPENBLAS_TARGET_PPC970MP
>> +	bool "PPC970MP"
>> +	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>> +config BR2_PACKAGE_OPENBLAS_TARGET_PPC440
>> +	bool "PPC440"
>> +	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>> +config BR2_PACKAGE_OPENBLAS_TARGET_PPC440FP2
>> +	bool "PPC440FP2"
>> +	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>> +config BR2_PACKAGE_OPENBLAS_TARGET_CELL
>> +	bool "CELL"
>> +	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>> +config BR2_PACKAGE_OPENBLAS_TARGET_P5600
>> +	bool "P5600"
>> +	depends on BR2_mips || BR2_mipsel
>> +config BR2_PACKAGE_OPENBLAS_TARGET_SICORTEX
>> +	bool "SICORTEX"
>> +	depends on BR2_mips64 || BR2_mips64el
>> +config BR2_PACKAGE_OPENBLAS_TARGET_LOONGSON3A
>> +	bool "LOONGSON3A"
>> +	depends on BR2_mips64 || BR2_mips64el
>> +config BR2_PACKAGE_OPENBLAS_TARGET_LOONGSON3B
>> +	bool "LOONGSON3B"
>> +	depends on BR2_mips64 || BR2_mips64el
>> +config BR2_PACKAGE_OPENBLAS_TARGET_I6400
>> +	bool "I6400"
>> +	depends on BR2_mips64 || BR2_mips64el
>> +config BR2_PACKAGE_OPENBLAS_TARGET_SPARC
>> +	bool "SPARC"
>> +	depends on BR2_sparc || BR2_sparc64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_SPARCV7
>> +	bool "SPARCV7"
>> +	depends on BR2_sparc || BR2_sparc64
>> +config BR2_PACKAGE_OPENBLAS_TARGET_CORTEXA15
>> +	bool "CORTEXA15"
>> +	depends on BR2_arm || BR2_armeb
>> +config BR2_PACKAGE_OPENBLAS_TARGET_CORTEXA9
>> +	bool "CORTEXA9"
>> +	depends on BR2_arm || BR2_armeb
>> +config BR2_PACKAGE_OPENBLAS_TARGET_ARMV7
>> +	bool "ARMV7"
>> +	depends on BR2_arm || BR2_armeb
>> +config BR2_PACKAGE_OPENBLAS_TARGET_ARMV6
>> +	bool "ARMV6"
>> +	depends on BR2_arm || BR2_armeb
>> +config BR2_PACKAGE_OPENBLAS_TARGET_ARMV5
>> +	bool "ARMV5"
>> +	depends on BR2_arm || BR2_armeb
>> +config BR2_PACKAGE_OPENBLAS_TARGET_ARMV8
>> +	bool "ARMV8"
>> +	depends on BR2_aarch64 || BR2_aarch64_be
>> +config BR2_PACKAGE_OPENBLAS_TARGET_CORTEXA57
>> +	bool "CORTEXA57"
>> +	depends on BR2_aarch64 || BR2_aarch64_be
> 
> Do we really need this choice? What about directly using the
> architecture symbols?
> 
> I.e, replace what you have below by:
> 
> config BR2_PACKAGE_OPENBLAS_TARGET
> 	string
> 	default "ATOM"	if BR2_x86_atom
> 	default "CORE2"	if BR2_x86_core2
> 	...
> 	default "CORTEXA15" if BR2_cortex_a15
> 	...

No, we cannot do that because there isn't only one OpenBLAS target per
BR arch symbol. For instance, for mips64 there are 3 OpenBLAS targets
available. For x86 there are lots of them. Same for x86_64. Plust the
user may want to build a generic buildroot (because it doesn't have
specific support for certain core) and build OpenBLAS for that core.

>> new file mode 100644
>> index 0000000..5e6f417
>> --- /dev/null
>> +++ b/package/openblas/openblas.mk
>> @@ -0,0 +1,54 @@
>> +################################################################################
>> +#
>> +# openblas
>> +#
>> +################################################################################
>> +
>> +OPENBLAS_VERSION = 7a190653698ecd6576653109adbae5b805278c7e
>> +OPENBLAS_SITE = $(call github,xianyi,OpenBLAS,$(OPENBLAS_VERSION))
>> +OPENBLAS_LICENSE = BSD-3
>> +OPENBLAS_LICENSE_FILES = LICENSE
>> +OPENBLAS_INSTALL_STAGING = YES
>> +OPENBLAS_PATCH = https://github.com/vriera/OpenBLAS/commit/e12cff87b86615f5a4643d246a6c1963a0e81ca5.patch
> 
> I think that for such small patches, that are not taken from upstream,
> my preference is to have them in Buildroot itself rather than
> downloaded by <pkg>_PATCH.

I remember someone told me that we prefer this method when possible...
Anyway my pull request has been merged so if I have to respin this patch
I will just bump the version and get rid of the patch.

>> +
>> +# Disable fortran if the fortran compiler doesn't actually exist.
>> +ifeq ($(wildcard $(TARGET_FC)),)
> 
> I don't really like this way of testing if we have Fortran support. We
> probably want some kind of BR2_TOOLCHAIN_HAS_FORTRAN hidden config
> option. Talk with Samuel, I think he had some patches that were adding
> this kind of stuff for the external toolchains.

Yeah, that would be great, but we don't have it right now. I wrote a
patch for SSP toolchain support and it's taking ages to get applied. I
don't know if I want to wait for another patch for the
BR2_TOOLCHAIN_HAS_FORTRAN stuff to get applied before adding this
package to Buildroot. Why don't do that in the future? Add the package
now. When we have that toolchain-has-fortran thing available, then we
modify the package to use it.

>> +OPENBLAS_MAKE_OPTS += ONLY_CBLAS=1
>> +endif
>> +
>> +# Enable/Disable multi-threading (not for static-only since it uses dlfcn.h)
>> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_STATIC_LIBS),yx)
>> +OPENBLAS_MAKE_OPTS += USE_THREAD=1
>> +# Take advantage of OpenMP if we have support for it
>> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
>> +OPENBLAS_MAKE_OPTS += USE_OPENMP=1
> 
> It seems weird that OpenMP is related to NPTL thread support. OpenMP is
> a separate feature of the toolchain, see the option
> BR2_GCC_ENABLE_OPENMP for internal toolchains.

Well, I've read here [1] that "OpenMP is available for most platforms
that support POSIX threads".

1: https://wiki.linaro.org/WorkingGroups/ToolChain/OptimizationDescriptions

Regards,

Vincent.

> Thomas
> 
