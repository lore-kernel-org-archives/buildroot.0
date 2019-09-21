From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Sep 2019 22:57:50 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libspatialindex: bump to version 1.9.0
In-Reply-To: <20190921200314.5117-1-fontaine.fabrice@gmail.com>
References: <20190921200314.5117-1-fontaine.fabrice@gmail.com>
Message-ID: <20190921225750.2c5a4fd9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 21 Sep 2019 22:03:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch site to github to get latest version
> - Switch to cmake to be able to disable tests as they fail to build with
>   /home/fabrice/buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: warning: libspatialindex.so.5, needed by ../../.libs/libspatialindex_c.so, not found (try using -rpath or -rpath-link)
>   /home/fabrice/buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: ../../.libs/libspatialindex_c.so: undefined reference to `Tools::NotSupportedException::NotSupportedException(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)'
> - Add C++11 dependency for shared_ptr
> - Drop patch (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Romain Naour and Arnout
> Vandecapelle):
>  - Add C++11 dependency
>  - Fix CXXFLAGS handling with cmake and update commit log to give an
>    additional reason for disabling tests

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
