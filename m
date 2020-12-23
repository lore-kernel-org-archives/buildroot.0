From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 23 Dec 2020 14:59:06 +0100
Subject: [Buildroot] [PATCH 1/1]
 package/freescale-imx/firmware-imx/Config.in: install imx6q binaries for
 IM6UL platform
In-Reply-To: <20201113101026.1824-1-pawnrob@gmail.com>
References: <20201113101026.1824-1-pawnrob@gmail.com>
Message-ID: <X+NNKoJi6YuAxO1Y@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rob,

Thanks for your contribution and sorry for the delayed response.

On Fri, Nov 13, 2020 at 10:10:26AM +0000, pawnrob at gmail.com wrote:
> From: RMellor <Rob.Mellor@ultra-pals.com>
> 
> linux-*/arch/arm/boot/dts/imx6ul.dtsi
> requires the install of the sdma-imx6q.bin as stated in
> line 727: fsl,sdma-ram-script-name = "imx/sdma/sdma-imx6q.bin";
> 
> without the BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME being set to "imx6q"
> line 102 of firmware-imx.mk does not install the firmware to to target
> 
> Signed-off-by: RMellor <Rob.Mellor@ultra-pals.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
