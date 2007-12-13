From: Martin Bures <needemesleepe@gmail.com>
Date: Thu, 13 Dec 2007 14:21:40 -0500
Subject: [Buildroot] BR2_PACKAGE_LINUX_KCONFIG question
Message-ID: <5970ab460712131121n7ee4357cl89d769320f2e2a81@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I can't get buildroot to complete and BR2_PACKAGE_LINUX_KCONFIG was pointed
out as the culprit.  It was not set.  I followed the setup instructions on
the buildroot website but nothing was mentioned about this variable and I
can't find it when I do a "make menuconfig".  What do I need to set this
variable to?

Without it, this is the error message that I get:

make[1]: Leaving directory
`/home/martin/buildroot/toolchain_build_arm_nofpu/module-init-tools-3.2.2'
touch -c
/home/martin/buildroot/toolchain_build_arm_nofpu/module-init-tools-3.2.2/depmod
/usr/bin/install -D
/home/martin/buildroot/toolchain_build_arm_nofpu/module-init-tools-3.2.2/depmod
/home/martin/buildroot/build_arm/staging_dir/bin/arm-linux-depmod26
cp -dpf
/home/martin/buildroot/project_build_arm/uclibc/linux-2.6.22.10/.config
cp: missing destination file operand after
`/home/martin/buildroot/project_build_arm/uclibc/linux-2.6.22.10/.config'
Try `cp --help' for more information.
make: ***
[/home/martin/buildroot/project_build_arm/uclibc/linux-2.6.22.10/.configured]
Error 1


Thanks.
martin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071213/64013490/attachment.htm 
