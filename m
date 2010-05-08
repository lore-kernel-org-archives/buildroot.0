From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 08 May 2010 12:09:05 +0200
Subject: [Buildroot] Build Error!
In-Reply-To: <h2xa3e4d2d61005070951va874ec3bh77d05ec083479848@mail.gmail.com>
	(Sameer Bobade's message of "Fri, 7 May 2010 22:21:22 +0530")
References: <j2ma3e4d2d61005010430hb5d94b22ia8ce4d39a84c52a7@mail.gmail.com>
	<u2sa3e4d2d61005010435i99dc0cfbi6ab02762e7788da1@mail.gmail.com>
	<87tyqk929a.fsf@macbook.be.48ers.dk>
	<h2xa3e4d2d61005070951va874ec3bh77d05ec083479848@mail.gmail.com>
Message-ID: <87eihm7lj2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sameer" == Sameer Bobade <skbobade@gmail.com> writes:

Please don't mail me directly, use the mailing list instead.

 Sameer> This is the output:
 Sameer> [Sameer at localhost ~]$ cd buildroot-2010.02/
 Sameer> [Sameer at localhost buildroot-2010.02]$ make
 Sameer> rm -rf /home/Sameer/buildroot-2010.02/output/build/buildroot-config
 Sameer> mkdir -p /home/Sameer/buildroot-2010.02/output/build
 Sameer> cp -dpRf package/config/buildroot-config /home/Sameer/buildroot-2010.02/output/
 Sameer> build/buildroot-config
 Sameer> mkdir -p /home/Sameer/buildroot-2010.02/output/toolchain/gmp-4.2.4-host
 Sameer> (cd /home/Sameer/buildroot-2010.02/output/toolchain/gmp-4.2.4-host; rm -rf
 Sameer> config.cache; \
 Sameer> ??? ??? PATH=/home/Sameer/buildroot-2010.02/output/host/bin:/home/Sameer/
 Sameer> buildroot-2010.02/output/host/usr/bin:/usr/lib/qt-3.3/bin:/usr/local/bin:/usr/
 Sameer> bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/lib/alliance/bin:/usr/libexec/
 Sameer> sdcc:/home/Sameer/bin:/usr/lib/alliance/bin:/usr/libexec/sdcc AR="/usr/bin/ar"
 Sameer> AS="/usr/bin/as" LD="/usr/bin/ld -L/home/Sameer/buildroot-2010.02/output/host/
 Sameer> lib -L/home/Sameer/buildroot-2010.02/output/host/usr/lib" NM="/usr/bin/nm" CC="
 Sameer> /usr/bin/gcc -I/home/Sameer/buildroot-2010.02/output/host/include -I/home/
 Sameer> Sameer/buildroot-2010.02/output/host/usr/include" GCC="/usr/bin/gcc -I/home/
 Sameer> Sameer/buildroot-2010.02/output/host/include -I/home/Sameer/buildroot-2010.02/
 Sameer> output/host/usr/include" CXX="/usr/bin/g++ -I/home/Sameer/buildroot-2010.02/
 Sameer> output/host/include -I/home/Sameer/buildroot-2010.02/output/host/usr/include"
 Sameer> CPP="/usr/bin/cpp -I/home/Sameer/buildroot-2010.02/output/host/include -I/home/
 Sameer> Sameer/buildroot-2010.02/output/host/usr/include" AR_FOR_BUILD="/usr/bin/ar"
 Sameer> AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/
 Sameer> gcc" CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld" FC_FOR_BUILD="/usr
 Sameer> /bin/ld" CFLAGS_FOR_BUILD="-I/home/Sameer/buildroot-2010.02/output/host/include
 Sameer> -I/home/Sameer/buildroot-2010.02/output/host/usr/include" CXXFLAGS_FOR_BUILD=
 Sameer> "-I/home/Sameer/buildroot-2010.02/output/host/include -I/home/Sameer/
 Sameer> buildroot-2010.02/output/host/usr/include" LDFLAGS_FOR_BUILD="-L/home/Sameer/
 Sameer> buildroot-2010.02/output/host/lib -L/home/Sameer/buildroot-2010.02/output/host/
 Sameer> usr/lib" FCFLAGS_FOR_BUILD="" AR_FOR_TARGET="/home/Sameer/buildroot-2010.02/
 Sameer> output/staging/usr/bin/i686-linux-uclibc-ar" AS_FOR_TARGET="/home/Sameer/
 Sameer> buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-as" CC_FOR_TARGET="/
 Sameer> home/Sameer/buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-gcc"
 Sameer> LD_FOR_TARGET="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/
 Sameer> i686-linux-uclibc-ld" NM_FOR_TARGET="/home/Sameer/buildroot-2010.02/output/
 Sameer> staging/usr/bin/i686-linux-uclibc-nm" RANLIB_FOR_TARGET="/home/Sameer/
 Sameer> buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-ranlib"
 Sameer> STRIP_FOR_TARGET="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/
 Sameer> i686-linux-uclibc-strip" OBJCOPY_FOR_TARGET="/home/Sameer/buildroot-2010.02/
 Sameer> output/staging/usr/bin/i686-linux-uclibc-objcopy" OBJDUMP_FOR_TARGET="/home/
 Sameer> Sameer/buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-objdump"
 Sameer> DEFAULT_ASSEMBLER="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/
 Sameer> i686-linux-uclibc-as" DEFAULT_LINKER="/home/Sameer/buildroot-2010.02/output/
 Sameer> staging/usr/bin/i686-linux-uclibc-ld" ORIGINAL_AS_FOR_TARGET="/home/Sameer/
 Sameer> buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-as"
 Sameer> ORIGINAL_LD_FOR_TARGET="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/
 Sameer> i686-linux-uclibc-ld" ORIGINAL_NM_FOR_TARGET="/home/Sameer/buildroot-2010.02/
 Sameer> output/staging/usr/bin/i686-linux-uclibc-nm" ORIGINAL_OBJDUMP_FOR_TARGET="/home
 Sameer> /Sameer/buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-objdump"
 Sameer> PKG_CONFIG="/home/Sameer/buildroot-2010.02/output/host/usr/bin/pkg-config"
 Sameer> PKG_CONFIG_LIBDIR="/home/Sameer/buildroot-2010.02/output/host/usr/lib/
 Sameer> pkgconfig" PERLLIB="/home/Sameer/buildroot-2010.02/output/host/usr/lib/perl" \
 Sameer> ??? ??? ?\
 Sameer> ??? ??? /home/Sameer/buildroot-2010.02/output/toolchain/gmp-4.2.4/configure? \
 Sameer> ??? ??? --prefix="/home/Sameer/buildroot-2010.02/output/toolchain/gmp" \
 Sameer> ??? ??? --build=i386-SamOs v1.0 \
 Sameer> ??? ??? --host=i386-SamOs v1.0 \
 Sameer> ??? ??? --disable-shared \
 Sameer> ??? ??? --enable-static \
 Sameer> ??? ??? --disable-nls \
 Sameer> ??? )
 Sameer> configure: WARNING: you should use --build, --host, --target
 Sameer> configure: WARNING: you should use --build, --host, --target
 Sameer> configure: error: --target is not appropriate for GMP
 Sameer> Use --build=CPU-VENDOR-OS if you need to specify your CPU and/or system
 Sameer> explicitly.? Use --host if cross-compiling (see "Installing GMP" in the
 Sameer> manual for more on this).
 Sameer> make: *** [/home/Sameer/buildroot-2010.02/output/toolchain/gmp-4.2.4-host
 Sameer> /.configured] Error 1

What is your .config? Could you try with the latest git snapshot as
well?

-- 
Bye, Peter Korsgaard
