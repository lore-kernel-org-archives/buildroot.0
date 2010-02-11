From: Andreas Kuehn <Andreas.Kuehn@gin.de>
Date: Thu, 11 Feb 2010 13:54:42 +0100
Subject: [Buildroot] buildroot-2009.11 doesn't build kernel modules
Message-ID: <4B73FE12.6000700@gin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All!


I trying to build an at91sam9263 based system. At earlier versions a
full compilation run on buildroot creates all pieces including *.ko.
The current buildroot does not.

I tried recompiling the kernel and of course make linux26 but no effect.
Running make linux26-modules created the following output:

$ make linux26-modules
cp -dpf
/usr/cross/GL4200/buildroot-2009.11/output/build/u-boot-2009.06/tools/mkimage
/usr/cross/GL4200/buildroot-2009.11/output/staging/usr/bin/


Did I miss something?

Thanks in advance,
	akuehn
