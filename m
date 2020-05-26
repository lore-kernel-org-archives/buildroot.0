From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 26 May 2020 14:48:56 +0200
Subject: [Buildroot] [PATCH v3 3/5] board/freescale/common/imx: use
 generic ddr_fw.bin name
In-Reply-To: <1590422530-4788-4-git-send-email-stephane.viau@oss.nxp.com>
References: <1590422530-4788-1-git-send-email-stephane.viau@oss.nxp.com>
 <1590422530-4788-4-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200526124856.GC438358@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane,

On Mon, May 25, 2020 at 06:02:08PM +0200, Stephane Viau wrote:
> For some SoCs (i.e.: i.MX8M Nano for now), the DDR training firmware
> in the boot image depends on the type of memory installed on a board
> (LPDDR4, DDR4, etc...). The previous patch makes this firmware name
> agnostic of the DDR type and uses ddr_fw.bin as a generic name. This
> patch makes imx8-bootloader-prepare.sh use this generic name,
> independently of the kind board DDR type.
> 
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> Reviewed-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
> Reviewed-by: Julien Olivain <julien.olivain@oss.nxp.com>
> ---
> v2:
>   - generic ddr_fw.bin name is now used also for 8M and 8MM, along with
>     8MN (suggested by Gary)
> 
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Thanks,
Gary
