From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 28 Jul 2011 09:08:19 +0200
Subject: [Buildroot] [PATCH 3/3] usbmount fixes
In-Reply-To: <87zkjzsdme.fsf@macbook.be.48ers.dk>
References: <4E298D06.4050107@visionsystems.de>
 <4E298E70.50200@visionsystems.de>
 <4E298ED8.5000901@visionsystems.de> <4E29900B.6040502@visionsystems.de>
 <87zkjzsdme.fsf@macbook.be.48ers.dk>
Message-ID: <CAGm1_ks6+ust-8O4wg0CHuWMphEwkxEDCECXKeprcupYxtkeKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 27, 2011 at 9:54 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:
>
> ?Yegor> - create mounting points
> ?Yegor> - fix dependencies
> ?Yegor> - fix udev rules
> ?Yegor> - fix fs type detection
>
> Thanks, committed with some fixes (see below).
........
> Please provide a proper description of what patches do in the future.

1. fix file system type detection due to multiple entries with keyword
TYPE (already submitted)
2. automatic mounting points generation. Patch exists
(http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=361693), but has to
be adapted to the latest usbmount version
3. udev rules: SUBSYSTEMS=="usb" trigger is not working, after
searching the mailingslist I found some links, as suggestion how to
fix/substitue usbmount:
http://lists.busybox.net/pipermail/buildroot/2011-April/042455.html

It would be great, if we could fix all these issues before next
usbmount release.

Yegor
