From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 23 Apr 2020 11:07:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-gpu-g2d: fix
 the file name
In-Reply-To: <1587617509-15087-1-git-send-email-timo.ketola@exertus.fi>
References: <1587617509-15087-1-git-send-email-timo.ketola@exertus.fi>
Message-ID: <20200423090701.GA814863@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks for your contribution.

On Thu, Apr 23, 2020 at 07:51:49AM +0300, Timo Ketola wrote:
> NXP apparently changed file naming convention for this particular file.

Yes apparently they started naming it this way with 6.4.0.p1.0 so that
it simplifies the recipe [1]:
FSLBIN_NAME_arm = "${PN}-${PV}-${TARGET_ARCH}"

So IMO this commit log should mention it fixes last commit so that it's
picked up for "LTS" branches:
Fixes:
1d0ea8d433 (package/freescale-imx/imx-gpu-g2d: bump to version
6.4.0.p1.0)

> Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>

Otherwise:
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary

[1] https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/tree/imx/meta-bsp/recipes-graphics/imx-gpu-g2d/imx-gpu-g2d_6.4.0.p1.0.bb?h=warrior-4.19.35-1.1.0
