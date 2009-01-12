From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 12 Jan 2009 11:33:45 +0100
Subject: [Buildroot] arch support
In-Reply-To: <20090112100054.25c79c4f@hcegtvedt>
References: <87ljtgj44z.fsf@macbook.be.48ers.dk>
	<20090112100054.25c79c4f@hcegtvedt>
Message-ID: <1231756425.6807.1.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-01-12 klockan 10:00 +0100 skrev Hans-Christian Egtvedt:
> On Mon, 12 Jan 2009 09:54:36 +0100
> Peter Korsgaard <jacmet@uclibc.org> wrote:
> 
> > Hi,
> > 
> > I just finished building the defconfigs for all the archs (uclibc
> > 0.9.30 / kernel headers 2.6.28 / binutils 2.19 / gcc 4.3.2 except for
> > avr32 which does it's own thing)
> > 
> 
> Nice, that is a good number of CPU cycles used ;)
> 
> > I'm using those versions instead of the defaults, as I would like to
> > change the defaults before the release.
> > 
> > Build logs are here: http://uclibc.org/~jacmet/br/
> > 
> > Status:
> > 
> > alpha: broken in libpthread
> > arm: ok
> > armeb: ok
> > avr32: ok (uclibc-0.9.29-avr32, binutils-2.17-avr32, gcc-4.2.2-avr32)
> 
> Hmm, why is not 0.9.30 default for AVR32? It compiles fine with the
> upstream release, no extra patches needed.

I am using uClibc-0.9.30 for all the builds I do now.

I have seen some issues in some packages which
seems to be compiler related, but not uClibc relateds.
Will come back on that.

BR
Ulf Samuelsson

> 
> <snipp>
> 
