From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 27 Apr 2021 14:19:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/imx-uuc: bump version and
 enable for i.MX8 architecture
In-Reply-To: <20210426233954.19401-1-charles.hardin@chargepoint.com>
References: <20210426233954.19401-1-charles.hardin@chargepoint.com>
Message-ID: <YIgBZKz+qFenGMWE@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks for your contribution!

On Mon, Apr 26, 2021 at 04:39:54PM -0700, Charles Hardin wrote:
> From: Charles Hardin <ckhardin@gmail.com>
> 
> The imx-uuc package was only selectable on 32-bit arm targets; this
> patch allows aarch64 targets such as i.MX8 to select the package
> and use the ufb for fastboot support against the mfgtools "uuu".
> 
> Also bumping to latest upstream commit from
>     https://github.com/NXPmicro/imx-uuc

Well this isn't the latest but this is actually a good thing.
The latest rev (15cb53e1) removes uuc from the standard build.
So next rev bump will require to modify the recipe to remove uuc (and
the fat file creation), but I guess that can wait.

> Tested on i.MX8QXP.
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
