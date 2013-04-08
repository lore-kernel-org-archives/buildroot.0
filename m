From: David Li <w.david.li@gmail.com>
Date: Mon, 8 Apr 2013 08:20:32 -0700
Subject: [Buildroot] Newbie questions on building images for EP405
Message-ID: <CAADET=fm0cNPKvvRj6k9nOiGqXZqVGLM7fabj=y8X8sR197WUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am new to using buildroot and I am learning this with an ep405 (ppc)
        board. My goal is to build an Linux image and boot it up. The
    board comes with u-boot loader on bootup.
        I did make menuconfig with minmal packages (busybox, devtmpfs,
    native buildroot tool chain etc).  After make, I got two image files
    in output/images: rootfs.tar and uImage.

        My questions are:
        1. There are two def kernel config files I used in
           output/build/linux-3.7.8/arch/
    powerpc/configs/. which one is really  for ep405? I tried both in make
    menuconfig and all of them built OK:

      ppc40x_defconfig
      40x/ep405_defconfig

          2. There are two files in output/images/ - one kernel and the
    other a roof filesystem. Can they be combined into one image and boot
    up with ep405 uboot?

           uImage
           rootfs.tar

          3. The ep405 board already boots up uboot. Do I need use  buildroot to
           build another uboot image?


        Thanks.
