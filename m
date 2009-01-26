From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 26 Jan 2009 07:05:45 +0100
Subject: [Buildroot] How handle broken or partly broken packages in the
 distribution
In-Reply-To: <d6cda7730901230912g6851880fua908aad10de0192@mail.gmail.com>
References: <1232651253.5311.19.camel@elrond.atmel.com>
	<20090123095712.6878553d@hcegtvedt>
	<d6cda7730901230912g6851880fua908aad10de0192@mail.gmail.com>
Message-ID: <20090126070545.1288702e@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 23 Jan 2009 15:12:56 -0200
Thiago A. Corr?a <thiago.correa@gmail.com> wrote:

> On Fri, Jan 23, 2009 at 6:57 AM, Hans-Christian Egtvedt
> <hans-christian.egtvedt@atmel.com> wrote:
> >> so they are not selectable for AVR32 users
> >>
> >
> > To make it harder to fix the problem with the packages?
> >
> > It might also be a result from the development environment on your
> > build machine, like the recent alsa-utils errors somebody else
> > found on opensuse, which I have not triggered in my Ubuntu system.
> >
> 
> I agree with HCE. Making packages unselectable or invisible is not a
> good approach.
> I think it would be very sufficient to just document it on the help
> string and take it out of the defconfig for that arch.
> 

Or just have a Wiki with a list of all packages and which archs they
work and do not work on. Users should also see/find this table fast, so
they easily know what is expected to work and what is not.

It might even encourage users to start fiddling with packages not
working.

-- 
Best regards,
Hans-Christian Egtvedt
