From: mzee mzee <wanyumba@gmail.com>
Date: Mon, 23 Mar 2009 14:24:50 +0000
Subject: [Buildroot] help
Message-ID: <33966b5d0903230724l7508be23m9e114af609f41cb6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

#



hi,i need helpthis is my problem

thuoeg at elp:~/builroot/buildrootsnap$ make all

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                Ok
CC clean:                    Ok
CXX clean:                    Ok
CPP clean:                    Ok
CFLAGS clean:                    Ok
INCLUDES clean:                    Ok
CXXFLAGS clean:                    Ok
which installed:                Ok
sed works:                    Ok (/bin/sed)
GNU make version '3.81':            Ok
C compiler '/usr/bin/gcc'
C compiler version '4.3.3':            Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.3.3':            Ok
awk installed:                    Ok
bash installed:                    Ok
bison installed:                Ok
flex installed:                    Ok
gettext installed:                Ok
makeinfo installed:                Ok
Build system dependencies:            Ok

rm -rf
/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/buildroot-config
mkdir -p /home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee
cp -dpRf package/config/buildroot-config
/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/buildroot-config
mkdir -p
/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/root/etc
echo "" >
/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/root/etc/issue
echo "" >>
/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/root/etc/issue
echo "Welcome to mzee" >>
/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/root/etc/issue
mkdir -p
/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/root/etc
echo "mzee" >
/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/root/etc/hostname
mkdir -p
/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/root/etc
echo "2009.05-svn"
>/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/root/etc/br-version
PATH="/home/thuoeg/builroot/buildrootsnap/toolchain_build_i686/bin:/home/thuoeg/builroot/buildrootsnap/build_i686/host_dir/bin:/home/thuoeg/builroot/buildrootsnap/build_i686/host_dir/usr/bin:/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/bin:/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/games"
AR="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ar"
AS="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-as"
LD="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ld"
NM="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-nm"
CC="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
-Os -pipe -Os
-I/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/include
-I/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/include
--sysroot=/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/
-isysroot /home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir
-mtune=pentium3 -march=pentium3"
GCC="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
-Os -pipe -Os
-I/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/include
-I/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/include
--sysroot=/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/
-isysroot /home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir
-mtune=pentium3 -march=pentium3"
CPP="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-cpp
-Os -pipe -Os
-I/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/include
-I/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/include
--sysroot=/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/
-isysroot /home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir
-mtune=pentium3 -march=pentium3"
CXX="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-g++
-Os -pipe -Os
-I/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/include
-I/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/include
--sysroot=/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/
-isysroot /home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir
-mtune=pentium3 -march=pentium3"
FC="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gfortran
"
RANLIB="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ranlib"
STRIP="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-strip"
OBJCOPY="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-objcopy"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld"
CFLAGS_FOR_BUILD="-I/home/thuoeg/builroot/buildrootsnap/build_i686/host_dir/include
-I/home/thuoeg/builroot/buildrootsnap/build_i686/host_dir/usr/include"
CXXFLAGS_FOR_BUILD="-I/home/thuoeg/builroot/buildrootsnap/build_i686/host_dir/include
-I/home/thuoeg/builroot/buildrootsnap/build_i686/host_dir/usr/include"
LDFLAGS_FOR_BUILD="-L/home/thuoeg/builroot/buildrootsnap/build_i686/host_dir/lib
-L/home/thuoeg/builroot/buildrootsnap/build_i686/host_dir/usr/lib"
FCFLAGS_FOR_BUILD=""
AR_FOR_TARGET="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ar"
AS_FOR_TARGET="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-as"
CC_FOR_TARGET="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc"
LD_FOR_TARGET="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ld"
NM_FOR_TARGET="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-nm"
DEFAULT_ASSEMBLER="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-as"
DEFAULT_LINKER="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ld"
PKG_CONFIG_SYSROOT_DIR="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir"
PKG_CONFIG="/home/thuoeg/builroot/buildrootsnap/build_i686/host_dir/usr/bin/pkg-config"
PKG_CONFIG_PATH="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/lib/pkgconfig"
STAGING_DIR="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir"
CXX="" \
        CFLAGS="-Os -pipe -Os
-I/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/include
-I/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/include
--sysroot=/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/
-isysroot /home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir
-mtune=pentium3 -march=pentium3" \

LDFLAGS="-L/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/lib
-L/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/lib
--sysroot=/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/" \
         \
        /usr/bin/make -j1
CROSS_COMPILE="/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-"
ARCH=i386 \
         -C
/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/u-boot-2009.01
make[1]: Entering directory
`/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/u-boot-2009.01'
for dir in tools examples api_examples ; do /usr/bin/make -C $dir _depend ;
done
make[2]: Entering directory
`/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/u-boot-2009.01/tools'
make[2]: Nothing to be done for `_depend'.
make[2]: Leaving directory
`/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/u-boot-2009.01/tools'
make[2]: Entering directory
`/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/u-boot-2009.01/examples'
make[2]: Nothing to be done for `_depend'.
make[2]: Leaving directory
`/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/u-boot-2009.01/examples'
make[2]: Entering directory
`/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/u-boot-2009.01/api_examples'
make[2]: Nothing to be done for `_depend'.
make[2]: Leaving directory
`/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/u-boot-2009.01/api_examples'
/usr/bin/make -C tools all
make[2]: Entering directory
`/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/u-boot-2009.01/tools'
make[2]: Leaving directory
`/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/u-boot-2009.01/tools'
/usr/bin/make -C examples all
make[2]: Entering directory
`/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/u-boot-2009.01/examples'
/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
-g  -Os   -fPIC -ffixed-r14 -meabi -fno-strict-aliasing -D__KERNEL__
-DTEXT_BASE=0xFFFC0000
-I/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/u-boot-2009.01/include
-fno-builtin -ffreestanding -nostdinc -isystem
/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin-ccache/../lib/gcc/i686-linux-uclibc/4.3.3/include
-pipe  -DCONFIG_I386 -D__I386__ -DCONFIG_4xx -ffixed-r2 -mstring
-msoft-float -Wa,-m405 -mcpu=405 -Wall -Wstrict-prototypes  -c -o
hello_world.o hello_world.c
`-mcpu=' is deprecated. Use `-mtune=' or '-march=' instead.
cc1: error: unrecognized command line option "-meabi"
cc1: error: unrecognized command line option "-mstring"
cc1: warning: unknown register name: r2
hello_world.c:1: error: bad value (405) for -mtune= switch
/home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin-ccache/../lib/gcc/i686-linux-uclibc/4.3.3/../../../../i686-linux-uclibc/bin/as:
unrecognized option '-m405'
make[2]: *** [hello_world.o] Error 1
make[2]: Leaving directory
`/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/u-boot-2009.01/examples'
make[1]: *** [examples] Error 2
make[1]: Leaving directory
`/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/u-boot-2009.01'
make: ***
[/home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/u-boot-2009.01/u-boot.bin]
Error 2
thuoeg at elp:~/builroot/buildrootsnap$










please help
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090323/4952542f/attachment-0001.htm>
