From: Dinesh Guleria <din.gulu.er@gmail.com>
Date: Tue, 8 Sep 2015 14:26:31 +0530
Subject: [Buildroot] Right board to use -- buildroot begniers
In-Reply-To: <55EE8B90.9060708@mind.be>
References: <CAKpDV8sGQrmePsmbhrQo0YMGTLLTZb4Rsq90W3Y4nfMZTrcS+A@mail.gmail.com>
 <55EDE7A6.4060902@mind.be>
 <CAKpDV8udG2fRi8RWJbb=5nPNJ3SnYUE6dsPPmD11vnwUFzLL1A@mail.gmail.com>
 <55EE8B90.9060708@mind.be>
Message-ID: <CAKpDV8uJiT88YYY2gxNohTmQoP2toaFpWFjDSGTSaG2kENaPCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So i will go for atmel_sama5d3_xplained .
http://www.element14.com/community/docs/DOC-38394/l/evaluation-kit-for-at91sam9g45

>> I have no idea, but it is fully supported by Buildroot, both for booting
from
SD card and booting from flash.

With seggers j- link can i flash uboot to the Nand flash of this board ?

Regards,
Katoch
On 8 Sep 2015 12:48, "Arnout Vandecappelle" <arnout@mind.be> wrote:

>  Hi Dinesh,
>
>  [Please don't top-post]
>
> On 08-09-15 04:13, Dinesh Guleria wrote:
> > Thanks Arnout, for your reply.
> >
> > This one is quiet expensive :--
> >
> http://www.element14.com/community/docs/DOC-38394/l/evaluation-kit-for-at91sam9g45
>
>  Ah yes I forgot that - I got mine for free :-)
>
>  Check out the linuxgizmos article [1] for a nice overview of low-cost
> boards.
> Some of them have a buildroot defconfig. If you take one which doesn't,
> you can
> develop it yourself and contribute :-)
>
>
> > It seems to be good bet for beginners  as it is low cost, what do you
> say ?
> >
> http://www.element14.com/community/docs/DOC-65651?CMP=KNC-PS-G-APAC-GEN-MAN
>
>  That's the atmel_sama5d3_xplained I mentioned. Wow, it is still relatively
> expensive...
>
> > Does it comes with uboot installed ?
>
>  I have no idea, but it is fully supported by Buildroot, both for booting
> from
> SD card and booting from flash.
>
>
> > Does this buildroot support SAMA5D3 & board in above link ?
>
>  Yes.
>
>
> > http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRoot
>
>  Well, the linux4sam fork is relatively old. In addition, there are some
> changes
> in it that are incorrect. So I'd stick to upstream buildroot :-)
>
>
>  Regards,
>  Arnout
>
> [1]
> http://linuxgizmos.com/ringing-in-2015-with-40-linux-friendly-hacker-sbcs/
>
> >
> > Please suggest.
> >
> > Regards,
> > Dinesh
> >
> [snip]
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150908/c20f5629/attachment.html>
