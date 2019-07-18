From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 18 Jul 2019 16:16:27 +0300
Subject: [Buildroot] fb-test-app: Git repo with sources is gone
In-Reply-To: <CY4PR1201MB01202AF6D2B078F3070C2690A1C80@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <CY4PR1201MB01200469C475B81E48B0C364A1CE0@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20190718081132.532nstxozjkj65ki@M43218.corp.atmel.com>
 <CY4PR1201MB01202AF6D2B078F3070C2690A1C80@CY4PR1201MB0120.namprd12.prod.outlook.com>
Message-ID: <20190718131627.GZ9224@smile.fi.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 18, 2019 at 08:50:01AM +0000, Alexey Brodkin wrote:
> > -----Original Message-----
> > From: Ludovic Desroches <ludovic.desroches@microchip.com>
> > Sent: Thursday, July 18, 2019 11:12 AM
> > To: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Arnout Vandecappelle <arnout@mind.be>;
> > buildroot at buildroot.org
> > Subject: Re: fb-test-app: Git repo with sources is gone
> > On Tue, Jul 16, 2019 at 01:22:22PM +0000, Alexey Brodkin wrote:

> > > Just noticed that the FBTest's git repo [1] is no longer available.
> > > I was not able to find its owner's (David Anders AKA prpplague)
> > > up-to-date email so not sure if there's a chance to get it recovered.
> > >
> > > Looks like Buildroot's autobuilder didn't highlight that problem due to the
> > > "cached" version of the tarball [2].
> > >
> > > Unfortunately I don't have a local clone of this repo but maybe
> > > someone else has it.
> > 
> > Thanks for the feedback. Let see if we can have a revival of this repo.
> > Otherwise, it's not a big deal for me to remove it.
> 
> I was able to contact David and he's not interested in restoration
> of his repo. But given there're quite some forks of it we may rely
> either on once of them (for example Andy Shevchenko one [1]) or
> just keep using "cached" tarball hosted at sources.buildroot.net
> and change Buildroot's fb-test-app.mk [3] accordingly.

For the record, I had checked all twenty repositories on GitHub and they have
almost nothing advanced in comparison to what I have now. Similar patch to
revert the change had been done in one, and one non-significant change had been
done in another, the rest just a fork without anything additional to the, used
to be, original one.

-- 
With Best Regards,
Andy Shevchenko
