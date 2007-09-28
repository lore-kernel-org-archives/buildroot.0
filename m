From: don <don_reid@comcast.net>
Date: Fri, 28 Sep 2007 09:09:19 -0700
Subject: [Buildroot] Libtool error with AVR32
In-Reply-To: <20070927223420.GG20951@aon.at>
References: <20070927181757.GA8519@reid1.localdomain>
	<1190926438.5322.16.camel@elrond.atmel.sweden>
	<20070927221919.GA8983@reid1.localdomain>
	<20070927223420.GG20951@aon.at>
Message-ID: <20070928160919.GA10853@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 28, 2007 at 12:34:20AM +0200, Bernhard Fischer wrote:
> On Thu, Sep 27, 2007 at 03:19:19PM -0700, don wrote:
> >On Thu, Sep 27, 2007 at 10:53:58PM +0200, Ulf Samuelsson wrote:
> >> tor 2007-09-27 klockan 11:17 -0700 skrev don:
> >> > I tried to use the latest AVR32 release from ATmel and got an error.
> >> > Is there somewhere else to post that other than this list?
> >> > 
> >> > The error is in build_avr32_nofpu/libdaemon-0.12 and is:
> 
> >I did not select any packages, just copied the ntgw100_defconfig to
> >.config.
> 
> Ulf, can you point me to a known good revision (of buildroot) that built
> that ntgw100 successfully, please? Modulo libdaemon, or other such
> packages. This would help alot to pinpoint any possible problems.
> 
> Don, I'm still under the impression that you're using something
> provided by atmel and not http://buildroot.uclibc.org/
> This is not the appropriate place for the "latest AVR32 release from
> ATmel" but for buildroot.

I'm using an archive of buildroot that Atmel provides on their website.
I have tried to use the "current" svn buildroot many many times over
months, and it has never worked.  From the list I can see that buildroot
is highly unstable.

I had hoped that Atmel had a frozen version that works.  I'm sure it
does under some conditions.  

In this case I suspect that my up to date Gentoo host has a new version of
autoconf that is doing some new check.  I thought you might want to know
about this as it will probably come up again.

Have you considered creating buildroot releases, which are frozen
excerpt for simple bug fixes?  It seems that the rate of new "features"
is such that the trunk version is in constant flux.

Thank you
Don
