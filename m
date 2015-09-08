From: Dinesh Guleria <din.gulu.er@gmail.com>
Date: Tue, 8 Sep 2015 07:43:30 +0530
Subject: [Buildroot] Right board to use -- buildroot begniers
In-Reply-To: <55EDE7A6.4060902@mind.be>
References: <CAKpDV8sGQrmePsmbhrQo0YMGTLLTZb4Rsq90W3Y4nfMZTrcS+A@mail.gmail.com>
 <55EDE7A6.4060902@mind.be>
Message-ID: <CAKpDV8udG2fRi8RWJbb=5nPNJ3SnYUE6dsPPmD11vnwUFzLL1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Arnout, for your reply.

This one is quiet expensive :--
http://www.element14.com/community/docs/DOC-38394/l/evaluation-kit-for-at91sam9g45


It seems to be good bet for beginners  as it is low cost, what do you say ?
http://www.element14.com/community/docs/DOC-65651?CMP=KNC-PS-G-APAC-GEN-MAN
Does it comes with uboot installed ?


Does this buildroot support SAMA5D3 & board in above link ?
http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRoot

Please suggest.

Regards,
Dinesh

On Tue, Sep 8, 2015 at 1:08 AM, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 07-09-15 14:36, Dinesh Guleria wrote:
> > Hi,
> >
> > I am new to buildroot & looking forward to try my hands on creating :--:
> > linux Kernel
> > Rfile system
> > Uboot
> >
> > For embedded system.
> >
> > I want to know from your experience which board shall i go for :--
> > Raspberrypi b version
>
>  Problem with Raspberry Pi is that it's rather difficult to understand the
> SoC,
> and its software support is pretty unusual (i.e., far from upstream).
>
> > AT91SAM9260
>
>  That's a SoC, not a board. There are a bunch of devboards with the
> processor,
> but can you still get them? Probably the at91sam9g45m10ek or
> atmel_sama5d3_xplained are a better fit.
>
>  The MIPS creator CI20 is also nice. But that's not ARM, of course.
>
> > What i think as something is already existing in buildroot & linux
> kernel for
> > support of these two boards, so its good for freshers to learn all these
> process
> > on these boards.
> >
> > Means 32 bit controller whose specs are clearly define so that one can
> try hand
> > on creating/configuring memory drivers for sdram or Nand , creating
> device
> > drivers , configuring uboot & architecture specific files, porting linux
> &
> > rfsystem & uboot made by yourself ?
>
>  These things are _not_ something I would advise for an absolute beginner.
> Experienced consultants like me plan two to four weeks of full-time work
> for
> porting everything from a devboard to a custom board. So starting from
> scratch
> is definitely an ambitious goal.
>
> Start out with just building and installing the boot loader, kernel and
> rootfs
> for which support already exists. Then maybe you can bump the U-Boot and
> kernel
> version (and contribute patches, of course).
>
>  Anyway, any devboard you can get probably already has U-Boot and kernel
> support, otherwise they wouldn't be able to sell it. So unless you're
> developing
> a custom board, re-implementing those from scratch is just duplicate work.
>
>  Regards,
>  Arnout
>
> >
> > Regards,
> > Katoch
> >
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150908/f0718fc4/attachment.html>
