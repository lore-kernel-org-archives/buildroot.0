From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 08:25:42 +0200
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/imx-vpu-hantro:
 bump version to 1.15.0
In-Reply-To: <20200326164943.564656-3-gary.bisson@boundarydevices.com>
References: <20200326164943.564656-1-gary.bisson@boundarydevices.com>
 <20200326164943.564656-3-gary.bisson@boundarydevices.com>
Message-ID: <20200330082542.3ff7310a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Mar 2020 17:49:43 +0100
Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> To match NXP BSP 4.19.35-1.1.0 release:
> https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/tree/imx/meta-bsp/recipes-bsp/imx-vpu-hantro?h=warrior-4.19.35-1.1.0
> 
> Adds support for i.MX8MMini platform (Hantro H1 encoder).
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  ...on.h-header-inclusion-to-be-standard.patch | 64 ++++++++++++++-----
>  .../imx-vpu-hantro/imx-vpu-hantro.hash        |  6 +-
>  .../imx-vpu-hantro/imx-vpu-hantro.mk          |  5 +-
>  3 files changed, 54 insertions(+), 21 deletions(-)

Following the feedback from Laurent, I've marked this patch as Changes
Requested.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
