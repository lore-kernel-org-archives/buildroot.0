From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 29 Jan 2009 16:30:36 +0100
Subject: [Buildroot] So what do we do about all the unmaintained boards?
References: <1233182567.4147.16.camel@elrond.atmel.com>
	<87vdryrw65.fsf@macbook.be.48ers.dk>
Message-ID: <F9E9391EAD414FA2BA0378C38D349B86@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Ulf> VENDOR BOARD KERNEL
> Ulf> AMD Dbu1500 2.6.19.1
> Ulf> ARM AT91SAM9260 2.6.24 REMOVE?
> Ulf> ARMLTD Integrator926 2.6.22.9
> Ulf> Atmel Plenty All are or will soon be 2.6.28
> Ulf> Hitachi MS7206SE01 No kernel config
> Ulf> jp q5 2.4.26/29/32 REMOVE?
> Ulf> KWIKBYTE kb9202 2.6.24
> Ulf> mips malta 2.6.21.5
> Ulf> Sharp LNode80 2.4.26 REMOVE?
> Ulf> Soekris net4521/4801 2.4.29 REMOVE?
> Ulf> Valka v100sc2 No kernel config
> Ulf> Via epia-mii 2.6.11.5 REMOVE?
> Ulf> x86 i386 2.6.21.5
> 
> Ulf> The reason for removing the ARM directory, is that it does not make
> Ulf> any sense to do a "generic ARM".
> 
> I have been wanting to get rid of (atleast all the really ancient)
> boards for some time, I don't remember ever seeing any updates to
> them.
> 
> Either we mark them as DEPRECATED and remove them after the release,
> or we do it now.
> 
> -- 
> Bye, Peter Korsgaard
>

I suggest we remove the boards with 2.4 kernel only today
but we should have one board per architecture we want to support.

There is no PowerPC board support at the moment. 
Can you fix since you seem to be working on this?

The BOARD_NAME, BOARD_PATH really belong
in a target/device/<subdir> directory and not in the <buildroot>/project.

Best Regards
Ulf Samuelsson
