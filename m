From: alberteerj <albertrj01@yahoo.com>
Date: Tue, 2 Dec 2008 23:21:11 -0800 (PST)
Subject: [Buildroot] compile buildroot: mkimage': No such file or directory
Message-ID: <20807971.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,

I'm currently doing the "make" buildroot compilation in fedora 8 for my
connex 400xm Gumstix. But it seems that at the final stage of compilation
and it fails to complete the compile. Some errors occurred and i have copy
down the errors at below. Please help me out in this matter, i'm kinda
rushing for my project right now :( thanks.


[alberteerj at localhost gumstix-buildroot]$ make

Checking build system dependencies:
sed works:                          Ok
GNU make version '3.81':            Ok
gcc version '4.1.2':                Ok
which installed:                    Ok
bison installed:                    Ok
flex installed:                     Ok
gettext installed:                  Ok
Build system dependencies:          Ok

make -j3 BR2_TARGET_GUMSTIX_BASIXCONNEX=y GUMSTIX_400MHZ=y
SVN_REVISION=1637M ARCH=arm
CROSS_COMPILE=/home/ken/gumstix-buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibcgnueabi-
-C /home/ken/gumstix-buildroot/build_arm_nofpu/u-boot-1.2.0 tools
make[1]: Entering directory
`/home/ken/gumstix-buildroot/build_arm_nofpu/u-boot-1.2.0'
make -C tools all
make[2]: Entering directory
`/home/ken/gumstix-buildroot/build_arm_nofpu/u-boot-1.2.0/tools'
make[2]: Leaving directory
`/home/ken/gumstix-buildroot/build_arm_nofpu/u-boot-1.2.0/tools'
make[1]: Leaving directory
`/home/ken/gumstix-buildroot/build_arm_nofpu/u-boot-1.2.0'
cp -f /home/ken/gumstix-buildroot/build_arm_nofpu/u-boot-1.2.0/tools/mkimage
/home/ken/gumstix-buildroot/build_arm_nofpu/staging_dir/bin/mkimage
cp: cannot stat
`/home/ken/gumstix-buildroot/build_arm_nofpu/u-boot-1.2.0/tools/mkimage': No
such file or directory
make: ***
[/home/ken/gumstix-buildroot/build_arm_nofpu/staging_dir/bin/mkimage] Error
1


-- 
View this message in context: http://www.nabble.com/compile-buildroot%3A-mkimage%27%3A-No-such-file-or-directory-tp20807971p20807971.html
Sent from the BuildRoot mailing list archive at Nabble.com.
