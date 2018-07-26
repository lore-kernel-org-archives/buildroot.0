From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 26 Jul 2018 08:45:42 +0200
Subject: [Buildroot] [PATCH 4/8] imx-vpu-hantro: new package
In-Reply-To: <20180725162912.a6kf4j3ntp42nfla@sapphire.tkos.co.il>
References: <20180725150149.30774-1-gary.bisson@boundarydevices.com>
 <20180725150149.30774-5-gary.bisson@boundarydevices.com>
 <20180725162912.a6kf4j3ntp42nfla@sapphire.tkos.co.il>
Message-ID: <20180726064542.GB20581@g751.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Wed, Jul 25, 2018 at 07:29:12PM +0300, Baruch Siach wrote:
> Hi Gary,
> 
> On Wed, Jul 25, 2018 at 05:01:45PM +0200, Gary Bisson wrote:
> > +config BR2_PACKAGE_IMX_VPU_HANTRO
> > +	bool "imx-vpu-hantro"
> > +	depends on BR2_aarch64 # Only relevant for i.MX8
> > +	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
> > +	help
> > +	  Library of userspace helpers specific for the NXP i.MX CPUs
> > +	  integrating a Hantro Video Processing Unit (VPU). It requires
> > +	  a kernel that includes the i.MX specific headers to be built.
> 
> Here also, a mention of i.MX8 would be nice, IMO.

Yes that would be clearer indeed, will be fixed in V2.

Thanks,
Gary
