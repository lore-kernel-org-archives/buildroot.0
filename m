From: Bob Bouterse <bob.bouterse@dm-holdings-na.com>
Date: Tue, 25 May 2010 09:13:07 -0400
Subject: [Buildroot] Help with configuring Buildroot for the Omap3530 EVM
In-Reply-To: <201005241809.04330.minimod@morethan.org>
References: <1274732624.9526.87.camel@bbouterse-debian.escient.local>
	<000c01cafb93$b9e9c4f0$2dbd4ed0$@pauljones.id.au>
	<201005241802.54715.minimod@morethan.org>
	<201005241809.04330.minimod@morethan.org>
Message-ID: <1274793187.26577.4.camel@bbouterse-debian.escient.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you all,
I will try those extensions today.

On Mon, 2010-05-24 at 18:09 -0500, Michael S. Zick wrote:
> On Mon May 24 2010, Michael S. Zick wrote:
> > On Mon May 24 2010, Paul Jones wrote:
> > > 
> > > > -----Original Message-----
> > > > From: buildroot-bounces at busybox.net [mailto:buildroot-
> > > > bounces at busybox.net] On Behalf Of Bob Bouterse
> > > > Sent: Tuesday, 25 May 2010 6:24 AM
> > > > To: buildroot at busybox.net
> > > > Subject: [Buildroot] Help with configuring Buildroot for the Omap3530 EVM
> > > > 
> > > > Sorry everone, this is a bit of complaining from me, with a hope that
> > > there is
> > > > someone that can give me either help to configure Buildroot for an
> > > > Omap3530 EVM board, or hard measurements that I can use to show my
> > > > Management (and TI) that OE is slow and will cost us development time.
> > > > 
> > > > Here is my problem:
> > > > We are beginning a new project, an have decided to use the Omap3530 EVM
> > > > board to begin development on. We do not know if we will go to market with
> > > > the OMAP or some other processor at this time.
> > > > Seems like the entire Omap Open Source Community has jumped to using
> > > > OpenEmbedded with no consideration for how well it works. I find several
> > > > documents that give hearsay comments that it might be slow, but no metrics
> > > > to show what they mean. I have seen that it seems to be around
> > > > 2.5 to 4 times slower that buildroot, and even worse running on a VM, but
> > > > due to my lack of experience with OE, it could be a configuration error on
> > > my
> > > > part. I am working with the Arago group on that.
> > > > 
> > > > Does anyone have a board configuration for the Omap3503 EVM for
> > > > buildroot? It would help a lot if I could show my management a working
> > > build
> > 
> > Check on the recently posted patch to add support for the Beagleboard
> > to Buildroot.  The Beagleboard uses an Omap3530.
> > 
> > I admit that I didn't read the patch, but any new board should have 
> > a defconfig file as part of its addition to Buildroot.
> > 
> 
> Yup, there is a defconfig listed:
> http://lists.busybox.net/pipermail/buildroot/2010-May/034598.html
> 
> Mike
> > Mike
> > > > really quickly. I need the target/device files and Omap patches in a
> > > working
> > > > build. I am not being given any time to work on this because Arago
> > > "works".
> > > 
> > > >From my experience with a mini2440 board it seems that the quickest route is
> > > to get a kernel patch and get that building/running using buildroot, then
> > > work on the root filesystem. All I had to do was select my architecture
> > > (arm920) and choose some packages to build.
> > > 
> > > Good Luck!
> > > 
> > > 
> > > Paul.
> > > 
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> > > 
> > > 
> > 
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> > 
> > 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
