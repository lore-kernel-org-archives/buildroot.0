From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 2 Jan 2009 23:44:37 +0100
Subject: [Buildroot] svn
	commit:trunk/buildroot/target/device/Atmel/arch-avr32:kernel-patches-2.6.27.6
References: <20081220221939.4935476CEB@busybox.osuosl.org>
	<873agf8bnm.fsf@macbook.be.48ers.dk>
Message-ID: <FC51A1FF4A8643D8A0C0B2C0DA0C5E2D@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Subject: Re: [Buildroot] svn
commit:trunk/buildroot/target/device/Atmel/arch-avr32:kernel-patches-2.6.27.6


>>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
>
> ulf> Author: ulf
> ulf> Date: 2008-12-20 22:19:38 +0000 (Sat, 20 Dec 2008)
> ulf> New Revision: 24469
>
> ulf> Log:
> ulf> Add 2.6.27.7 patches for AVR32
>
> ulf> Added:
> ulf>
> trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.27.6/
>
> 2.6.27.6 or 2.6.27.7? Don't they apply to 2.6.27.10?
>
> Do we really need another ~800kb of avr specific patches? What about
> the older patches, can they go away?
>

The way it works now the patches are for a specific major/minor combination
but you select which kernel you want to use, and then you select which
patchset.
You can apply 2.6.27.6 on top of 2.6.27.10 if you want to,
but the name indicates which kernel it was intended for, and the
further away you go in terms of major/minor revisions
the higher the risk that the patch will not apply.

When I get time, I will implement downloading the patchset
instead of storing it in the svn.
Then the size will go down.

Best Regards
Ulf Samuelsson

> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
