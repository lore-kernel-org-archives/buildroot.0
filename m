From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 23:10:48 +0200
Subject: [Buildroot] How can I boot my custom system?
In-Reply-To: <AANLkTintTd3-7T8ODcFnL470RnkKa8RebjiQHpGJZDKj@mail.gmail.com>
References: <AANLkTintTd3-7T8ODcFnL470RnkKa8RebjiQHpGJZDKj@mail.gmail.com>
Message-ID: <20100912231048.22c246eb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Sep 2010 14:18:07 +0800
icemanpro <icemanpro@gmail.com> wrote:

>  I download buildroot on Fedora 13 and
> 
> 1) tar -xvzf buildroot-2010.08.tar.gz
> 
> 2) cd buildroot-2010.08
> 
> 3) make menuconfig
> - no changes at all made to default options
> - save on exit
> 
> 4) make --> OK. rootfs.ext2 created in output/images
> 
> 
> Now,it this finish? How to boot my custom system?

It depends. You can boot it on real hardware, you can boot in a virtual
machine emulator such as Qemu.

However, by default, Buildroot does not configure and build a kernel
for you, so you'll have to tell it to build a kernel for the hardware
you are targeting.

Without more precisions from you, it's hard to give a detailed set of
steps to follow.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
