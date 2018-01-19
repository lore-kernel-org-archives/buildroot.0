From: daggs <daggs@gmx.com>
Date: Fri, 19 Jan 2018 14:59:53 +0100
Subject: [Buildroot] host-kodi-texturepacker fails compilation
In-Reply-To: <trinity-1572b060-653d-4ee9-b656-25aec71a78f2-1516369652740@3c-app-mailcom-bs13>
References: <trinity-1572b060-653d-4ee9-b656-25aec71a78f2-1516369652740@3c-app-mailcom-bs13>
Message-ID: <trinity-5007eb93-5b2e-4045-970f-c56d3ee19325-1516370393505@3c-app-mailcom-bs13>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Sent: Friday, January 19, 2018 at 3:47 PM
> From: daggs <daggs@gmx.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] host-kodi-texturepacker fails compilation
>
> Greetings,
> 
> I've tried to build an image with kodi in it and it fails compilation, the error is:
> >>> host-kodi-texturepacker 17.6-Krypton Building
> PATH="/home/dagg/workspace/buildroots/buildroot-streamer/output/host/bin:/home/dagg/workspace/buildroots/buildroot-streamer/output/host/sbin:/usr/x86_64-pc-linux-gnu/gcc-bin/7.2.0:/usr/x86_64-pc-linux-gnu/aarch64-unknown-linux-gnu/gcc-bin/5.4.0:/usr/x86_64-pc-linux-gnu/aarch64-unknown-linux-musl/gcc-bin/6.4.0:/usr/lib/llvm/5/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/games/bin:/usr/sbin:/usr/local/bin" PKG_CONFIG="/home/dagg/workspace/buildroots/buildroot-streamer/output/host/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/dagg/workspace/buildroots/buildroot-streamer/output/host/lib/pkgconfig:/home/dagg/workspace/buildroots/buildroot-streamer/output/host/share/pkgconfig"  /usr/bin/make -j9  -C /home/dagg/workspace/buildroots/buildroot-streamer/output/build/host-kodi-texturepacker-17.6-Krypton/tools/depends/native/TexturePacker
> make[1]: Entering directory '/home/dagg/workspace/buildroots/buildroot-streamer/output/build/host-kodi-texturepacker-17.6-Krypton/tools/depends/native/TexturePacker'
> make[2]: Entering directory '/home/dagg/workspace/buildroots/buildroot-streamer/output/build/host-kodi-texturepacker-17.6-Krypton/tools/depends/native/TexturePacker'
> make[3]: Entering directory '/home/dagg/workspace/buildroots/buildroot-streamer/output/build/host-kodi-texturepacker-17.6-Krypton/tools/depends/native/TexturePacker'
> Scanning dependencies of target TexturePacker
> make[3]: Leaving directory '/home/dagg/workspace/buildroots/buildroot-streamer/output/build/host-kodi-texturepacker-17.6-Krypton/tools/depends/native/TexturePacker'
> make[3]: Entering directory '/home/dagg/workspace/buildroots/buildroot-streamer/output/build/host-kodi-texturepacker-17.6-Krypton/tools/depends/native/TexturePacker'
> [ 10%] Building CXX object CMakeFiles/TexturePacker.dir/src/md5.o
> [ 20%] Building CXX object CMakeFiles/TexturePacker.dir/src/DecoderManager.o
> [ 30%] Building CXX object CMakeFiles/TexturePacker.dir/src/decoder/PNGDecoder.o
> [ 40%] Building CXX object CMakeFiles/TexturePacker.dir/src/XBTFWriter.o
> [ 50%] Building CXX object CMakeFiles/TexturePacker.dir/src/decoder/JPGDecoder.o
> [ 60%] Building CXX object CMakeFiles/TexturePacker.dir/src/TexturePacker.o
> [ 70%] Building CXX object CMakeFiles/TexturePacker.dir/src/decoder/GifHelper.o
> [ 80%] Building CXX object CMakeFiles/TexturePacker.dir/home/dagg/workspace/buildroots/buildroot-streamer/output/build/host-kodi-texturepacker-17.6-Krypton/xbmc/guilib/XBTF.o
> [ 90%] Building CXX object CMakeFiles/TexturePacker.dir/src/decoder/GIFDecoder.o
> In file included from /usr/lib/gcc/x86_64-pc-linux-gnu/7.2.0/include/g++-v7/cstdlib:75:0,
>                  from /usr/lib/gcc/x86_64-pc-linux-gnu/7.2.0/include/g++-v7/ext/string_conversions.h:41,
>                  from /usr/lib/gcc/x86_64-pc-linux-gnu/7.2.0/include/g++-v7/bits/basic_string.h:6159,
>                  from /usr/lib/gcc/x86_64-pc-linux-gnu/7.2.0/include/g++-v7/string:52,
>                  from /home/dagg/workspace/buildroots/buildroot-streamer/output/build/host-kodi-texturepacker-17.6-Krypton/tools/depends/native/TexturePacker/src/decoder/GifHelper.h:45,
>                  from /home/dagg/workspace/buildroots/buildroot-streamer/output/build/host-kodi-texturepacker-17.6-Krypton/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp:21:
> /usr/include/stdlib.h:443:14: error: declaration of ?void* reallocarray(void*, size_t, size_t) throw ()? has a different exception specifier
>  extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size)
>               ^~~~~~~~~~~~
> In file included from /home/dagg/workspace/buildroots/buildroot-streamer/output/build/host-kodi-texturepacker-17.6-Krypton/tools/depends/native/TexturePacker/src/decoder/GifHelper.h:23:0,
>                  from /home/dagg/workspace/buildroots/buildroot-streamer/output/build/host-kodi-texturepacker-17.6-Krypton/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp:21:
> /home/dagg/workspace/buildroots/buildroot-streamer/output/host/usr/include/gif_lib.h:248:1: note: from previous declaration ?void* reallocarray(void*, size_t, size_t)?
>  reallocarray(void *optr, size_t nmemb, size_t size);
>  ^~~~~~~~~~~~
> make[3]: *** [CMakeFiles/TexturePacker.dir/build.make:207: CMakeFiles/TexturePacker.dir/src/decoder/GifHelper.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> make[3]: Leaving directory '/home/dagg/workspace/buildroots/buildroot-streamer/output/build/host-kodi-texturepacker-17.6-Krypton/tools/depends/native/TexturePacker'
> make[2]: *** [CMakeFiles/Makefile2:68: CMakeFiles/TexturePacker.dir/all] Error 2
> make[2]: Leaving directory '/home/dagg/workspace/buildroots/buildroot-streamer/output/build/host-kodi-texturepacker-17.6-Krypton/tools/depends/native/TexturePacker'
> make[1]: *** [Makefile:84: all] Error 2
> make[1]: Leaving directory '/home/dagg/workspace/buildroots/buildroot-streamer/output/build/host-kodi-texturepacker-17.6-Krypton/tools/depends/native/TexturePacker'
> make: *** [package/pkg-generic.mk:250: /home/dagg/workspace/buildroots/buildroot-streamer/output/build/host-kodi-texturepacker-17.6-Krypton/.stamp_built] Error 2
> 
> config to reproduce:
> BR2_x86_64=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_PYTHON=y
> BR2_PACKAGE_PYTHON_PY_PYC=y
> 
> my compiler is:
> $ gcc -v
> Using built-in specs.
> COLLECT_GCC=gcc
> COLLECT_LTO_WRAPPER=/usr/libexec/gcc/x86_64-pc-linux-gnu/7.2.0/lto-wrapper
> Target: x86_64-pc-linux-gnu
> Configured with: /var/tmp/portage/sys-devel/gcc-7.2.0-r1/work/gcc-7.2.0/configure --host=x86_64-pc-linux-gnu --build=x86_64-pc-linux-gnu --prefix=/usr --bindir=/usr/x86_64-pc-linux-gnu/gcc-bin/7.2.0 --includedir=/usr/lib/gcc/x86_64-pc-linux-gnu/7.2.0/include --datadir=/usr/share/gcc-data/x86_64-pc-linux-gnu/7.2.0 --mandir=/usr/share/gcc-data/x86_64-pc-linux-gnu/7.2.0/man --infodir=/usr/share/gcc-data/x86_64-pc-linux-gnu/7.2.0/info --with-gxx-include-dir=/usr/lib/gcc/x86_64-pc-linux-gnu/7.2.0/include/g++-v7 --with-python-dir=/share/gcc-data/x86_64-pc-linux-gnu/7.2.0/python --enable-languages=c,c++,objc,obj-c++ --enable-obsolete --enable-secureplt --disable-werror --with-system-zlib --enable-nls --without-included-gettext --enable-checking=release --with-bugurl=https://bugs.gentoo.org/ --with-pkgversion='Gentoo 7.2.0-r1 p1.1' --disable-esp --enable-libstdcxx-time --enable-shared --enable-threads=posix --enable-__cxa_atexit --enable-clocale=gnu --enable-multilib --with-multilib-list=m32,m64 --disable-altivec --disable-fixed-point --enable-targets=all --disable-libgcj --enable-libgomp --disable-libmudflap --disable-libssp --disable-libcilkrts --disable-libmpx --enable-vtable-verify --enable-libvtv --disable-libquadmath --enable-lto --without-isl --enable-libsanitizer --enable-default-pie --enable-default-ssp
> Thread model: posix
> gcc version 7.2.0 (Gentoo 7.2.0-r1 p1.1)

looks like this patch fixes it: https://github.com/xbmc/xbmc/pull/13015
I'll test and report back.
