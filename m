From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 25 Mar 2008 09:55:50 +0100
Subject: [Buildroot] avr32 patches vs. x86 breakage
References: <1206079232.2562.60.camel@nigel-x60><87k5jw34gp.fsf@macbook.be.48ers.dk>
	<20080321085200.GB8894@mx.loc><1206090774.2562.82.camel@nigel-x60>
	<874pb01l1i.fsf@macbook.be.48ers.dk>
Message-ID: <049b01c88e5d$54dd4870$070514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi,
> 
> >> They should fix their arch and you should not add kludge to work around
> >> such bugs, imo.
> 
> Nigel> In an ideal situation yes .... but buildroot is an opensource
> Nigel> project with no time constraints imposed on its contributors.
> 
> But that doesn't mean that contributors don't care.
> 
> Nigel> If I contributed a patch to add an arch to GCC, and it broke 2
> Nigel> months down the line when people began to use it, are you just
> Nigel> going to remove it out of buildroot until it gets fixed? What
> Nigel> happens if it broke support for everything except its own
> Nigel> arch?  What happens if there were thousands of users of it,
> Nigel> more than any other arch?
> 
> If you would not be ready to support your work and no one else would
> step up to do it (or if I could/would myself) - Then yes. No one gains
> by stuff just sitting in the tree bitrotting.
> 
> Nigel> In this case its the AVR32 support which breaks x86 .... I'm sure there
> Nigel> are more users of AVR32 than x86. 1) its impractical to remove AVR32
> Nigel> support until its fixed, we don't know how long it will take  2) its
> Nigel> senseless to drop support for x86 because an AVR32 patch breaks it.


The AVR32 is supported in two ways today.
1) Through downloading the prepatched source
2) Through normal methods with patches in the toolchain/gcc/gcc-x.y.z

I doubt that we need both.
It is VERY practical to remove the AVR32 support from the toolchain directory.


Best Regards
Ulf Samuelsson
