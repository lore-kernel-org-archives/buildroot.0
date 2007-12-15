From: Lan Ngoc <ngoclan.it@gmail.com>
Date: Sat, 15 Dec 2007 22:41:08 +0700
Subject: [Buildroot] Build kernel for ARM with Buildroot
Message-ID: <2b4282de0712150741n6266e9b0ged662875d25e2824@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have been building kernel and getting error1: "cp: missing destination
file operand after" as following:
................................................................

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
C compiler '/usr/lib/ccache/gcc'
C compiler version '4.1.2':                     Ok
C++ compiler '/usr/lib/ccache/g++'
C++ compiler version '4.1.2':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf /mnt/e/buildroot/project_build_arm/ENDUP/buildroot-config
mkdir -p /mnt/e/buildroot/project_build_arm/ENDUP
cp -dpRf package/config/buildroot-config
/mnt/e/buildroot/project_build_arm/ENDUP/buildroot-config
cp -dpf  /mnt/e/buildroot/project_build_arm/ENDUP/linux-2.6.22.10/.config
cp: missing destination file operand after
`/mnt/e/buildroot/project_build_arm/ENDUP/linux-2.6.22.10/.config'
Try `cp --help' for more information.
make: *** [/mnt/e/buildroot/project_build_arm/ENDUP/linux-
2.6.22.10/.configured] Error 1

......................................................
I'm using Fedora core 7 and lastest Buildroot version.

Please show me how to sovle this error!

Thank you very much!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071215/ed6fa3d1/attachment.htm 
