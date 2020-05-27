From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 27 May 2020 10:36:22 +0200
Subject: [Buildroot] [PATCH v4 2/5] package/freescale-imx/firmware-imx:
 add choice for DDR training binaries
In-Reply-To: <1590556068-7043-3-git-send-email-stephane.viau@oss.nxp.com>
References: <1590556068-7043-1-git-send-email-stephane.viau@oss.nxp.com>
 <1590556068-7043-3-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200527083622.GA524381@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane,

Thanks for the quick respin!

On Wed, May 27, 2020 at 07:07:45AM +0200, Stephane Viau wrote:
> Several i.MX8 (e.g.: 8M, 8MM, 8MN) support many DDR types (LPDDR4, DDR4,
> etc.), for which the DDR training is performed in the bootloader.
> Some boards have LPDDR4 (e.g.: nitrogen8mn) and some others have the DDR4
> (e.g.: NXP's reference board EVK). This patch allows the selection of either
> of the binaries used to train the DDR.
> 
> Note that DDR and HDMI FW copies are now separated, which makes latter
> being properly copied only for the relevant SoC (i.MX8MQ).
> Suggested-by: Gary Bisson <gary.bisson@boundarydevices.com>
> 
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> Reviewed-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
> Reviewed-by: Julien Olivain <julien.olivain@oss.nxp.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
