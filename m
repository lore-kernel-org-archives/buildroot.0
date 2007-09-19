From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 19 Sep 2007 23:53:39 +0200
Subject: [Buildroot] local mirror management (bug #572)
In-Reply-To: <20070919082107.GC11856@aon.at>
References: <20070917075500.052F2A4692@busybox.net>
	<1190025802.8052.4.camel@elrond.sweden.atmel.com>
	<20070917092735.GA18888@aon.at>
	<1190031404.8052.9.camel@elrond.sweden.atmel.com>
	<20070917111024.GB22104@aon.at>
	<1190040978.8052.20.camel@elrond.sweden.atmel.com>
	<20070917134117.GC24993@aon.at>
	<1190098489.4064.7.camel@elrond.sweden.atmel.com>
	<20070919082107.GC11856@aon.at>
Message-ID: <1190238819.7740.8.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2007-09-19 klockan 10:21 +0200 skrev Bernhard Fischer:
> On Tue, Sep 18, 2007 at 08:54:49AM +0200, Ulf Samuelsson wrote:
> >
> >> >Exactly what problem are you trying to resolve?
> >> 
> >> There is no point in having any atmel mirror in my .config unless i
> >> build for at91 or avr32 and choose to use an atmel toolchain or atmel
> >> patches.
> >
> >if/when it will mirror all the tarballs used by Buildroot
> >it will be useful to everyone.
> >I am lobbying for this to happen.
> 
> No, this is unacceptable. If you want to do stuff like that, look at the
> "local mirror" patch in mantis (or the ML archives). See 1).
> 
> With the patch mentioned above, you (i.e. the user) is free to setup and
> use any mirror she likes, be it the
> http://buildroot.uclibc.org/downloads/buildroot-sources/
> or another, potentially local directory (i.e. nothing you can talk to
> via http or ftp).
> 
> We will not accept to rely on a random vendor's ftp collection, this is
> conceptually broken since we have no influence on their ftp server and
> the packages they may choose to have there or not.
> 
> 1) http://bugs.busybox.net/view.php?id=572
> has a rough draft that IIRC needs some cleanup and that should be
> discussed in it's cleaned up version on this list.

Don't be so negative.
Any patch regarding mirrors will need to maintain a list of mirror
locations.

All packages should normally be downloaded from their current location
and the mirrors should only be used if the packet is not available
at the current location for some reason.

Best Regards
Ulf Samuelsson
