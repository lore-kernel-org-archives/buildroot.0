From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 20 Sep 2007 08:40:02 +0200
Subject: [Buildroot] local mirror management (bug #572)
In-Reply-To: <20070919212027.GU20058@aon.at>
References: <20070917075500.052F2A4692@busybox.net>
	<1190025802.8052.4.camel@elrond.sweden.atmel.com>
	<20070917092735.GA18888@aon.at>
	<1190031404.8052.9.camel@elrond.sweden.atmel.com>
	<20070917111024.GB22104@aon.at>
	<1190040978.8052.20.camel@elrond.sweden.atmel.com>
	<20070917134117.GC24993@aon.at>
	<1190098489.4064.7.camel@elrond.sweden.atmel.com>
	<20070919082107.GC11856@aon.at>
	<1190238819.7740.8.camel@elrond.sweden.atmel.com>
	<20070919212027.GU20058@aon.at>
Message-ID: <1190270402.7740.18.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2007-09-19 klockan 23:20 +0200 skrev Bernhard Fischer:
> On Wed, Sep 19, 2007 at 11:53:39PM +0200, Ulf Samuelsson wrote:
> >ons 2007-09-19 klockan 10:21 +0200 skrev Bernhard Fischer:
> 
> >> With the patch mentioned above, you (i.e. the user) is free to setup and
> >> use any mirror she likes, be it the
> >> http://buildroot.uclibc.org/downloads/buildroot-sources/
> 
> I've dropped a couple of "our" package-sources there, fyi.
> 
> >> or another, potentially local directory (i.e. nothing you can talk to
> >> via http or ftp).
> 
> >> 1) http://bugs.busybox.net/view.php?id=572
> >> has a rough draft that IIRC needs some cleanup and that should be
> >> discussed in it's cleaned up version on this list.
> >
> >Don't be so negative.
> 
> I'm not negative (just look at the patch to see what i mean).




I don't see any conflict in these patches.
It is similar to what I had in mind.

You would define BR2_LOCAL_MIRROR_SITE as $(ATMEL_MIRROR)
It is not good to define it as the current value of ATMEL_MIRROR
since the site will eventually change.

Best Regards
