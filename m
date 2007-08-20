From: nebulae <shravan.mishra@gmail.com>
Date: Mon, 20 Aug 2007 12:24:46 -0400
Subject: [Buildroot] soekris build problem
Message-ID: <80a8c9800708200924p1aea572fwbff50b4fbcb98012@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm using buildroot for cross compiling  a soekris build and I'm
getting the following error :

 make

Checking build system dependencies:
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/usr/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.2':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.1.2':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

mkdir -p /home/local_smishra/buildroot/toolchain_build_i586/mpfr-2.2.1-host
(cd /home/local_smishra/buildroot/toolchain_build_i586/mpfr-2.2.1-host; \

PATH="/home/local_smishra/buildroot/toolchain_build_i586/bin:/home/local_smishra/buildroot/build_i586/staging_dir/bin:/home/local_smishra/buildroot/build_i586/staging_dir/usr/bin:/bin:/sbin:/usr/bin:/usr/sbin:/opt/bin:/usr/i686-pc-linux-gnu/gcc-bin/4.1.2:/opt/blackdown-jdk-1.4.2.03/bin:/opt/blackdown-jdk-1.4.2.03/jre/bin:/usr/kde/3.5/sbin:/usr/kde/3.5/bin:/usr/qt/3/bin"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld"
CFLAGS_FOR_BUILD="" CXXFLAGS_FOR_BUILD="" LDFLAGS_FOR_BUILD=""
AR_FOR_TARGET=/home/local_smishra/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ar
AS_FOR_TARGET=/home/local_smishra/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-as
LD_FOR_TARGET=/home/local_smishra/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld
NM_FOR_TARGET=/home/local_smishra/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-nm
RANLIB_FOR_TARGET=/home/local_smishra/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ranlib
STRIP_FOR_TARGET=/home/local_smishra/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip
OBJCOPY_FOR_TARGET=/home/local_smishra/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-objcopy
\

/home/local_smishra/buildroot/toolchain_build_i586/mpfr-2.2.1/configure
\

--prefix="/home/local_smishra/buildroot/toolchain_build_i586/mpfr" \
                --build=i386-pc-linux-gnu \
                --host=i386-pc-linux-gnu \
                --enable-shared \
                --enable-static \

--with-gmp=/home/local_smishra/buildroot/toolchain_build_i586/gmp \
                --disable-nls \
        );
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking build system type... i386-pc-linux-gnu
checking host system type... i386-pc-linux-gnu
checking for i386-pc-linux-gnu-gcc... i386-pc-linux-gnu-gcc
checking for C compiler default output file name...
configure: error: C compiler cannot create executables
See `config.log' for more details.

Can somebody please help.

Thanks.
Shravan
