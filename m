From: Leo Zhang <netboy_feng@163.com>
Date: Fri, 11 May 2007 16:34:19 +0800
Subject: [Buildroot] help,config.sub i386- failed
Message-ID: <46442DEF.30252C.22055@m12-13.163.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

buildroot at uclibc.orghello list,
I am a new user of buildroot,I want build a cross toolchain for arm.
but when i make,something err display.who can help me?
error info:
mkdir -p /home/zhf/LeoProject/buildchain/buildroot_1/toolchain_build_arm/mpfr-2.2.1-host
(cd /home/zhf/LeoProject/buildchain/buildroot_1/toolchain_build_arm/mpfr-2.2.1-host; \
        CC="gcc" CC_FOR_BUILD="gcc" \
        CXX="g++" \
        /home/zhf/LeoProject/buildchain/buildroot_1/toolchain_build_arm/mpfr-2.2.1/configure \
        --prefix="/home/zhf/LeoProject/buildchain/buildroot_1/toolchain_build_arm/mpfr" \
        --build=i386- \
        --host=i386- \
        --target=arm-linux-uclibc \
        --enable-shared \
        --enable-static \
        --with-gmp=/home/zhf/LeoProject/buildchain/buildroot_1/toolchain_build_arm/gmp \
        --disable-nls \
);
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking build system type... Invalid configuration `i386-': system `' not recognized
configure: error: /bin/sh /home/zhf/LeoProject/buildchain/buildroot_1/toolchain_build_arm/mpfr-2.2.1/config.sub i386- failed
make: *** [/home/zhf/LeoProject/buildchain/buildroot_1/toolchain_build_arm/mpfr-2.2.1-host/.configured] error 1
	
thanks!
								leo zhang
????????2007-05-11
