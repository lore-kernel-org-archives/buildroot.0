From: Steven Woody <narkewoody@gmail.com>
Date: Sun, 31 Aug 2008 18:16:13 +0800
Subject: [Buildroot] modify default stuffs of rootfs
Message-ID: <ed4892840808310316ja012fd0ha8822417f38b00fe@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am using buildroot to create a cramfs rootfs. I want to modifiy the
default stuff in rootfs, such as

1, modify it's /dev/inittab
2. add a prebuild executable into the /usr/bin

What's the correct way to do it?  Can I simply run mkfs.cramfs
project_build_arm/uclibc/root rootfs.arm.cramfs after manually do
these changes in the project_build_arm/uclibc/root directory?

Thanks.

-
narke
