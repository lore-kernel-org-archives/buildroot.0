From: don <don_reid@comcast.net>
Date: Fri, 28 Sep 2007 11:34:03 -0700
Subject: [Buildroot] Libtool error with AVR32
In-Reply-To: <1190997482.5322.208.camel@elrond.atmel.sweden>
References: <20070927181757.GA8519@reid1.localdomain>
	<1190926438.5322.16.camel@elrond.atmel.sweden>
	<20070927221919.GA8983@reid1.localdomain>
	<20070927223420.GG20951@aon.at>
	<20070928160919.GA10853@reid1.localdomain>
	<1190997482.5322.208.camel@elrond.atmel.sweden>
Message-ID: <20070928183403.GA11186@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 28, 2007 at 06:38:02PM +0200, Ulf Samuelsson wrote:
> fre 2007-09-28 klockan 09:09 -0700 skrev don:
> > On Fri, Sep 28, 2007 at 12:34:20AM +0200, Bernhard Fischer wrote:
> > > On Thu, Sep 27, 2007 at 03:19:19PM -0700, don wrote:
> > > >On Thu, Sep 27, 2007 at 10:53:58PM +0200, Ulf Samuelsson wrote:
> > > >> tor 2007-09-27 klockan 11:17 -0700 skrev don:
> > > >> > I tried to use the latest AVR32 release from ATmel and got an error.
> > > >> > Is there somewhere else to post that other than this list?
> > > >> > 
> > > >> > The error is in build_avr32_nofpu/libdaemon-0.12 and is:
> > > 
> > > >I did not select any packages, just copied the ntgw100_defconfig to
> > > >.config.
> > > 
> > > Ulf, can you point me to a known good revision (of buildroot) that built
> > > that ntgw100 successfully, please? Modulo libdaemon, or other such
> > > packages. This would help alot to pinpoint any possible problems.
> > > 
> > > Don, I'm still under the impression that you're using something
> > > provided by atmel and not http://buildroot.uclibc.org/
> > > This is not the appropriate place for the "latest AVR32 release from
> > > ATmel" but for buildroot.
> > 
> > I'm using an archive of buildroot that Atmel provides on their website.
> > I have tried to use the "current" svn buildroot many many times over
> > months, and it has never worked.  From the list I can see that buildroot
> > is highly unstable.
> > 
> > I had hoped that Atmel had a frozen version that works.  I'm sure it
> > does under some conditions.
> 
> Do you do:
> $ make atstk1000_defconfig or make atngw100_defconfig

Yes, the later.

> This should work. Works for me.
> 
> Please note that this is what this is what the Atmel buildroot does.
> It does not support that you enable any other application 
> than what is supported by these two configs.

I did not do anything else like enable any other packages.

> I have made considerable progress today with the main trunk.

Thanks for all your work.  I will try the main trunk again an a few
days.

-- 
Don
