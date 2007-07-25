From: Hebbar <gururajakr@sanyo.co.in>
Date: Wed, 25 Jul 2007 16:35:21 -0700 (PDT)
Subject: [Buildroot] error building arm toolchain with latest snapshot-
 error says missing system headers
In-Reply-To: <11778512.post@talk.nabble.com>
References: <11778512.post@talk.nabble.com>
Message-ID: <11801829.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi All,

few more things to add.

After the 1st error when i try "make gcc" i get below error. Kindly help me
to solve this. all this started with latest buildroot snapshot


/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gcc-4.2.0-initial/./gcc/xgcc
-B/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gcc-4.2.0-initial/./gcc/
-B/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/bin/
-B/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/lib/
-isystem
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/include
-isystem
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/sys-include
-O2 -g -Os -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  -isystem
./include  -I. -I.
-I/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gcc-4.2.0/gcc
-I/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gcc-4.2.0/gcc/.
-I/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gcc-4.2.0/gcc/../include
-I/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gcc-4.2.0/gcc/../libcpp/include
-I/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gmp/include
-I/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/mpfr/include
-I/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gcc-4.2.0/gcc/../libdecnumber
-I../libdecnumber  -g0 -finhibit-size-directive -fno-inline-functions
-fno-exceptions -fno-zero-initialized-in-bss -fno-toplevel-reorder   \
          -c
/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gcc-4.2.0/gcc/crtstuff.c
-DCRT_BEGIN \
          -o crtbegin.o
/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gcc-4.2.0-initial/./gcc/as:
line 2: exec: -m: invalid option
exec: usage: exec [-cl] [-a name] file [redirection ...]
make[2]: *** [crtbegin.o] Error 1
make[2]: Leaving directory
`/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gcc-4.2.0-initial/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory
`/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gcc-4.2.0-initial'
make: ***
[/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gcc-4.2.0-initial/.compiled]
Error 2


Regards
Gururaja


-- 
View this message in context: http://www.nabble.com/error-building-arm-toolchain-with-latest-snapshot--error-says-missing-system-headers-tf4140817.html#a11801829
Sent from the BuildRoot mailing list archive at Nabble.com.
