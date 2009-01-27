From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 27 Jan 2009 08:26:07 +0100
Subject: [Buildroot] Newbie question
In-Reply-To: <877i4h2pkq.fsf@macbook.be.48ers.dk>
References: <497EA507.6060505@iwtech.com.au>
	<20090127073152.0571b3ae@hcegtvedt>
	<877i4h2pkq.fsf@macbook.be.48ers.dk>
Message-ID: <1233041167.2298.138.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-01-27 klockan 08:08 +0100 skrev Peter Korsgaard:
> >>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:
> 
>  Hans-Christian> It is set for some targets in a Makefile in a sub
>  Hans-Christian> directory beneath target/devices/...
> 
>  Hans-Christian> Perhaps doing make BOARD_NAME=foobar works
> 
> It seems like we have a BR2_BOARD_NAME several places under
> target/device. That should probably be generalized and moved together
> with BR2_PROJECT.
> 

I agree with that.

BR
Ulf Samuelsson
