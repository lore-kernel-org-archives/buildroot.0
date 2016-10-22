From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 16:42:05 +0200
Subject: [Buildroot] [PATCH v6 0/9] Misc. CMake fixes
In-Reply-To: <20161016111245.1847-1-s.martin49@gmail.com>
References: <20161016111245.1847-1-s.martin49@gmail.com>
Message-ID: <20161022164205.2a21afef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Oct 2016 13:12:36 +0200, Samuel Martin wrote:

> Max Filippov (1):
>   package/opencv3: fix CMAKE_CXX_FLAGS
> 
> Samuel Martin (8):
>   Revert "package/cmake: with BR2_ENABLE_DEBUG use RelWithDebInfo"
>   package/pkg-cmake.mk: move CMAKE_BUILD_TYPE definition into
>     toolchainfile.cmake
>   toolchainfile.cmake: set per-config appended {C,CXX}FLAGS
>   package/gflags: include TARGET_CXXFLAGS to the overloaded CXXFLAGS
>   package/gnuradio: include TARGET_CFLAGS to the overloaded CFLAGS
>   package/libcec: include TARGET_{C,CXX}FLAGS to the overloaded
>     {C,CXX}FLAGS
>   package/rpi-userland: include TARGET_CFLAGS to the overloaded CFLAGS
>   toochainfile.cmake: rework the way Buildroot sets flags

I've applied the series. I've done a few changes on specific patches,
I'll reply to the patches themselves.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
