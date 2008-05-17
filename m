From: Papa Malick SARR <malicksarr@gmail.com>
Date: Sat, 17 May 2008 12:17:15 +0200
Subject: [Buildroot] Buildroot build wih external toolchain failed
Message-ID: <a53deff80805170317g603162c2y1c71245a22c7ffc2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

When I try to build Buildroot with an external toolchain it fails. I want to
use the compiler installed on my computer (gcc, ld ,as, ..). My host  and
target are  compliant to i686 then it make sense to use my native compiler.

I get the following. I seem that the error is due to prefix handling for
toolchain tools naming scheme.




root at kocc:/media/sda7/bme-buildroo/packages/buildroot# make

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
C compiler version '4.1.3':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.1.3':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf
/media/sda7/bme-buildroo/packages/buildroot/project_build_i686/bme-buildroot-test-glibc/buildroot-config
mkdir -p
/media/sda7/bme-buildroo/packages/buildroot/project_build_i686/bme-buildroot-test-glibc
cp -dpRf package/config/buildroot-config
/media/sda7/bme-buildroo/packages/buildroot/project_build_i686/bme-buildroot-test-glibc/buildroot-config
mkdir -p
/media/sda7/bme-buildroo/packages/buildroot/project_build_i686/bme-buildroot-test-glibc/root/lib
/bin/sh: /usr/bin/bin/-gcc: not found
copy_toolchain_lib_root: lib=/lib/libc.so.6 not found
exit: 1: Illegal number: -1
make: ***
[/media/sda7/bme-buildroo/packages/buildroot/project_build_i686/bme-buildroot-test-glibc/root/lib//lib/libc.so.6]
Erreur 2
root at kocc:/media/sda7/bme-buildroo/packages/buildroot#
root at kocc:/media/sda7/bme-buildroo/packages/buildroot#
root at kocc:/media/sda7/bme-buildroo/packages/buildroot#








Best regards
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080517/04a67081/attachment.htm 
