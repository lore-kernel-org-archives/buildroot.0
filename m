From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 17:02:11 +0200
Subject: [Buildroot] [PATCH v3 00/14] Fortran support for all toolchains
In-Reply-To: <20160703134750.7516-1-s.martin49@gmail.com>
References: <20160703134750.7516-1-s.martin49@gmail.com>
Message-ID: <20160703170211.39c252b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jul 2016 15:47:36 +0200, Samuel Martin wrote:

> Samuel Martin (13):
>   toolchain/toolchain-common.in: add BR2_TOOLCHAIN_HAS_LIBQUADMATH
>     hidden symbol
>   package/gcc: complete the logic on libquadmath
>   package/gcc: fix fortran support
>   toolchain: add hidden symbol for fortran support in the toolchain
>   docs/manual: document dependency on fortran
>   package/gcc: select BR2_TOOLCHAIN_HAS_FORTRAN when appropriate
>   pkg-cmake.mk: export the fortran compiler path in the CMake toolchain
>     file
>   toolchain/helpers: add fortran check
>   toolchain/toolchain-external: enable fortran check when it is selected
>   toolchain/toolchain-external: add libgfortran and libquadmath to the
>     TOOLCHAIN_EXTERNAL_LIBS list
>   toolchain/toolchain-external: add knob for fortran support
>   toolchain/toolchain-external: update external toolchain configuration
>     with BR2_TOOLCHAIN_HAS_FORTRAN
>   package/fftw: add fortran support

I've applied those patches, with some minor tweaks here and there.

However, I haven't applied the lapack patch since it fails to build
with the Linaro toolchain as we discussed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
