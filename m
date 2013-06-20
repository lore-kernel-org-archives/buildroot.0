From: gpontis at spamcop.net <gpontis@spamcop.net>
Date: Thu, 20 Jun 2013 10:52:23 -0700
Subject: [Buildroot] FW:  Xenomai package not extracted in time
References: <02de01ce6dd0$bb38f3a0$31aadae0$@spamcop.net>	<20130620184222.37b73ce2@skate>	<000501ce6dda$fca14a90$f5e3dfb0$@z9.com>
 <20130620194009.55364faf@skate> 
Message-ID: <001701ce6dde$eaff24c0$c0fd6e40$@spamcop.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: Thursday, June 20, 2013 10:40 AM
> To: George Pontis
> Cc: buildroot at uclibc.org
> Subject: Re: [Buildroot] Xenomai package not extracted in time
> 
> Dear George Pontis,
> 
> Please don't reply to me only, but also to the list.
> 
> On Thu, 20 Jun 2013 10:24:14 -0700, George Pontis wrote:
> > Thanks for your attention Thomas. I look forward to a fix, but in 
> > the short term I'll look at the commit and see if I can back it out 
> > temporarily since we only use Xenomai.
> 
> Backing out the commit will be hard because many other related changes 
> have been done since then.
> 
> You can try adding a line like:
> 
> linux-patch: xenomai-extract
> 
> in the linux/linux-ext-xenomai.mk.
> 
> Completely untested, of course.
> 
> Best regards,
> 
> Thomas

That seems to take care of it. Thank you Thomas.

- Geo.
