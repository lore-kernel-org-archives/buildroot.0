From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 7 Jan 2009 12:50:05 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <1231326832.32308.320.camel@elrond.atmel.com>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<200901070409.42558.markus.heidelberg@web.de>
	<1231326832.32308.320.camel@elrond.atmel.com>
Message-ID: <200901071250.05379.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson, 07.01.2009:
> ons 2009-01-07 klockan 04:09 +0100 skrev Markus Heidelberg:
> > CC-ing Hans-Christian Egtvedt
> > 
> > Peter Korsgaard, 06.01.2009:
> > > >>From talking with HcE on IRC, it seems like the Atmel fork of
> > > buildroot is the recommended solution for avr32 users anyway.
> > 
> > I wonder, why many of the patches are also included in uClibc's
> > Buildroot then. Don't the avr32 users use Atmel's Buildroot? I'm an
> > avr32 user myself and only use Atmel's Buildroot for development. One
> > drawback is that I'm not up-to-date with uClibc, because these changes
> > are only seldom merged into the Atmel branches, only short before their
> > release candidates. So I end up working on another file base, which
> > doesn't ease integration of changes into uClibc's Buildroot. I could
> > merge myself, a branch "upstream" is available and is updated often, but
> > that doesn't make sense somehow. I haven't yet tried it, so I don't know
> > whether it will cause some hassle or not.
> 
> I think it is desirable to have more people contributing
> with testing and patches.

Then what's the purpose of buildroot-avr32, when you seem to say
uclibc-buildroot should be used for AVR32 development? A personal
playground for HCE and cherry-picking for you into uclibc-buildroot?
Surely not. This repository is well-tested for all of Atmel's AVR32
boards for every release and even during the release candidates.

> > I haven't yet asked why this merge happens so rarely. Maybe lack of
> > time? OK, I'm already getting avr32-buildroot specific, but I think
> > updating the "devel" branch would be nice, even without testing
> > anything.  Currently the three branches "devel", "master" and
> > "atmel-2.3" are the same, pointing to the latest release.
> 
> Lack of time is the answer.
> The way it works is that HCE is doing the Atmel Branch
> and I am working on the main svn (even if HCE is providing
> patches from time to time).
> 
> >>From time to time I am taking HCEs additions
> from the Atmel branch and update the devel branch,
> but I did really not have time to do anything
> during most of the autumn.

What is the devel branch you mentioned? Above I refered to the devel
branch from HCE, I don't think you work on his devel branch, I haven't
seen a commit from you there. Do you mean uclibc-buildroot?

See my comment above. Why picking commits from HCE, making his
repository more valueless, because everything is also in
uclibc-buildroot and at the same time risk breaking it or prevent
updating packages (mplayer for example)?

Markus
