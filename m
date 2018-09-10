From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 17:43:17 +0200
Subject: [Buildroot] [PATCH] imx-lib: bump to version used in
 4.9.88-2.0.0_ga
In-Reply-To: <20180904212822.48852-1-1baldgeek@gmail.com>
References: <20180904212822.48852-1-1baldgeek@gmail.com>
Message-ID: <20180910174317.74b61c36@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Sep 2018 17:28:22 -0400, Dan Riegsecker wrote:
> In the latest release from NXP, Yocto Rocko 4.9.88-2.0.0_ga,
> imx-lib was switched from a specific branch or tag release to the
> master branch and a specific commit. See the link below for
> reference.
> 
> https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/commit/?h=rocko-4.9.88-2.0.0_ga&id=ded1a9ea3d723c56058524fc9ebd420a3510ae05
> 
> Signed-off-by: Dan Riegsecker <1baldgeek@gmail.com>
> ---
>  package/freescale-imx/imx-lib/imx-lib.hash | 2 +-
>  package/freescale-imx/imx-lib/imx-lib.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. Thanks Dan for the patch, thanks Gary for
the review!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
