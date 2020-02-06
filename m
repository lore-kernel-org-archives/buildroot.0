From: Vladimir Oltean <olteanv@gmail.com>
Date: Thu, 6 Feb 2020 11:44:24 +0200
Subject: [Buildroot] [EXT] Re: [PATCH v4 1/9] package/nxp: new package
 directory
In-Reply-To: <VI1PR04MB5136E5E9F34B5A91437E89B2FE1D0@VI1PR04MB5136.eurprd04.prod.outlook.com>
References: <20200205105227.13698-1-jerry.huang@nxp.com>
 <CAEyMn7YhNQE8AaUu7vzpoO-TPcYgr5qWADKB-geq3AAj_MHZdw@mail.gmail.com>
 <VI1PR04MB5136E5E9F34B5A91437E89B2FE1D0@VI1PR04MB5136.eurprd04.prod.outlook.com>
Message-ID: <CA+h21hqTB3LVV91DaRf=b=XyUv_UhQB0Snjv-qCu2+z+RW+k=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerry, Heiko,

On Thu, 6 Feb 2020 at 05:41, Jerry Huang <jerry.huang@nxp.com> wrote:
>

[snip]

> >
> > This seems to be a duplication of the FREESCALE_IMX_EXTRACT_HELPER, isn't
> > it?
> > Do we then can remove the other one and use only the new "nxp" one?
> >
> > By the way is there a plan to move all NXP specific packages (qoriq and imx) to
> > the nxp subdir?
> Yes, the helper is the duplication of FREESCALE_IMX_EXTRACT_HELPER.
> Because Freescale is merged into NXP a few years ago, according to NXP's policy, we need to use nxp, instead of freescale.
> So, I think the packages related NXP should be move into nxp directory.
>

Is it really NXP policy though?
The thing is that LS1028A and several other boards are already
supported by some downstream Buildroot patches, so it makes sense to
keep using the folder names that we have there, i.e. "nxp" instead of
changing to "freescale".
However I don't think there is any hard requirement either way, so in
practice, whatever generates the least amount of friction should work.

> > --
> > Heiko

Thanks,
-Vladimir
