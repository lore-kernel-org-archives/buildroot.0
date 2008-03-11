From: Arnar Mar Sig <antab@valka.is>
Date: Tue, 11 Mar 2008 16:32:55 +0000
Subject: [Buildroot] svn commit:
	trunk/buildroot/package:editors	editors/vi
In-Reply-To: <87tzjeyyve.fsf@macbook.be.48ers.dk>
References: <ADB1372A-7CAA-41A5-A619-09A9DF0A0D0D@valka.is>
	<008b01c88027$780e44a0$040514ac@atmel.com>
	<4D6547F3-9672-4606-90EA-88630B3565E9@valka.is>
	<20080307235344.GA6144@cloud.net.au>
	<87zlt7bmdg.fsf@macbook.be.48ers.dk>
	<042e01c882d4$d82aa450$f1c4af0a@atmel.com>
	<87skyy2yav.fsf@macbook.be.48ers.dk>
	<007a01c882ec$717efea0$080514ac@atmel.com>
	<87pru21f8a.fsf@macbook.be.48ers.dk>
	<00aa01c882f4$1cfd90f0$080514ac@atmel.com>
	<871w6i1d1w.fsf@macbook.be.48ers.dk>
	<87wsoaz2h6.fsf@macbook.be.48ers.dk>
	<01a401c882fb$ca574be0$080514ac@atmel.com>
	<87tzjeyyve.fsf@macbook.be.48ers.dk>
Message-ID: <6929EAF0-47DA-4A45-9D32-9901B51D73F3@valka.is>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

And just to point out. This subdir structure is already used for the  
x11r7 packages, so why not keep the package/ structure constant and do  
this for the other package groups?

Arnar Mar Sig.

On Mar 10, 2008, at 10:53 PM, Peter Korsgaard wrote:

>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
>
> Hi,
>
> Peter> Then just do a find ..|xargs on those or use **/*.mk (if you  
> use a
> Peter> proper shell).
>>>
>
> Ulf> Yes, I can try to become an expert in shell programming, but
> Ulf> that is not on my top 100 list of things to do.
>
> A pity. BR is basically just a bunch of shell (and) make scripts ;)
>
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
