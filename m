From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 23 Jul 2007 14:05:49 +0200
Subject: [Buildroot] _VER vs. _VERSION breakage
In-Reply-To: <20070723110417.GE7044@aon.at>
References: <20070715104024.GB4096@aon.at>
	<1184615647.18357.27.camel@elrond.sweden.atmel.com>
	<20070723095243.GC6597@aon.at> <0707231218440.1707@somehost>
	<20070723110417.GE7044@aon.at>
Message-ID: <1185192349.21840.0.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-07-23 klockan 13:04 +0200 skrev Bernhard Fischer:
> On Mon, Jul 23, 2007 at 12:22:41PM +0200, Cristian Ionescu-Idbohrn wrote:
> >On Mon, 23 Jul 2007, Bernhard Fischer wrote:
> >
> >> On Mon, Jul 16, 2007 at 09:54:06PM +0200, Ulf Samuelsson wrote:
> >> >s?n 2007-07-15 klockan 12:40 +0200 skrev Bernhard Fischer:
> >> >> Ulf,
> >> >>
> >> >> Your change to use _VERSION broke at least acpid. Please double-check
> >> >> that all packages that you touched in this patch still build fine and
> >> >> repair.
> >> >
> >> >Here is the result of trying to build most available packages
> >> >in buildroot for ARM. (I build for ARM generic (not using WCHAR)).
> >>
> >> I will revert that _VERSION vs. _VER patch since it breaks a couple of
> >> packages.
> >
> >Now this is IMO a rather silly :( You made your point.  Can't you just
> >fix those "couple of packages" instead and stop this ping-pong game?
> 
> I don't have time to fix them and since they worked before, reverting it
> is fine. It's not that i didn't wait for 1 week (!) to allow Ulf (or
> anybody else) to fix it up.. Selecting i386 in the config isn't really
> hard, i suppose.

Have the machine working on it at the moment, testing x86...
Bear with me.


> pong.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
