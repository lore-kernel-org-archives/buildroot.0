From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 26 May 2020 14:43:56 +0200
Subject: [Buildroot] [PATCH v3 1/5] package/freescale-imx: Add option
 for DDR FW need
In-Reply-To: <1590422530-4788-2-git-send-email-stephane.viau@oss.nxp.com>
References: <1590422530-4788-1-git-send-email-stephane.viau@oss.nxp.com>
 <1590422530-4788-2-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200526124356.GA438358@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane,

On Mon, May 25, 2020 at 06:02:06PM +0200, Stephane Viau wrote:
> Only some i.MX8 needs a DDR training firmware (8M, 8MM, 8MN). Some other
> i.MX8 (QuadMax, QuadXPlus) rely on system controller for that task.
> 
> Suggested-by: Julien Olivain <julien.olivain@oss.nxp.com>
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> ---
> v3:
>   - let the others 'select' this newly introduced option instead of
>     'default y' it. I believe this option is still required since we
>     only want to choose a DDR binary for the i.MX 8M platforms. (Gary)

I've tested this patch and confirm it is working properly.

Note that using 'select' instead of 'default y if...' was suggested by
Yann on IRC.

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
