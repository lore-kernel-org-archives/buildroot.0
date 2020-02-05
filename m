From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 11:36:31 +0100
Subject: [Buildroot] [PATCH 2/7] package/freescale-imx: add option for
 i.MX8QM
In-Reply-To: <20191108173026.GB9828@g751>
References: <20190909121525.13935-1-maeva.manuel@nxp.com>
 <20190909121525.13935-2-maeva.manuel@nxp.com>
 <20191108173026.GB9828@g751>
Message-ID: <20200205113631.5ba22eba@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 8 Nov 2019 18:30:26 +0100
Gary Bisson <bisson.gary@gmail.com> wrote:

> This isn't sufficient, you also need to make sure to add
> BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 in the
> BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU definition as I'm sure it has a
> Vivante GPU ;)

True, I fixed that when applying.

> Looking at Config.in, seems that MX8MM has the same issue.

It was fixed yesterday by commit 7b3c48ed8107c5cd39f5d761734964dcd8c8d408.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
