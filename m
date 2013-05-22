From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 22 May 2013 16:06:00 +0200
Subject: [Buildroot] gst-fsl plugins imx53 build error
Message-ID: <84A636242B704DF3A957F6A111BD4ACA@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

(Buildroot 2013-05rc git)

I was trying to build this for a karo imx53 based som.
Is it missing some dependency ?

 gzip -d -c /home/johan/dl/imx-lib-12.09.01.tar.gz | tar --strip-components=1 -C /home/buildroot12git/output/build/imx-lib-12.09.01
-xf -
>>> imx-lib 12.09.01 Patching package//imx-lib
>>> imx-lib 12.09.01 Configuring
>>> imx-lib 12.09.01 Building
PATH="/home/buildroot12git/output/host/bin:/home/buildroot12git/output/host/usr/bin:/home/buildroot12git/output/host/usr/sbin/:/usr/
local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/host/usr/bin"
PERLLIB="/home/buildroot12git/output/host/usr/lib/perl"
PATH="/home/buildroot12git/output/host/bin:/home/buildroot12git/output/host/usr/bin:/home/buildroot12git/output/host/usr/sbin/:/usr/
local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/host/usr/bin"
AR="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ar"
AS="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-as"
LD="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ld"
NM="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-nm"
CC="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc"
GCC="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc"
CPP="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-cpp"
CXX="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++"
FC="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gfortran"
RANLIB="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ranlib"
READELF="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-readelf"
STRIP="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-strip"
OBJCOPY="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-objcopy"
OBJDUMP="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-objdump" AR_FOR_BUILD="/usr/bin/ar"
AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" CXX_FOR_BUILD="/usr/bin/g++"
FC_FOR_BUILD="/usr/bin/ld" LD_FOR_BUILD="/usr/bin/ld" CPPFLAGS_FOR_BUILD="-I/home/buildroot12git/output/host/usr/include"
CFLAGS_FOR_BUILD="-O2 -I/home/buildroot12git/output/host/usr/include" CXXFLAGS_FOR_BUILD="-O2
-I/home/buildroot12git/output/host/usr/include" LDFLAGS_FOR_BUILD="-L/home/buildroot12git/output/host/lib
-L/home/buildroot12git/output/host/usr/lib -Wl,-rpath,/home/buildroot12git/output/host/usr/lib" FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-as"
DEFAULT_LINKER="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ld" CPPFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os "
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os " LDFLAGS="" FCFLAGS=""
PKG_CONFIG="/home/buildroot12git/output/host/usr/bin/pkg-config" PERLLIB="/home/buildroot12git/output/host/usr/lib/perl"
STAGING_DIR="/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot" CROSS_COMPILE="
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-" PLATFORM="IMX25_3STACK"
INCLUDE="-I/home/buildroot12git/output/build/linux-3.4.44/drivers/mxc/security/rng/include
-I/home/buildroot12git/output/build/linux-3.4.44/drivers/mxc/security/sahara2/include -idirafter
/home/buildroot12git/output/build/linux-3.4.44/include" /usr/bin/make -j1 -C /home/buildroot12git/output/build/imx-lib-12.09.01
make[1]: Entering directory `/home/buildroot12git/output/build/imx-lib-12.09.01'
/usr/bin/make -C ipu all
make[2]: Entering directory `/home/buildroot12git/output/build/imx-lib-12.09.01/ipu'
Not support platform, will not complile
make[2]: Leaving directory `/home/buildroot12git/output/build/imx-lib-12.09.01/ipu'
/usr/bin/make -C pxp all
make[2]: Entering directory `/home/buildroot12git/output/build/imx-lib-12.09.01/pxp'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/buildroot12git/output/build/imx-lib-12.09.01/pxp'
/usr/bin/make -C rng all
make[2]: Entering directory `/home/buildroot12git/output/build/imx-lib-12.09.01/rng'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -pipe -Os  -g -Wall -W -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -fPIC
-DFSL_PLATFORM_OTHER -DFSL_HAVE_RNGC -I/home/buildroot12git/output/build/linux-3.4.44/drivers/mxc/security/rng/include
-I/home/buildroot12git/output/build/linux-3.4.44/drivers/mxc/security/sahara2/include -idirafter
/home/buildroot12git/output/build/linux-3.4.44/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -c -o
fsl_shw_rand.o fsl_shw_rand.c
fsl_shw_rand.c:46:24: fatal error: shw_driver.h: No such file or directory
compilation terminated.
make[2]: *** [fsl_shw_rand.o] Error 1
make[2]: Leaving directory `/home/buildroot12git/output/build/imx-lib-12.09.01/rng'
make[1]: *** [rng] Error 2
make[1]: Leaving directory `/home/buildroot12git/output/build/imx-lib-12.09.01'
make: *** [/home/buildroot12git/output/build/imx-lib-12.09.01/.stamp_built] Error 2

What's missing ?

Sagaert Johan
