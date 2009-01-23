From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 23 Jan 2009 13:54:00 +0100
Subject: [Buildroot] svn
	commit:	trunk/buildroot/target/u-boot/2009.01-rc3
In-Reply-To: <87k58mmlgt.fsf@macbook.be.48ers.dk>
References: <20090122073913.5C9CE765E9@busybox.osuosl.org>
	<87zlhjogcu.fsf@macbook.be.48ers.dk>
	<1232649458.5311.6.camel@elrond.atmel.com>
	<87k58mmlgt.fsf@macbook.be.48ers.dk>
Message-ID: <1232715240.5311.52.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-01-23 klockan 10:16 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
>  >> I don't see this either in U-Boot git or as a patch to the mailing
>  >> list.
> 
>  Ulf> It is in the u-boot-avr32 git.
>  Ulf> I pointed it out to Haavard, so he has asked Wolfgang
>  Ulf> to pull this patch, but it is too late for 2009.01
> 
> So 2009.01 is broken on all avr32? Seems like someone forgot to do
> tests.

Yes, Got the fix from the u-boot AVR32 git but that
never got pulled in time.


> I see that your patch is not the same as Haavard sent to wdenx,
> perhaps update?
> 

It is probably doing the same thing, but I'll check

>  >> 2009.01 is furthermore released, so -rcX should imho go.
>  >> 
> 
>  Ulf> I am testing this very thing right now, so
>  Ulf> 2009.01-rc3 will go, and 2009.01
>  Ulf> will be enabled, and the patch will be moved 
>  Ulf> to the correct directory.
> 
> I already did that yesterday.
> 

Saw that after sending the mail.
/Ulf
