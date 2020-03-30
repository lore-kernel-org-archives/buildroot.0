From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 14:13:01 +0200
Subject: [Buildroot] [PATCH v2] package/freescale-imx/imx-vpu-hantro:
 bump version to 1.15.0
In-Reply-To: <20200330080522.23854-1-gary.bisson@boundarydevices.com>
References: <20200330080522.23854-1-gary.bisson@boundarydevices.com>
Message-ID: <20200330141301.095ec67c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Mar 2020 10:05:22 +0200
Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> To match NXP BSP 4.19.35-1.1.0 release:
> https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/tree/imx/meta-bsp/recipes-bsp/imx-vpu-hantro?h=warrior-4.19.35-1.1.0
> 
> Adds support for i.MX8MMini platform (Hantro H1 encoder).
> 
> Changelog v2:
> - Add uclibc build fix from Laurent

The changelog should not be inside the commit log, but after the "---".

> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Thanks, applied with the changelog part removed from the commit log!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
