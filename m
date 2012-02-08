From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 8 Feb 2012 08:02:23 +0100
Subject: [Buildroot] Reviewing the Buildroot ELC presentation slides
In-Reply-To: <20120207224611.0d9e45d5@skate>
References: <20120207224611.0d9e45d5@skate>
Message-ID: <CAAXf6LUubuiS01Xqv+h+vMBSCMgH9FEfbkEAP2v4bdWQeXAynA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Feb 7, 2012 at 10:46 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> I have posted at http://free-electrons.com/~thomas/pub/buildroot.pdf
> the current version of the slides I intend to present next week at the
> ELC in San Francisco.
>
> For the record, the conference abstract is:
> https://events.linuxfoundation.org/events/embedded-linux-conference/petazzoni
>
> I would be very interested in your comments and review, both on details
> (typos, mistakes) but also on the overall contents of the slides.

slide 4: Complete rebuild -> rebuilds

slide 9: I find it a bit strange that the toolchain block is at the
bottom, since it is the first thing to be produced. But maybe you
intentionally put it there as most people would care more about the
other blocks...

slide 13: a SDK -> I think this should be 'an SDK' as this is how you
pronounce it.

slide 14: on the internal toolchain you write 'the historic one': I
feel it could be interpreted negatively and not as a viable
alternative.
slide 14: an uClibc --> here I think it should be 'a uClibc' as you
pronounce as 'you-see-libc'.

slide 18: is9660 -> iso9660

slide 23: I'd put a semicolon instead of comma between the toolchain
and library example
slide 23: all reverse dependencies needs to be rebuilt -> need

slide 25: a few stamps files -> stamp

slide 29: there should be a space after 'make' in
make<foo>-reconfigure and make<foo>-rebuild

slide 30: choosen -> chosen


>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
