From: Jennifer D'silva <jennifer_dsilva24@yahoo.com>
Date: Wed, 7 Oct 2020 07:53:32 +0000 (UTC)
Subject: [Buildroot] Not able to build buildroot with rootfs generation
References: <727877040.91717.1602057212426.ref@mail.yahoo.com>
Message-ID: <727877040.91717.1602057212426@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I need a help as?I am trying to build buildroot (buildroot-2020.02.6) with (gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf) on ubuntu 20.04 when I give a make -j4, code starts building for sometime apprx. 2-3 minutes later I get following Error

">>> toolchain-external-custom? Configuring

Cannot execute cross-compiler '/opt/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gcc'

make: *** [package/pkg-generic.mk:259: /home/sid/bbb/buildroot-2020.02.6/output/build/toolchain-external-custom/.stamp_configured] Error 1"
Help me to understand what may cauing this. and set-up maunuconfig correctly
Regards,Jennifer


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201007/a000f6ea/attachment.html>
