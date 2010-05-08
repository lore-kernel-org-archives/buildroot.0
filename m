From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 May 2010 16:09:29 +0200
Subject: [Buildroot] u-boot build issue *** No rule to make target
	`y_config'.
In-Reply-To: <w2q11cd97431005071421of8e1c8c6id8057e544ad852e0@mail.gmail.com>
	(Amber's message of "Fri, 7 May 2010 14:21:18 -0700")
References: <w2q11cd97431005071421of8e1c8c6id8057e544ad852e0@mail.gmail.com>
Message-ID: <87632y7aee.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Amber" == Amber  <amberved@gmail.com> writes:

 Amber> I am new to buildroot (and linux too). I used build root to create
 Amber> toolchain, kernel and rootfs already.

 Amber> But, I am getting the following error while trying to build a uboot
 Amber> image using buildroot for PowerPC.

 Amber> /usr/bin/make -j1 -C
 Amber> /home/xxx/Downloads/buildroot-2010.02/output/build/u-boot-2009.11	\
 Amber> 		y_config
 Amber> make[1]: Entering directory
 Amber> `/home/xxx/Downloads/buildroot-2010.02/output/build/u-boot-2009.11'
 Amber> make[1]: *** No rule to make target `y_config'.  Stop.
 Amber> make[1]: Leaving directory
 Amber> `/home/xxx/Downloads/buildroot-2010.02/output/build/u-boot-2009.11'
 Amber> make: *** [/home/xxx/Downloads/buildroot-2010.02/output/build/u-boot-2009.11/.configured]
 Amber> Error 2

 Amber> I don't see any y_config file in the u-boot-2009.11 folder. Can
 Amber> someone please advice?

You have presumably set BR2_TARGET_UBOOT_BOARDNAME (the u-boot
configuration to use) to "y"

-- 
Bye, Peter Korsgaard
