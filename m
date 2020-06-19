From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 19 Jun 2020 15:24:32 +0200
Subject: [Buildroot] [PATCH 3/3] package/freescale-imx/firmware-imx:
 bump version to 8.6
In-Reply-To: <20200615130633.19909-3-sebastien.szymanski@armadeus.com>
References: <20200615130633.19909-1-sebastien.szymanski@armadeus.com>
 <20200615130633.19909-3-sebastien.szymanski@armadeus.com>
Message-ID: <20200619132432.GB525498@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sebastien,

On Mon, Jun 15, 2020 at 03:06:33PM +0200, S?bastien Szymanski wrote:
> This package needed to be updated to be aligned with NXP
> BSP 5.4.3_1.0.0.
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

Looks good, thanks! Only addition I would do in the commit log,
explaining the update of COPYING/EULA, from what I see:
- update to LA_OPT_NXP_Software_License v10 December 2019
- addition of Crank, EmSA and TARA Systems restrictions

Also, this update from 8.5 to 8.6 only updates the imx8 vpu firmware
files.

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
