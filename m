From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2011 16:49:00 +0100
Subject: [Buildroot] Adding Microblaze support to Buildroot
In-Reply-To: <4ECD153B.3040801@relinux.de>
References: <4EBC554E.7050605@gmail.com> <4EBC5656.2010103@gmail.com>
 <4EBD18F1.6020804@relinux.de> <4ECB62C8.6030301@relinux.de>
 <87sjlgplif.fsf@macbook.be.48ers.dk> <4ECCD481.4030707@relinux.de>
 <20111123145448.5f5d15b9@skate> <4ECD153B.3040801@relinux.de>
Message-ID: <20111123164900.1e5a8a69@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 23 Nov 2011 16:46:03 +0100,
Stephan Hoffmann <sho@relinux.de> a ?crit :

> In fact, my Microblaze is with MMU since Xilinx only supports linux with
> mmu.

Ah, ok.

> I'll send these in one patch if that's O.K. There ia also a new kernel
> defconfig, because the defconfig supplied with the kernel does not work
> for my configuration.

Ok.

> >  * It would be even better if another patch could add a defconfig for
> >    the Microblaze Qemu emulation, so that those not having a
> >    Microblaze board can test.
> That's a real good idea, I'll work on this later.

Do you know if Qemu emulates the Microblaze variants that have a MMU ?
It would be good to have samples for both cases.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
