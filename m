From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 07 Jan 2009 20:16:48 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <20090107181337.GB14648@zelow.no>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<1231243376.32308.52.camel@elrond.atmel.com>
	<87vdsssiwo.fsf@macbook.be.48ers.dk>
	<200901070409.42558.markus.heidelberg@web.de>
	<1231326832.32308.320.camel@elrond.atmel.com>
	<87prizl5im.fsf@macbook.be.48ers.dk>
	<1231330238.32308.334.camel@elrond.atmel.com>
	<20090107181337.GB14648@zelow.no>
Message-ID: <1231355808.32308.414.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2009-01-07 klockan 19:13 +0100 skrev Thomas Lundquist:
> On Wed, Jan 07, 2009 at 01:10:38PM +0100, Ulf Samuelsson wrote:
> > 
> > It is not fixed by a system which has stable distributions
> > which are removed and replaced with another stable
> > distribution which breaks support for a number of systems.
> 
> Replaced? It's versioned (and tagged in the VCS) so it's not 
> that an old version just ends up in /dev/null
> 
> The main issue regarding older releases is that the source packages might
> not be available where they used to be. That's a different issue
> that seems to be addressed anyway.
> 

When we release a distribution, then all needed packages
in that distribution needs to be mirrored somewhere.

This was a key requirement when I pestered Atmel Norway 
to replace their build scripts with buildroot,
and I think HCE has implemented it.
There is a scripts/wget.sh which I will have a look at.


> 
> Thomas.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
