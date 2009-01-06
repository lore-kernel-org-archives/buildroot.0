From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Jan 2009 16:26:17 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/u-boot/2009.01-rc1
In-Reply-To: <1231255007.32308.107.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Tue\, 06 Jan 2009 16\:16\:47 +0100")
References: <20090103000614.1DC5F769FA@busybox.osuosl.org>
	<87mye4qz4d.fsf@macbook.be.48ers.dk>
	<1231255007.32308.107.camel@elrond.atmel.com>
Message-ID: <874p0cpiau.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> I discovered I made a mistake and checked in the
 Ulf> 1.3.4 patch so it will be updated later today

 Ulf> The original is part of the atmel 1.3.4 patch freom www.linux4sam.org

Why is that not in mainline U-Boot?

 Ulf> ?There will be some other fixes due to the CFG->CONFIG(_SYS)

Yes, that's what I mentioned last week. This again will complicate
stuff when we're supporting 3+ U-Boot versions.

 Ulf> I have tested the new patches to build for all possible AT91 targets
 Ulf> in buildroot as well as for a PowerPC target.

 Ulf> Generally on patches to u-boot:
 Ulf> The AT91 team got zero response from the U-Boot during 2003-2005
 Ulf> so they dropped all attempts to submit new stuff.

They just have to try again like the rest of us, or maybe ping wdenx
on irc.

I know he can be a pain, but that's his job.

 Ulf> After it was decided to split the responsibilities up
 Ulf> to several people, the submission process has improved a lot, 
 Ulf> so the AT91 team started to be interested again last year.
 Ulf> The board support for AT91 processors has improved.
 Ulf> The AT91RM9200 has less priority on support from the product line
 Ulf> and has therefore not been submitted, even if patches
 Ulf> has been available for a long time.

 Ulf> Currently the merge window is closed, but I expect
 Ulf> to submit the board support patches and some of the
 Ulf> new commands end of January.

Ok, please do so. There's afaik nothing stopping you from submitting
patches now so they can be integrated by the arm/at91 subtree
maintainer.

 Ulf> The factory default command relies heavily on
 Ulf> the buildroot configuration, so it may make less
 Ulf> sense to include that in the main u-boot trunk.

What's the point of it? Is it any different than simply erasing the
environment and resetting the board?

I don't like us carrying feature patches in buildroot.

-- 
Bye, Peter Korsgaard
