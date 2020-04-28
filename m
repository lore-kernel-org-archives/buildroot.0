From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 28 Apr 2020 10:27:05 +0200
Subject: [Buildroot] [PATCH 4/4] configs/freescale_imx8mnevk: new
 defconfig
In-Reply-To: <1588059233-11467-5-git-send-email-stephane.viau@oss.nxp.com>
References: <1588059233-11467-1-git-send-email-stephane.viau@oss.nxp.com>
 <1588059233-11467-5-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200428082705.GC183066@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane,

On Tue, Apr 28, 2020 at 09:33:53AM +0200, Stephane Viau wrote:
> This patch adds support for the i.MX8M Nano EVK Board [1].
> 
> The creation of u-boot.imx image is disabled since it fails and is not
> required. 

I don't understand that sentence. What do you mean? AFAIK u-boot.imx is
the i.MX6 format, not sure why it is relevant to i.MX8M.

> The final boot image is created from uboot and firmware binaries
> in post image script board/freescale/common/imx/imx8-bootloader-prepare.sh
> 
> Note that this config is based on 4.19.35_1.1.0 ; hence, the kernel
> configuration needs host-openssl to build.
> 
> [1] https://www.nxp.com/document/guide/i-mx-8m-nano-evk-board-getting-started-guide:GS-8MNANOLPD4-EVK

Doesn't the name of the EVK suggest it's using LPDDR4?

Is there several versions of the same board?

Regards,
Gary
