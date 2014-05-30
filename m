From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 30 May 2014 14:57:19 -0500
Subject: [Buildroot] buildroot-2014.05-rc3 report on Microblazeel
 Spartan 6 LX45 little endian uartlite and ethernetlite AXI hardware design
In-Reply-To: <CAPALihMP2UAY_VyxhX84Y64hb1NEWA+M9uFziw6gtmZtOi3kHw@mail.gmail.com>
References: <CAPALihMP2UAY_VyxhX84Y64hb1NEWA+M9uFziw6gtmZtOi3kHw@mail.gmail.com>
Message-ID: <CAEBucnBXiP6bEHVWgW8_Y-BAqE4kQjrMyMBg7w=v2kHTn00Y4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

William,

On May 30, 2014 10:58 AM, "William Welch" <bvwelch@gmail.com> wrote:
>
> Greetings,
>
> First congratulations and thank you for all the hard work!
>
> The internal buildroot toolchain for microblazeel works fine. -- the
system boots up into the shell prompt.  Previously it had not worked on my
Spartan 6, even though it was working on QEMU.
>
> The old 'Xilinx' toolchain also works fine, as expected.
>
> However, the 'MUSL' toolchain does not work -- apparently, buildroot
quietly installs a 'big endian' toolchain, even though I selected
microblazeel AXI.   I am basing this on the output of 'readelf' on the
kernel image and the busybox image -- both say 'big endian'.  When I tried
to boot anyway, I get no console output.

That's unfortunate.  Can you file a bug at bugs.buildroot.org with this
information?

>
> Since the internal buildroot toolchain is working now, I personally have
no need for the MUSL toolchain, but I am willing to re-test if others are
interested.

The more testers the better. I have an older xupv5 that I have been testing
big endian builds with.

It would be great if an article could be added to the xilinx wiki about how
to build and run buildroot on microblaze based platforms and also zynq (I
can do this one.)

If you're up for it. I'd be happy to collaborate.

>
> Thank you all,
>
> William
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140530/f4cff594/attachment.html>
