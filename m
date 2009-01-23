From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 23 Jan 2009 18:46:55 +0100
Subject: [Buildroot] How handle broken or partly broken packages in
	the	distribution
In-Reply-To: <d6cda7730901230912g6851880fua908aad10de0192@mail.gmail.com>
References: <1232651253.5311.19.camel@elrond.atmel.com>
	<20090123095712.6878553d@hcegtvedt>
	<d6cda7730901230912g6851880fua908aad10de0192@mail.gmail.com>
Message-ID: <1232732815.5311.88.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-01-23 klockan 15:12 -0200 skrev Thiago A. Corr?a:
> Ulf,
> 
> On Fri, Jan 23, 2009 at 6:57 AM, Hans-Christian Egtvedt
> <hans-christian.egtvedt@atmel.com> wrote:
> >> so they are not selectable for AVR32 users
> >>
> >
> > To make it harder to fix the problem with the packages?
> >
> > It might also be a result from the development environment on your
> > build machine, like the recent alsa-utils errors somebody else found on
> > opensuse, which I have not triggered in my Ubuntu system.
> >
> 
> I agree with HCE. Making packages unselectable or invisible is not a
> good approach.
> I think it would be very sufficient to just document it on the help
> string and take it out of the defconfig for that arch.

It is sufficient for experienced buildroot user,
but for people *starting* to use it, then they 
have to experiment and spend a lot of time 
trying to figure out what works and what does not work.

Why on earth do you want to enable a thing which NEVER will work?

If you want to update the package so it works,
then you can do that in the trunk which should not 
have these limitations turned on by default 

The distibution, on the other hand, should be easy to use
and should IMO protect users against wasting their time.

BR
Ulf Samuelsson

> Kind Regards,
>    Thiago A. Correa
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
