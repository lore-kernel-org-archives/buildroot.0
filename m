From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 7 Oct 2019 11:01:12 -0300
Subject: [Buildroot] glmark2 build failure
Message-ID: <CAOMZO5BC0CyEpPyJxeXWYf8ZqY+K10tEQw2W5nJZ2S9viM0e4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

When trying to build imx6-sabresd_qt5_defconfig I get the following
glmark2 error:

Does anyone have any ideas on how to solve this?

Thanks

>>> glmark2 9e01aef1a786b28aca73135a5b00f85c357e8f5e Patching
>>> glmark2 9e01aef1a786b28aca73135a5b00f85c357e8f5e Configuring
cd /home/fabio/buildroot/output/build/glmark2-9e01aef1a786b28aca73135a5b00f85c357e8f5e/
&& PATH="/home/fabio/buildroot/output/host/bin:/home/fabio/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
AR="/home/fabio/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ar"
AS="/home/fabio/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-as"
LD="/home/fabio/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ld"
NM="/home/fabio/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-nm"
CC="/home/fabio/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc"
GCC="/home/fabio/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc"
CPP="/home/fabio/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-cpp"
CXX="/home/fabio/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-g++"
FC="/home/fabio/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gfortran"
F77="/home/fabio/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gfortran"
RANLIB="/home/fabio/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ranlib"
READELF="/home/fabio/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-readelf"
STRIP="/home/fabio/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-strip"
OBJCOPY="/home/fabio/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-objcopy"
OBJDUMP="/home/fabio/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/fabio/buildroot/output/host/include"
CFLAGS_FOR_BUILD="-O2 -I/home/fabio/buildroot/output/host/include"
CXXFLAGS_FOR_BUILD="-O2 -I/home/fabio/buildroot/output/host/include"
LDFLAGS_FOR_BUILD="-L/home/fabio/buildroot/output/host/lib
-Wl,-rpath,/home/fabio/buildroot/output/host/lib" FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/fabio/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-as"
DEFAULT_LINKER="/home/fabio/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  "
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os  " LDFLAGS="" FCFLAGS=" -Os " FFLAGS=" -Os
" PKG_CONFIG="/home/fabio/buildroot/output/host/bin/pkg-config"
STAGING_DIR="/home/fabio/buildroot/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot"
INTLTOOL_PERL=/usr/bin/perl
/home/fabio/buildroot/output/host/bin/python2 ./waf configure
--prefix=/usr --libdir=/usr/lib --prefix=/usr --with-flavors=
Setting top to                           :
/home/fabio/buildroot/output/build/glmark2-9e01aef1a786b28aca73135a5b00f85c357e8f5e
Setting out to                           :
/home/fabio/buildroot/output/build/glmark2-9e01aef1a786b28aca73135a5b00f85c357e8f5e/build
Unknown flavor: . Supported flavors are dispmanx-glesv2, drm-gl,
drm-glesv2, mir-gl, mir-glesv2, wayland-gl, wayland-glesv2, win32-gl,
win32-glesv2, x11-gl, x11-glesv2
(complete log in
/home/fabio/buildroot/output/build/glmark2-9e01aef1a786b28aca73135a5b00f85c357e8f5e/build/config.log)
package/pkg-generic.mk:228: recipe for target
'/home/fabio/buildroot/output/build/glmark2-9e01aef1a786b28aca73135a5b00f85c357e8f5e/.stamp_configured'
failed
make: *** [/home/fabio/buildroot/output/build/glmark2-9e01aef1a786b28aca73135a5b00f85c357e8f5e/.stamp_configured]
Error 1
