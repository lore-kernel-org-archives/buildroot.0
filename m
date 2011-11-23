From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 23 Nov 2011 18:06:52 +0100
Subject: [Buildroot] Adding Microblaze support to Buildroot
In-Reply-To: <20111123164900.1e5a8a69@skate>
References: <4EBC554E.7050605@gmail.com>	<4EBC5656.2010103@gmail.com>	<4EBD18F1.6020804@relinux.de>	<4ECB62C8.6030301@relinux.de>	<87sjlgplif.fsf@macbook.be.48ers.dk>	<4ECCD481.4030707@relinux.de>	<20111123145448.5f5d15b9@skate>	<4ECD153B.3040801@relinux.de>
 <20111123164900.1e5a8a69@skate>
Message-ID: <4ECD282C.6030905@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 23.11.2011 16:49, schrieb Thomas Petazzoni:
> Le Wed, 23 Nov 2011 16:46:03 +0100,
> Stephan Hoffmann <sho@relinux.de> a ?crit :
>
>> In fact, my Microblaze is with MMU since Xilinx only supports linux with
>> mmu.
> Ah, ok.
>
>> I'll send these in one patch if that's O.K. There ia also a new kernel
>> defconfig, because the defconfig supplied with the kernel does not work
>> for my configuration.
> Ok.
>
>>>  * It would be even better if another patch could add a defconfig for
>>>    the Microblaze Qemu emulation, so that those not having a
>>>    Microblaze board can test.
>> That's a real good idea, I'll work on this later.
> Do you know if Qemu emulates the Microblaze variants that have a MMU ?
> It would be good to have samples for both cases.
Qemu should support both with and without mmu. Unfortunatelly, I am not
very experienced in qemu, so it might take some time to fiugure out how
it goes. A first try gives me a error on an address that is neither in
the physical nor in the logical address space of my kernel.

Regards

Stephan
> Regards,
>
> Thomas


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
