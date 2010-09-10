From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Fri, 10 Sep 2010 16:29:14 +0100
Subject: [Buildroot] [PATCH] Fix 'make source' when used with external
 toolchains
In-Reply-To: <AB12B32E73474741A2C5361C433A44DE0219146B@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
References: <AB12B32E73474741A2C5361C433A44DE021912DD@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
	<1284129272.3193.279.camel@dubciaranr1.verifone.com>
	<AB12B32E73474741A2C5361C433A44DE0219146B@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
Message-ID: <1284132554.3193.288.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ar Aoine, 2010-09-10 ag 16:25 +0100, scr?obh Phil Edworthy:
> > I was about to send to the list for proposed solutions because I feared
> > that just disabling the specific lines wasn't the right approach.
> 
> It seemed like the simplest approach at the time!
> 
Oh, I'm not doubting you.  Just that I wasn't sure of it myself. :-)

> Unfortunately I'm not around for the next week so I can't check this. I also
> don?t have a uclibc external toolchain... 
> 
I also only use glibc toolchain (CodeSourcery 2010q1) and that's what
comes out in $(TARGETS_SOURCE): "uclibc-source".
