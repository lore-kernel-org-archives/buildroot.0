From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 06 Jan 2009 16:16:47 +0100
Subject: [Buildroot] svn
	commit:	trunk/buildroot/target/u-boot/2009.01-rc1
In-Reply-To: <87mye4qz4d.fsf@macbook.be.48ers.dk>
References: <20090103000614.1DC5F769FA@busybox.osuosl.org>
	<87mye4qz4d.fsf@macbook.be.48ers.dk>
Message-ID: <1231255007.32308.107.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-01-06 klockan 15:37 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-03 00:06:13 +0000 (Sat, 03 Jan 2009)
>  ulf> New Revision: 24658
> 

I discovered I made a mistake and checked in the
1.3.4 patch so it will be updated later today

The original is part of the atmel 1.3.4 patch freom www.linux4sam.org

?There will be some other fixes due to the CFG->CONFIG(_SYS)
I have tested the new patches to build for all possible AT91 targets
in buildroot as well as for a PowerPC target.

Generally on patches to u-boot:
The AT91 team got zero response from the U-Boot during 2003-2005
so they dropped all attempts to submit new stuff.
After it was decided to split the responsibilities up
to several people, the submission process has improved a lot, 
so the AT91 team started to be interested again last year.
The board support for AT91 processors has improved.
The AT91RM9200 has less priority on support from the product line
and has therefore not been submitted, even if patches
has been available for a long time.

Currently the merge window is closed, but I expect
to submit the board support patches and some of the
new commands end of January.

The factory default command relies heavily on
the buildroot configuration, so it may make less
sense to include that in the main u-boot trunk.


>  ulf> Log:
>  ulf> Add support for at91sam9g20 to U-Boot
> 
> What's the upstream status of this patch?
> 
