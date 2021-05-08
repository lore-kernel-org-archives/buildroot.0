From: Drew Fustini <drew@beagleboard.org>
Date: Sat, 8 May 2021 12:54:55 -0700
Subject: [Buildroot] [PATCH v3 5/7] boot/beaglev-ddrinit: new package
In-Reply-To: <20210508182048.GJ2137340@scaer>
References: <20210504205139.1055360-1-thomas.petazzoni@bootlin.com>
 <20210504205139.1055360-6-thomas.petazzoni@bootlin.com>
 <20210507220401.GE2137340@scaer>
 <CAPgEAj6=TkK79B32P-JRL+T1KPYQd1djsVbYc2ah3zx7xno6cg@mail.gmail.com>
 <20210508073718.GI2137340@scaer>
 <CAPgEAj4C5tjW_Wne18cWqcL2ub7wAZ61UFBr=non5U23sXS97A@mail.gmail.com>
 <CAMKF1srq7i5qzkOhEcEPsc7n-t4sKaT2m961xMH68kvLzeUUKA@mail.gmail.com>
 <20210508182048.GJ2137340@scaer>
Message-ID: <CAPgEAj551UyFRp9PtWVu_pDD+5mReskhCJ4HR8NzipaUMGgXyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 8, 2021 at 11:21 AM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:
>
> Khem, All,
>
> On 2021-05-08 09:01 -0700, Khem Raj spake thusly:
> > On Sat, May 8, 2021 at 12:48 AM Drew Fustini <drew@beagleboard.org>
wrote:
> > > On Sat, May 8, 2021 at 12:37 AM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:
> > > > On 2021-05-07 16:30 -0700, Drew Fustini spake thusly:
> > > > > On Fri, May 7, 2021, 15:04 Yann E. MORIN < [1]
yann.morin.1998@free.fr> wrote:
> > > > >   The upstream package name is beaglev-ddrlnit, yes, with an 'l'
instead
> > > > >   of an 'i'. [...]
> > > > > Would it be helpful if I get StarFive to fix the typo and rename
it to ddrinit?
> > > > It is not so important that the upstream name gets fixed; [...]
> > Is there general consensus on what it should be called ?
> > I am happy to remove references to SOC name, if we have clear naming
> > convention and strategy to also name future iterations of beagleV based
on RISCV
>
> Khem: note that we were speaking about a typo in one of the upstream
> repositories: beaglev-ddrlnit (dee-dee-are-ell-hen-eye-tee) instead of
> ddrinit (dee-dee-are-eye-hen-eye-tee).
>
> But Drew said this should be a short-term repository, which will
> eventually get phased out in favour of uboot spl.

Bin Meng is trying to get u-boot SPL working on the StarFive JH7100 SoC and
that could replace ddrinit.  Although I am not sure exactly when that goal
will be accomplished.

StarFive will fix the 'l' typo in the ddrinit repo if I ask them to, but
they probably would not get that done until Monday or Tuesday.  It seemed
like from your previous email it would be best to avoid that churn of
renaming the repository as the patch already went into buildroot.

I am happy to do whatever is best for buildroot and also Khem's meta-riscv
OE layer.

Thank you,
Drew
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210508/f4ea970a/attachment.html>
