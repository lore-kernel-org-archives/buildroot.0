From: Jerry Huang <jerry.huang@nxp.com>
Date: Wed, 20 Nov 2019 09:57:54 +0000
Subject: [Buildroot] [EXT] Re: [External] Re: [PATCH 1/9] package/rcw:
 upgrade the rcw version to LSDK-19.09
In-Reply-To: <CANQCQpYBjDv8-=hDyOGeCHMQymFqsu3St+9fCvhcgunVQs9UKw@mail.gmail.com>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-2-jerry.huang@nxp.com>
 <8ef6b0156f54102d837ecfc429ae810d@walle.cc>
 <20191120103204.19a15798@windsurf.home>
 <CANQCQpbZdy0q_qvRf8AWKu8wVFTNh8o9fjY7=UDeiKmU8zhnGw@mail.gmail.com>
 <20191120104539.37da1c64@windsurf.home>
 <CANQCQpYBjDv8-=hDyOGeCHMQymFqsu3St+9fCvhcgunVQs9UKw@mail.gmail.com>
Message-ID: <VI1PR04MB5136B0C1D54D82996FA82D35FE4F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Matt,

Best Regards
Jerry Huang

> -----Original Message-----
> From: Matthew Weber <matthew.weber@collins.com>
> Sent: Wednesday, November 20, 2019 5:52 PM
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Michael Walle <michael@walle.cc>; Jerry Huang <jerry.huang@nxp.com>;
> buildroot mailing list <buildroot@busybox.net>
> Subject: [EXT] Re: [External] Re: [Buildroot] [PATCH 1/9] package/rcw: upgrade
> the rcw version to LSDK-19.09
> 
> Caution: EXT Email
> 
> Changming,
> 
> On Wed, Nov 20, 2019 at 3:45 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > On Wed, 20 Nov 2019 03:38:40 -0600
> > Matthew Weber <matthew.weber@collins.com> wrote:
> >
> > > > True, rcw is very short and quite generic. Matt, what do you think?
> > >
> > > Michael, good points, maybe we could append a prefix to make it
> > > freescale-qoriq-rcw?
> >
> > Yes, freescale-qorqiq-rcw is good.
> >
> 
> I can send a patch, however do you want to add this rename as a patch in your
> current layerscape devkit series as you touch lots of RCW variables?  Let me
> know your plan, I can send it but I don't want to do it in the middle of your
> work :).
I can add this rename as a patch
I created one sub-directory " freescale-qoriq" for all hardware related,
So, can I move RCW after rename into this directory?

> Matt
