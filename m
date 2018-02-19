From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Date: Mon, 19 Feb 2018 13:45:00 -0600
Subject: [Buildroot] Read only rootfs with writable (aufs) overlay
In-Reply-To: <5a8b2633.54afdf0a.cb7dd.554c@mx.google.com>
References: <5a8b2633.54afdf0a.cb7dd.554c@mx.google.com>
Message-ID: <CAKGmAFr1umC8Vgs_oRk9FLufG3agqwStPyOR4joJFRHeW_70Dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alex,


On Mon, Feb 19, 2018 at 1:32 PM, Alex Hildebrand
<alexander.hildebrand@googlemail.com> wrote:
> Hi there,
>
> Does anyone of you have experience with a rootfs with a writable (aufs)
> overlay?
>
> I managed to compile aufs and mount a folder combining the read only rootfs
> with a read write data overlay. How to switch the rootfs to this mount
> point? Tried to move the mount point to this folder in the inittab, but this
> fails with "Too many levels of symbolic links"
>

I'm not sure I understand the question fully. Are you saying you want
the entire filesystem to be in the aufs? Why not use a RW filesystem
instead?

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 


Bryce Ferguson
Software Engineer
Airborne Information Solutions \ RC Linux Platform

400 Collins Rd NE Cedar Rapids, Iowa 52498

Bryce.Ferguson at rockwellcollins.com
