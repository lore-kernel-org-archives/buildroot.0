From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 11 Oct 2008 02:57:01 -0700
Subject: [Buildroot] [buildroot 0005344]: The latest version can not compile
	openssl/openssh
Message-ID: <c4f0fd605efdc0474f623ffd85f828f0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5344 
====================================================================== 
Reported By:                dishui
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5344
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-11-2008 02:57 PDT
Last Modified:              10-11-2008 02:57 PDT
====================================================================== 
Summary:                    The latest version can not compile openssl/openssh
Description: 
I have built toolchain for ARM, if openssh was selected, I always got the
following message:
[root at localhost buildroot]# make

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.1':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.1.1':                   Ok
awk installed:                                  Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf /home/dishui/buildroot/project_build_arm/uclibc/buildroot-config
mkdir -p /home/dishui/buildroot/project_build_arm/uclibc
cp -dpRf package/config/buildroot-config
/home/dishui/buildroot/project_build_arm/uclibc/buildroot-config
(cd /home/dishui/buildroot/build_arm/openssl-0.9.8g; \
                ac_cv_lbl_unaligned_fail=yes
ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_memcmp_working=yes
ac_cv_c_bigendian=no \
               
PATH="/home/dishui/buildroot/toolchain_build_arm/bin:/home/dishui/buildroot/build_arm/staging_dir/bin:/home/dishui/buildroot/build_arm/staging_dir/usr/bin:/usr/local/arm/3.4.1/bin:/usr/lib/qt-3.3/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin"
AR="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ar"
AS="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-as"
LD="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ld
-L/home/dishui/buildroot/build_arm/staging_dir/lib
-L/home/dishui/buildroot/build_arm/staging_dir/usr/lib
--sysroot=/home/dishui/buildroot/build_arm/staging_dir/"
NM="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-nm"
CC="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
-Os  -I/home/dishui/buildroot/build_arm/staging_dir/usr/include
-I/home/dishui/buildroot/build_arm/staging_dir/include
--sysroot=/home/dishui/buildroot/build_arm/staging_dir/ -isysroot
/home/dishui/buildroot/build_arm/staging_dir -mtune=arm920t
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
GCC="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
-Os  -I/home/dishui/buildroot/build_arm/staging_dir/usr/include
-I/home/dishui/buildroot/build_arm/staging_dir/include
--sysroot=/home/dishui/buildroot/build_arm/staging_dir/ -isysroot
/home/dishui/buildroot/build_arm/staging_dir -mtune=arm920t
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CPP="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-cpp
-Os  -I/home/dishui/buildroot/build_arm/staging_dir/usr/include
-I/home/dishui/buildroot/build_arm/staging_dir/include
--sysroot=/home/dishui/buildroot/build_arm/staging_dir/ -isysroot
/home/dishui/buildroot/build_arm/staging_dir -mtune=arm920t
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CXX="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-g++
-Os  -I/home/dishui/buildroot/build_arm/staging_dir/usr/include
-I/home/dishui/buildroot/build_arm/staging_dir/include
--sysroot=/home/dishui/buildroot/build_arm/staging_dir/ -isysroot
/home/dishui/buildroot/build_arm/staging_dir -mtune=arm920t
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
FC="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gfortran
"
RANLIB="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ranlib"
STRIP="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip"
OBJCOPY="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-objcopy"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="" CXXFLAGS_FOR_BUILD=""
LDFLAGS_FOR_BUILD="" FCFLAGS_FOR_BUILD=""
AR_FOR_TARGET="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ar"
AS_FOR_TARGET="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-as"
CC_FOR_TARGET="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc"
LD_FOR_TARGET="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ld"
NM_FOR_TARGET="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-nm"
DEFAULT_ASSEMBLER="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-as"
DEFAULT_LINKER="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ld"
PKG_CONFIG_SYSROOT_DIR="/home/dishui/buildroot/build_arm/staging_dir"
PKG_CONFIG="/home/dishui/buildroot/build_arm/staging_dir/usr/bin/pkg-config"
PKG_CONFIG_PATH="/home/dishui/buildroot/build_arm/staging_dir/usr/lib/pkgconfig:"
STAGING_DIR="/home/dishui/buildroot/build_arm/staging_dir" \
                ./Configure \
                        linux-arm \
                        --prefix=/usr \
                        --openssldir=/usr/lib/ssl \
                        threads \
                        shared \
                        no-idea \
                        no-mdc2 \
                        no-rc5 \
                        zlib-dynamic \
        )
