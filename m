From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Mon, 03 Nov 2008 12:26:11 +0200
Subject: [Buildroot] kernel size
In-Reply-To: <20081103111506.1005c517@surf>
References: <000001c93d37$d5a696d0$80f3c470$@be> <20081103111506.1005c517@surf>
Message-ID: <490ED1C3.9040109@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please search mailing list archive,
There was similar problem.
The issue was in binutils and linux-kernel version incompatibility.

Regards,
Ivan

> Le Sun, 2 Nov 2008 23:10:37 +0100,
> "steve caster" <steve@c2root.be> a ?crit :
> 
>> I am trying to build a kernel with buildroot and are using a separate
>> .config file which I made myself. The kernel is working, yet is about
>> 90MB is size. This is unbelievable as I nearly don't have any
>> modules. What could make is so big?
> 
> By chance, aren't you using an initramfs, included in the kernel, which
> contains your root filesystem ? That could easily explain the large
> size of your kernel image.
> 
> This is something that is done automatically by Buildroot if you
> enabled BR2_TARGET_ROOTFS_INITRAMFS.
> 
> Sincerly,
> 
> Thomas
