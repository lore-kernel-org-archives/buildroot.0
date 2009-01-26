From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 26 Jan 2009 12:21:14 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: argus
	bind	dmraid kismet libeXosip2 ltra etc...
In-Reply-To: <873af6d219.fsf@macbook.be.48ers.dk>
References: <20090126003405.2EE7776D28@busybox.osuosl.org>
	<873af6d219.fsf@macbook.be.48ers.dk>
Message-ID: <1232968874.2298.60.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-01-26 klockan 07:17 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-26 00:34:02 +0000 (Mon, 26 Jan 2009)
>  ulf> New Revision: 25041
> 
>  ulf> Log:
>  ulf> Add help for packages without AVR32 support
> 

Most of these indicate "Machine not recognized"
I think one of them indicated something similar
to "header"-<ARCH>.h not found.

I consider them as totally broken for AVR32 until proven otherwise.
I would prefer them to depend on !BR2_avr32 in the distribution
(not the svn), but that is apparently not popular.

Totally meaninless to even attempt to build a package
if there is 0% of success.

HCE wants it to be there in the hope of that someone will
need the support on AVR32 so much that they will fix it,
but the casual user should not include them and fail the build.

BR
Ulf Samuelsson



> Do they all really NEED avr32 patches to build? Some of them atleast
> doesn't seem to be very hardware specific. Do they all fail doing
> build for avr32? Can you post snippets of the build logs?
> 
