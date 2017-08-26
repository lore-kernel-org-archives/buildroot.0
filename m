From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 26 Aug 2017 10:12:26 +0800
Subject: [Buildroot] Change "Target Architecture" does not rebuild
	everything?
Message-ID: <CAEUhbmVe=CaF3Rf6L2aNmgJbVd1d1rjeu26dfYZ4jB8HSVn6KQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I had a successful build of minnowboard_max_defconfig which generates
a 64-bit kernel and rootfs. Now I want to change the target
architecture to i386 (via 'make menuconfig') to generate a 32-bit
build. But 'make' completed very quickly, and it looks the everything
does not get rebuilt.

Is this supposed behavior? or a bug?

Regards,
Bin
