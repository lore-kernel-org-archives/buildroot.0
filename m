From: Paul Jones <Paul.Jones@iwtech.com.au>
Date: Sat, 1 Nov 2008 19:29:39 +1100
Subject: [Buildroot] Error copying kernel image
Message-ID: <3B941116898CDA489B91563DEF88F4B6059548@iwt-server.iwt.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason it seems to be trying to copy the kernel image from the
main linux-2.6.26 directory rather than from arch/arm/boot/ - I assume
that this is not correct behaviour? Copying the file manually results in
a successful build.


  CHK     include/linux/compile.h
  Kernel: arch/arm/boot/Image is ready
  Kernel: arch/arm/boot/zImage is ready
  Image arch/arm/boot/uImage is ready
make[1]: Leaving directory
`/home/paul.jones/buildroot/project_build_arm/kisssa/linux-2.6.26'
cp -pf
/home/paul.jones/buildroot/project_build_arm/kisssa/linux-2.6.26/uImage
/home/paul.jones/buildroot/binaries/kisssa/arm-linux-2.6.26-20081101.gz
cp: cannot stat
`/home/paul.jones/buildroot/project_build_arm/kisssa/linux-2.6.26/uImage
': No such file or directory
make: ***
[/home/paul.jones/buildroot/binaries/kisssa/arm-linux-2.6.26-20081101.gz
] Error 1


Paul.
