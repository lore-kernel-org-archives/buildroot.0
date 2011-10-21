From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Oct 2011 17:25:49 +0200
Subject: [Buildroot] [RFC] Slides "Using Buildroot for real projects"
In-Reply-To: <4EA182BA.2050400@carallon.com>
References: <20111017184718.71afc290@skate> <20111021154303.43f98ccd@skate>
 <4EA182BA.2050400@carallon.com>
Message-ID: <20111021172549.2611d3a7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 21 Oct 2011 15:33:30 +0100,
Will Wagner <will_wagner@carallon.com> a ?crit :

> Couple of minor points on the English (Still very impressive from a
> non native speaker)

Thanks!

> p8: "Buildroot starts by the toolchain" should be "starts with the"

Funny, because Will Moore told me to do the exact opposite (in a review
he sent me privately yesterday):

"""
Slide 7, "Buildroot starts with the toolchain" not "Buildroot starts by
the toolchain".
"""

Now I understand why I fail to further improve my english. It's because
it's a fuzzy logic language ! :-)

> p16 "Any other project specific file" should perhaps be "files"

I have changed to "All other project specific files", maybe it's more
correct?

> p17: "kernel and bootloaders often" shouldn't it be singular
> bootloader?

Not necessarily. On AT91 platforms, you have two bootloaders:
at91boostrap and u-boot, and I both patch them and build them within
Buildroot.

> p17: "drawback is that Buildroot does directly" unless I
> misunderstand the use case, don't you mean doesn't?

Fixed, thanks, that was a major typo.

> p21: "I don't recommend this, ..." I'm not sure if you are not 
> recommending changing the skeleton or using a script to modify it

Ok, I tried to clarify it:

"""I don't recommend this solution as it consists in duplicating the
default skeleton, which would prevent from taking advantage of future
improvements of the default skeleton."""

> p30: "finds automagically" should be "automagically finds"

Fixed.

> p37: "assignements" should be assignments

Fixed.

> p37: "allows to tell" should be "allows you to tell"

Fixed.
 
> One thing I'd love to get written up somewhere is best practice for
> NFS mounting a filesystem image, but I realise this may not be
> relevant to your talk.

Ah, good point. I'll include a slide about this.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
