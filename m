From: Amber <amberved@gmail.com>
Date: Fri, 7 May 2010 14:21:18 -0700
Subject: [Buildroot] u-boot build issue *** No rule to make target
	`y_config'.
Message-ID: <w2q11cd97431005071421of8e1c8c6id8057e544ad852e0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am new to buildroot (and linux too). I used build root to create
toolchain, kernel and rootfs already.

But, I am getting the following error while trying to build a uboot
image using buildroot for PowerPC.

/usr/bin/make -j1 -C
/home/xxx/Downloads/buildroot-2010.02/output/build/u-boot-2009.11	\
		y_config
make[1]: Entering directory
`/home/xxx/Downloads/buildroot-2010.02/output/build/u-boot-2009.11'
make[1]: *** No rule to make target `y_config'.  Stop.
make[1]: Leaving directory
`/home/xxx/Downloads/buildroot-2010.02/output/build/u-boot-2009.11'
make: *** [/home/xxx/Downloads/buildroot-2010.02/output/build/u-boot-2009.11/.configured]
Error 2

I don't see any y_config file in the u-boot-2009.11 folder. Can
someone please advice?

Thanks
