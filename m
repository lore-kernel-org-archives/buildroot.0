From: Felipe Uderman <felipe.uderman@gmail.com>
Date: Fri, 16 Nov 2007 09:46:21 -0300
Subject: [Buildroot] Fails to build: error on copying .config file,
	please help
Message-ID: <951b8d920711160446k4bc43ac6n38b33612c161947f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am trying to compile a Kernel for the ARM architecture, but my build
fails. A copy instruction is incomplete, without the destination parameter.
Please take a look at it:

uderman at udermanlp:~/udAPP/buildroot$ make

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
C compiler version '4.1.2':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.1.2':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf
/home/uderman/udAPP/buildroot/project_build_arm/teste02/buildroot-config
mkdir -p /home/uderman/udAPP/buildroot/project_build_arm/teste02
cp -dpRf package/config/buildroot-config
/home/uderman/udAPP/buildroot/project_build_arm/teste02/buildroot-config
cp -dpf  /home/uderman/udAPP/buildroot/project_build_arm/teste02/linux-
2.6.22.10/.config
cp: missing destination file operand after
`/home/uderman/udAPP/buildroot/project_build_arm/teste02/linux-
2.6.22.10/.config'
Try `cp --help' for more information.
make: *** [/home/uderman/udAPP/buildroot/project_build_arm/teste02/linux-
2.6.22.10/.configured] Error 1

I could not found the instruction that causes the error on my Makefile, is
that where it is supposed to be?

Any sugestions?

Thank you,

uderman
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071116/8b8bc043/attachment-0001.htm 
