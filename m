From: Eric Seifert <eric.seifert@cyaninc.com>
Date: Wed, 9 Oct 2013 15:49:45 -0700
Subject: [Buildroot] iproute2 build error
Message-ID: <CALoHCLPE6SOyJM58kDXFyTxhKoCiJs4qQ1Gzk2Fsa_0-1ubViA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, I was on buildroot-2012.08 and am trying to get up to date, so I am
using the git repo directly now with the latest changes. Previously
iproute2 was building successfully (v3.4.0), now I am getting this iproute2
build error (v3.11.0). I am building for PowerPC 8548/e500v2 (SPE). I am
using an external toolchain gcc4.3.2 that uses eglibc. Any help would be
great.

Thank You,
Eric Seifert


>>> iproute2 3.11.0 Configuring
/bin/sed -i -e 's/gcc/$CC $CFLAGS/g'
/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/build/iproute2-3.11.0/configure
cd
/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/build/iproute2-3.11.0
&&
PATH="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/bin:/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin:/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/sbin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
AR="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-ar"
AS="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-as"
LD="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-ld"
NM="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-nm"
CC="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-gcc"
GCC="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-gcc"
CPP="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-cpp"
CXX="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-g++"
FC="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-gfortran"
RANLIB="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-ranlib"
READELF="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-readelf"
STRIP="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-strip"
OBJCOPY="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-objcopy"
OBJDUMP="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/include"
CFLAGS_FOR_BUILD="-O2
-I/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-O2
-I/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/lib
-L/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/lib
-Wl,-rpath,/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-as"
DEFAULT_LINKER="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-mabi=spe -mfloat-gprs=double -Wa,-me500x2 -pipe -Os "
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-mabi=spe -mfloat-gprs=double -Wa,-me500x2 -pipe -Os " LDFLAGS=""
FCFLAGS=""
PKG_CONFIG="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/pkg-config"
PERLLIB="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/lib/perl"
STAGING_DIR="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/powerpc-buildroot-linux-gnuspe/sysroot"
./configure
TC schedulers
 ATM no
 IPT using xtables
 IPSET  no
iptables modules directory: /usr/lib/xtables
libc has setns: no
# arpd needs berkeleydb
/bin/sed -i -e "/^TARGETS=/s: arpd : :"
/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/build/iproute2-3.11.0/misc/Makefile
/bin/sed -i -e 's/-Werror//'
/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/build/iproute2-3.11.0/Makefile
echo "IPT_LIB_DIR:=/usr/lib/xtables"
>>/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/build/iproute2-3.11.0/Config
# Makefile is busted so it never passes IPT_LIB_DIR properly
/bin/sed -i -e "s/-DIPT/-DXT/"
/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/build/iproute2-3.11.0/tc/Makefile
echo "TC_CONFIG_XT:=y"
>>/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/build/iproute2-3.11.0/Config
>>> iproute2 3.11.0 Building
/bin/sed -i -e 's/$(CCOPTS)//'
/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/build/iproute2-3.11.0/netem/Makefile
PATH="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/bin:/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin:/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/sbin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
PERLLIB="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/lib/perl"
/usr/bin/make -j3
CC="/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-gcc"
CCOPTS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-mabi=spe -mfloat-gprs=double -Wa,-me500x2 -pipe -Os  -D_GNU_SOURCE" -C
/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/build/iproute2-3.11.0
make[1]: Entering directory
`/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/build/iproute2-3.11.0'
make[2]: Entering directory
`/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/build/iproute2-3.11.0/lib'
/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-gcc
-Wall -Wstrict-prototypes  -Wmissing-prototypes -Wmissing-declarations
-Wold-style-definition -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=double -Wa,-me500x2 -pipe -Os
 -D_GNU_SOURCE -I../include -DRESOLVE_HOSTNAMES -DLIBDIR=\"/usr/lib\"
-DCONFDIR=\"/etc/iproute2\" -D_GNU_SOURCE -fPIC   -c -o libgenl.o libgenl.c
/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-gcc
-Wall -Wstrict-prototypes  -Wmissing-prototypes -Wmissing-declarations
-Wold-style-definition -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=double -Wa,-me500x2 -pipe -Os
 -D_GNU_SOURCE -I../include -DRESOLVE_HOSTNAMES -DLIBDIR=\"/usr/lib\"
-DCONFDIR=\"/etc/iproute2\" -D_GNU_SOURCE -fPIC   -c -o ll_map.o ll_map.c
/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-gcc
-Wall -Wstrict-prototypes  -Wmissing-prototypes -Wmissing-declarations
-Wold-style-definition -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=double -Wa,-me500x2 -pipe -Os
 -D_GNU_SOURCE -I../include -DRESOLVE_HOSTNAMES -DLIBDIR=\"/usr/lib\"
-DCONFDIR=\"/etc/iproute2\" -D_GNU_SOURCE -fPIC   -c -o libnetlink.o
libnetlink.c
libnetlink.c: In function 'rtnl_open_byproto':
libnetlink.c:46: error: 'SOCK_CLOEXEC' undeclared (first use in this
function)
libnetlink.c:46: error: (Each undeclared identifier is reported only once
libnetlink.c:46: error: for each function it appears in.)
make[2]: *** [libnetlink.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory
`/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/build/iproute2-3.11.0/lib'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/build/iproute2-3.11.0'
make: ***
[/home/eseifert/dev/cyrfs/git_trunk/buildroot-2012.08/output/build/iproute2-3.11.0/.stamp_built]
Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131009/aa843fa1/attachment-0001.html>