Configuring for linux-arm
Usage: Configure [no-<cipher> ...] [enable-<cipher> ...] [-Dxxx] [-lxxx]
[-Lxxx] [-fxxx] [-Kxxx] [no-hw-xxx|no-hw] [[no-]threads] [[no-]shared]
[[no-]zlib|zlib-dynamic] [no-asm] [no-dso] [no-krb5] [386] [--prefix=DIR]
[--openssldir=OPENSSLDIR] [--with-xxx[=vvv]] [--test-sanity]
os/compiler[:flags]

pick os/compiler from:
BC-32 BS2000-OSD BSD-generic32 BSD-generic64 BSD-ia64 BSD-sparc64
BSD-sparcv8 
BSD-x86 BSD-x86-elf BSD-x86_64 Cygwin Cygwin-pre1.3 DJGPP MPE/iX-gcc
OS2-EMX 
OS390-Unix ReliantUNIX SINIX SINIX-N UWIN VC-CE VC-NT VC-WIN32 VC-WIN64A 
VC-WIN64I aix-cc aix-gcc aix3-cc aix64-cc aix64-gcc aux3-gcc bsdi-elf-gcc
cc 
cray-j90 cray-t3e darwin-i386-cc darwin-ppc-cc darwin64-ppc-cc 
darwin64-x86_64-cc dgux-R3-gcc dgux-R4-gcc dgux-R4-x86-gcc dist gcc
hpux-cc 
hpux-gcc hpux-ia64-cc hpux-ia64-gcc hpux-parisc-cc hpux-parisc-cc-o4 
hpux-parisc-gcc hpux-parisc1_0-cc hpux-parisc2-cc hpux-parisc2-gcc 
hpux64-ia64-cc hpux64-ia64-gcc hpux64-parisc2-cc hpux64-parisc2-gcc
hurd-x86 
irix-cc irix-gcc irix-mips3-cc irix-mips3-gcc irix64-mips4-cc
irix64-mips4-gcc 
linux-alpha+bwx-ccc linux-alpha+bwx-gcc linux-alpha-ccc linux-alpha-gcc 
linux-aout linux-elf linux-generic32 linux-generic64 linux-ia32-icc
linux-ia64 
linux-ia64-ecc linux-ia64-icc linux-ppc linux-ppc64 linux-sparcv8 
linux-sparcv9 linux-x86_64 linux64-sparcv9 mingw ncr-scde netware-clib 
netware-libc netware-libc-bsdsock netware-libc-gcc newsos4-gcc nextstep 
nextstep3.3 osf1-alpha-cc osf1-alpha-gcc purify qnx4 qnx6 rhapsody-ppc-cc

sco5-cc sco5-gcc solaris-sparcv7-cc solaris-sparcv7-gcc solaris-sparcv8-cc

solaris-sparcv8-gcc solaris-sparcv9-cc solaris-sparcv9-gcc solaris-x86-cc

solaris-x86-gcc solaris64-sparcv9-cc solaris64-sparcv9-gcc
solaris64-x86_64-cc 
solaris64-x86_64-gcc sunos-gcc tandem-c89 tru64-alpha-cc ultrix-cc
ultrix-gcc 
unixware-2.0 unixware-2.1 unixware-7 unixware-7-gcc vos-gcc vxworks-mipsle

vxworks-ppc405 vxworks-ppc750 vxworks-ppc750-debug vxworks-ppc860 debug 
debug-BSD-x86-elf debug-Cygwin debug-ben debug-ben-debug debug-ben-openbsd

debug-ben-openbsd-debug debug-ben-strict debug-bodo debug-darwin-ppc-cc 
debug-geoff debug-levitte-linux-elf debug-levitte-linux-elf-extreme 
debug-levitte-linux-noasm debug-levitte-linux-noasm-extreme
debug-linux-elf 
debug-linux-elf-noefence debug-linux-pentium debug-linux-ppro debug-rse 
debug-solaris-sparcv8-cc debug-solaris-sparcv8-gcc
debug-solaris-sparcv9-cc 
debug-solaris-sparcv9-gcc debug-steve debug-steve-linux-pseudo64 debug-ulf

debug-vos-gcc 

NOTE: If in doubt, on Unix-ish systems use './config'.
make: ***
[/home/dishui/buildroot/build_arm/openssl-0.9.8g/.stamp_configured] Error
1
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-11-08 02:57  dishui         New Issue                                    
10-11-08 02:57  dishui         Status                   new => assigned     
10-11-08 02:57  dishui         Assigned To               => buildroot       
======================================================================
