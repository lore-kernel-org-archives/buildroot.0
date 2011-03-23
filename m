From: Chia-Hung Chou <s85125212@gmail.com>
Date: Wed, 23 Mar 2011 19:50:09 +0800
Subject: [Buildroot] Buildroot toolchain for arm
Message-ID: <AANLkTi=o3wKS3BhnGrN+g1emwedgsnN3GtEbMYz4x560@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I want to build the toolchain to compile into fully thumb instruction. In
the menuconfig, I add the "--with-mode=thumb" into gcc options.
After I make the buildroot, there are some Errors :
    make[5]: *** [libmudflap.la] Error 1
    make[5]: Leaving directory
'/home/chiahung/buildroot-2011.02/output/toolchain/gcc-4.4.5-final/arm-unknown-linux-uclibic/libmudflap'
    make[4]: *** [all-recursive] Error 1
    make[4]: Leaving directory
'/home/chiahung/buildroot-2011.02/output/toolchain/gcc-4.4.5-final/arm-unknown-linux-uclibic/libmudflap'
    make[3]: *** [all] Error 2
    make[3]: Leaving directory
'/home/chiahung/buildroot-2011.02/output/toolchain/gcc-4.4.5-final/arm-unknown-linux-uclibic/libmudflap'
    make[2]: *** [all-target-libmudflap] Error 2
    make[2]: Leaving directory
'/home/chiahung/buildroot-2011.02/output/toolchain/gcc-4.4.5-final'
    make[1]: *** [all-target-libmudflap] Error 2
    make[1]: Leaving directory
'/home/chiahung/buildroot-2011.02/output/toolchain/gcc-4.4.5-final'
    make: ***
[/home/chiahung/buildroot-2011.02/output/toolchain/gcc-4.4.4.5-final/.compiled]
Error 2
 I try a lot of ways but I still can't solve it. Is there any way to solve
or to build a toolchain that could compile code into fully thumb
instruction??

thanks~
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110323/bc3f36d4/attachment.html>
