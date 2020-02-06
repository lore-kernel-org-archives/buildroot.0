From: Vladimir Oltean <olteanv@gmail.com>
Date: Thu, 6 Feb 2020 12:04:05 +0200
Subject: [Buildroot] [EXT] Re: [PATCH v4 1/9] package/nxp: new package
 directory
In-Reply-To: <20200206105150.14fb9a83@windsurf>
References: <20200205105227.13698-1-jerry.huang@nxp.com>
 <CAEyMn7YhNQE8AaUu7vzpoO-TPcYgr5qWADKB-geq3AAj_MHZdw@mail.gmail.com>
 <VI1PR04MB5136E5E9F34B5A91437E89B2FE1D0@VI1PR04MB5136.eurprd04.prod.outlook.com>
 <CA+h21hqTB3LVV91DaRf=b=XyUv_UhQB0Snjv-qCu2+z+RW+k=g@mail.gmail.com>
 <20200206105150.14fb9a83@windsurf>
Message-ID: <CA+h21hqmndrgZMwd7mqVxpNHHgZLObCN338AUuMVMHycpMMHXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 6 Feb 2020 at 11:51, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Thu, 6 Feb 2020 11:44:24 +0200
> Vladimir Oltean <olteanv@gmail.com> wrote:
>
> > > > This seems to be a duplication of the FREESCALE_IMX_EXTRACT_HELPER, isn't
> > > > it?
> > > > Do we then can remove the other one and use only the new "nxp" one?
> > > >
> > > > By the way is there a plan to move all NXP specific packages (qoriq and imx) to
> > > > the nxp subdir?
> > > Yes, the helper is the duplication of FREESCALE_IMX_EXTRACT_HELPER.
> > > Because Freescale is merged into NXP a few years ago, according to NXP's policy, we need to use nxp, instead of freescale.
> > > So, I think the packages related NXP should be move into nxp directory.
> > >
> >
> > Is it really NXP policy though?
> > The thing is that LS1028A and several other boards are already
> > supported by some downstream Buildroot patches, so it makes sense to
> > keep using the folder names that we have there, i.e. "nxp" instead of
> > changing to "freescale".
>
> The proposal is not to change from nxp to freescale, but the opposite.
>

It depends on perspective, but I guess you already got the point.

> However, I think it's good to keep in mind that NXP's policy applies to
> whatever NXP does. The Buildroot project is independent and is not
> forced in any way to comply with NXP policies.
>

Not trying to suggest otherwise, just to explain why the freescale ->
nxp name change took place between Jerry's v2 and v3 of this patch
series. The arguments have been brought on both sides, I don't think
it's a big deal either way as long as the naming between device
families is consistent and there isn't any unjustified duplication, so
I'll just let Jerry make a decision one way or another.

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Regards,
-Vladimir
