From: James Newell <jnewell@wgate.com>
Date: Fri, 9 Feb 2007 09:51:23 -0500
Subject: [Buildroot] building ARM toolchain with nofpu
Message-ID: <FA7EECCA3735EF46BE49245D249B788CE2E309@exchange1.wgate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 

> -----Original Message-----
> From: Bernhard Fischer [mailto:rep.dot.nop at gmail.com] 
> Sent: Friday, February 09, 2007 9:30 AM
> To: James Newell
> Cc: Yann E. MORIN; buildroot at uclibc.org
> Subject: Re: [Buildroot] building ARM toolchain with nofpu
> 
> On Fri, Feb 09, 2007 at 09:10:03AM -0500, James Newell wrote:
> > 
> >
> >> -----Original Message-----
> >> From: Bernhard Fischer [mailto:rep.dot.nop at gmail.com]
> >> Sent: Friday, February 09, 2007 8:11 AM
> >> To: James Newell
> >> Cc: Yann E. MORIN; buildroot at uclibc.org
> >> Subject: Re: [Buildroot] building ARM toolchain with nofpu
> >> 
> >> On Thu, Feb 08, 2007 at 08:41:53PM -0500, James Newell wrote:
> >> >The buildroot only seems to go to gcc 4.0.3? 
> >> 
> >> I'll add 4.0.4 later today (provided that it builds and 
> works), fwiw
> >> 
> >> 
> >
> >I was able to add 4.0.4 myself, and it worked as described by Yann.
> 
> I'm curious as to why you think we don't have -lfloat?
I didn't say that.  The 4.1.1 compiler doesn't seem to build the uclibc
with default soft-float enabled.

Did I miss an email?

> 
> Could somebody please follow up on
> http://www.busybox.net/lists/buildroot/2007-January/001182.html
> 
> 
> 
