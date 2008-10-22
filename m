From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 22 Oct 2008 03:20:50 -0700
Subject: [Buildroot] [buildroot 0005654]: Xclock does not compile
Message-ID: <636a36cc4d1bdd8cf12f4220e4f56eb9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5654 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5654
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-22-2008 03:20 PDT
Last Modified:              10-22-2008 03:20 PDT
====================================================================== 
Summary:                    Xclock does not compile
Description: 
roberto at rafbook:~/gles/buildroot$ make

[...]

>>> xapp_xclock 1.0.3 Configuring
cd /home/roberto/gles/buildroot/build_i586/xapp_xclock-1.0.3/ && rm -f
config.cache && \
	PATH="/home/roberto/gles/buildroot/toolchain_build_i586/bin:/home/roberto/gles/buildroot/build_i586/staging_dir/bin:/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin:/home/roberto/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
AR="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ar"
AS="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-as"
LD="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld
-L/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/"
NM="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-nm"
CC="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64"
GCC="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64"
CPP="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-cpp
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64"
CXX="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64"
FC="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gfortran
"
RANLIB="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ranlib"
STRIP="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-sstrip"
OBJCOPY="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-objcopy"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="" CXXFLAGS_FOR_BUILD=""
LDFLAGS_FOR_BUILD="" FCFLAGS_FOR_BUILD=""
AR_FOR_TARGET="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ar"
AS_FOR_TARGET="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-as"
CC_FOR_TARGET="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc"
LD_FOR_TARGET="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld"
NM_FOR_TARGET="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-nm"
DEFAULT_ASSEMBLER="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-as"
DEFAULT_LINKER="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld"
PKG_CONFIG_SYSROOT_DIR="/home/roberto/gles/buildroot/build_i586/staging_dir"
PKG_CONFIG="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/pkg-config"
PKG_CONFIG_PATH="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib/pkgconfig:"
STAGING_DIR="/home/roberto/gles/buildroot/build_i586/staging_dir" \
	ac_cv_lbl_unaligned_fail=no ac_cv_func_mmap_fixed_mapped=yes
ac_cv_func_memcmp_working=yes ac_cv_c_bigendian=no \
	 \
		./configure \
		--target=i586-linux \
		--host=i586-linux \
		--build=i386-pc-linux-gnu \
		--prefix=/usr \
		--exec-prefix=/usr \
		--sysconfdir=/etc \
		 LDFLAGS="-liconv"
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking for i586-linux-strip...
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-sstrip
checking whether to enable maintainer-specific portions of Makefiles...
no
checking for i586-linux-gcc...
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
checking for C compiler default output file name... 
configure: error: C compiler cannot create executables
See `config.log' for more details.
make: ***
[/home/roberto/gles/buildroot/build_i586/xapp_xclock-1.0.3/.stamp_configured]
Error 77

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-22-08 03:20  robang74       New Issue                                    
10-22-08 03:20  robang74       Status                   new => assigned     
10-22-08 03:20  robang74       Assigned To               => buildroot       
======================================================================
