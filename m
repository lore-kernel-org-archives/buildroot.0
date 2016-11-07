From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 23:05:45 +0100
Subject: [Buildroot] [PATCH] freescale: Create the
 board/freescale/common/imx/ directory
In-Reply-To: <1478472207-29799-1-git-send-email-festevam@gmail.com>
References: <1478472207-29799-1-git-send-email-festevam@gmail.com>
Message-ID: <20161107230545.63cdbc92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  6 Nov 2016 20:43:27 -0200, Fabio Estevam wrote:
> In order to have a better hierarchy for the genimage scripts used by
> NXP mx25, mx51, mx53, mx6, mx7 SoCs, let's place them inside the
> board/freescale/common/imx/ directory.
> 
> This helps in creating a more natural separation between the mxs scripts
> that are placed inside the board/freescale/common/mxs/ directory.
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  board/freescale/common/{ => imx}/genimage.cfg.template | 0
>  board/freescale/common/{ => imx}/post-image.sh         | 2 +-
>  board/freescale/imx25pdk/readme.txt                    | 2 +-
>  board/freescale/imx51evk/readme.txt                    | 2 +-
>  board/freescale/imx6sabre/readme.txt                   | 2 +-
>  board/freescale/imx6ulevk/readme.txt                   | 2 +-
>  board/freescale/imx7dsdb/readme.txt                    | 2 +-
>  board/technexion/imx6ulpico/readme.txt                 | 2 +-
>  configs/freescale_imx6dlsabreauto_defconfig            | 2 +-
>  configs/freescale_imx6dlsabresd_defconfig              | 2 +-
>  configs/freescale_imx6qsabreauto_defconfig             | 2 +-
>  configs/freescale_imx6qsabresd_defconfig               | 2 +-
>  configs/freescale_imx6sololiteevk_defconfig            | 2 +-
>  configs/freescale_imx6sxsabresd_defconfig              | 2 +-
>  configs/freescale_imx6ulevk_defconfig                  | 2 +-
>  configs/freescale_imx7dsabresd_defconfig               | 2 +-
>  configs/imx6ulpico_defconfig                           | 2 +-
>  configs/mx25pdk_defconfig                              | 2 +-
>  configs/mx51evk_defconfig                              | 2 +-
>  configs/mx53loco_defconfig                             | 2 +-
>  configs/warp7_defconfig                                | 2 +-
>  configs/warpboard_defconfig                            | 2 +-
>  22 files changed, 21 insertions(+), 21 deletions(-)
>  rename board/freescale/common/{ => imx}/genimage.cfg.template (100%)
>  rename board/freescale/common/{ => imx}/post-image.sh (94%)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
