From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 18 Jul 2019 08:50:01 +0000
Subject: [Buildroot] fb-test-app: Git repo with sources is gone
In-Reply-To: <20190718081132.532nstxozjkj65ki@M43218.corp.atmel.com>
References: <CY4PR1201MB01200469C475B81E48B0C364A1CE0@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20190718081132.532nstxozjkj65ki@M43218.corp.atmel.com>
Message-ID: <CY4PR1201MB01202AF6D2B078F3070C2690A1C80@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ludovic,

> -----Original Message-----
> From: Ludovic Desroches <ludovic.desroches@microchip.com>
> Sent: Thursday, July 18, 2019 11:12 AM
> To: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Arnout Vandecappelle <arnout@mind.be>;
> buildroot at buildroot.org
> Subject: Re: fb-test-app: Git repo with sources is gone
> 
> Hi Alexey,
> 
> On Tue, Jul 16, 2019 at 01:22:22PM +0000, Alexey Brodkin wrote:
> >
> > Hi Ludovic,
> >
> > Just noticed that the FBTest's git repo [1] is no longer available.
> > I was not able to find its owner's (David Anders AKA prpplague)
> > up-to-date email so not sure if there's a chance to get it recovered.
> >
> > Looks like Buildroot's autobuilder didn't highlight that problem due to the
> > "cached" version of the tarball [2].
> >
> > Unfortunately I don't have a local clone of this repo but maybe
> > someone else has it.
> 
> Thanks for the feedback. Let see if we can have a revival of this repo.
> Otherwise, it's not a big deal for me to remove it.

I was able to contact David and he's not interested in restoration
of his repo. But given there're quite some forks of it we may rely
either on once of them (for example Andy Shevchenko one [1]) or
just keep using "cached" tarball hosted at sources.buildroot.net
and change Buildroot's fb-test-app.mk [3] accordingly.

Personally I'd prefer to keep this very useful application in Buildroot.
My use-case is bring-up and smoke-testing of video pipelines of
real boards so loosing it will be quite unfortunate.

[1] https://github.com/andy-shev/fb-test-app
[2] http://sources.buildroot.net/fb-test-app/fb-test-app-rosetta-1.1.0.tar.gz
[3] https://git.buildroot.org/buildroot/tree/package/fb-test-app/fb-test-app.mk

-Alexey
