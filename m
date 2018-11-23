From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 10:42:07 +0100
Subject: [Buildroot] [PATCH] configs/imx6sabre: Create distinct
 pre-processed mkimage config files
In-Reply-To: <1542912921-28407-1-git-send-email-festevam@gmail.com>
References: <1542912921-28407-1-git-send-email-festevam@gmail.com>
Message-ID: <20181123104207.02996447@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Nov 2018 16:55:21 -0200, Fabio Estevam wrote:
> Commit 0c4bccf9e882 ("configs/imxsabre: Fix U-Boot parallel build issue")
> tried to fix the parallel build issue, but the real fix was developed
> later by Trent Piepho later, so add such commit to fix Buildroot
> build failures on rel_imx_4.9.x_1.0.0_ga NXP branch.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/123771053
> https://gitlab.com/buildroot.org/buildroot/-/jobs/123771054
> https://gitlab.com/buildroot.org/buildroot/-/jobs/123771055
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  ...distinct-pre-processed-mkimage-config-fil.patch | 89 ++++++++++++++++++++++
>  ...emove-failure-when-no-IVT-offset-is-found.patch | 55 -------------
>  2 files changed, 89 insertions(+), 55 deletions(-)
>  create mode 100644 board/freescale/imx6sabre/patches/uboot/0002-imx-Create-distinct-pre-processed-mkimage-config-fil.patch
>  delete mode 100644 board/freescale/imx6sabre/patches/uboot/0002-imximage-Remove-failure-when-no-IVT-offset-is-found.patch

I tested, and it does fix the problem, so I've applied to master.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
