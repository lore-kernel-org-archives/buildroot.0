From: Will Moore <will.moore@beraninstruments.com>
Date: Wed, 8 Feb 2012 11:24:50 -0000
Subject: [Buildroot] Reviewing the Buildroot ELC presentation slides
In-Reply-To: <20120207224611.0d9e45d5@skate>
References: <20120207224611.0d9e45d5@skate>
Message-ID: <28C7A4673D674D4D8CF24862E3A38E14@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Some typo etc suggestions:

Slide 2, "... and Android system development trainings, ...", trainings ->
training
Slide 4, "Those technologies are familiar ...", Those -> These
Slide 4, "... composed only of Busybox, ...", Busybox -> BusyBox or busybox (I
believe), this applies in other slides too.
Slide 7, "Increase of the number ...", of -> in
Slide 14, "... which allows to use existing ..." -> "... which allows use of
existing ..."
Slide 14, "Using this backend allows to completely skip the toolchain build
time." -> "Using an external toolchain removes the toolchain build time."
Slide 14, "This allows to benefit from all Crosstool-NG advantages..." -> "This
allows Buildroot to benefit from all Crosstool-NG's advantages ..."
Slide 15, "Allows to define ..." -> "Allows you to define ..."
Slide 15, "Some misc. other parameters" does not really add anything useful, can
you be more specific?
Slide 19, "Allows to build ..." -> "Allows you to build ..."
Slide 19, Capitalisation consistency: syslinux -> Syslinux
Slide 25, talking about an "internal backend" seems a little clumsy, perhaps
"internal toolchain" would be better.
Slide 29, "... allow to restart ..." -> "... allow you to restart ..."
Slide 31, "boot, bootloaders recipes" -> "boot, bootloader recipes"

To add my 2p to the discussion on "a" versus "an", I agree with Thomas De
Schampheleire and would use a uClibc (you-see-lib-see) and an SDK (ess-dee-kay).

Regards,


Will

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On
> Behalf Of Thomas Petazzoni
> Sent: 07 February 2012 21:46
> To: buildroot at uclibc.org
> Subject: [Buildroot] Reviewing the Buildroot ELC presentation slides
> 
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
